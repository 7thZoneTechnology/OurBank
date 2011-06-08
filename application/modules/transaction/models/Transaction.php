<?php
class Transaction_Model_Transaction extends Zend_Db_Table 
{
    protected $_name = 'ourbank_transaction';
    public function transactionByDate() 
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
                DATE(A.created_date) = '".date("Y-m-d")."' AND
                A.account_id = B.id AND
                A.paymenttype_id = D.id AND
                A.created_by = E.id 
                ORDER BY A.transaction_id DESC
                ";
        $result = $db->fetchAll($sql);
        return $result;
    }
}
