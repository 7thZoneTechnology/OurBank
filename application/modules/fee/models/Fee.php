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
class Fee_Model_Fee extends Zend_Db_Table 
{
    protected $_name = 'ourbank_fee';

    public function getFee($id) 
	{
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_fee'),array('id'),array('a.description as feedescription','name as feename','value','category_id','feetype_id'))
                ->where('a.id=?',$id)
				->join(array('b' => 'ourbank_category'),'a.category_id = b.id','name as categoryname')
				->join(array('c' => 'ourbank_feetype'),'a.feetype_id = c.id','name as feetype')
				->join(array('d' => 'ourbank_officehierarchy'),'a.hierarchy_id = d.id','type as officename')
				->join(array('e' => 'ourbank_feeamounttypes'),'a.amountype_id = e.id','name as amounttype');

		// die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
   	}
 public function getffee($id) 
	{
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_fee'),array('id'),array('a.description as description','name as name','value','category_id','hierarchy_id','amountype_id','feetype_id'))
                ->where('a.id=?',$id)
				->join(array('b' => 'ourbank_category'),'a.category_id = b.id','name as type')
				->join(array('c' => 'ourbank_feetype'),'a.feetype_id = c.id','name as feetype')
				->join(array('d' => 'ourbank_officehierarchy'),'a.hierarchy_id = d.id','type as officename')
				->join(array('e' => 'ourbank_feeamounttypes'),'a.amountype_id = e.id','name as amounttype');

		// die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
   	}

public function fetchfee($id) 
	{
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_fee'),array('id'),array('a.description as description','name as name','value','category_id','hierarchy_id','amountype_id','feetype_id'))
                ->where('a.id=?',$id)
				->join(array('c' => 'ourbank_feetype'),'a.feetype_id = c.id','name as feetype')
				->join(array('d' => 'ourbank_officehierarchy'),'a.hierarchy_id = d.id','type as officename')
				->join(array('e' => 'ourbank_feeamounttypes'),'a.amountype_id = e.id','name as amounttype');

		// die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
   	}


   	public function feeSearch($post) 
	{
		$select = $this->select()
					->setIntegrityCheck(false)  
					->join(array('a' => 'ourbank_fee'),array('id'))
                    ->where('a.name like "%" ? "%"',$post['name'])
                    ->where('a.value like "%" ? "%"',$post['value']);

		// die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}
 public function getOffice() {
              $select = $this->select()
                       ->setIntegrityCheck(false)  
                       ->join(array('a' => 'ourbank_glsubcode'),array('a.office_name,a.officeshort_name'))
                       ->where('a.glcode_id != 1 AND 2');
                      
       $result = $this->fetchAll($select);
       return $result->toArray();
    }

        public function findlastlevel()
        {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT MAX(id) as lastid FROM `ourbank_glcode`";
        $result = $this->db->fetchAll($sql,array());
        return $result;

        }

     public function findmaxlevel()
        {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT MAX(id) as lastid FROM `ourbank_glsubcode`";
        $result = $this->db->fetchAll($sql,array());
        return $result;

        }

  public function genarateGlsubCode1($ledgertype_id,$id)
        {
            $this->db = $this->getAdapter();
            $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            return $this->db->fetchRow("SELECT MAX(glsubcode) as id
                                            FROM  ourbank_glsubcode
                                            where glcode_id = $id and subledger_id = ".$ledgertype_id);


        }







public function SearchFee($post) {
$dateconvert= new App_Model_dateConvertor();
		$keyvalue = array_filter($post);
		$searchcounter = count($keyvalue);
	if($searchcounter > 0) {
			$select = $this->select()
					->setIntegrityCheck(false)  
					->join(array('a' => 'ourbank_fee'),array('id'))
                    ->where('a.name like "%" ? "%"',$post['s1'])
                    ->where('a.value like "%" ? "%"',$post['s2']);

		// die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
		} else {
	$select = $this->select()
					->setIntegrityCheck(false)  
					->join(array('a' => 'ourbank_fee'),array('id'));
 	//	die($select->__toString($select));
// 
		$result = $this->fetchAll($select);
		return $result->toArray();
		}
	}



















}
