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
class Funderdetails_Model_funderdetails extends Zend_Db_Table {
	protected $_name = 'ourbank_holiday';
//getting holiday details
	public function getfunder() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_funder'),array('a.id'));
 		//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
//getting office
 public function findmaxlevel()
        {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT MAX(id) as lastid FROM `ourbank_glcode`";
        $result = $this->db->fetchAll($sql,array());
        return $result;

        }

	 public function findmaxfunder()
        {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT MAX(id) as lastid FROM `ourbank_funder`";
        $result = $this->db->fetchAll($sql,array());
        return $result;

        }
public function getfunderlast($lastfunderid) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_funder'),array('a.id'))
                ->where('a.id=?',$lastfunderid);



 		//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
public function getglcode($glid) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_glcode'),array('a.id'))
                ->where('a.id=?',$glid);



 		//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}

}
