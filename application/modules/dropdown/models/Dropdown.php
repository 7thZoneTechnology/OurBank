<?php 
class Dropdown_Model_Dropdown extends Zend_Db_Table 
{
     protected $_name='ourbank_master_gender';
    public function tableContent($tableName) 
    {        $select = $this->select()
                        ->setIntegrityCheck(false)
			->from(array('a' => $tableName));
       $result = $this->fetchAll($select);
       return $result->toArray();
     // die($select->__toString($select));
    }
    
    public function insertContent($tName,$input = array())
    {
       $db = $this->getAdapter();
	$db->insert("$tName",$input);
	return '1';
      
    }
public function getdetails($tName,$id) {
		 $select = $this->select()
                        ->setIntegrityCheck(false)
			->from(array('a' => $tName),array('id','name'))
			->where('a.id = ?',$id);

//die($select->__toString($select));


       $result = $this->fetchAll($select);
       return $result->toArray();
	}
 public function tabledata($tablename)
    {
	$select = $this->select()
		->setIntegrityCheck(false)  

		->join(array('b' => $tablename),array('b.id'));
		

		//die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	 
        
    }
 public function district($state) {
//         $this->db = Zend_Db_Table::getDefaultAdapter();
//         $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
//         $sql = "SELECT * FROM ourbank_master_districtlist WHERE state_id= $state";
//         $result = $this->db->fetchAll($sql,array());
// 		die($);
//         return $result;
 $select = $this->select()
             ->setIntegrityCheck(false)
			->from(array('a' => 'ourbank_master_districtlist'),array('a.id','a.name'))
			->where('a.state_id = ?',$state);

// die($select->__toString($select));


       $result = $this->fetchAll($select);
       return $result->toArray();
    }
public function hobli($taluk) {
 $select = $this->select()
             ->setIntegrityCheck(false)
			->from(array('a' => 'ourbank_master_hoblilist'),array('a.id','a.name'))
			->where('a.taluk_id = ?',$taluk);

// die($select->__toString($select));


       $result = $this->fetchAll($select);
       return $result->toArray();
    }
	public function panchayath($gillapanchayath) {
 	$select = $this->select()
             ->setIntegrityCheck(false)
			->from(array('a' => 'ourbank_master_villagelist'),array('a.id','a.name'))
			->where('a.gillapanchayath_id = ?',$gillapanchayath);
 //die($select->__toString($select));


       $result = $this->fetchAll($select);
       return $result->toArray();
    }
public function Createtable($tablename) {
        $db = $this->getAdapter();

 		$sql = "CREATE TABLE $tablename (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         name VARCHAR(100),
created_by int(11),
created_date datetime
       );";
		$result=$db->query($sql);
         return $result;
    }
public function insert($commonname) {
        $db = $this->getAdapter();

 		$sql = "CREATE TABLE $commonname (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
         name VARCHAR(100),
created_by int(11),
created_date datetime
       );";
		$result=$db->query($sql);
         return $result;
    }

}
    
