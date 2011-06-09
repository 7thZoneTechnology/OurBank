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
class Externalloan_Model_Dec  extends Zend_Db_Table {
    protected $_name = 'ourbank_group';


            public function groupDeatils($memcode,$moduleid) 
            {
		$select = $this->select()
			->setIntegrityCheck(false)
			->join(array('a' => 'ourbank_group'),array('id','name','groupcode'))
                        ->where('a.groupcode = ?',$memcode)
			->join(array('b' => 'ourbank_address'),'b.id=a.id')
                        ->where('b.submodule_id=?',$moduleid)
			->join(array('c' => 'ourbank_accounts'),'c.member_id=a.id',array('c.account_number'))
                        ->where('c.membertype_id=3 or c.membertype_id=2')
			->join(array('d' => 'ourbank_groupmembers'),'d.group_id =a.id',array('d.member_id'))
			->join(array('e' => 'ourbank_loanprocess'),'e.member_id= d.member_id',array('e.request_amount as amount'))
                        ->join(array('f' => 'ourbank_master_bank'),'f.id=a.branch_id',array('name as bankname'))
                        ->join(array('g' => 'ourbank_master_branch'),'g.bank_id =f.id',array('name as branchname'))
                        ->join(array('h' => 'ourbank_master_loanpurpose'),'h.id=e.purpose',array('name as purpose'))
//                         ->join(array('j' => 'ourbank_contact'),'j.id=a.id',array('mobile'));
                        ->group('a.groupcode');

//                 die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

            public function getmember($membercode)
            {
                $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_group'),array('id'),array('a.id as groupid','a.name as name','a.groupcode as code',''))
                ->where('a.groupcode = '.$membercode)
                ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.group_id',array('b.id as memid'))
                ->join(array('d'=>'ourbank_familymember'),'d.id=b.member_id',array('d.name as memname'))
                ->join(array('c' => 'ourbank_loanprocess'),'b.member_id = c.member_id',array('c.id as requestid','c.request_amount as Amount','c.created_date as requestdate'))
                ->join(array('e' => 'ourbank_master_loanpurpose'),'e.id = c.purpose',array('e.name as purposename'))
				->where('c.membertype=2 or c.membertype=3');

//                 die($select->__toString($select));
                $result=$this->fetchAll($select);
                return $result->toArray(); // return group member details
	   }


            public function represent($membercode)
            {
                $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_group'),array('id'),array('a.id as groupid','a.name as name','a.groupcode as code',''))
                ->where('a.groupcode = '.$membercode)
                ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.group_id',array('b.id as memid'))
                ->join(array('s'=>'ourbank_group_representatives'),'s.representative_id=b.member_id',array('id'))
                ->join(array('d'=>'ourbank_familymember'),'d.id=s.representative_id',array('d.name as memnames'));
//                 die($select->__toString($select));
                $result=$this->fetchAll($select);
                return $result->toArray(); // return group member details
	   }

            public function getgrouploans($membercode)
            {
                $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_group'),array('id'),array('a.id as groupid','a.name as name','a.groupcode as code',''))
                ->where('a.groupcode = '.$membercode)
                ->join(array('b' => 'ourbank_accounts'),'a.id=b.member_id',array('b.account_number as loanaccount'))
                ->join(array('c'=>'ourbank_loanaccounts'),'c.account_id=b.id',array('id'));
/*				->join(array('j' => 'ourbank_contact'),'j.id=a.id',array('mobile'));*/
//                  die($select->__toString($select));
                $result=$this->fetchAll($select);
                return $result->toArray(); // return group member details
	   }

            public function getmodule($modulename)
            {
                $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('ourbank_modules'),array('module_id'))
                                ->where('module_description=?',$modulename);
//  die($select->__toString($select));
                $result=$this->fetchAll($select);
                //return office id, address and contact details
                return $result->toArray();
            }
}
