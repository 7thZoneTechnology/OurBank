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
class Fundings_Model_Fundings extends Zend_Db_Table 
{
    protected $_name = 'ourbank_funding';


    public function SearchFundings($post) 
	{

		$select = $this->select()
				->setIntegrityCheck(false)  
				->join(array('a' => 'ourbank_funding'),array('funding_id'))
				->join(array('c' => 'ourbank_funder'),'a.funder_id = c.id',array('c.id'))
				->join(array('e' => 'ourbank_master_currency'),'a.currency_id = e.id',array('e.id'))			
				->where('a.name like "%" ? "%"',$post['field2'])
				->where('a.amount like "%" ? "%"',$post['field4'])
				->where('a.beginingdate like "%" ? "%"',$post['field7'])
				->where('a.closingdate like "%" ? "%"',$post['field8']);
		return $this->fetchAll($select);
                //die($select->__toString($select));
	}
        
    public function viewfundings($id)
    {
	$select = $this->select()
		->setIntegrityCheck(false)  

		->join(array('b' => 'ourbank_funding'),array('b.id'))
        ->where('b.id = ?',$id)
		->join(array('c' => 'ourbank_funder'),'b.funder_id = c.id',array('c.name as fundername'))
		->join(array('e' => 'ourbank_master_currency'),'b.currency_id = e.id',array('e.name as currency'))
		->join(array('f' => 'ourbank_glsubcode'),'f.id = b.id',array('f.header as glname'));

		//die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	 
        
    }
public function getfunder($lastfunderid) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_funder'),array('a.id'))
                ->where('a.id=?',$lastfunderid);



 		//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
public function getfundings() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_funding'),array('a.id'));



 		//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
public function getglcode($glcodeid) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_glcode'),array('a.id'))
                ->where('a.id=?',$glcodeid);



 		//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
 public function insertGlsubcode($input)
    {
        $this->db = $this->getAdapter();
        $this->db->insert('ourbank_glsubcode',$input);
        return '1';
    } 
 public function findmaxlevel()
        {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT MAX(id) as lastid FROM `ourbank_glsubcode`";
        $result = $this->db->fetchAll($sql,array());
        return $result;

        }
 public function findmaxfunding($funderid)
        {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT MAX(id) as lastid FROM `ourbank_funding` where funder_id='$funderid'";
        $result = $this->db->fetchAll($sql,array());
        return $result;

        }
public function getuseroffice($userid) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_user'),array('a.id'))
                ->where('a.id=?',$userid);



 		//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
public function getfundingslast($lastfundingid) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_funding'),array('a.id'))
                ->where('a.id=?',$lastfundingid);



 	//	die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
public function getglsubcode($glsubcode) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_glsubcode'),array('a.id'))
                ->where('a.id=?',$glsubcode);



 //	die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
}