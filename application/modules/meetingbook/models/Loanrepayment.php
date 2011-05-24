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
class Meetingbook_Model_Loanrepayment extends Zend_Db_Table {

    public function searchaccounts($acc) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql="SELECT 
                A.name as name,
                A.familycode as code,
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
// 				echo $sql;
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
                                                         $this->less($accId,$data["amount"],$data["accNum"]);
                                                         break;
                case ($installmentAmt === $data["amount"]) : 
                                                         $this->update($accId,$data["amount"]);
                                                         break;
                case ($data["amount"] > $installmentAmt) :
                                                         $this->more($accId,$data["amount"],$data["accNum"]);
                                                         break;
        }
    }
    public function declainDetalis($accNum,$accId)
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
                $int = $data->installment_interest_amount;
                $id = $data->installment_id;
                $instAmt = $data->installment_amount;
                $principal = $data->installment_principal_amount;
                $rPrincipal = $data->reduced_prinicipal_balance;
                $date = $data->installment_date;
        }
        $acc = $this->searchaccounts($accNum);
        foreach ($acc as $acc) {
            $accId = $acc->accId;
            $loanAmt = $acc->amount;
            $interest = $acc->interest;
        }
        $dateDiff = 30; // single installment 
        //PTR
        $si = ($rPrincipal*$dateDiff*$interest)/(100*365); // interest per day
        $capital = $si+$rPrincipal;
        return array('principal' => $rPrincipal,
                    'intrest' => round($si,2),
                    'totalAmt' => round($capital,2),
                    'si' => $si,
                    'capital' => $capital);
    }
    public function declain($data) 
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
        $installments = $this->declainDetalis($data["accNum"],$accId);
        $rPrincipal = $installments["principal"];
        $int = $installments["intrest"];
        $si = $installments["si"];
        $totalAmt = $installments["totalAmt"];
        $capital = $installments["capital"];
        $where[] = "account_id = '".$accId."'";
        $where[] = "installment_status = 4";
        $set =  array('installment_status' => '2',
                        'paid_amount' => $amt,
                        'installment_principal_amount' => $amt - $int,
                        'installment_interest_amount' => $int);
        $db->update('ourbank_installmentdetails',$set,$where);
        
        $sql = "select id from ourbank_installmentdetails where account_id='".$accId."' AND installment_status = 2 limit 1";
        $idData = $db->fetchAll($sql);
        foreach ($idData as $idData) {
                $pram = $idData->id;
        }
        $status = 4;
        $instl = array('account_id' => $accId,
                            'installment_id' => ($pram + 2),
                            'installment_date' => "2011-09-09",
                            'installment_amount' => ($rPrincipal - $amt),
                            'reduced_prinicipal_balance'=> ($rPrincipal - $amt),
                            'installment_status' => $status,
                            'created_by' => 1);
        $this->addRecord('ourbank_installmentdetails',$instl);
        return;
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
        return;
    }
    public function update($accId,$amt) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $where[] = "account_id = '".$accId."'";
        $where[] = "installment_status = 4";
        $set =  array('installment_status' => '2','paid_amount' => $amt);
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
        return;
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
        //
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
        return;
    }
    public function insertTran($data)
    {  
        $db = Zend_Db_Table::getDefaultAdapter();
        $acc = $this->searchaccounts($data["accNum"]); //echo '<pre>';print_r($acc);
        $tranId = $data["transID"];
        foreach ($acc as $acc) {
               $accId = $acc->accId;
               $gl = $acc->gl;
               $officeid = $acc->officeid; 
               $interest = $acc->interest; 
               $intGl = $acc->intGl;
        }
//         $tranData= array('account_id' => $accId,
//                         'glsubcode_id_to' => $gl,
//                         'transaction_date' => $data["date"],
//                         'amount_to_bank' => $data["amount"],
//                         'paymenttype_id' => $data["paymentMode"],
//                         'recordstatus_id' => 3,
//                         'transactiontype_id' => 1,
//                         'transaction_description'=>$data["description"],
//                         'created_by'=>1);
//         $db->insert("ourbank_transaction",$tranData);
//         $tranId = $db->lastInsertId('id');
        // Installment update
        $sql = "select installment_id from ourbank_installmentdetails where account_id='".$accId."' AND installment_status = 4 limit 1";
        $idData = $db->fetchAll($sql);
        foreach ($idData as $idData) {
                $pram = $idData->installment_id;
        }
        //insert into loan repayment
        $repayData= array('account_id' => $accId,
                'transaction_id' => $tranId,
                'paid_date' => $data["date"],
                'paid_amount' => $data["amount"],
                'installment_id' => $pram -1,
                'recordstatus_id' => 3);
        $db->insert("ourbank_loan_repayment",$repayData);
        // Insertion into Assets ourbank_Assets Cash Cr entry
        $glresult = $this->getGlcode($officeid);
        foreach ($glresult as $glresult) {
                $cashglsubocde = $glresult->id;
        }
        // Insertion into Assets ourbank_Assets cash Cr entry
        $assets =  array('office_id' => $officeid,
                         'glsubcode_id_from' => $cashglsubocde,
                         'glsubcode_id_to' => '',
                         'transaction_id' => $tranId,
                         'credit' => $data["amount"],
                         'record_status' => 3);
       	$db->insert('ourbank_Assets',$assets);
        // Insertion into Assets ourbank_Assets productgl Cr entry
		$glassets =  array('office_id' => $officeid,
                         'glsubcode_id_from' => $gl,
                         'glsubcode_id_to' => '',
                         'transaction_id' => $tranId,
                         'credit' => $data["amount"],
                         'record_status' => 3);
       	$db->insert('ourbank_Assets',$glassets);
        // Insertion into Assets ourbank_Liabilities productgl Cr entry
// 		$glLia =  array('office_id' => $officeid,
//                          'glsubcode_id_from' => $gl,
//                          'glsubcode_id_to' => '',
//                          'transaction_id' => $tranId,
//                          'credit' => $data["amount"],
//                          'record_status' => 3);
//        	$db->insert('ourbank_Liabilities',$glLia);
        // Insertion into Assets ourbank_Assets interest Cr entry
        $interest =  array('office_id' => $officeid,
                         'glsubcode_id_from' => $intGl,
                         'glsubcode_id_to' => '',
                         'transaction_id' => $tranId,
                         'credit' => $interest,
                         'record_status' => 3);
       	$db->insert('ourbank_Assets',$interest);
       	//Retuns some variables
        return array('transaction_id' => $tranId,
                        'account_id' => $accId,
                        'paymentMode' => $data["paymentMode"],
                        'installment_id' => $accId);
	}
    public function getGlcode($officeId)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select id from ourbank_glsubcode where substr(header,5)=$officeId and glcode_id=2";
        return $db->fetchAll($sql);
    }

    public function paid($accNum) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql="SELECT 
                count(*) as paidCount,
                sum(A.paid_amount) as paidAmt
                FROM
                ourbank_installmentdetails A,
                ourbank_accounts B
                WHERE
                B.account_number = '$accNum' AND
                B.id = A.account_id AND 
                (A.installment_status = 2 OR
                A.installment_status = 8 )
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
			   A.installment_status = 4)";
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
//     public function grpRepayment($accdata)
//     {
//         $db = Zend_Db_Table::getDefaultAdapter();
//         $db->insert('ourbank_grouploan_repayment',$accdata);
//         return;
//     }
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
}
