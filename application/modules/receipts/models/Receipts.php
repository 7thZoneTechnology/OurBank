<?php
class Receipts_Model_Receipts extends Zend_Db_Table {
	protected $_name = 'ourbank_Expenditure';

	public function listOfglcode() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_glcode'),array('id'));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}


	public function listOfglsubcode($glcode,$username) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('b' => 'ourbank_glsubcode'),array('id'))
			->join(array('a' => 'ourbank_glcode'),'a.id=b.glcode_id',array('glcode'))
			->where('a.id = ?',$glcode)
                        ->join(array('c' => 'ourbank_user'),'c.bank_id=b.office_id',array('bank_id'))
                        ->where('c.username = ?',$username);
 	//	die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

	public function listOfledgercode($glcode) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_glcode'),array('id'))
			->where('a.id = ?',$glcode)
			->join(array('b' => 'ourbank_master_ledgertypes'),'a.ledgertype_id=b.id');
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

	public function listOfsubledgercode($glsubcode) {
                $db = $this->getAdapter();
                $sql = "SELECT A.*, B.* FROM ourbank_glcode as A,ourbank_master_ledgertypes as B,ourbank_glsubcode as C where A.ledgertype_id=B.id and C.id ='".$glsubcode."' and C.glcode_id = A.id";
                return $db->fetchAll($sql);
	}

        public function getHeadOffice($username) {
            $db = $this->getAdapter();
                $sql = "select A.id,A.name,A.officetype_id,C.type from 
                        ourbank_office A, ourbank_user B, ourbank_officehierarchy C
                        where B.name='".$username."' AND 
                        B.bank_id = A.id AND
                        C.id = A.officetype_id";
            return $db->fetchAll($sql);

        }

	public function addtransactions($input = array())
	{
		$this->db = Zend_Db_Table::getDefaultAdapter();
		$result = $this->db->insert('ourbank_transaction',$input);
		return $this->db->lastInsertId('ourbank_transaction');
        }

	public function fetchassetsaccount($memberbranch_id) 
	{
		$this->db = Zend_Db_Table::getDefaultAdapter();
		$sql = "select * from   ourbank_bankaccounts where (bank_branch_id='$memberbranch_id') LIMIT 1";
		$result = $this->db->fetchAll($sql,array());
		return $result;
	}

	public function fetchincomeaccount($memberbranch_id) 
	{
		$this->db = Zend_Db_Table::getDefaultAdapter();
		$sql = "select * from   ourbank_bankaccounts where (bank_branch_id='$memberbranch_id') LIMIT 1,1";
		$result = $this->db->fetchAll($sql,array());
		return $result;
	}


	public function fetchlibalitesaccount($memberbranch_id) 
	{
		$this->db = Zend_Db_Table::getDefaultAdapter();
		$sql = "select * from   ourbank_bankaccounts where (bank_branch_id='$memberbranch_id') LIMIT 2,1";
		$result = $this->db->fetchAll($sql,array());
		return $result;
	}

	public function fetchExpendituraccount($memberbranch_id) 
	{
		$this->db = Zend_Db_Table::getDefaultAdapter();
		$sql = "select * from   ourbank_bankaccounts where (bank_branch_id='$memberbranch_id') LIMIT 3,1";
		$result = $this->db->fetchAll($sql,array());
		return $result;
	}

	public function addfromaccounts($tablenamefrom,$bankIDfrom,$fromglsubcodeid,$toglsubcodeid,$transaction_id,$amount) {

                 if (($tablenamefrom == 'ourbank_Income') or ($tablenamefrom == 'ourbank_Expenditure')) {
                        $this->db = Zend_Db_Table::getDefaultAdapter();
                        $data = array('office_id'=> $bankIDfrom,
                                        'glsubcode_id_from'=>$fromglsubcodeid,
                                        'tranasction_id'=>$transaction_id,
                                        'credit'=>'',
                                        'debit'=>$amount,
                                        'recordstatus_id'=>'3');
                        return $this->db->insert($tablenamefrom,$data);
                } else {
                        $this->db = Zend_Db_Table::getDefaultAdapter();
                        $data = array('office_id'=> $bankIDfrom,
                                        'glsubcode_id_from'=>$fromglsubcodeid,
                                        'transaction_id'=>$transaction_id,
                                        'credit'=>'',
                                        'debit'=>$amount,
                                        'record_status'=>'3');
                        return $this->db->insert($tablenamefrom,$data); }
	}


	public function addtoaccounts($tablenameto,$bankIDto,$fromglsubcodeid,$toglsubcodeid,$transaction_id,$amount) {
                if (($tablenameto == 'ourbank_Income') or ($tablenameto == 'ourbank_Expenditure')) {
                        $this->db = Zend_Db_Table::getDefaultAdapter();
                        $data = array('office_id'=> $bankIDto,
                                        'glsubcode_id_to'=>$toglsubcodeid,
                                        'tranasction_id'=>$transaction_id,
                                        'credit'=>$amount,
                                        'debit'=>'',
                                        'recordstatus_id'=>'3');
                        return $this->db->insert($tablenameto,$data);
                } else {
		$this->db = Zend_Db_Table::getDefaultAdapter();
		$data = array('office_id'=> $bankIDto,
				'glsubcode_id_to'=>$toglsubcodeid,
				'transaction_id'=>$transaction_id,
				'credit'=>$amount,
				'debit'=>'',
				'record_status'=>'3');
		return $this->db->insert($tablenameto,$data); }
	}

        public function updateRecord($table,$param,$data)  
            {
                $db = $this->getAdapter();
                $db->update($table, $data , array('transaction_id = '.$param));
                return;
            }

	public function paymenttype() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_paymenttypes'),array('id'));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

	public function paymenttype_id($id) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_paymenttypes'),array('id'))
                        ->where('a.id = ?',$id);
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

        public function getBranchEdit($office_id)
        {
                $db = $this->getAdapter();
                $sql = "select name, id from ourbank_office where parentoffice_id=$office_id";
                return $db->fetchAll($sql);
        }

        public function getBranch($office_id)
        {
                $db = $this->getAdapter();
                $sql = "select a.name, a.id,b.type from ourbank_office a, ourbank_officehierarchy b where a.parentoffice_id='".$office_id."' 
                        and b.id = a.officetype_id";
                return $db->fetchAll($sql);
        }

//         public function getbalanceto($toglsubcode,$tablenameto)
//         {
//                 $db = $this->getAdapter();
//                $sql = "select sum(credit)-sum(debit) as balance from ourbank_Assets where glsubcode_id_to=".$toglsubcode." or glsubcode_id_from=$toglsubcode";
//                 return $db->fetchAll($sql);
//         }
        public function getbalance($glsubcode,$tablename)
        {
                $db = $this->getAdapter();
                $sql = "select sum(credit)-sum(debit) as balance from ".$tablename." where glsubcode_id_from=".$glsubcode." or glsubcode_id_to=$glsubcode";
                return $db->fetchAll($sql);
        }
}
