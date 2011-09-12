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


	public function listOfglsubcode($glcode) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_glcode'),array('id'))
			->where('a.id = ?',$glcode)
			->join(array('b' => 'ourbank_glsubcode'),'a.id=b.glcode_id');
 	//	die($select->__toString($select));



		$result = $this->fetchAll($select);
		return $result->toArray();
	}

	public function listOfledgercode($glcode) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_glcode'),array('id'))
			->where('a.id = ?',$glcode)
			->join(array('b' => 'ourbank_ledgertypes'),'a.ledgertype_id=b.id');
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

        public function getHeadOffice() {
            $db = $this->getAdapter();
            $sql = "select id, name, officetype_id from
               ourbank_office where officetype_id = 
               (select officetype_id from ourbank_officehierarchy where Hierarchy_level = (select max(Hierarchy_level) from ourbank_officehierarchy))";
//echo $sql;

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

		$this->db = Zend_Db_Table::getDefaultAdapter();
		$data = array('office_id'=> $bankIDfrom,
				'glsubcode_id_to'=>$fromglsubcodeid,
				'transaction_id'=>$transaction_id,
				'credit'=>'',
				'debit'=>$amount,
				'record_status'=>'3');
		return $this->db->insert($tablenamefrom,$data);
	}


	public function addtoaccounts($tablenameto,$bankIDto,$fromglsubcodeid,$toglsubcodeid,$transaction_id,$amount) {

		$this->db = Zend_Db_Table::getDefaultAdapter();
		$data = array('office_id'=> $bankIDto,
				'glsubcode_id_to'=>$toglsubcodeid,
				'transaction_id'=>$transaction_id,
				'credit'=>$amount,
				'debit'=>'',
				'record_status'=>'3');
		return $this->db->insert($tablenameto,$data);
	}

	public function paymenttype() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_paymenttypes'),array('id'));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}
 public function getBranchEdit($office_id) {

        $db = $this->getAdapter();
        $sql = "select name, id from ourbank_office where parentoffice_id=$office_id";
//      echo $sql;
        return $db->fetchAll($sql);

    }
}
