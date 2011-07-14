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
			->join(array('b' => 'ourbank_master_ledgertypes'),'a.ledgertype_id=b.id');
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

        public function getHeadOffice($username) {
            $db = $this->getAdapter();
//             $sql = "select id, name, officetype_id from
//                ourbank_office where officetype_id = 
//                (select officetype_id from ourbank_officehierarchy where Hierarchy_level = (select max(Hierarchy_level) from ourbank_officehierarchy))";
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

		$this->db = Zend_Db_Table::getDefaultAdapter();
		$data = array('office_id'=> $bankIDfrom,
				'glsubcode_id_from'=>$fromglsubcodeid,
				'transaction_id'=>$transaction_id,
				'credit'=>'',
				'debit'=>$amount,
				'record_status'=>'3'); echo '<pre>'; print_r($data);
		return $this->db->insert($tablenamefrom,$data);
	}


	public function addtoaccounts($tablenameto,$bankIDto,$fromglsubcodeid,$toglsubcodeid,$transaction_id,$amount) {
                if ($tablenameto == 'ourbank_Income') {
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
        //      echo $sql;
                return $db->fetchAll($sql);
        }

        public function getBranch($office_id)
        {
                $db = $this->getAdapter();
                $sql = "select a.name, a.id,b.type from ourbank_office a, ourbank_officehierarchy b where a.parentoffice_id='".$office_id."' 
                        and b.id = a.officetype_id";
        //      echo $sql;
                return $db->fetchAll($sql);
        }

        public function getbalanceto($toglsubcode,$tablenameto)
        {
                $db = $this->getAdapter();
               $sql = "select sum(credit)-sum(debit) as balance from ourbank_Assets where glsubcode_id_to=".$toglsubcode;
                return $db->fetchAll($sql);
        }
        public function getbalancefrom($fromglsubcode,$tablenamefrom)
        {
                $db = $this->getAdapter();
               $sql = "select sum(credit)-sum(debit) as balance from ourbank_Assets where glsubcode_id_from=".$fromglsubcode;
                return $db->fetchAll($sql);
        }
}
