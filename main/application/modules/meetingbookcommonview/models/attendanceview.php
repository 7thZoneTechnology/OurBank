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
    public function memberabsent($memberid,$attendanceid)
    {
        $select = $this->select()
                    ->setIntegrityCheck(false)  
                    ->from(array('a' => 'ourbank_memberattendance'),array('a.member_id as latemem_id'))
                     ->where('a.member_id = '.$memberid.' and a.attendance_id='.$attendanceid.' and a.attendance_type=1')
                    ->join(array('b' => 'ourbank_attendance'),'a.attendance_id = b.id');
//         die($select->__toString($select));
            $result = $this->fetchAll($select);
            return $result->toArray();
    }

    public function memberlate($memberid,$attendanceid)
    {
        $select = $this->select()
                    ->setIntegrityCheck(false)  
                    ->from(array('a' => 'ourbank_memberattendance'),array('a.member_id as latemem_id'))
                     ->where('a.member_id = '.$memberid.' and a.attendance_id='.$attendanceid.' and a.attendance_type=2')
//                      ->where('a.latemem_id = '.$memberid)
                    ->join(array('b' => 'ourbank_attendance'),'a.attendance_id = b.id');
//         die($select->__toString($select));
            $result = $this->fetchAll($select);
            return $result->toArray();
    }
public function creditbalance($memberid) {

        $select = $this->select()
                ->setIntegrityCheck(false)
            ->from(array('a' => 'ourbank_accounts'),array('a.id'))
             ->where("a.status_id=1")
            ->join(array('b' => 'ourbank_group_savingstransaction'),"b.account_id=a.id and b.transaction_type='1' AND b.member_id=".$memberid, array('sum(b.transaction_amount) as currentbalance'))
            ->group('b.member_id');
// 	die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();	
    }

public function loanoutstanding($memberid) {
        $select = $this->select()
                ->setIntegrityCheck(false)
		->join(array('a' => 'ourbank_accounts'),array('a.id'))
                ->where('a.member_id = '.$memberid)
                ->where('membertype_id=1')
		->join(array('b' => 'ourbank_loanaccounts'),'b.account_id=a.id',array('b.id as loanid'))
		->join(array('c' => 'ourbank_installmentdetails'), 'c.account_id=b.account_id', array('sum(c.installment_amount) as outstanding','c.installment_amount as pay'))
                ->where('installment_status!=2');

	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();	
    }

public function loandue($memberid) {
        $select = $this->select()
                ->setIntegrityCheck(false)
		->join(array('a' => 'ourbank_accounts'),array('a.id'))
                ->where('a.member_id = '.$memberid)
                ->where('membertype_id=1')
		->join(array('b' => 'ourbank_loanaccounts'),'b.account_id=a.id',array('b.id as loanid'))
		->join(array('c' => 'ourbank_installmentdetails'),'c.account_id=b.account_id',array('sum(c.installment_amount) as outstanding'))
                ->where('installment_status=4 OR installment_status=5');

	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();		
    }

public function debitbalance($memberid) {
        $select = $this->select()
                ->setIntegrityCheck(false)
		->join(array('e' => 'ourbank_group_acccounts'),array('e.account_id'))
                ->where('e.member_id = '.$memberid)
            ->join(array('f' => 'ourbank_accounts'),'f.id = e.account_id')
            ->join(array('g' => 'ourbank_group_savingstransaction'),'g.account_id=e.account_id AND g.transaction_type="2" AND g.member_id='.$memberid, array('sum(g.transaction_amount) as currentbalance'))
            ->group('g.member_id');
	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();		
    }
public function fetchsavingsdetails($transId)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('a' => 'ourbank_transaction'),array('a.transaction_id'))
                ->where('a.recordstatus_id = 3')
                ->where('a.transaction_id = '.$transId)
                ->join(array('b' => 'ourbank_group_savingstransaction'),'a.transaction_id=b.transaction_id', array('b.member_id', 'b.transaction_amount'));

// 	die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
public function fetchloandetails($transId)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('a' => 'ourbank_transaction'),array('a.transaction_id'))
                ->where('a.recordstatus_id = 3')
                ->where('a.transaction_id = '.$transId)
                ->join(array('b' => 'ourbank_accounts'),'a.account_id=b.id',array('b.member_id'))
                ->join(array('c' => 'ourbank_loan_repayment'),'b.id=c.account_id', array('c.paid_amount'));

// 	die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
}
?>
