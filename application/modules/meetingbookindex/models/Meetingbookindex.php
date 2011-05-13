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
class Meetingbookindex_Model_Meetingbookindex extends Zend_Db_Table {
	protected $_name = 'ourbank_meeting';
	
	

    public function fetchAllmeetingdetails() 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
//                 ->join(array('a'=>'ourbank_meeting'),array('id'))
                ->join(array('b'=>'ourbank_group'),array('b.id as gid','b.name as gname'))
                ->order(array('b.id DESC'));
// die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function fetchAllattendancedetailsview() 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_attendance'),array('id'),array('a.id as attid','a.meeting_date','a.week_no'))
                ->group('a.id')
                ->join(array('b' => 'ourbank_group'),'a.meeting_id = b.id');
// die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
    public function SearchAttendance($post) 
    {
        $convertdate = new App_Model_dateConvertor();
        if($post['search_meeting_date']) { 
            $search_meeting_date=$convertdate->phpmysqlformat($post['search_meeting_date']);
        }
        else{
            $search_meeting_date=$post['search_meeting_date'];
        }
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_attendance'),array('id'),array('a.id as attid','a.meeting_date', 'a.week_no'))
                ->where('a.meeting_id like "%" ? "%"',$post['search_meeting_name_att'])
                ->where('a.meeting_date like "%" ? "%"',$search_meeting_date)
                ->group('a.id')
                ->join(array('b' => 'ourbank_group'),'a.meeting_id = b.id');
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
}
