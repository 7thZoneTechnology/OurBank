<?php
class Bank_Model_Bank extends Zend_Db_Table 
{
    protected $_name = 'ob_bank';


        
    public function addBank($table,$post) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
		$db->insert($table,$post);
		return $db->lastInsertId('id');
    }

    public function getBank()
    {
		$select = $this->select()
		->setIntegrityCheck(false)  
		->join(array('a' => 'ob_bank'),array('id '))
		->order('id DESC');
		return $this->fetchAll($select);
    }
    
    public function search($name)
    {
		$select = $this->select()
					->setIntegrityCheck(false)  
					->join(array('a' => 'ob_bank'),array('id '))
        			->where('a.name  like "%" ? "%"',$name)
					->order('id DESC');
		return $this->fetchAll($select);
    }
        
    public function viewBank($id)
    {
	$select = $this->select()
		->setIntegrityCheck(false)  
		->join(array('a' => 'ob_bank'),array('id '))

                ->where('a.id = ?',$id);
	//die($select->__toString($select));
	$result = $this->fetchAll($select);
	return $result->toArray();
	 
        
    }
    
    public function getAddress($institutionid)
    {
         $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->from('ob_address_details')
                        ->where('recordstatus_id = 3 OR recordstatus_id = 1')
                        ->where('module_id = 1')
                        ->where('submodule_id = 2')
                        ->where('id = ?',$institutionid);
            //die($select->__toString($select));             	 	 
            return $result = $this->fetchAll($select);
    }
    
    public function getContact($institutionid)
    {
      $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->from('ob_contact_details')
                        ->where('recordstatus_id = 3 OR recordstatus_id = 1')
                        ->where('module_id = 1')
                        ->where('submodule_id = 2')
                        ->where('id = ?',$institutionid);
            //die($select->__toString($select));             	 	 
            return $result = $this->fetchAll($select);
    }
    
    public function updateBank($id,$data)  
    {
	
        $where = array('id = '.$id,);
		$db = $this->getAdapter();
        $db->update('ob_bank', $data , $where);
        return;
    }

    public function deleteBank($id)  
    {
	
        $where = array('id = '.$id,);
		$db = $this->getAdapter();
        $db->delete('ob_bank',$where);
        return;
    }

}