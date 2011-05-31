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
class Altertransaction_Model_Altertransaction extends Zend_Db_Table
{
    protected $db;

    public function details($vochure_number) 
    {
        $db = $this->getAdapter();
        $sql = 'SELECT 
                A.transaction_id as vNum,
                A.transaction_date as date,
                A.amount_to_bank as cR,
                A.amount_from_bank as dT,
                A.paymenttype_id as paymenttype_id,
                A.transactiontype_id as transactiontype_id,
                B.account_number as accNum,
                B.id as aID,
                D.name as tranType,
                E.description as payName,
                A.confirmation_flag as cFlag,
                A.glsubcode_id_to as gl,
                A.transaction_description as dsc
                FROM
                ourbank_transaction A,
                ourbank_accounts B,
                ourbank_transactiontype D, 
                ourbank_paymenttypes E where (
                A.transaction_id='.$vochure_number.' &&
                A.account_id = B.id && 
                A.transactiontype_id = D.id && 
                A.paymenttype_id = E.id )';
		
		$result = $db->fetchAll($sql,array($vochure_number));
		return $result;
    }
    
    public function recordStatus($transactionId) 
    {
        $db = $this->getAdapter();
        $sql = 'SELECT recordstatus_id FROM  ourbank_transaction where (transaction_id=?)';
        $result = $db->fetchAll($sql,array($transactionId));
        return $result;
    }

    public function fetchTransactionDetails($transactionId) 
    {
        $db = $this->getAdapter();
        $sql = 'SELECT * FROM
                       ourbank_accounts A,
                       ourbank_productsoffer B,
                       ourbank_familymember D,
                       ourbank_transaction E,
                       ourbank_paymenttypes G,
                       ourbank_transactiontype H,
                       ourbank_office I where (
                       E.transaction_id = '.$transactionId.' &&
                       A.id = E.account_id && 
                       A.member_id = D.id &&
                       A.product_id = B.product_id &&
                       H.id = E.transactiontype_id  &&
                       G.id = E.paymenttype_id  && 
		 		       A.status_id  = 3 or A.status_id = 1)';
		
        $result = $db->fetchAll($sql,array($transactionId));
		return $result;
    }

    public function groupDetails($transactionId) 
    {
        $db = $this->getAdapter();
        $sql = 'SELECT * FROM
                ourbank_transaction A,
                ourbank_accounts B,
                ourbank_groupmembers C,
                ourbank_address D,
                ourbank_office E where (
                A.transaction_id = ? &&  
                A.account_id = B.id  &&  
                B.member_id = C.group_id &&  
                C.group_id = D.id &&  
                D.submodule_id = E.id)';
        $result = $db->fetchAll($sql,array($transactionId));
        return $result;
    }

    public function transactionUpdate1($feildname,$table,$pk,$input = array())
    {
        $db = $this->getAdapter();
	$pk = intval($pk);
		
        $where[] = "$feildname = '".$pk."'";
	$result = $db->update($table,$input,$where);
        return $result;
    }

    public function transactionDelete($id,$input = array()) {

        $db = $this->getAdapter();
        $where[] = "transaction_id = '".$id."'";
        $where[] = "recordstatus_id = '3'";
        $result = $db->update('ourbank_savings_transaction',$input,$where);

    }
        
    public function insertsavingstransactionDetails($input = array())
    {
            $db = $this->getAdapter();
            $db->insert('ourbank_savings_transaction',$input);
            return $db->lastInsertId('ourbank_savings_transaction');
    }

    public function insertTransaction($input = array())
    {
        $db = $this->getAdapter();
        $db->insert('ourbank_transaction',$input);
        $result = $db->lastInsertId('ourbank_transaction');
	return $result;
    } 

    public function transactionUpdate($id,$input = array()) {
        $db = $this->getAdapter();
        $where[] = "transaction_id = '".$id."'";
        $result = $db->update('ourbank_transaction',$input,$where);
    }

    public function transactionType($transactiontype)
    {
        $db = $this->getAdapter();
        $sql = 'SELECT * FROM ourbank_transactiontype  where transaction_type =?';
        $result = $db->fetchAll($sql,array($transactiontype));
        return $result;
    }  

    public function transactionMode($transaction_mode)
    {
        $db = $this->getAdapter();
        $sql = 'SELECT * FROM ourbank_paymenttypes where paymenttype_description =?';
        $result = $db->fetchAll($sql,array($transaction_mode));
        return $result;
    }
    
    public function transactionResult($transaction_id)
    {
        $db = $this->getAdapter();
        $sql = 'SELECT * FROM ourbank_transaction where transaction_id =?';
        $result = $db->fetchAll($sql,array($transaction_id));
        return $result;
    }
    
    public function transaction_type()
    {
        $db = $this->getAdapter();
        $sql = 'SELECT * FROM ourbank_transactiontype ';
        $result = $db->fetchAll($sql);
        return $result;
    }


    public function transactionModeEdit()
    {
        $db = $this->getAdapter();
        $sql = 'SELECT * FROM ourbank_master_paymenttypes ';
        $result = $db->fetchAll($sql);
        return $result;
    }

    public function accountStatus($account_number)
    {
        $db = $this->getAdapter();
        $sql = 'SELECT * FROM ourbank_accounts where (account_number = ?)';
        $result = $db->fetchAll($sql,array($account_number));
        return $result;
    }
	public function updateRecord($table,$param,$data)  
    {
		$db = $this->getAdapter();
        $db->update($table, $data , array('transaction_id = '.$param));
        return;
    }
}
