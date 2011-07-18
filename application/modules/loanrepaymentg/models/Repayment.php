<?php
/*
############################################################################
#  This file is part of OurBank.
############################################################################
#  OurBank is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as
#  published by the Free Software Foundation, either version 3 of the
#  License, or (at your option) any later version.
############################################################################
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
############################################################################
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
############################################################################
*/
class Loanrepaymentg_Model_Repayment extends Zend_Db_Table
{
    protected $_name = 'ourbank_accounts';
    public function searchaccounts($acc) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql="SELECT 
                A.name as name,
                A.familycode as code,
                A.uid as uid,
                B.name as officename,
                B.id as officeid,
                D.account_number as number,
                D.id as accId,
                E.name as loanname,
                E.glsubcode_id as gl,
                E.Interest_glsubcode_id as intGl,
                F.loan_amount as amount,
                F.loan_installments as installments,
                DATE_FORMAT(F.loansanctioned_date, '%d/%m/%Y') as sanctioned,
                G.Interest as interest,
                F.interesttype_id as interesttype,
                F.savingsaccount_id as sAccId
                FROM
                ourbank_familymember A,
                ourbank_office B,
                ourbank_accounts D,
                ourbank_productsoffer E,
                ourbank_loanaccounts F,
                ourbank_interest_periods G
                WHERE 
                (A.name = '$acc' OR D.account_number = '$acc') AND
                D.membertype_id = substr(A.familycode,5,1) AND
                D.member_id = A.id AND
                B.id=A.village_id AND
                D.product_id = E.id AND
                F.account_id = D.id AND
                F.loan_interest  = G.id
                UNION
                SELECT 
                A.name as name,
                A.groupcode as code,
                A.absent_subglcode as uid,
                B.name as officename,
                B.id as officeid,
                D.account_number as number,
                D.id as accId,
                E.name as loanname,
                E.glsubcode_id as gl,
                E.Interest_glsubcode_id as intGl,
                F.loan_amount as amount,
                F.loan_installments as installments,
                DATE_FORMAT(F.loansanctioned_date, '%d/%m/%Y') as sanctioned,
                G.Interest as interest,
                F.interesttype_id as interesttype,
                F.savingsaccount_id as sAccId
                FROM
                ourbank_group A,
                ourbank_office B,
                ourbank_accounts D,
                ourbank_productsoffer E,
                ourbank_loanaccounts F,
                ourbank_interest_periods G
                WHERE 
                (A.name = '$acc' OR D.account_number = '$acc') AND
                D.membertype_id = substr(A.groupcode,5,1) AND
                D.member_id = A.id AND
                B.id=A.village_id AND
                D.product_id = E.id AND
                F.account_id = D.id AND
                F.loan_interest  = G.id";
				//echo $sql;
        return $db->fetchAll($sql,array($acc));
    }
    public function activeDisburs($acc) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                count(*) as count
                FROM
                ourbank_familymember A,
                ourbank_office B,
                ourbank_accounts D,
                ourbank_productsoffer E,
                ourbank_loanaccounts F,
                ourbank_loan_disbursement G,
                ourbank_family H
                WHERE
                (A.name = '$acc' OR D.account_number = '$acc') AND
                B.id = H.village_id AND 
                A.id = D.member_id AND 
                D.product_id = E.id AND
                F.account_id = D.id AND
                A.family_id=H.id AND
                D.id = G.account_id AND
                substr(A.familycode,5,1) = E.applicableto
                UNION
                SELECT 
                count(*) as count
                FROM
                ourbank_group A,
                ourbank_office B,
                ourbank_accounts D,
                ourbank_productsoffer E,
                ourbank_loanaccounts F,
                ourbank_loan_disbursement G
                WHERE
                (A.name = '$acc' OR D.account_number = '$acc') AND
                B.id = A.village_id AND 
                A.id = D.member_id AND 
                D.product_id = E.id AND
                F.account_id = D.id AND
                D.id = G.account_id AND
	        substr(A.groupcode,5,1) = E.applicableto";
        return  $db->fetchAll($sql,array($acc));
    }
    public function loanInstalments($accNum) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
	$sql="SELECT 
               sum(A.installment_principal_amount) as principal,
	       sum(A.installment_interest_amount) as intrest,
               sum(A.installment_amount) as totalAmt,
                A.installment_amount as installmentAmt,
                A.installment_date,
                A.account_id as accId
               FROM
               ourbank_installmentdetails A,
               ourbank_accounts B
               WHERE
               B.account_number = '$accNum' AND
               B.id = A.account_id AND 
               (A.installment_status = 4 OR
                A.installment_status = 8)";
	return $db->fetchAll($sql);
    }
    public function emi($data) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $result = $this->loanInstalments($data["accNum"]); 
        foreach ($result as $result) {
                    $installmentAmt = $result->installmentAmt;
        }
        $acc = $this->searchaccounts($data["accNum"]);
        foreach ($acc as $acc) {
                    $accId = $acc->accId;
        }

        switch ($installmentAmt) {
                case ($data["amount"] < $installmentAmt) : 
                                                         $int = $this->less($accId,$data["amount"],$data["accNum"]);
                                                         break;
                case ($installmentAmt === $data["amount"]) : 
                                                         $int = $this->update($accId,$data["amount"]);
                                                         break;
                case ($data["amount"] > $installmentAmt) :
                                                         $int = $this->more($accId,$data["amount"],$data["accNum"]);
                                                         break;
        }
        return $int;
    }

    public function declain($data,$totalAmt,$int,$p)
    {
        $cl = new App_Model_dateConvertor ();
        $amt = $data["amount"];
        $db = Zend_Db_Table::getDefaultAdapter();
        $acc = $this->searchaccounts($data["accNum"]);
        foreach ($acc as $acc) {
            $accId = $acc->accId;
            $loanAmt = $acc->amount;
            $interest = $acc->interest;
            $installments = $acc->installments;
        }

        $sql = "select MAX(installment_id) as id from ourbank_installmentdetails where account_id='".$accId."' AND installment_status = 2 limit 1";

        $idData = $db->fetchAll($sql);
        if($idData){
        foreach ($idData as $idData) {
                $pram = $idData->id+1;
        }
        }
        else
        {
            $pram = 1;
        }
        $instl = array('account_id' => $accId,
                            'installment_id' => $pram,
                            'installment_date' => $cl->phpmysqlformat($data['date']),
                            'installment_amount' => $totalAmt,
                            'reduced_prinicipal_balance'=>$totalAmt-$data["amount"],
                            'paid_amount' => $data["amount"],
                            'installment_interest_amount'=> $int,
                            'installment_principal_amount'=> $p,
                            'installment_status' => 2,
                            'created_by' => 1); 
        $this->addRecord('ourbank_installmentdetails',$instl);

        return $int;
    }

    public function maxid($accNum)
    {
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_accounts'),array('a.id'),array('a.id'))
        ->join(array('b'=>'ourbank_installmentdetails'),'a.id=b.account_id',array('MAX(b.installment_id) as maxid'))
        ->where('a.account_number=?',$accNum)
        ->group('a.account_number');
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();

    }

    public function declainedpaid($accNum,$maxid)
    {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_accounts'),array('a.id'),array('a.id'))
                                ->join(array('b'=>'ourbank_installmentdetails'),'a.id=b.account_id',array('b.reduced_prinicipal_balance','b.installment_id','b.installment_date'))
                                ->where('a.account_number=?',$accNum)
                                ->where('b.installment_id=?',$maxid);
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function declaineddisbursed($accno)
    {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_accounts'),array('a.id'),array('a.id'))
                                ->join(array('b'=>'ourbank_loan_disbursement'),'a.id=b.account_id',array('b.loandisbursement_date','SUM(b.amount_disbursed) as amount'))
                                ->where('a.account_number=?',$accno)
                                ->group('a.account_number');
        //die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();

    }
    public function more($accId,$amt,$accNum) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select 
                *
                from
                ourbank_installmentdetails 
                where account_id='".$accId."' 
                AND installment_status = 4";
        $data = $db->fetchAll($sql);
        foreach ($data as $data) {
                $instAmt = $data->installment_amount;
        }
        $where[] = "account_id = '".$accId."'";
        $where[] = "installment_status = 4";
        $set =  array('installment_status' => '2','paid_amount' => $instAmt);
        $db->update('ourbank_installmentdetails',$set,$where);
        $sql = "select id from ourbank_installmentdetails where account_id='".$accId."' AND installment_status = 3 limit 1";
        $idData = $db->fetchAll($sql);
        foreach ($idData as $idData) {
                $pram = $idData->id;
        }
        $where1[] = "account_id = '".$accId."'";
        $where1[] = "id = '".$pram."'";
        $set1 =  array('installment_status' => '4');
        $db->update('ourbank_installmentdetails',$set1,$where1);
        $sql = "select 
                *
                from
                ourbank_installmentdetails 
                where account_id='".$accId."' 
                AND installment_status = 4";
        $data = $db->fetchAll($sql);
        foreach ($data as $data) {
                $int = $data->installment_interest_amount;
                $id = $data->installment_id;
                $instAmt = $data->installment_amount;
                $principal = $data->installment_principal_amount;
                $rPrincipal = $data->reduced_prinicipal_balance;
                $date = $data->installment_date;
        }
        $where[] = "account_id = '".$accId."'";
        $where[] = "installment_status = 4";
        $set =  array('installment_status' => '8','paid_amount' => ($amt - $instAmt));
        $db->update('ourbank_installmentdetails',$set,$where);
        $accDetails = $this->searchaccounts($accNum);
        foreach ($accDetails as $accDetails) {
            $interest = $accDetails->interest;
            $installments = $accDetails->installments;
        }
        $db->delete("ourbank_installmentdetails",array('account_id = '.$accId,'installment_status = 3'));
        $emi =0;$roi=0;
        $amount = $rPrincipal - ($amt - $instAmt);
        $cb = $amount;
        //EMI ie., decling capital
        $rpm = $interest/100/12;
        $emi = (($amount)*($rpm)*pow((1+$rpm),($installments-$id)))/(pow((1+$rpm),($installments-$id))-1);
        for ($i = $id; $i<$installments; $i++) {
            $date = $this->dateAction($date,30,0,0);
            //$roi = rate of interest
            $status = ($i == $id) ? 4: 3;
            $roi =$cb*$rpm;
            $cb = $cb - ($emi - $roi);
            $instl = array('account_id' => $accId,
                            'installment_id' => $i+1,
                            'installment_date' => $date,
                            'installment_amount' => $emi,
                            'installment_interest_amount'=> $roi,
                            'installment_principal_amount' => round(($emi - $roi),2),
                            'reduced_prinicipal_balance'=> round($cb,2),
                            'installment_status' => $status,
                            'created_by' => 1);
            $this->addRecord('ourbank_installmentdetails',$instl);
        }
        return $rpm;
    }
    public function update($accId,$amt) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $where[] = "account_id = '".$accId."'";
        $where[] = "installment_status = 4";
        $set =  array('installment_status' => '2','paid_amount' => $amt);
        $db->update('ourbank_installmentdetails',$set,$where);
        $sql = "select id,installment_interest_amount from ourbank_installmentdetails where account_id='".$accId."' AND installment_status = 3 limit 1";
        $idData = $db->fetchAll($sql);
        foreach ($idData as $idData) {
            $pram = $idData->id;
            $int = $idData->installment_interest_amount;

        }
        $where1[] = "account_id = '".$accId."'";
        $where1[] = "id = '".$pram."'";
        $set1 =  array('installment_status' => '4');
        $db->update('ourbank_installmentdetails',$set1,$where1);
        return $int;
    }
    public function less($accId,$amt,$accNum) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $where[] = "account_id = '".$accId."'";
        $where[] = "installment_status = 4";
        $set =  array('installment_status' => '8','paid_amount' => $amt);
        $db->update('ourbank_installmentdetails',$set,$where);
        $sql = "select 
                *
                from
                ourbank_installmentdetails 
                where account_id='".$accId."' 
                AND installment_status = 8";
        $data = $db->fetchAll($sql);
        foreach ($data as $data) {
                $int = $data->installment_interest_amount;
                $id = $data->installment_id;
                $principal = $data->installment_principal_amount;
                $rPrincipal = $data->reduced_prinicipal_balance;
                $date = $data->installment_date;

        }
        $accDetails = $this->searchaccounts($accNum);
        foreach ($accDetails as $accDetails) {
            $interest = $accDetails->interest;
            $installments = $accDetails->installments;
        }
        $db->delete("ourbank_installmentdetails",array('account_id = '.$accId,'installment_status = 3'));
        $emi =0;$roi=0;
        $amount = ($principal - ($amt - $int)) + $rPrincipal;
        $cb = $amount;
        //EMI ie., decling capital
        $rpm = $interest/100/12;
        $emi = (($amount)*($rpm)*pow((1+$rpm),($installments-$id)))/(pow((1+$rpm),($installments-$id))-1);
        for ($i = $id; $i<$installments; $i++) {
            $date = $this->dateAction($date,30,0,0);
            //$roi = rate of interest
            $status = ($i == $id) ? 4: 3;
            $roi =$cb*$rpm;
            $cb = $cb - ($emi - $roi);
            $instl = array('account_id' => $accId,
                            'installment_id' => $i+1,
                            'installment_date' => $date,
                            'installment_amount' => $emi,
                            'installment_interest_amount'=> $roi,
                            'installment_principal_amount' => round(($emi - $roi),2),
                            'reduced_prinicipal_balance'=> round($cb,2),
                            'installment_status' => $status,
                            'created_by' => 1);
            $this->addRecord('ourbank_installmentdetails',$instl);
        }
        return $roi;
    }
    public function insertTran($data,$int,$totalAmt)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $acc = $this->searchaccounts($data["accNum"]);
        foreach ($acc as $acc) {
                $accId = $acc->accId;
                $gl = $acc->gl;
                $officeid = $acc->officeid; 
                $interest = $acc->interest; 
                $intGl = $acc->intGl;
        }
        $cl = new App_Model_dateConvertor ();
        $tranData= array('account_id' => $accId,
                        'glsubcode_id_to' => $gl,
                        'transaction_date' => $cl->phpmysqlformat($data["date"]),
                        'amount_to_bank' => $data["amount"],
                        'paymenttype_details'=>$data["paymenttype_details"],
                        'paymenttype_id' => $data["paymentMode"],
                        'recordstatus_id' => 3,
                        'transactiontype_id' => 1,
                        'transaction_description'=>$data["description"],
                        'created_by'=>1);
        $db->insert("ourbank_transaction",$tranData);
        $tranId = $db->lastInsertId('id');
        // Installment update
        $sql = "select installment_id from ourbank_installmentdetails where account_id='".$accId."' AND installment_status = 4 limit 1";
        $idData = $db->fetchAll($sql);
        foreach ($idData as $idData) {
                $pram = $idData->installment_id;
        }
        //insert into loan repayment
        $repayData= array('account_id' => $accId,
                'transaction_id' => $tranId,
                'paid_date' => $cl->phpmysqlformat($data["date"]),
                'paid_amount' => $data["amount"],
                'paid_principal' => $data["amount"] - $int,
                'paid_interest' => $int,
                'balanceamount' => $totalAmt-$data["amount"],
                'installment_id' => $pram -1,
                'recordstatus_id' => 3);
        $db->insert("ourbank_loan_repayment",$repayData);
        // Insertion into Assets ourbank_Assets Cash Cr entry
        $glbank = $this->getGlcode($officeid,'cash'.$officeid);
        // Insertion into Assets ourbank_Assets cash Cr entry
        $assets =  array('office_id' => $officeid,
                         'glsubcode_id_from' => $glbank[0]['id'],
                         'glsubcode_id_to' => '',
                         'transaction_id' => $tranId,
                         'credit' => $data["amount"]-$interest,
                         'record_status' => 3);
       	$db->insert('ourbank_Assets',$assets);
        // Insertion into Assets ourbank_Assets productgl Cr entry

        $glassets =  array('office_id' => $officeid,
                    'glsubcode_id_from' => $gl,
                    'glsubcode_id_to' => '',
                    'transaction_id' => $tranId,
                    'credit' => $data["amount"]-$interest,
                    'record_status' => 3);
        $db->insert('ourbank_Assets',$glassets);


        // Insertion into Assets ourbank_Income interest Cr entry
        $interestledger = $this->getGlcode($officeid,'interest'.$officeid);
        $interest =  array('office_id' => $officeid,
                         'glsubcode_id_from' => $interestledger[0]['id'],
                         'glsubcode_id_to' => '',
                         'transaction_id' => $tranId,
                         'credit' => $interest,
                         'recordstatus_id' => 3);
       	$db->insert('ourbank_Income',$interest);
       	//Retuns some variables
        return array('transaction_id' => $tranId,
                        'account_id' => $accId,
                        'paymentMode' => $data["paymentMode"],
                        'installment_id' => $accId);
	}
    public function getGlcode($officeId,$headername)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_glsubcode'),array('a.id'),array('a.id'))
                ->where('a.header=?',$headername)
                ->where('a.office_id=?',$officeId);
//        die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function paid($accNum) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql="SELECT 
                count(*) as paidCount,
                sum(A.paid_amount) as paidAmt,
                sum(A.installment_principal_amount) as principal_amount
                FROM
                ourbank_installmentdetails A,
                ourbank_accounts B
                WHERE
                B.account_number = '$accNum' AND
                B.id = A.account_id AND 
                (A.installment_status = 2 OR
                A.installment_status = 8 ) group by account_number
                ";
        //echo $sql;
        return $db->fetchAll($sql);
    }

    public function disbursedamount($accNum)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql="SELECT 
                count(*) as paidCount,
                sum(A.amount_disbursed) as disbursedAmt
                FROM
                ourbank_loan_disbursement A,
                ourbank_accounts B
                WHERE
                B.account_number = '$accNum' AND
                B.id = A.account_id
                ";

        return $db->fetchAll($sql);

    }

    public function unpaid($accNum) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
		$sql="SELECT 
               count(*) as unpaidCount,
               sum(A.installment_amount) as unpaidAmt
               FROM
               ourbank_installmentdetails A,
               ourbank_accounts B
               WHERE
               B.account_number = '$accNum' AND
               B.id = A.account_id AND 
               (A.installment_status = 3 OR
			   A.installment_status = 4) group by account_number";
        //echo $sql;
		return $db->fetchAll($sql);

    }
    public function getMember($accNum)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select 
                C.familycode as code,
                C.name as name,
                C.id as id
                from
                ourbank_group as A,
                ourbank_groupmembers B,
                ourbank_familymember C,
                ourbank_accounts D
                where
                D.account_number = '".$accNum."' AND
                D.member_id = A.id AND
                A.id = B.id AND
                B.member_id = C.id  
                ";
        return $result = $db->fetchAll($sql);
    }
    public function grpRepayment($accdata)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->insert('ourbank_grouploan_repayment',$accdata);
        return;
    }
    public function dateAction($givendate,$day=0,$mth=0,$yr=0) 
    {
        $cd = strtotime($givendate);
        $newdate = date('Y-m-d', mktime(date('h',$cd),
        date('i',$cd), date('s',$cd), date('m',$cd)+$mth,
        date('d',$cd)+$day, date('Y',$cd)+$yr));
        return $newdate;
    }
    public function addRecord($table,$params) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
	$db->insert($table,$params);
	return $db->lastInsertId('id');
    }
    public function dateDiff($date1,$date2)
    {

            $start_ts = strtotime($date1);
            $end_ts = strtotime($date2);
            $diff = $end_ts - $start_ts;
            return round($diff / 86400);


//         explode the date by "-" and storing to array
//         $date_parts1=explode("-", $date1);
//         $date_parts2=explode("-", $date2);
//         gregoriantojd() Converts a Gregorian date to Julian Day Count
//         $start_date=gregoriantojd($date_parts1[1], $date_parts1[2], $date_parts1[0]);
//         $end_date=gregoriantojd($date_parts2[1], $date_parts2[2], $date_parts2[0]);
//         return $end_date - $start_date;
    }

    public function getdisbursementdetails($accNum)
    {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_accounts'),array('a.id'),array('a.id'))
                                ->join(array('b'=>'ourbank_loan_disbursement'),'a.id=b.account_id',array('b.loandisbursement_date'))
                                ->where('a.account_number=?',$accNum);

       // die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getinstallmentid($accId)
    {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_installmentdetails'),array('a.id'),array('a.installment_id','a.paid_amount','a.installment_amount'))
                                ->where('a.installment_status=4 or a.installment_status=8')
                                ->where('a.account_id=?',$accId);
       // die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function findmaxpaidid($accId)
    {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_loan_repayment'),array('a.id'),array('MAX(a.transaction_id) as maxpaidid'))
                                ->where("a.account_id = ?",$accId)
                                ->group("a.account_id");
       // die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function declainedpaid1($accNum,$accId)
    {
        $maxid=$this->findmaxpaidid($accId);

        if($maxid){
           $trasid=$maxid[0]['maxpaidid'];
        }
        else{
            $trasid="";
        }
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_accounts'),array('a.id'),array('a.id'))
                                ->join(array('b'=>'ourbank_loan_repayment'),'a.id=b.account_id',array('b.id','b.paid_date','b.balanceamount'))
                                ->where("b.transaction_id = ?",$trasid)
                                ->where('a.account_number=?',$accNum);
       // die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function updateinstallment($installmentid,$accid,$paidamount,$balance,$status)
    {
        $this->db = Zend_Db_Table::getDefaultAdapter();
                $data = array('installment_status'=> $status,'paid_amount'=>$paidamount,'balance'=>$balance); //print_r($data);
                $where='installment_id='.$installmentid.' and account_id='.$accid; //echo $where;
        $this->db->update('ourbank_installmentdetails',$data,$where);
    }
}
