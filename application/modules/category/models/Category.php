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
class Category_Model_Category extends Zend_Db_Table {
	protected $_name = 'ourbank_category';
//getting category details
	public function getCategoryDetails() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_category'),array('a.id','a.categoryname','a.description','a.createddate'));
			
		$result = $this->fetchAll($select);
		return $result->toArray();
// 		die($select->__toString($select));
	}
//category information
	public function getCategoryinformation() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_category'),array('id'));
		$result = $this->fetchAll($select);
		return $result->toArray();
// 		die($select->__toString($select));
	}
//view category
	public function viewCategory($category_id) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_category'),array('id'))
			->where('a.id = ?',$category_id);
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

	
//getting category
	public function getCategory($id) {
		$select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_category'),array('id'))
                ->where('id=?',$id);
		// die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
	}
	public function SearchCategory($post = array()) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_category'),array('id'))
			->where('a.name like "%" ? "%"',$post['name'])
			->where('a.description like "%" ? "%"',$post['description']);
		$result = $this->fetchAll($select);
		return $result->toArray();
	}
        public function getAllCategory(){
                    $this->db = $this->getAdapter();
                    $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
                    $sql = 'select * from ourbank_category';
                    $result = $this->db->fetchALL($sql,array());
                    return $result;
                }
        public function insertbaseCategory($input)
            {
                $this->db = $this->getAdapter();
                $this->db->insert('ourbank_category',$input);
            } 

        public function getcategorystatus($categoryid){
                $db = $this->getAdapter();
                $sql = "select * from ourbank_accounts where product_id in (select id from ourbank_productsoffer where product_id in (select id from ourbank_product where category_id = $categoryid) )";
                $result = $db->fetchAll($sql);
                return $result;
                }

}
tegorystatus($categoryid){
                $db = $this->getAdapter();
                $sql = "select * from ourbank_accounts where product_id in (select id from ourbank_productsoffer where product_id in (select id from ourbank_product where category_id = $categoryid) )";
                $result = $db->fetchAll($sql);
                return $result;
                }

}
