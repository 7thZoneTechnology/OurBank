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
class Familykoota_Model_Familykoota extends Zend_Db_Table
{
    protected $_name = 'ourbank_transaction';

	public function getHier() {
		$select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_officehierarchy'),array('id'))
                ->where('a.id !=1 AND id !=2');
        $result=$this->fetchAll($select);
        return $result->toArray();
	}

	public function fetchDetails($hierarchy,$village_id){
				switch($hierarchy){
					case '3':
					{  $select = $this->select()
				->setIntegrityCheck(false)
				->join(array('a' =>'ourbank_family'),array('a.id'),array('COUNT(a.rev_village_id)','COUNT(a.Koota_id) as countfamily'))
                ->where('a.Koota_id = "'.$village_id.'"')
				->join(array('b' =>'ourbank_familymember'),'a.id = b.family_id',array('COUNT(b.village_id) as indimember'))
                ->joinLeft(array('c' => 'ourbank_groupmembers'),'b.id  = c.member_id',array('c.id as groupmemid'))
                ->joinLeft(array('e' => 'ourbank_group'),'e.id  = c.group_id',array('COUNT(e.village_id) as groupmem'))
				->joinLeft(array('d' =>'ourbank_master_villagelist'),'a.rev_village_id = d.village_id',array('d.name as village'))
				->group('d.id');
		        return $this->fetchAll($select);}break;


				case '4':
			    {   $select = $this->select()
                ->setIntegrityCheck(false)
				->join(array('a' =>'ourbank_family'),array('a.id'),array('COUNT(a.rev_village_id) as countfamily'))
                ->where('a.rev_village_id = "'.$village_id.'"')
				->join(array('b' =>'ourbank_familymember'),'a.id = b.family_id',array('COUNT(b.village_id) as indimember'))
                ->joinLeft(array('c' => 'ourbank_groupmembers'),'b.id  = c.member_id',array('c.id as groupmemid'))
                ->joinLeft(array('e' => 'ourbank_group'),'e.id  = c.group_id',array('COUNT(e.village_id) as groupmem'))
				->joinLeft(array('d' =>'ourbank_master_villagelist'),'a.rev_village_id = d.village_id',array('d.name as village'))
				->group('a.rev_village_id');
                $result = $this->fetchAll($select);
                return $result->toArray();	}break;

				case '5':
			    {      $select = $this->select()
                ->setIntegrityCheck(false)  
				->from(array('f' => 'ourbank_master_village'),array('f.id','f.panchayath_id'))
                ->join(array('a' => 'ourbank_master_gillapanchayath'),'f.panchayath_id = a.id',array('SUM(a.id)','a.name as village'))
                ->joinLeft(array('b' => 'ourbank_family'),'f.village_id = b.rev_village_id',array('COUNT(b.rev_village_id) as countfamily'))
                ->joinLeft(array('c' => 'ourbank_familymember'),'b.village_id = c.family_id',array('COUNT(c.village_id) as indimember'))
			    ->join(array('e' => 'ourbank_groupmembers'),'c.id  = e.member_id',array('e.id as groupmemid'))
                ->joinLeft(array('d' => 'ourbank_group'),'e.group_id = d.id',array('COUNT(d.village_id) as groupmem'))
				->where('a.id = "'.$village_id.'"');
                $result = $this->fetchAll($select);
                return $result->toArray();
				}
		}
	}

	public function subofficeFromUrl($hierarchy) {
	   switch($hierarchy){
		case '3':{
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id,name  FROM ourbank_office WHERE officetype_id = $hierarchy";
        $result = $this->db->fetchAll($sql,array($hierarchy));
        return $result;   	}break;

		case '4':{
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id,name  FROM ourbank_office WHERE officetype_id = $hierarchy";
        $result = $this->db->fetchAll($sql,array($hierarchy));
        return $result; 	}break;

		case '5':{
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id,name  FROM ourbank_master_gillapanchayath";
        $result = $this->db->fetchAll($sql,array($hierarchy));
        return $result;}break;
		}
	}
	}

