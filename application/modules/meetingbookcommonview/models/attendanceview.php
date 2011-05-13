<?php
class Meetingbookcommonview_Model_attendanceview extends Zend_Db_Table 
{
    protected $_name = 'ourbank_attendance';

    public function fetchattendancedetailsforID($attendance_id,$week) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_attendance'),array('id'),array('a.meeting_id','a.meeting_date', 'a.notes', 'a.resolution','a.time as attendancetime','a.week_no'))
                ->where('a.id = '.$attendance_id)
                ->where('a.week_no = '.$week)
                ->group('a.id')
                ->join(array('b' => 'ourbank_group'),'a.meeting_id = b.id');
                //->join(array('c' => 'ourbank_master_weekdays'),'a.day = c.id', 'c.name as weekday');

// 		die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

public function absentmembers($attendance_id) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_memberattendance'),array('id'))
                ->where('a.attendance_id = '.$attendance_id.' and a.attendance_type=1')
                ->join(array('b' => 'ourbank_familymember'),'a.member_id = b.id');
 		//die($select->__toString($select));
       $result = $this->fetchAll($select);
        return $result->toArray();
    }

public function latemembers($attendance_id) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_memberattendance'),array('id'))
                ->where('a.attendance_id = '.$attendance_id.' and a.attendance_type=2')
                ->join(array('b' => 'ourbank_familymember'),'a.member_id = b.id');
//  		die($select->__toString($select));
       $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function attendancediscussion($attendance_id) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_discussion'),array('id'))
                ->where('attendance_id = '.$attendance_id)
		->join(array('b' => 'ourbank_master_servicesectors'),'a.discussion_id = b.id');
 	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function attendancedecision($attendance_id) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_decision'),array('id'))
                ->where('attendance_id = '.$attendance_id)
		->join(array('b' => 'ourbank_master_servicesectors'),'a.decision_id = b.id');
 	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }


}
?>
