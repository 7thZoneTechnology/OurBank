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
class Thumbdeclaration_Model_Dec  extends Zend_Db_Table {
    protected $_name = 'ourbank_group';

            public function groupDeatils($memcode,$moduleid) 
            {
		$select = $this->select()
			->setIntegrityCheck(false)
			->join(array('a' => 'ourbank_group'),array('id','name','groupcode'))
                        ->where('a.groupcode = ?',$memcode)
			->join(array('d' => 'ourbank_groupmembers'),'d.group_id =a.id',array('d.member_id'))
			->join(array('c' => 'ourbank_familymember'),'d.member_id=c.id',array('c.sign','c.name as membername'))
                        ->where('c.sign = 0')

                        ->join(array('f' => 'ourbank_master_bank'),'f.id=a.branch_id',array('name as bankname'))
                        ->join(array('g' => 'ourbank_master_branch'),'g.bank_id=f.id',array('name as branchname'))
                        ->group('a.groupcode');

//                 die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

            public function getmodule($modulename)
            {
                $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('ourbank_modules'),array('module_id'))
                                ->where('module_description=?',$modulename);
                $result=$this->fetchAll($select);
                //return office id, address and contact details
                return $result->toArray();
            }
}
