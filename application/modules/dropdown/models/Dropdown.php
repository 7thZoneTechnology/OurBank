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
	public function editRecord($tName,$id)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => $tName),array('a.id'))
                ->where('a.id =?',$id);
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
	public function deleteRecord($tName,$id)  
    {
        $db = $this->getAdapter();
        $db->delete($tName, $id);
        return '1';
    }
public function getdetailss($tName,$id)  
    {
      		$select = $this->select()
            ->setIntegrityCheck(false)
			->from(array('a' => $tName),array('id','name as habit'))
			->where('a.id = ?',$id);

		$result = $this->fetchAll($select);
       return $result->toArray();
    }

public function getdetails($tName,$id) {
// 				$select = $this->select()
//               ->setIntegrityCheck(false)
// 						->from(array('a' => $tName),array('id','name as habit'))
// 				->where('a.id = ?',$id);
// 
// 		$result = $this->fetchAll($select);
//        return $result->toArray();

			switch($tName) {

				case 'ourbank_master_villagelist':
					{ 
						$select = $this->select()
              			->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','gp_id'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_gillapanchayath'),array('id','name','hobli_id'))
				->where('b.id =a.gp_id')
 						->from(array('c' =>'ourbank_master_hoblilist'),array('id','name','taluk_id'))
				->where('c.id =b.hobli_id')
 						->from(array('d' =>'ourbank_master_taluklist'),array('id','name','district_id'))
				->where('d.id =c.taluk_id')
						->from(array('e' =>'ourbank_master_districtlist'),array('id','name','state_id'))
                ->where('e.id =d.district_id');
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
				
				case 'ourbank_master_gillapanchayath':
					{ 
						$select = $this->select()
              			->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','hobli_id'))
				->where('a.id = ?',$id)
						->from(array('c' =>'ourbank_master_gillapanchayath'),array('id','name','hobli_id'))
                ->where('c.id =a.hobli_id')
						->from(array('d' =>'ourbank_master_hoblilist'),array('id','name','taluk_id'))
                ->where('d.id =c.hobli_id')
						->from(array('e' =>'ourbank_master_taluklist'),array('id','name','district_id'))
                ->where('e.id =d.taluk_id')
						->from(array('f' =>'ourbank_master_districtlist'),array('id','name','state_id'))
                ->where('f.id =e.district_id');
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;

				case 'ourbank_master_hoblilist':
					{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','taluk_id'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_taluklist'),array('id','name','district_id'))
                ->where('b.id =a.taluk_id')
						->from(array('c' =>'ourbank_master_districtlist'),array('id','name','state_id'))
                ->where('c.id =b.district_id');
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
				case 'ourbank_master_taluklist':
					{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','district_id'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_districtlist'),array('id','name','state_id'))
                ->where('b.id =a.district_id');
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
				case 'ourbank_master_districtlist':
					{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','state_id'))
				->where('a.id = ?',$id);
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;

				case 'ourbank_master_branch':
					{ 
				$select = $this->select()
				->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','bank_id'))
				->where('a.id = ?',$id)
						->from(array('b' => 'ourbank_master_bank'),array('id','accounttype_id'))
				->where('b.id  =a.bank_id');
/*die($select->__toString($select));*/
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;

				case 'ourbank_master_habitation':
					{ 
 				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','village_id'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_villagelist'),array('id','name','gp_id'))
                ->where('b.id =a.village_id')
						->from(array('c' =>'ourbank_master_gillapanchayath'),array('id','name','hobli_id'))
                ->where('c.id =b.gp_id')
						->from(array('d' =>'ourbank_master_hoblilist'),array('id','name','taluk_id'))
                ->where('d.id =c.hobli_id')
						->from(array('e' =>'ourbank_master_taluklist'),array('id','name','district_id'))
                ->where('e.id =d.taluk_id')
						->from(array('f' =>'ourbank_master_districtlist'),array('id','name','state_id'))
                ->where('f.id =e.district_id');
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
		}

				$select = $this->select()
              ->setIntegrityCheck(false)
				->from(array('a' => $tName),array('id','name as habit'))
				->where('a.id = ?',$id);

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
    
