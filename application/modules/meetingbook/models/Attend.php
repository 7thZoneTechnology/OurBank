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
class Meetingbook_Model_Attend extends Zend_Db_Table {
    protected $_name = 'ourbank_member';

public function fetchgroupid($meeting_ID) {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_group'),array('id'))
                ->where('a.id = '.$meeting_ID);
// 	die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();		
    }

public function meetingweek($groupid) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $sql="SELECT max(week_no)+1 as weekno FROM ourbank_attendance WHERE meeting_id=".$groupid;
        $result = $this->db->fetchAll($sql); //echo $sql;
        return $result;	
    }

    public function fetchmeeting($meeting_ID) {
        $select = $this->select()
                ->setIntegrityCheck(false)

//                 ->join(array('a' => 'ourbank_group'),array('a.id'),array('a.day','a.grouphead_name','a.place','a.time','a.village_id'))
//                 ->where('a.id =?',$meeting_ID)
                ->join(array('b' => 'ourbank_group'),array('b.id'), array('b.id','b.name as groupname', 'b.saving_perweek', 'b.village_id','b.place','b.time'))
            ->where('b.id =?',$meeting_ID)
		->join(array('c' => 'ourbank_groupmembers'),'c.group_id = b.id',array('c.member_id'))
                ->join(array('e' => 'ourbank_master_weekdays'),'b.days = e.id',array('e.name as day'))
                ->join(array('f' => 'ourbank_office'),'b.village_id = f.id',array('f.name as officename'))
                ->join(array('g' => 'ourbank_familymember'),'b.head = g.id',array('g.name as grouphead_name'));

// 	die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();		
    }
	
public function fetchaccNum($groupid)
{
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->join(array('b' => 'ourbank_accounts'),array('b.account_number'))
                ->where('b.member_id='.$groupid)
                ->where("b.account_number LIKE '%S%' and (b.membertype_id=2 or b.membertype_id=3) and  (b.status_id=1 or b.status_id=3) and product_id!=0");
//                 ->where("b.account_number LIKE '%S%' and (b.membertype_id=2 or b.membertype_id=3)");

// die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
}

    public function fetchMembers($meeting_ID) {
        $select = $this->select()
                ->setIntegrityCheck(false)

//                 ->join(array('a' => 'ourbank_group'),array('a.id'))
//                 ->where('a.id =?',$meeting_ID)
                ->join(array('b' => 'ourbank_group'),array('b.id'),array('b.id as group_id','b.saving_perweek', 'b.penalty_latecoming','b.penalty_notcoming','b.late_subglcode','b.absent_subglcode'))
            ->where('b.id =?',$meeting_ID)
		->join(array('c' => 'ourbank_groupmembers'),'c.group_id = b.id',array('c.member_id as memberid'))
		->join(array('d' => 'ourbank_familymember'),'d.id = c.member_id',array('d.name as membername','d.id'));
//         die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

public function creditbalance($memberid) {
        $select = $this->select()
                ->setIntegrityCheck(false)
// 		->join(array('e' => 'ourbank_group_acccounts'),array('e.account_id'))
//                 ->where('e.member_id = '.$memberid)
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

public function fetchloanofficer($groupid)
{
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from(array('a'=>'ourbank_groupmembers'),array('a.id'))
                ->where('a.group_id=?',$groupid)
                ->join(array('b' => 'ourbank_accounts'),'a.member_id=b.member_id',array('b.account_number'))
                ->where("b.account_number LIKE '%L%'")
//             ->where('a.member_id =?',$memberid)
//             ->join(array('b' => 'ourbank_loanaccounts'), 'b.account_id=a.id',array('b.id'))
            ->join(array('c' => 'ourbank_user'), 'c.id=b.created_by',array('c.name as loanofficer'));

// 	die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
}

}
