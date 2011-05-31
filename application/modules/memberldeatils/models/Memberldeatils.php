<?php
class Memberldeatils_Model_Memberldeatils extends Zend_Db_Table 
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
                B.id as officeid,
                D.account_number as number,
                D.id as accId,
                E.name as loanname,
                E.glsubcode_id as gl,
                F.loan_amount as amount,
                F.loan_installments as installments,
                DATE_FORMAT(F.loansanctioned_date, '%d/%m/%Y') as sanctioned,
                F.loan_interest as interest,
                F.interesttype_id as interesttype,
                F.savingsaccount_id as sAccId
                FROM
                ourbank_familymember A,
                ourbank_office B,
                ourbank_accounts D,
                ourbank_productsoffer E,
                ourbank_loanaccounts F
                WHERE 
                (A.name = '$acc' OR D.account_number = '$acc') AND
                D.membertype_id = substr(A.familycode,5,1) AND
                D.member_id = A.id AND
                B.id=A.village_id AND
                D.product_id = E.id AND
                F.account_id = D.id
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
                F.loan_amount as amount,
                F.loan_installments as installments,
                DATE_FORMAT(F.loansanctioned_date, '%d/%m/%Y') as sanctioned,
                F.loan_interest as interest,
                F.interesttype_id as interesttype,
                F.savingsaccount_id as sAccId
                FROM
                ourbank_group A,
                ourbank_office B,
                ourbank_accounts D,
                ourbank_productsoffer E,
                ourbank_loanaccounts F
                WHERE 
                (A.name = '$acc' OR D.account_number = '$acc') AND
                D.membertype_id = substr(A.groupcode,5,1) AND
                D.member_id = A.id AND
                B.id=A.village_id AND
                D.product_id = E.id AND
                F.account_id = D.id";
				//echo $sql;
        $result = $db->fetchAll($sql,array($acc));
        return $result;
    }

    public function loanInstalments($accNum) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                A.transaction_id as id,
                B.account_number as number,
                DATE_FORMAT(A.transaction_date, '%d/%m/%Y') as date,
                A.amount_to_bank as cr,
                A.amount_from_bank as dt,
                D.name as mode,
                E.name as name
                FROM 
                ourbank_transaction A,
                ourbank_accounts B,
                ourbank_master_paymenttypes D,
                ourbank_user E
                WHERE
                B.account_number = '$accNum' AND
                A.account_id = B.id AND
                A.paymenttype_id = D.id AND
                A.created_by = E.id 
                ORDER BY A.transaction_id DESC
                ";
        $result = $db->fetchAll($sql);
        return $result;
    }
	public function paid($accNum) 
	{
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
		$sql="SELECT 
               count(*) as paidCount,
               sum(A.paid_amount) as paidAmt,
               sum(A.installment_interest_amount) as interest
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
