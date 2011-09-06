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
class Prareport_Model_Prareport extends Zend_Db_Table
{
    protected $_name = 'ourbank_praservice';

 	public function fetchDetails($gilla_id) {

         $db = $this->getAdapter();
	     $sql = "SELECT

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 1 and ourbank_master_village.panchayath_id = $gilla_id) AS wpension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 2 and ourbank_master_village.panchayath_id = $gilla_id) AS hcrepair,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 3 and ourbank_master_village.panchayath_id = $gilla_id) AS rcard,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 4 and ourbank_master_village.panchayath_id = $gilla_id) AS oapension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 5 and ourbank_master_village.panchayath_id = $gilla_id) AS dpension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 6 and ourbank_master_village.panchayath_id = $gilla_id) AS nregs,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 7 and ourbank_master_village.panchayath_id = $gilla_id) AS skills,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 8 and ourbank_master_village.panchayath_id = $gilla_id) AS j2g,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 9 and ourbank_master_village.panchayath_id = $gilla_id) AS Hinsurance,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_praservice.source_id = 10 and ourbank_master_village.panchayath_id = $gilla_id) AS Sanitation,ourbank_master_gillapanchayath.name

		FROM ourbank_praservice
		join ourbank_family on ourbank_praservice.member_id = ourbank_family.id
		join ourbank_master_village on ourbank_master_village.village_id = ourbank_family.rev_village_id
		join ourbank_master_gillapanchayath on ourbank_master_gillapanchayath.id = ourbank_master_village.panchayath_id
		where ourbank_master_gillapanchayath.id= $gilla_id limit 0,1 ";

// 		echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
	}
}
