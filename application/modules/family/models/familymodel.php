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
?>

<?php
class Family_Model_familymodel extends Zend_Db_Table
{
        protected $_name = 'ourbank_family';
  // fetch the member details query
    public function getMemberDetails($userid) {

//         $selectC = $this->select()
//                         ->setIntegrityCheck(false)  
//                    ->join(array('b'=>'ourbank_familymember'),array('b.family_id'));
// 
        $selectA = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_family'),array('a.id'))
                        ->join(array('d'=>'ourbank_office'),'d.id=a.rev_village_id',array('d.name as villagename'))
                        ->join(array('c'=>'ourbank_user'),'c.id=a.created_by',array('c.name as username'))
                        ->where('c.id=?',$userid);
    //    die($selectA->__toString($selectA));	
	return $this->fetchAll($selectA);
    }

//fetch the member details from search options...
    public function searchDetails($userid,$post = array()) 
    {       
         $keyvalue = array_filter($post);
	    $searchcounter = count($keyvalue);
	    if($searchcounter > 0) 
	   { 
             $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_family'),array('a.id'))
                        ->join(array('b'=>'ourbank_office'),'b.id=a.rev_village_id',array('b.name as villagename'))
                        ->join(array('c'=>'ourbank_user'),'c.id=a.created_by',array('c.name as username'))
                        ->where('a.code like "%" ? "%"',$post['s1'])
                        ->where('a.rev_village_id like "%" ? "%"',$post['s3'])
                        ->where('a.house_no like "%" ? "%"',$post['s2'])
                      //  ->where('a.family_id like "%" ? "%"',$post['familyid']);
                        ->order(array('a.id DESC'))
                       ->where('c.id=?',$userid);
  // die($select->__toString($select));	
	//echo $select;
	return $this->fetchAll($select);
    }else{
            $select = $this->select()
			->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_family'),array('a.id'))
                        ->join(array('b'=>'ourbank_office'),'b.id=a.rev_village_id',array('b.name as villagename'));
                        //->join(array('c'=>'ourbank_user'),'c.id=a.created_by',array('c.name as username'));

			//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
		}
	}


//get the office hierarchy id from the maximum hierarchy level
        public function getoffice_hierarchy() {
        $db = $this->getAdapter();
        $sql = "SELECT id FROM `ourbank_officehierarchy` where Hierarchy_level in (SELECT max(Hierarchy_level) FROM `ourbank_officehierarchy`)";
        $result = $db->fetchAll($sql);
        return $result;
    }

//get the office name and id with respective office type
    public function getoffice($id){
        $select=$this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a'=>'ourbank_office'),array('a.id'),array('a.id as office_id','a.name'))
                    ->where('a.officetype_id=?',$id);
                     return $this->fetchAll($select);

    }
}

