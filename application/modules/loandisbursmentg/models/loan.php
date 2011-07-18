<?php
class Loandisbursmentg_Model_loan extends Zend_Db_Table 
{
    protected $_name = 'ourbank_accounts';

    public function searchaccounts($acc) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);

        $sql="SELECT 
                A.name as name,
                A.familycode as code,
                B.name as officename,
                A.uid as uid,
                B.id as officeid,
                D.account_number as number,
		D.member_id as memberid,
		D.membertype_id as membertypeid,
                D.id as accId,
                E.name as loanname,
                E.glsubcode_id as gl,
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
                (A.name like '%' '$acc' '%' OR D.account_number = '$acc') AND
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
                A.absent_subglcode as uid,
                B.id as officeid,
                D.account_number as number,
		D.member_id as memberid,
		D.membertype_id as membertypeid,
                D.id as accId,
                E.name as loanname,
                E.glsubcode_id as gl,
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
                (A.name like '%' '$acc' '%' OR D.account_number = '$acc') AND
                D.membertype_id = substr(A.groupcode,5,1) AND
                D.member_id = A.id AND
                (D.membertype_id=2 or D.membertype_id=3) AND
                B.id=A.village_id AND
                D.product_id = E.id AND
                F.account_id = D.id AND
                F.loan_interest  = G.id";
        //echo $sql."<br>";
        $result = $db->fetchAll($sql,array($acc));
        return $result;
    }
    
    public function active($accNum)
    {
    	$db = Zend_Db_Table::getDefaultAdapter();
	$where[] = "account_number = '".$accNum."'";
	$where[] = "status_id = 3";
	return $db->update('ourbank_accounts',array('status_id' =>1),$where);
    }
    
    public function getSavingGl($id) 
    {
       	$db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select 
                B.glsubcode_id,
                sum(C.amount_to_bank) - sum(C.amount_from_bank) as balance
                FROM
                ourbank_accounts A,
                ourbank_productsoffer B,
                ourbank_transaction C
                WHERE
                A.product_id=B.id AND
                A.id = C.account_id
                ";
        $result = $db->fetchAll($sql,array($id));
        return $result;
    }	
    public function glBank($id,$headername) 
    {

        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_glsubcode'),array('a.id'),array('a.id'))
                ->where('a.header=?',$headername)
                ->where('a.office_id=?',$id);
//        die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();


// 	$db = Zend_Db_Table::getDefaultAdapter();
// 	$sql = "select id from ourbank_glsubcode where office_id = $id and header = $headername ";
// 	$result = $db->fetchAll($sql,array());
// 	return $result;
    }
    public function getFee($accNum) 
    {
	$db = Zend_Db_Table::getDefaultAdapter();
	$sql = "select 
	        A.name as name,
	        A.value as value,
	        A.amountype_id as amountype_id,
                A.glsubcode_id,
                B.feeamount
	        from 
	        ourbank_fee A,
	        ourbank_accountfee B,
	        ourbank_accounts C
	        where 
	        C.account_number = '$accNum' AND
	        B.account_id = C.id AND
	        B.fee_id = A.id
	        ";
	//echo $sql;
	$result = $db->fetchAll($sql);
	return $result;
    }

    public function getdisbursementdetails($accNum)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_accounts'),array('a.id'))
                ->join(array('b'=>'ourbank_loan_disbursement'),'a.id=b.account_id')
                ->where('a.account_number=?',$accNum);
//        die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function findlastpaid($accNum)
    {
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_loan_repayment'),array('a.id'),array('MAX(installment_id) as lastpaidid','SUM(paid_principal) as paidamount','paid_date'))
        ->join(array('b'=>'ourbank_accounts'),'b.id=a.account_id',array('b.id as accountid'))
        ->where('b.account_number=?',$accNum)
        ->group('b.account_number');
        //die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getsavingaccount($memberid,$membertype)
	{
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_accounts'),array('a.id'))
        ->where('a.member_id=?',$memberid)
	->where('a.tag_account=0')
	->where('a.account_number like "%" ? "%"','S')
	->where('a.membertype_id=?',$membertype);
        //die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
	}

    public function getmemberdetails($memberid,$membertype)
    {
	if($membertype==1){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_familymember'),array('a.id'),array('a.village_id'))
	->where('a.id=?',$memberid);
        //die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
	} 
	if($membertype==2 or $membertype==3)
	{
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_group'),array('a.id'),array('a.village_id'))
	->where('a.id=?',$memberid);
        //die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
	}
    }

    public function accUpdate($accId,$input)
    {
    	$where[] = "id = '".$accId."'";
	$db = $this->getAdapter();
        $result = $db->update('ourbank_accounts',$input,$where);
    }

    public function loanupdate($accId,$input)
    {
    	$where[] = "transaction_id = '".$accId."'";
	$db = $this->getAdapter();
        $result = $db->update('ourbank_transaction',$input,$where);
    }

    public function maxid($accNum)
    {
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_accounts'),array('a.id'),array('a.id'))
        ->join(array('b'=>'ourbank_installmentdetails'),'a.id=b.account_id',array('MAX(b.installment_id) as maxid'))
        ->where('a.account_number=?',$accNum)
        ->group('a.account_number');
      //  die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function declainedpaid($accNum,$maxid)
    {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_accounts'),array('a.id'),array('a.id'))
                                ->join(array('b'=>'ourbank_installmentdetails'),'a.id=b.account_id')
                                ->where('a.account_number=?',$accNum)
                                ->where('b.installment_id=?',$maxid);
         //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function findwithoutpaid($accNum)
    {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_installmentdetails'),array('a.id'),array('MIN(installment_id) as lastpaidid','reduced_prinicipal_balance','installment_date'))
                                ->join(array('b'=>'ourbank_accounts'),'b.id=a.account_id',array('b.id as accountid'))
                                ->where('b.account_number=?',$accNum)
                                ->group('b.account_number');
        //die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function remaininginstallmemnt($accNum)
    {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_installmentdetails'),array('a.id'),array('COUNT(a.id) as countnumber','installment_id'))
                                ->join(array('b'=>'ourbank_accounts'),'b.id=a.account_id',array('b.id as accountid'))
                                ->where('a.installment_status=3 or a.installment_status=4')
                                ->where('b.account_number=?',$accNum)
                                ->group('b.account_number');
 //       die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function updateold($accId,$input=array())
    {
    $where[] = "account_id = '".$accId."'";
    $where[] = "installment_status = 3 or installment_status = 4";
    $db = $this->getAdapter();
    $result = $db->update('ourbank_installmentdetails',$input,$where);
    }

    public function updateinstallment($accId,$installmentid,$input=array())
    {
    $where[] = "account_id = '".$accId."'";
    $where[] = "installment_id  = '".$installmentid."'";
    $db = $this->getAdapter();
    $result = $db->update('ourbank_installmentdetails',$input,$where);
    }
}
