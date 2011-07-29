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
class Attendance_Model_Attend extends Zend_Db_Table {
    protected $_name = 'ourbank_member';

public function fetchgroupid($meeting_ID) {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_meeting'),array('id'))
                ->where('a.id = '.$meeting_ID);
	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();		
    }


    public function fetchMembers($meeting_ID,$groupid) {
        $select = $this->select()
                ->setIntegrityCheck(false)

                ->join(array('a' => 'ourbank_meeting'),array('a.id'),array('a.day','a.grouphead_name','a.place','a.time'))
                ->where('a.id =?',$meeting_ID)
                ->join(array('b' => 'ourbank_group'),'b.village_id = a.village_id',array('b.id','b.name as groupname'))
            ->where('b.id =?',$groupid)
		->join(array('c' => 'ourbank_groupmembers'),'c.group_id = b.id',array('c.member_id'))
		->join(array('d' => 'ourbank_familymember'),'d.id = c.member_id',array('d.name as membername','d.id'))
->join(array('e' => 'ourbank_master_weekdays'),'a.day = e.id',array('e.name as day'));


	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        //$count = $result->count(); 
        return $result->toArray();		
    }
	
}
