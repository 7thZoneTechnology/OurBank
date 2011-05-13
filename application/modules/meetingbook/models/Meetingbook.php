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
class Meetingbook_Model_Meetingbook extends Zend_Db_Table 
{
    protected $_name = 'ourbank_attendance';

    public function fetchattendancedetailsforID($attendance_id) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_attendance'),array('a.id'),array('a.meeting_id','a.meeting_date', 'a.notes', 'a.resolution', 'a.resolution','a.time as attendancetime','a.week_no as week'))
                ->where('a.id = '.$attendance_id)
                ->group('a.id')
                ->join(array('b' => 'ourbank_group'),'a.meeting_id = b.id')
                ->join(array('c' => 'ourbank_memberattendance'),'a.id = c.attendance_id');
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function fetchattendancedetailsforID1($attendance_id) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_attendance'),array('a.id'),array('a.meeting_id','a.meeting_date', 'a.notes', 'a.resolution', 'a.resolution','a.time as attendancetime','a.week_no as week'))
                ->where('a.id = '.$attendance_id)
                ->group('a.id')
                ->join(array('b' => 'ourbank_group'),'a.meeting_id = b.id');
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
    public function fetchmemberttendance($attendance_id)
    { 
    $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_memberattendance'),array('id'))
                ->where('a.attendance_id = '.$attendance_id);
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function absenteesdetails($attendance_id) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_memberattendance'),array('id'))
                ->where('a.id = '.$attendance_id)
                ->join(array('b' => 'ourbank_familymember'),'a.member_id = b.id')
                ->join(array('c' => 'ourbank_memberattendance'),'a.id = c.attendance_id');
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function assignMembers($attendance_id) 
    {
        $select = $this->select()
            ->setIntegrityCheck(false)
            ->join(array('a'=>'ourbank_attendance'),array('id'))
            ->where('a.id='.$attendance_id)
            ->join(array('b'=>'ourbank_memberattendance'),'a.id=b.attendance_id')
            ->join(array('c'=>'ourbank_familymember'),'b.member_id = c.id');
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function discussionlist() 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_master_servicesectors'),array('id'));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function decissionlist() 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_master_servicesectors'),array('id'));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function getdiscussion($attendance_id)
    {
	        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_discussion'),array('id'))
                ->join(array('b' => 'ourbank_master_servicesectors'),'a.discussion_id=b.id',array('b.name as discussionname'))
		->where('a.attendance_id=?',$attendance_id);
        $result = $this->fetchAll($select);
        return $result->toArray();
	}

    public function getdecision($attendance_id)
    {
	        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_decision'),array('id'))
                ->join(array('b' => 'ourbank_master_servicesectors'),'a.decision_id=b.id',array('b.name as decisionname'))
		->where('a.attendance_id=?',$attendance_id);
        $result = $this->fetchAll($select);
        return $result->toArray();
	}

     public function attendance($attendance_id) {
	$db = Zend_Db_Table::getDefaultAdapter();
	$where = array();  $where1 = array();
	$where[] = $db->quoteInto('ID = ?', $attendance_id);
	$where1[] = $db->quoteInto('attendance_id = ?', $attendance_id);
	$db->delete('ourbank_memberattendance', $where1);
	$db->delete('ourbank_discussion', $where1);
	$db->delete('ourbank_decision', $where1);
	return;
	}

public function fetchmemberlog($attendance_id)
{
	        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_memberattendance'),array('id'))
		->where('a.attendance_id=?',$attendance_id);
        $result = $this->fetchAll($select);
        return $result->toArray();
}

public function fetchdiscussionlog($attendance_id)
{
	        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_discussion'),array('id'))
		->where('a.attendance_id=?',$attendance_id);
        $result = $this->fetchAll($select);
        return $result->toArray();
}


public function fetchdecisionlog($attendance_id)
{
	        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_decision'),array('id'))
		->where('a.attendance_id=?',$attendance_id);
        $result = $this->fetchAll($select);
        return $result->toArray();
}

public function deletememberattendance($attendance_id)
{
            $db = $this->getAdapter();
            $db->delete("ourbank_memberattendance",array('attendance_id = '.$attendance_id));
            return;
}
public function deletediscussion($attendance_id)
{
            $db = $this->getAdapter();
            $db->delete("ourbank_discussion",array('attendance_id = '.$attendance_id));
            return;
}
public function deletedecision($attendance_id)
{
            $db = $this->getAdapter();
            $db->delete("ourbank_decision",array('attendance_id = '.$attendance_id));
            return;
}
public function fetchmaxid($maxid){ 
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $sql="SELECT max(week_no)+1 as meetingno FROM ourbank_attendance WHERE meeting_id=".$maxid;
        $result = $this->db->fetchAll($sql); echo $sql;
        return $result;
}

}
