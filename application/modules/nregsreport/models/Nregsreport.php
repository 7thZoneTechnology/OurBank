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
class Nregsreport_Model_Nregsreport extends Zend_Db_Table
{
    protected $_name = 'ourbank_master_village';

 public function fetchDetails($gilla_id)
    {
//         $select = $this->select()
//             ->setIntegrityCheck(false)  
// 			->from(array('f' => 'ourbank_master_village'),array('f.id','f.panchayath_id'))
//             ->join(array('a' => 'ourbank_master_gillapanchayath'),'f.panchayath_id = a.id',array('SUM(a.id)','a.name as gpname'))
// 
//             ->joinLeft(array('b' => 'ourbank_family'),'f.village_id = b.village_id',array('COUNT(b.ration_id) as totalcards','COUNT(b.nregs_jobno!=null) as jobcardno'))
// 			->where('a.id = "'.$gilla_id.'"');
// 
//                //  die($select->__toString());
//                 $result = $this->fetchAll($select);
//                 return $result->toArray();

         $db = $this->getAdapter();

       $sql = "SELECT

(SELECT COUNT(ration_id) FROM ourbank_family 
	join ourbank_master_village on ourbank_family.village_id = ourbank_master_village.village_id
	join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
	 WHERE ourbank_family.ration_id = 1 and ourbank_master_gillapanchayath.id = $gilla_id) AS first_condition,

(SELECT COUNT(ration_id) FROM ourbank_family 
	join ourbank_master_village on ourbank_family.village_id = ourbank_master_village.village_id
	join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
	 WHERE ourbank_family.ration_id = 2 and ourbank_master_gillapanchayath.id = $gilla_id) AS second_condition,

(SELECT COUNT(ration_id) FROM ourbank_family 
	join ourbank_master_village on ourbank_family.village_id = ourbank_master_village.village_id
	join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
	 WHERE ourbank_family.ration_id = 3 and ourbank_master_gillapanchayath.id = $gilla_id) AS third_condition ,

(SELECT COUNT(ration_id) FROM ourbank_family 
	join ourbank_master_village on ourbank_family.village_id = ourbank_master_village.village_id
	join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
	 WHERE ourbank_family.ration_id = 4 and ourbank_master_gillapanchayath.id = $gilla_id
) AS fourth_condition

FROM ourbank_family group by ration_id limit 0,1 AND ";

        $result = $db->fetchAll($sql);
        return $result;
    }

}

