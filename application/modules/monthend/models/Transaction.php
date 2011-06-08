<?php
class Monthend_Model_Transaction extends Zend_Db_Table 
{
    protected $_name = 'ourbank_transaction';
    public function transaction() 
    {
        $dtFirstDay = date("Y-m-d", mktime(0, 0, 0, date("m") , date("d")-date("d")+1, date("Y")))."<br>";
        $dtLastDay = date("Y-m-d", mktime(0, 0, 0, date("m")+1 , date("d")-date("d"), date("Y")))."<br>"; 
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                A.account_id as id
                FROM 
                ourbank_transaction A,
                ourbank_accounts B
                WHERE
                B.account_number LIKE '%S%' AND
                A.account_id = B.id AND
                A.transaction_date between '$dtFirstDay' AND '$dtLastDay'
                group by(A.account_id)
                ";
        //echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
    }

    public function getSavingsDetails($id) 
    {
        $dtFirstDay = date("Y-m-d", mktime(0, 0, 0, date("m") , date("d")-date("d")+1, date("Y")))."<br>";
        $dtLastDay = date("Y-m-d", mktime(0, 0, 0, date("m")+1 , date("d")-date("d"), date("Y")))."<br>"; 
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                account_id as id,
                glsubcode_id_to as glSub,
                transaction_date as transaction_date,
                amount_to_bank - amount_from_bank as balance
                FROM 
                ourbank_savings_transaction 
                WHERE
                account_id = '$id' AND
                transaction_date between '$dtFirstDay' AND '$dtLastDay'
                ";
        //echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
    }
}
