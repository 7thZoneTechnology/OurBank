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
                ->join(array('a' => 'ourbank_meeting'),array('id'))
                ->where('a.id = '.$meeting_ID);
	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();		
    }


    public function fetchmeeting($meeting_ID,$groupid) {
        $select = $this->select()
                ->setIntegrityCheck(false)

                ->join(array('a' => 'ourbank_meeting'),array('a.id'),array('a.day','a.grouphead_name','a.place','a.time'))
                ->where('a.id =?',$meeting_ID)
                ->join(array('b' => 'ourbank_group'),'b.village_id = a.village_id',array('b.id','b.name as groupname','b.saving_perweek'))
            ->where('b.id =?',$groupid)
		->join(array('c' => 'ourbank_groupmembers'),'c.group_id = b.id',array('c.member_id'))
                ->join(array('e' => 'ourbank_master_weekdays'),'a.day = e.id',array('e.name as day'));
	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();		
    }
	

    public function fetchMembers($meeting_ID,$groupid) {
        $select = $this->select()
                ->setIntegrityCheck(false)

                ->join(array('a' => 'ourbank_meeting'),array('a.id'))
                ->where('a.id =?',$meeting_ID)
                ->join(array('b' => 'ourbank_group'),'b.village_id = a.village_id',array('b.id','b.saving_perweek'))
            ->where('b.id =?',$groupid)
		->join(array('c' => 'ourbank_groupmembers'),'c.group_id = b.id',array('c.member_id as memberid'))
		->join(array('d' => 'ourbank_familymember'),'d.id = c.member_id',array('d.name as membername','d.id'));

//ourbank_group_savingstransaction

	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();		
    }

public function creditbalance($memberid) {
        $select = $this->select()
                ->setIntegrityCheck(false)
		->join(array('e' => 'ourbank_group_acccounts'),array('e.account_id'))
                ->where('e.member_id = '.$memberid)
            ->join(array('f' => 'ourbank_accounts'),'f.id = e.account_id')
            ->join(array('g' => 'ourbank_group_savingstransaction'),'g.account_id=e.account_id AND g.transaction_type="1" AND g.member_id='.$memberid, array('sum(g.transaction_amount) as currentbalance'))
            ->group('g.member_id');
	//die($select->__toString($select));
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
		->join(array('c' => 'ourbank_installmentdetails'),'c.account_id=b.account_id',array('sum(c.installment_amount) as outstanding','c.installment_amount as pay'))
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
                ->join(array('a' => 'ourbank_accounts'), array('a.id'),array('a.account_number'))
            ->where('a.membertype_id =2 or a.membertype_id =3')
            ->where('a.member_id =?',$groupid)
            ->join(array('b' => 'ourbank_loanaccounts'), 'b.account_id=a.id',array('b.id'))
            ->join(array('c' => 'ourbank_user'), 'c.id=b.created_by',array('c.name as loanofficer'));

	//die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
}

}
