<?php
class Loandisbursmentg_Model_loan extends Zend_Db_Table 
{
    protected $_name = 'ob_accounts';

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
    public function glBank($id) 
    {
	$db = Zend_Db_Table::getDefaultAdapter();
	$sql = "select id from ourbank_glsubcode where substr(header,5) = $id and glcode_id = 1 ";
	$result = $db->fetchAll($sql,array());
	return $result;
    }
    public function getFee($accNum) 
    {
	$db = Zend_Db_Table::getDefaultAdapter();
	$sql = "select 
	        A.name as name,
	        A.value as value,
	        A.amountype_id as amountype_id
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
}
