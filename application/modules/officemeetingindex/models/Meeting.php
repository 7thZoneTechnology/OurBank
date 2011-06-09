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
class Officemeetingindex_Model_Meeting extends Zend_Db_Table {
	protected $_name = 'ourbank_officemeeting';

// 	public function fetchAllmeetingdetails() {
// 		$select = $this->select()
// 			->setIntegrityCheck(false)
// 			->from('ourbank_officemeeting');
// // 			->order(array('creditline_id DESC'));
// 		$result = $this->fetchAll($select);
// 		return $result->toArray();
// 	}

    public function fetchAllmeetingdetails() 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_officemeeting'),array('id'))
                ->join(array('b'=>'ourbank_office'),'b.id = a.office_id',array('b.id as gid','b.name as officename'))
                ->order(array('a.id DESC'));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

	public function SearchMeeting($post) {
               $select = $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_officemeeting'),array('id'))
                ->join(array('b'=>'ourbank_office'),'b.id = a.office_id',array('b.id as gid','b.name as officename'))
                ->where('a.name like "%" ? "%"',$post['meetingname'])
                ->where('a.frequency like "%" ? "%"',$post['frequency'])
                ->where('a.place like "%" ? "%"',$post['place'])
                ->where('a.office_id like "%" ? "%"',$post['office'])
	        ->order(array('a.id DESC'));
                //die($select->__toString($select));	
                $result = $this->fetchAll($select);
                return $result->toArray();
       }
}
