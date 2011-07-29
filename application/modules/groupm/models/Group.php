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

class Groupm_Model_Group extends Zend_Db_Table {
    protected $_name = 'ourbank_group';// set ourbank_member table is a base table

    // get All group details
    public function getGroupDetails() {
	$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_group'),array('id'),array('id as groupid','groupcode','name as  group_name'))
			->join(array('b' => 'ourbank_office'),'a.village_id = b.id')
			->order(array('a.id DESC'));   
	return $this->fetchAll($select);
    }
    // get search group details  
    public function searchDetails($post) 
    {   
        	$keyvalue = array_filter($post);
		$searchcounter = count($keyvalue);
	if($searchcounter > 0) 
	{
	$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('b' => 'ourbank_group'),array('id'),array('id as groupid','groupcode','name as  group_name'))
                        ->join(array('c' => 'ourbank_office'),'b.village_id=c.id',array('name'))
                        ->where('c.name like "%" ? "%"',$post['s3'])
			->where('b.groupcode like "%" ? "%"',$post['s1'])
			->where('b.name like "%" ? "%"',$post['s2']);
 	return $this->fetchAll($select);
    }else{
            $select = $this->select()
			->setIntegrityCheck(false)  
                        ->join(array('b' => 'ourbank_group'),array('id'),array('id as groupid','groupcode','name as  group_name'))
                        ->join(array('c' => 'ourbank_office'),'b.village_id=c.id',array('name'));			
 //die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
		}
	}

 }
