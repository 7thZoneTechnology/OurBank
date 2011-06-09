<?php
class Maintenance_Model_Dayend extends Zend_Db_Table 
{
    protected $_name = 'ourbank_transaction';
    public function transactionByDate() 
    {
        $dateTo = date('Y-m-d',strtotime(date("Y-m-d", strtotime(date("Y-m-d"))) . " -1 days"));
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = 'SELECT 
                E.transaction_id as transaction_id,
                A.account_number as account_number,
                E.transaction_date as transaction_date,
                E.amount_to_bank as amount_to_bank,
                E.amount_from_bank as amount_from_bank,
                G.name as name,
                J.name as login_name
                FROM
                ourbank_accounts A,
                ourbank_transactionB E,
                ourbank_master_paymenttypes G,
                ourbank_transactiontype H,
                ourbank_user J
                where (
                E.transaction_date BETWEEN "'.$dateTo.'" AND  "'.date("Y-m-d").'" &&
                A.id = E.account_id && 
                H.id = E.transactiontype_id &&
                G.id = E.paymenttype_id && 
                J.id = E.created_by &&
                E.recordstatus_id = 3)
                UNION
                SELECT 
                E.transaction_id as transaction_id,
                A.header as account_number,
                E.transaction_date as transaction_date,
                E.amount_to_bank as amount_to_bank,
                E.amount_from_bank as amount_from_bank,
                G.name as name,
                J.name as login_name
                FROM
                ourbank_glsubcode A,
                ourbank_transactionB E,
                ourbank_master_paymenttypes G,
                ourbank_transactiontype H,
                ourbank_user J
                where (
                E.transaction_date BETWEEN "'.$dateTo.'" AND  "'.date("Y-m-d").'" &&
                A.id = E.glsubcode_id_from && 
                H.id = E.transactiontype_id &&
                G.id = E.paymenttype_id && 
                J.id = E.created_by &&
                E.recordstatus_id = 3)
                ';
        $result = $db->fetchAll($sql);
        return $result;
    }
    public function transactionUpdate($transaction_id,$input)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $where[] = "transaction_id = '".$transaction_id."'";
	$result = $db->update('ourbank_transactionB',$input,$where);
        //  echo $result;
    }
    public function transactionCommit()
    {
        // Auto commit of transaction
        $data = array('recordstatus_id' => 1,
                      'confirmation_flag' => 1);
        $db = Zend_Db_Table::getDefaultAdapter();
        $where[] = "transaction_date <= '".date('Y-m-d',strtotime(date("Y-m-d", strtotime(date("Y-m-d"))) . " -2 days"))."'";
	$result = $db->update('ourbank_transactionB',$data,$where);
    }
}
