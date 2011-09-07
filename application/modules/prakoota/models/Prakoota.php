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
class Prakoota_Model_Prakoota extends Zend_Db_Table
{
    protected $_name = 'ourbank_praservice';

 	public function fetchDetails($hierarchy,$gilla_id) {
	switch($hierarchy){
		case '3':
		{ $db = $this->getAdapter();
	      $sql = "SELECT

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 1 and b.Koota_id = $gilla_id) AS wpension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 2 and b.Koota_id = $gilla_id) AS hcrepair,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 3 and b.Koota_id = $gilla_id) AS rcard,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 4 and b.Koota_id = $gilla_id) AS oapension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 5 and b.Koota_id = $gilla_id) AS dpension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 6 and b.Koota_id = $gilla_id) AS nregs,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 7 and b.Koota_id = $gilla_id) AS skills,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 8 and b.Koota_id = $gilla_id) AS j2g,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 9 and b.Koota_id = $gilla_id) AS Hinsurance,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 10 and b.Koota_id = $gilla_id) AS Sanitation,c.name as village

		FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where b.Koota_id = $gilla_id group by c.id";
// //  		echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
			}break;
		case '4':
		{ $db = $this->getAdapter();
	      $sql = "SELECT

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 1 and b.rev_village_id = $gilla_id) AS wpension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 2 and b.rev_village_id = $gilla_id) AS hcrepair,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 3 and b.rev_village_id = $gilla_id) AS rcard,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 4 and b.rev_village_id = $gilla_id) AS oapension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 5 and b.rev_village_id = $gilla_id) AS dpension,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 6 and b.rev_village_id = $gilla_id) AS nregs,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 7 and b.rev_village_id = $gilla_id) AS skills,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 8 and b.rev_village_id = $gilla_id) AS j2g,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 9 and b.rev_village_id = $gilla_id) AS Hinsurance,

		(SELECT count(source_id) FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where ourbank_praservice.source_id = 10 and b.rev_village_id = $gilla_id) AS Sanitation,c.name as village

		FROM ourbank_praservice
		join ourbank_familymember a on ourbank_praservice.family_id = a.id
		join ourbank_family b on a.family_id = b.id
		join ourbank_master_villagelist c on c.village_id = b.rev_village_id
		where b.rev_village_id = $gilla_id limit 0,1 ";
// //  		echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
			}break;
		}
	}
		public function getHier() {
		$select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_officehierarchy'),array('id'))
                ->where('a.id !=1 AND id !=2');
// 		die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
	}
}
