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
class Familydefault_Model_familydefault extends Zend_Db_Table
{
    protected $_name = 'ourbank_family';

//geting saving id from the product offer table
    public function productoffers($savingname)
    {

        $db = $this->getAdapter();
       $sql = "SELECT `id` FROM `ourbank_productsoffer` WHERE shortname like('psi') && `applicableto` = (SELECT `id` FROM `ourbank_master_membertypes` WHERE `type` = ('Individual'))";
        $result = $db->fetchOne($sql); // return the product id details for that group
        return $result;
    }

	public function office($kootaid) {
           $select = $this->select()
                   ->setIntegrityCheck(false)
                   ->from(array('a' => 'ourbank_office'),array('name as villagename','id as village_id'))
                   ->where('a.officetype_id =?',$kootaid);

           //die($select->__toString($select));
           return $this->fetchAll($select);
       }

       public function getofficehierarchy()
       {
        $db = $this->getAdapter();
       $sql = "SELECT id as hierarchyid FROM `ourbank_officehierarchy` where Hierarchy_level in (SELECT max(Hierarchy_level) FROM `ourbank_officehierarchy`)";
       $result = $db->fetchAll($sql);
       return $result;
       }
//delete record with respective to table name and parameter
    public function deleteRecord($table,$param)  
    {
        $db = $this->getAdapter();
        $condition = array('member_id = '.$param);
        $db->delete($table, $condition);
        return;
    }

//geting family details record with respective to table name and parameter
    public function getfamilydetails($table,$param)
    {
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>$table),array('a.id'))
        ->where('a.member_id=?',$param);
        $result=$this->fetchAll($select);
        return $result->toArray();
        //die ($select->__toString($select));

    }

//find the active account number
    public function findaccount($id)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_accounts'),array('a.id'),array('a.id','a.member_id'))
                ->where('a.status_id=1')
                ->where('a.member_id =?',$id);
        $result = $this->fetchAll($select);
        return $result->toArray();
        //die($select->__toString($select));
    }

//update record with respective to table name and parameter
    public function updateLog($table,$param)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->insert($table,$param);
        return 1;
    }

	public function finduser($finduser,$officetype)
       {
           $select=$this->select()
                   ->setIntegrityCheck(false)
                   ->join(array('a'=>'ourbank_user'),array('id'),array('a.id','a.name as username','a.designation'))
                   ->join(array('b'=>'ourbank_office'),'a.bank_id=b.id',array('b.name as officename','b.id as officeid'))
                   ->where('a.id=?',$finduser)
				   ->where('b.officetype_id=?',$officetype);
            // die($select->__toString($select));
            $result=$this->fetchAll($select);
            return $result->toArray();
       }

    public function getIds($id)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_master_village'),array('a.id') )
                ->where('a.village_id =?',$id);
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
    public function editRecord($table,$id)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => $table),array('a.id'))
                ->where('a.id =?',$id);
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function getinsurance($id)
    {

        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_insurance'),array('a.id'))
                ->join(array('b'=>'ourbank_master_insurance'),'b.id=a.insurance_id',array('b.name as insurancename'))
                ->where('a.family_id=?',$id);
//            die($select->__toString($select));
            $result=$this->fetchAll($select);
            return $result->toArray();
    }

    public function deleteinsurance($param)  
    {
        $db = $this->getAdapter();
                    //$db->delete("ourbank_master_cropdetails",array('member_id = '.$param));
        $db->delete("ourbank_insurance",array('family_id = '.$param));

    // $db->exec("delete from ourbank_master_cropdetails where member_id = $param");
        return;
    }

// 	public function getsubcaste($id) {
// 		$select=$this->select()
// 			->setIntegrityCheck(false)
// 			->join(array('a'=>'ourbank_master_subcaste'),array('id'),array('a.name as subcastename','a.id as subcaste_id'))
// 			->join(array('b'=>'ourbank_master_castetype'),'b.id = a.caste_id')
//                         ->where('b.id=?',$id);
//                 //die($select->__toString($select));
// 		$result = $this->fetchAll($select);
// 		return $result->toArray();
// 	}

	public function gethabitation($id) {
		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_master_habitation'),array('id'),array('a.name as villagename','a.id'))
                        ->where('a.village_id =?',$id);
         //die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

        public function getparentid($tablename,$rev_villageid)
        { 
		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>$tablename),array('id'))
                        ->where('a.parentoffice_id =?',$rev_villageid);
         //die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
        }

        public function getpincode($rev_villageid,$sub_id)
        {
		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_address'),array('id'))
                        ->where('a.submodule_id  =?',$sub_id)
                        ->where('a.id =?',$rev_villageid);
                //die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
        }

        public function checkSujeevanNo($sujeevana_no,$rev_vill)
        {
                $db = $this->getAdapter();
                $sql = "select sujeevana from ourbank_family where sujeevana='".$sujeevana_no."' and rev_village_id='".$rev_vill."'";
                $result = $db->fetchAll($sql);
                return $result;
        }
    
}
}
    
}
