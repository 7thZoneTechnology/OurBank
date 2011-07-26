<?php
class Loandetailsg_Model_loandetails extends Zend_Db_Table {
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
		//echo $sql;
        $result = $db->fetchAll($sql,array($acc));
        return $result;
    }

	public function loanInstalments($accNum) 
	{
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('A' => 'ourbank_accounts'),array('id'))
			->join(array('B' => 'ourbank_installmentdetails'),'A.id = B.account_id')
			->join(array('C' => 'ourbank_master_instalstatus'),'B.installment_status = C.id')
                        ->where('B.installment_status!=7')
			->where('A.account_number = ?',$accNum);
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

	public function declainedpaid($accNum) 
	{
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('A' => 'ourbank_accounts'),array('id'),array('id'))
			->join(array('B' => 'ourbank_loan_repayment'),'A.id = B.account_id')
			->where('A.account_number = ?',$accNum);
		//die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
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
               A.installment_status = 8)";
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
}
