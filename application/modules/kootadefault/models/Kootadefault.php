<?php
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

class Kootadefault_Model_Kootadefault extends Zend_Db_Table {
   	protected $_name = 'ourbank_member'; // set ourbank_member is a parent table

        public function getofficehierarchy()
        {
         $db = $this->getAdapter();
        $sql = "SELECT id as hierarchyid FROM `ourbank_officehierarchy` where id in (SELECT max(id)-1 FROM `ourbank_officehierarchy`)";
        $result = $db->fetchAll($sql);
        return $result;
        }
	
        // get SHG or JLG groups
	public function GetGroups() {
        $db = $this->getAdapter();
	$sql = "select * from ourbank_group where id not in(select group_id from ourbank_groupmembers where member_id in(select member_id from ourbank_kootamembers)) ";
	$result = $db->fetchAll($sql);
	return $result;
	}

// get group location geo location 
	public function getmemberdetails($id){ 
		$select=$this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a' => 'ourbank_group_representatives'),array('id'),array('representative_id','group_id'))
                    ->where('a.group_id = '.$id)
                    ->join(array('b' => 'ourbank_familymember'),'b.id = a.representative_id',array('name as membername'));
		$result=$this->fetchAll($select);
		return $result->toArray();
        }

        public function getkoota($id){ 
		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a' => 'ourbank_koota'),array('id'))
			->where('a.koota_id = '.$id)
			->join(array('b' => 'ourbank_office'),'b.id  = a.koota_id',array('name as kootaname'));
		$result=$this->fetchAll($select);
		return $result->toArray();
        } 
	public function assignGroups($kootaid) {
                $db = $this->getAdapter();
                $sql = "(SELECT a.group_id,b.name as groupname FROM ourbank_groupmembers as a, ourbank_group as b WHERE member_id in (SELECT member_id FROM ourbank_kootamembers WHERE koota_id in(SELECT id FROM ourbank_koota WHERE koota_id = $kootaid)) and (b.id = a.group_id))";
                $result = $db->fetchAll($sql);
                return $result; // return assigned group
	}

        public function assignMembers($kootaid) {
                $db = $this->getAdapter();
                $sql = "(SELECT member_id FROM ourbank_kootamembers WHERE koota_id in(SELECT id FROM ourbank_koota WHERE koota_id = $kootaid))";
                $result = $db->fetchAll($sql);
                return $result; // return assigned group
	} 

        public function getgroupsforkoota($kootaid) {

                $db = $this->getAdapter();
                $sql = "SELECT id,name FROM ourbank_group where village_id  in (select id from ourbank_office WHERE parentoffice_id = $kootaid)";
                $result = $db->fetchAll($sql);
                return $result; // return group
	}



}
