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
         $db = $this->getAdapter();
	     $sql = "SELECT

(SELECT COUNT(ration_id) FROM ourbank_family
    join ourbank_familymember a on ourbank_family.id = a.family_id
    join ourbank_master_village on ourbank_family.rev_village_id = ourbank_master_village.village_id
    join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id

     WHERE ourbank_family.ration_id = 1 and ourbank_master_gillapanchayath.id = $gilla_id) AS norationcard,

(SELECT COUNT(ration_id) FROM ourbank_family
    join ourbank_familymember a on ourbank_family.id = a.family_id
    join ourbank_master_village on ourbank_family.rev_village_id = ourbank_master_village.village_id
    join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id

     WHERE ourbank_family.ration_id = 2 and ourbank_master_gillapanchayath.id = $gilla_id) AS APL,

(SELECT COUNT(ration_id) FROM ourbank_family
    join ourbank_familymember a on ourbank_family.id = a.family_id
    join ourbank_master_village on ourbank_family.rev_village_id = ourbank_master_village.village_id
    join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id

     WHERE ourbank_family.ration_id = 3 and ourbank_master_gillapanchayath.id = $gilla_id) AS BPL ,

(SELECT COUNT(ration_id) FROM ourbank_family
    join ourbank_familymember a on ourbank_family.id = a.family_id
    join ourbank_master_village on ourbank_family.rev_village_id = ourbank_master_village.village_id
    join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id

     WHERE ourbank_family.ration_id = 4 and ourbank_master_gillapanchayath.id = $gilla_id
) AS AAY,ourbank_master_gillapanchayath.name


FROM ourbank_family
join ourbank_familymember a on ourbank_family.id = a.family_id
join ourbank_master_village on ourbank_family.rev_village_id = ourbank_master_village.village_id
join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id where ourbank_master_gillapanchayath.id= $gilla_id limit 0,1";

//echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
    }

}

