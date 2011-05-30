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

class Koota_Model_Koota extends Zend_Db_Table {
    protected $_name = 'ourbank_familymember';// set ourbank_member table is a base table
// 
//     // get All group details
    public function getKootaDetails() {
	$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_koota'),array('id'))
			->join(array('b' => 'ourbank_office'),'a.koota_id = b.id',array('name as kootaname'))
			->order(array('a.id DESC'));  
	return $this->fetchAll($select);
    }
//     // get search group details  
    public function searchDetails($post) { 
	$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_koota'),array('id'),array('koota_id'))
			->join(array('b' => 'ourbank_office'),'b.id = a.koota_id',array('name as kootaname'))
			->where('b.name like "%" ? "%"',$post['kootaname']);
//  or ('b.name like "%" ? "%"'$post['kootaname']));
// die($select->__toString($select));

// 			->where('b.name like "%" ? "%"',$post['kootaname']);   
 	return $this->fetchAll($select);
    }

 }
