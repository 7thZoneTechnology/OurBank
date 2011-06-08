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
class Groupcommonview_Model_groupcommon extends Zend_Db_Table {
    protected $_name = 'ourbank_member'; // set ourbank_member table is a base table

        // get group details 
	public function getgroup($id){ 

		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a' => 'ourbank_group'),array('id'),array('id as groupid','village_id as officeid','name as groupname','group_created_date','groupcode','place','time','bank_id','branch_id','days', 'saving_perweek','penalty_latecoming','penalty_notcoming','rateinterest'))
			->where('a.id = '.$id)
			->join(array('b' => 'ourbank_office'),'b.id  = a.village_id',array('name as officename'))
			->join(array('c' => 'ourbank_master_weekdays'),'c.id  = a.days',array('name as weekday'))
			->join(array('d' => 'ourbank_master_branch'),'d.id = a.branch_id',array('name as branchname'))
			->join(array('e' => 'ourbank_master_bank'),'e.id = d.bank_id',array('name as bankname'));
		$result=$this->fetchAll($select);
		return $result->toArray();
        } 
        // get group location geo location 
	public function getlocation($id){ 
		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a' => 'ourbank_group'),array('id'),array('latitude','longitude'))	->where('a.id = '.$id);
		$result=$this->fetchAll($select);
		return $result->toArray();
        }
        // get group members 
        public function getgroupmembers($id)
        {
        $select=$this->select()
                ->setIntegrityCheck(false)
        	->join(array('a' => 'ourbank_groupmembers'),array('group_id'),array('group_id as groupid','member_id'))
		->where('a.groupmember_status = 3 or a.groupmember_status = 1')
		->where('a.group_id = '.$id)
         	->join(array('b' => 'ourbank_familymember'),'b.id = a.member_id')
		->join(array('c' => 'ourbank_group'),'c.id ='.$id,array('head'));
       $result=$this->fetchAll($select);
       return $result->toArray();
    } 
    // get group members 
        public function groupreps($id)
        {
        $select=$this->select()
                ->setIntegrityCheck(false)
        	->join(array('a' => 'ourbank_group_representatives'),array('group_id'),array('group_id as groupid','representative_id'))
		->where('a.group_id = '.$id)
         	->join(array('b' => 'ourbank_familymember'),'b.id = a.representative_id');
       $result=$this->fetchAll($select);
       return $result->toArray();
    }
     // get module description  details 
    public function getmodule($modulename)
   {
      $select=$this->select()
                   ->setIntegrityCheck(false)
                   ->join(array('ourbank_modules'),array('module_id'))
                   ->where('module_description=?',$modulename);
        $result=$this->fetchAll($select);
       return $result->toArray();
   }
}
