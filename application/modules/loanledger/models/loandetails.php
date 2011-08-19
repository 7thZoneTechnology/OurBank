<?php
class Loanledger_Model_loandetails extends Zend_Db_Table {
	protected $_name = 'ourbank_accounts';

    public function searchaccounts($acc) {

        $select = $this->select()
                       	->setIntegrityCheck(false)

             ->from(array('a' => 'ourbank_familymember'),array('a.village_id','a.familycode as code','a.name'))

             ->join(array('d' => 'ourbank_accounts'),'d.member_id = a.id',array('d.id as accId','d.account_number as number'))
				  ->where('d.account_number = "'.$acc.'"')

             ->join(array('b' => 'ourbank_office'),'b.id = a.village_id',array('b.id as officeid','b.name as officename'))

             ->join(array('e' => 'ourbank_productsoffer'),'d.product_id = e.id',array('e.name as loanname','e.glsubcode_id as gl'))

             ->join(array('f' => 'ourbank_loanaccounts'),'f.account_id = d.id',array('f.loan_amount as amount','f.loan_installments as installments','f.loansanctioned_date as sanctioned','f.loan_interest as interest','f.interesttype_id as interesttype','f.savingsaccount_id as sAccId'));

		return $this->fetchAll($select);
		}
// 		$select = $this->select()
//                        	->setIntegrityCheck(false)
//              ->from(array('a' => 'ourbank_group'),array('a.name','a.groupcode as code'))
// 
//              ->join(array('b' => 'ourbank_office'),'b.id=a.village_id',array('b.id as officeid','b.name as officename'))
// 
//              ->join(array('d' => 'ourbank_accounts'),'d.member_id = a.id',array('d.id as accId','d.account_number as number'))
// 				  ->where('d.account_number = "'.$acc.'"')
// 
//           ->join(array('e' => 'ourbank_productsoffer'),'d.product_id = e.id',array('e.name as loanname','e.glsubcode_id as gl'))
// 
//              ->join(array('f' => 'ourbank_loanaccounts'),'f.account_id = d.id',array('f.loan_amount as amount','f.loansanctioned_date as sanctioned','f.loan_interest as interest','f.savingsaccount_id as sAccId','f.interesttype_id as interesttype'));
// 
// 
//   die($select->__toString($select));
// 		return $this->fetchAll($select);

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
