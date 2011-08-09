<?php 
class Dropdown_Model_Dropdown extends Zend_Db_Table 
{
     protected $_name='ourbank_master_gender';
    public function tableContent($tableName)  {
        $select = $this->select()
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
			->from(array('a' => $tName),array('id','name as habit','name_regional'))
			->where('a.id = ?',$id);

		$result = $this->fetchAll($select);
       return $result->toArray();
    }
 	public function getdetails($tName,$id) {
			switch($tName) {
				case 'ourbank_master_villagelist':
					{ 
						$select = $this->select()
              			->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','panchayath_id','a.name_regional'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_gillapanchayath'),array('id as gpid','name_regional as gpname','hobli_id'))
				->where('b.id =a.panchayath_id')
 						->from(array('c' =>'ourbank_master_hoblilist'),array('id as hbid','name_regional as hbname','taluk_id'))
				->where('c.id =b.hobli_id')
 						->from(array('d' =>'ourbank_master_taluklist'),array('id as tid','name_regional as tname','district_id'))
				->where('d.id =c.taluk_id')
						->from(array('e' =>'ourbank_master_districtlist'),array('id as did','name_regional as dname','state_id'))
                ->where('e.id =d.district_id');
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
				
				case 'ourbank_master_gillapanchayath':{ 
						$select = $this->select()
              			->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','hobli_id','a.name_regional'))
				->where('a.id = ?',$id)
// 						->from(array('c' =>'ourbank_master_gillapanchayath'),array('id as gpid','name_regional as gpname'))
//                 ->where('c.id =a.hobli_id')
						->from(array('d' =>'ourbank_master_hoblilist'),array('id as hbid','name_regional as hbname','taluk_id'))
                ->where('d.id =a.hobli_id')
						->from(array('e' =>'ourbank_master_taluklist'),array('id as tid','name_regional as tname','district_id'))
                ->where('e.id =d.taluk_id')
						->from(array('f' =>'ourbank_master_districtlist'),array('id as did','name_regional as dname','state_id'))
						->from(array('g' =>'ourbank_master_state'),array('id as sid','name_regional as sname'))
                ->where('f.id =e.district_id');
// die($select->__toString($select));
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
				case 'ourbank_master_hoblilist':{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','taluk_id','a.name_regional'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_taluklist'),array('id as tid','name_regional as tname','district_id'))
                ->where('b.id =a.taluk_id')
						->from(array('c' =>'ourbank_master_districtlist'),array('id as did','name_regional as dname','state_id'))
						->from(array('g' =>'ourbank_master_state'),array('id as sid','name_regional as sname'))
                ->where('c.id =b.district_id');
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
			case 'ourbank_master_taluklist':	{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','district_id','a.name_regional'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_districtlist'),array('id as did','name_regional as dname','state_id'))
						->from(array('g' =>'ourbank_master_state'),array('id as sid','name_regional as sname'))
                ->where('b.id =a.district_id');
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
			case 'ourbank_master_mastertables':	{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','descriptions','a.name_regional'))
				->where('a.id = ?',$id);
						$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
			case 'ourbank_master_cbopromoter':{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id as cbid','name as habit','a.name_regional'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_office'),array('id as oid','name as oname','officetype_id'))
					->where('b.id =a.koota_id');
// // 				die($select->__toString($select));
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
			case 'ourbank_master_cbos':{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id as cbosid','name as habit','a.name_regional'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_cbopromoter'),array('id as cbid','name_regional as cbname'))
					->where('b.id =a.cbopromoter_id');
// // 				die($select->__toString($select));
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
			case 'ourbank_master_districtlist':{ 
				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','state_id','a.name_regional'))
						->from(array('g' =>'ourbank_master_state'),array('id as sid','name_regional as sname'))

				->where('a.id = ?',$id);
				
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
			case 'ourbank_master_bank':{ 
				$select = $this->select()
              		->setIntegrityCheck(false)
					->from(array('a' => $tName),array('id','name as habit','a.name_regional','a.village_id'))
				->where('a.id = ?',$id)
					->join(array('b' =>'ourbank_master_accountype'),'b.id  =a.accounttype_id',array('id as accid','name_regional as accname'))
					->join(array('c' =>'ourbank_master_villagelist'),'c.village_id = a.village_id',array('village_id','name_regional as vname'))
					->join(array('d' =>'ourbank_master_gillapanchayath'),'d.id =c.panchayath_id',array('id as gpid','name_regional as gpname'));
// die($select->__toString($select));
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
			case 'ourbank_master_branch':{ 
				$select = $this->select()
				->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','bank_id','a.name_regional'))
				->where('a.id = ?',$id)
						->from(array('b' => 'ourbank_master_bank'),array('id as bankid','name_regional as bankname','accounttype_id'))
						->join(array('c' =>'ourbank_master_villagelist'),'c.village_id = a.village_id',array('village_id','name_regional as vname'))
						->join(array('d' =>'ourbank_master_gillapanchayath'),'d.id =c.panchayath_id',array('id as gpid','name_regional as gpname'))
				->where('b.id  =a.bank_id');
/*die($select->__toString($select));*/
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
			case 'ourbank_master_habitation':{ 
 				$select = $this->select()
              ->setIntegrityCheck(false)
						->from(array('a' => $tName),array('id','name as habit','village_id','a.name_regional'))
				->where('a.id = ?',$id)
						->from(array('b' =>'ourbank_master_villagelist'),array('id as vid','name_regional as vname','panchayath_id'))
                ->where('b.village_id =a.village_id')
						->from(array('c' =>'ourbank_master_gillapanchayath'),array('id as gpid','name_regional as gpname','hobli_id'))
                ->where('c.id =b.panchayath_id')
						->from(array('d' =>'ourbank_master_hoblilist'),array('id as hbid','name_regional as hbname','taluk_id'))
                ->where('d.id =c.hobli_id')
						->from(array('e' =>'ourbank_master_taluklist'),array('id as tid','name_regional as tname','district_id'))
                ->where('e.id =d.taluk_id')
						->from(array('g' =>'ourbank_master_state'),array('id as sid','name_regional as sname'))
						->from(array('f' =>'ourbank_master_districtlist'),array('id as did','name_regional as dname','state_id'))
                ->where('f.id =e.district_id');
// // 				die($select->__toString($select));
				$result = $this->fetchAll($select);
       			return $result->toArray();
				}break;
		}
				$select = $this->select()
              ->setIntegrityCheck(false)
				->from(array('a' => $tName),array('id','name as habit','name_regional'))
				->where('a.id = ?',$id);

				$result = $this->fetchAll($select);
       			return $result->toArray();
	}
 	public function tabledata($tablename){

	if($tablename=='ourbank_master_habitation'){
		$select = $this->select()
            ->setIntegrityCheck(false)
				->from(array('a' => $tablename),array('id','name as habit','village_id','a.name_regional'))
				->from(array('b' =>'ourbank_master_villagelist'),array('id as vid','name as vname','panchayath_id'))
               		->where('b.village_id =a.village_id')
				->from(array('c' =>'ourbank_master_gillapanchayath'),array('id as gpid','name as gpname','hobli_id'))
        	        ->where('c.id =b.panchayath_id')

				->join(array('d'=>'ourbank_office'),'d.id=a.village_id',array('d.id','d.parentoffice_id'))
                ->join(array('e'=>'ourbank_officehierarchy'),'e.id=d.officetype_id',array('e.type'));

//  die($select->__toString($select));

		$result = $this->fetchAll($select);
    	return $result->toArray();
		} elseif($tablename=='ourbank_master_gillapanchayath') {
		$select = $this->select()
            ->setIntegrityCheck(false)
				->from(array('a' => $tablename),array('id','name as habit','hobli_id','a.name_regional'))
				->from(array('b' =>'ourbank_master_hoblilist'),array('id as hbid','name as hbname','taluk_id'))
                	->where('b.id =a.hobli_id')
				->from(array('e' =>'ourbank_master_taluklist'),array('id as tid','name as tname','district_id'))
                	->where('e.id =b.taluk_id');
		$result = $this->fetchAll($select);
    	return $result->toArray();
		} elseif($tablename=='ourbank_master_taluklist') {
		$select = $this->select()
            ->setIntegrityCheck(false)
				->from(array('a' => $tablename),array('id','name as habit','district_id','a.name_regional'))
				->from(array('b' =>'ourbank_master_districtlist'),array('id as did','name as dname','state_id'))
                	->where('a.district_id =b.id');

		$result = $this->fetchAll($select);
    	return $result->toArray();
		}elseif($tablename=='ourbank_master_hoblilist') {
		$select = $this->select()
            ->setIntegrityCheck(false)
					->from(array('a' => $tablename),array('id','name as habit','taluk_id','a.name_regional'))
					->from(array('b' =>'ourbank_master_taluklist'),array('id as tid','name as tname','district_id'))
                ->where('b.id =a.taluk_id');
		$result = $this->fetchAll($select);
    	return $result->toArray();
		}elseif($tablename=='ourbank_master_cbopromoter') {
		$select = $this->select()
            ->setIntegrityCheck(false)
			->from(array('a' => $tablename),array('id as cbid','name as habit','a.name_regional'))
			->join(array('b'=>'ourbank_office'),'b.id=a.koota_id',array('parentoffice_id','name as kootaname'))
            ->join(array('c'=>'ourbank_officehierarchy'),'c.id=b.officetype_id',array('c.type'));
		$result = $this->fetchAll($select);
    	return $result->toArray();
		}elseif($tablename=='ourbank_master_cbos') {
		$select = $this->select()
            ->setIntegrityCheck(false)
			->from(array('a' => $tablename),array('id as cbosid','name as habit','a.name_regional'))
			->from(array('b' =>'ourbank_master_cbopromoter'),array('b.id'))
				 ->where('b.id =a.cbopromoter_id')
			->join(array('c'=>'ourbank_office'),'c.id=b.koota_id',array('c.id','c.parentoffice_id','name as kootaname'));
// die($select->__toString($select));
		$result = $this->fetchAll($select);
    	return $result->toArray();
		}elseif($tablename=='ourbank_master_bank') {
		$select = $this->select()
            ->setIntegrityCheck(false)
			->from(array('a' => $tablename),array('id','name as habit','a.name_regional','a.village_id'))
			->join(array('b' =>'ourbank_master_villagelist'),'b.village_id = a.village_id',array('village_id','name as vname'))
			->join(array('c' =>'ourbank_master_gillapanchayath'),'c.id =b.panchayath_id',array('id as gpid','name as gpname'))
			->join(array('d'=>'ourbank_office'),'d.id=a.village_id',array('d.id','d.parentoffice_id'))
            ->join(array('e'=>'ourbank_officehierarchy'),'e.id=d.officetype_id',array('e.type'));
		$result = $this->fetchAll($select);
    	return $result->toArray();
		}elseif($tablename=='ourbank_master_branch') {
		$select = $this->select()
            ->setIntegrityCheck(false)
			->from(array('a' => $tablename),array('id','name as habit','a.name_regional','a.bank_id','a.village_id'))
			->from(array('b' => 'ourbank_master_bank'),array('b.id','name as bankname'))
				 ->where('b.id = a.bank_id')
			->join(array('c' =>'ourbank_master_villagelist'),'c.village_id=a.village_id',array('village_id'))
			->join(array('d' =>'ourbank_master_gillapanchayath'),'d.id =c.panchayath_id',array('id as gpid','name as gpname'))
			->join(array('e'=>'ourbank_office'),'e.id=a.village_id',array('e.id','e.parentoffice_id'))
            ->join(array('f'=>'ourbank_officehierarchy'),'f.id=e.officetype_id',array('f.type'));
//   die($select->__toString($select));
		$result = $this->fetchAll($select);
    	return $result->toArray();
		}else{

	$select = $this->select()
		->setIntegrityCheck(false)  
		->join(array('b' => $tablename),array('b.id'));
		$result = $this->fetchAll($select);
		return $result->toArray();
		}
    }
	 public function district($state) {
 	$select = $this->select()
             ->setIntegrityCheck(false)
			->from(array('a' => 'ourbank_master_districtlist'),array('a.id as did','a.name_regional as dname','a.name'))
			->where('a.state_id = ?',$state);
       $result = $this->fetchAll($select);
       return $result->toArray();
    }
	 public function listkoota() {
 	$select = $this->select()
              ->setIntegrityCheck(false)
					->from(array('b' =>'ourbank_office'),array('id as oid','name as oname','officetype_id'))
				->where('b.officetype_id = (select max(Hierarchy_level)-1 from ourbank_officehierarchy)');
				$result = $this->fetchAll($select);
       			return $result->toArray();
    }

	 public function getkoota($parant) {
 	$select = $this->select()
              ->setIntegrityCheck(false)
					->from(array('a' =>'ourbank_office'),array('a.name as kootaname'))
					->where('a.id =?',$parant);
				$result = $this->fetchAll($select);
       			return $result->toArray();
    }

	 public function gillapanchayath($hobli) {
	 $select = $this->select()
             ->setIntegrityCheck(false)
			->from(array('a' => 'ourbank_master_gillapanchayath'),array('a.id as gpid','a.name_regional as gpname','a.name'))
			->where('a.hobli_id = ?',$hobli);
       $result = $this->fetchAll($select);
       return $result->toArray();
    }
 	public function village($gillapanchayath) {
 	$select = $this->select()
             ->setIntegrityCheck(false)
		->from(array('a' => 'ourbank_master_villagelist'),array('a.id as vid','a.name_regional as vname','a.village_id','a.name'))
			->where('a.panchayath_id = ?',$gillapanchayath);
       $result = $this->fetchAll($select);
       return $result->toArray();
    }
	public function taluk($district) {
 	$select = $this->select()
             ->setIntegrityCheck(false)
			->from(array('a' => 'ourbank_master_taluklist'),array('a.id as tid' ,'a.name_regional as tname','a.name'))
			->where('a.district_id = ?',$district);
       $result = $this->fetchAll($select);
       return $result->toArray();
    }
 	public function hobli($taluk) {
 	$select = $this->select()
             ->setIntegrityCheck(false)
			->from(array('a' => 'ourbank_master_hoblilist'),array('a.id as hbid','a.name_regional as hbname','a.name'))
			->where('a.taluk_id = ?',$taluk);
       $result = $this->fetchAll($select);
       return $result->toArray();
    }
 	public function Createtable($tablename) {
        $db = $this->getAdapter();
 		$sql = "CREATE TABLE $tablename(
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100),created_by int(11),created_date datetime);";
		$result=$db->query($sql);
         return $result;
    }
 	public function insert($commonname) {
        $db = $this->getAdapter();
 		$sql = "CREATE TABLE $commonname (
         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100),created_by int(11),created_date datetime);";
		$result=$db->query($sql);
         return $result;
    }
}