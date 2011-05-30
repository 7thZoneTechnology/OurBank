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
class Kootacommonview_Model_Koota extends Zend_Db_Table {
    protected $_name = 'ourbank_koota'; // set ourbank_koota table is a base table

        // get koota details 
	public function getkoota($id){ 
		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a' => 'ourbank_koota'),array('id'))
			->where('a.koota_id = '.$id)
			->join(array('b' => 'ourbank_office'),'b.id  = a.koota_id',array('name as kootaname'));


		$result=$this->fetchAll($select);
		return $result->toArray();
        } 

//         // get koota members 
        public function getkootamembers($id)
        {
        $select=$this->select()
                ->setIntegrityCheck(false)
        	->join(array('a' => 'ourbank_koota'),array('id'),array('koota_id'))
        	->join(array('b' => 'ourbank_kootamembers'),'a.id = b.koota_id')
		->where('a.koota_id = '.$id)
         	->join(array('c' => 'ourbank_familymember'),'c.id = b.member_id',array('name'));
       $result=$this->fetchAll($select);
       return $result->toArray();
    }

}
