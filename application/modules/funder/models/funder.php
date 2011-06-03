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
?>

<?php
/*
 *  model page for fetch and return funder details, filtered search details
 */
class Funder_Model_funder extends Zend_Db_Table 
{
    protected $_name = 'ourbank_funder';

    public function funderDetails() 
    {
	$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_funder'),array('a.id'))
			->join(array('b' => 'ourbank_master_fundertype'),'b.id=a.type',array('b.name as fundertype'))
			->order(array('a.id DESC'));
	//return funder details
	return $this->fetchAll($select);
    }

    public function searchDetails($post = array()) 
    {
	$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_funder'),array('a.id'))
			->join(array('b' => 'ourbank_master_fundertype'),'b.id=a.type',array('b.name as fundertype'))
                        ->where('a.type like "%" ? "%"',$post['type'])
			->where('a.code like "%" ? "%"',$post['code'])
			->where('a.name like "%" ? "%"',$post['name'])
			->order(array('a.id DESC'));
	//die($select->__toString($select));
	//return funder searched details	
	return $this->fetchAll($select);
    }

 }
