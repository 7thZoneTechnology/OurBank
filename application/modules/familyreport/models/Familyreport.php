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
class Familyreport_Model_Familyreport extends Zend_Db_Table
{
    protected $_name = 'ourbank_master_village';

 public function fetchDetails($gilla_id)
    {
             $select = $this->select()
                    ->setIntegrityCheck(false)  
					->from(array('f' => 'ourbank_master_village'),array('f.id','f.panchayath_id'))
                    ->join(array('a' => 'ourbank_master_gillapanchayath'),'f.panchayath_id = a.id',array('SUM(a.id)','a.name as gpname'))
                    ->joinLeft(array('b' => 'ourbank_family'),'f.village_id = b.village_id',array('COUNT(b.id) as totalfamily'))
                    ->joinLeft(array('c' => 'ourbank_familymember'),'f.village_id = c.village_id',array('COUNT(c.id) as totalmember'))
                    ->joinLeft(array('d' => 'ourbank_group'),'f.village_id = d.village_id',array('COUNT(d.id) as totalgroup'))
					->where('a.id = "'.$gilla_id.'"');

               //  die($select->__toString());
                $result = $this->fetchAll($select);
                return $result->toArray();
    }
}

