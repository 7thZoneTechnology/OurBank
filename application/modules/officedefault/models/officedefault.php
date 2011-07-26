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
/*
 *  model page for fetch and return office, office hierarchy,glcode,glsubcode, update and delete
 */
class Officedefault_Model_officedefault extends Zend_Db_Table_Abstract {

    protected $_name = 'ourbank_officehierarchy';

      public function getOffice() {
              $select = $this->select()
                       ->setIntegrityCheck(false)
                       ->join(array('a' => 'ourbank_office'),array('a.name,a.short_name'))
                       ->join(array('c'=>'ourbank_officehierarchy'),'a.officetype_id = c.id','c.type');
       $result = $this->fetchAll($select);
       return $result->toArray();
    }

        public function officehierarchyselect() {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT * FROM ourbank_office WHERE id = 1";
        $result = $this->db->fetchAll($sql,array());
        return $result;
    }

        public function getOfficehierarchyDetailsout() {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT * FROM ourbank_officehierarchy WHERE id != 1";
        $result = $this->db->fetchAll($sql,array());
        return $result;
    }

        public function getOfficehierarchyDetails() {
        $result = $this->fetchAll();
        return $result; 
        }
	//select hierarchy wise office
	public function hierarchylevel($officetype_id) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT IF(Hierarchy_level=1,Hierarchy_level,Hierarchy_level-1) as hierarchylevel  FROM ourbank_officehierarchy WHERE id = $officetype_id";
        $result = $this->db->fetchAll($sql,array($officetype_id));
        return $result;
    	}

	public function officetypeid($hierarchylevel) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id  FROM ourbank_officehierarchy WHERE Hierarchy_level = $hierarchylevel";
        $result = $this->db->fetchAll($sql,array($hierarchylevel));
        return $result;
    	}

	public function subofficeFromUrl($officetype_id) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT name,id FROM ourbank_office WHERE officetype_id = $officetype_id";
        $result = $this->db->fetchAll($sql,array($officetype_id));
        return $result;
    	}

        public function subofficeFromUrledit($officetype_id) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT name,id FROM ourbank_office WHERE id = $officetype_id";
        $result = $this->db->fetchAll($sql,array($officetype_id));
        return $result;
    	}
	//select office type
	public function officetypename($officetype_id) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT type,id FROM ourbank_officehierarchy WHERE id = $officetype_id";
        $result = $this->db->fetchAll($sql,array($officetype_id));
        return $result;
    	}
	//insert new office
	public function officeInsert($input = array())
	{
            $this->db = Zend_Db_Table::getDefaultAdapter();
            $result = $this->db->insert('ourbank_office',$input);
            return $this->db->lastInsertId('ourbank_office');
    	}

        public function glcode($glname)
        {
                $select = $this->select()
                       ->setIntegrityCheck(false)  
                       ->join(array('a' => 'ourbank_glcode'),array('a.id'))
                       ->where('a.header like "%" ? "%"',$glname);
                $result = $this->fetchAll($select);
                return $result->toArray();
        }
	//new glsucode generate
        public function genarateGlsubCode1($ledgertype_id,$id)
        {
            $this->db = $this->getAdapter();
            $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            return $this->db->fetchRow("SELECT MAX(glsubcode) as id
                                            FROM  ourbank_glsubcode
                                            where glcode_id = $id and subledger_id = ".$ledgertype_id);
        }
	//filtered glcode
        public function fetchGlcode($id)
        {
            $this->db = $this->getAdapter();
            $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            $result = $this->db->fetchRow("SELECT glcode
                                            FROM  ourbank_glcode
                                            where (id = '$id')");
            return $result;
        }
        //subcode insert
            public function insertGlsubcode($input)
        {
            $this->db = $this->getAdapter();
            $this->db->insert('ourbank_glsubcode',$input);
            return '1';
        }
	//find member
        public function memberfind($id)
        {
          $select = $this->select()
                  ->setIntegrityCheck(false)  
                  ->join(array('a' => 'ourbank_member'),array('a.id'))
                  ->where('a.office_id =?',$id);
          $result = $this->fetchAll($select);
          return $result->toArray();
        }
	//search office
        public function findoffice($id)
        {
          $select = $this->select()
                  ->setIntegrityCheck(false)  
                  ->join(array('a' => 'ourbank_office'),array('a.id'))
                  ->where('a.parentoffice_id =?',$id);
          $result = $this->fetchAll($select);
          return $result->toArray();
        }

        public function gettaluklist($districteid)
        {
          $select = $this->select()
                  ->setIntegrityCheck(false)  
                  ->join(array('a' => 'ourbank_master_taluklist'),array('a.id'))
                  ->where('a.district_id =?',$districteid);
          //die($select->__toString($select));
          $result = $this->fetchAll($select);
          return $result->toArray();

        }

        public function gethoblilist($hobliid)
        {
          $select = $this->select()
                  ->setIntegrityCheck(false)  
                  ->join(array('a' => 'ourbank_master_hoblilist'),array('a.id'))
                  ->where('a.taluk_id =?',$hobliid);
         //die($select->__toString($select));
          $result = $this->fetchAll($select);
          return $result->toArray();
        }

        public function getpanchayathlist($panchayath)
        {
          $select = $this->select()
                  ->setIntegrityCheck(false)  
                  ->join(array('a' => 'ourbank_master_gillapanchayath'),array('a.id'))
                  ->where('a.hobli_id = ?',$panchayath);
         //die($select->__toString($select));
          $result = $this->fetchAll($select);
          return $result->toArray();
        }

        public function findlastlevel()
        {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT MAX(id) as lastid FROM `ourbank_officehierarchy`";
        $result = $this->db->fetchAll($sql,array());
        return $result;

        }

        public function getBranch() {
       $db = $this->getAdapter();
           $sql = 'select * from ourbank_office
                       where officetype_id in
                   (select id from ourbank_officehierarchy
                       where Hierarchy_level in
                   (select max(Hierarchy_level) from ourbank_officehierarchy))';
       $result = $db->fetchAll($sql);
       return $result;
   }

    public function getBranchId() {
       $db = $this->getAdapter();
           $sql = 'select id from ourbank_officehierarchy
                   where Hierarchy_level in
                   (select max(Hierarchy_level) from ourbank_officehierarchy)';
       $result = $db->fetchAll($sql);
       return $result;
   }

       public function get($index) {
       $db = $this->getAdapter();
           $sql = "SELECT a.id,a.name,a.officetype_id,a.parentoffice_id,a.short_name FROM ourbank_office a,ourbank_officehierarchy b where a.parentoffice_id='".$index."' and a.officetype_id = b.id and a.officetype_id != '1'";
       $result = $db->fetchAll($sql);
       return $result;
   }

    public function fetchoffice()
       {
           $db = $this->getAdapter();

           $sql = "select * from ourbank_office where officetype_id = 1";
// echo $sql;
           $result = $db->fetchAll($sql);
         return $result;
       }

       public function fetchofficesub($input)
       {
         $select = $this->select()
               ->setIntegrityCheck(false)  
               ->join(array('a' => 'ourbank_office'),array('a.id'))
//                 ->where('a.officetype_id !=3')
               ->where('a.parentoffice_id = ?',$input);
         $result = $this->fetchAll($select);
         return $result->toArray();
       }

       public function getofficetypename($officetype_id)
       {
         $select = $this->select()
               ->setIntegrityCheck(false)  
               ->join(array('a' => 'ourbank_officehierarchy'),array('a.id'),array('a.id','a.type'))
//                 ->where('a.officetype_id !=3')
               ->where('a.id = ?',$officetype_id);
        //die($select->__toString($select));
         $result = $this->fetchAll($select);
         return $result->toArray();
       }

       public function getvillageaddress($villageid)
       {
         $select = $this->select()
               ->setIntegrityCheck(false)  
               ->join(array('a' => 'ourbank_master_villagelist'),array('a.id'),array('a.name','a.id as villageid'))
               ->join(array('b'=>'ourbank_master_village'),'b.village_id=a.village_id ')
               ->where('a.village_id = ?',$villageid);
         //die($select->__toString($select));
         $result = $this->fetchAll($select);
         return $result->toArray();
       }

      public function updatevillage($village,$input = array()) { echo $village;
        $where[] = "village_id = '".$village."'";
        $db = $this->getAdapter();
        $result = $db->update('ourbank_master_village',$input,$where);
        }


}
