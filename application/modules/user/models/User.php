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

class User_Model_User extends Zend_Db_Table 
{
    protected $_name = 'ourbank_user';
    // search function
    public function getUserDetails() 
    {
	$select = $this->select()
            ->setIntegrityCheck(false)  
            ->join(array('a' => 'ourbank_user'),array('id'),array('name as username','id as userid'))
            ->join(array('b'=>'ourbank_master_designation'),'a.id = b.id',array('name as desi_name'))
            ->join(array('c'=>'ourbank_office'),'a.bank_id = c.id')
            ->join(array('d'=>'ourbank_master_gender'),'a.gender = d.id',array('name as sex'))
            ->join(array('e'=>'ourbank_grant'),'a.grant_id = e.id',array('name as grant'))
            ->join(array('f'=>'ourbank_master_department'),'a.department = f.id',array('name as department'));

	//die($select->__toString());		
	return $this->fetchAll($select);
    }

    // view function
    public function getUser($id) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a'=>'ourbank_user'),array('a.id'),array('name as username','id as userid','password','c.id as bank_id','username as usename'))
                ->where('a.id='.$id)
                ->join(array('b'=>'ourbank_master_designation'),'a.id = b.id',array('name as desi_name'))
                ->join(array('c'=>'ourbank_office'),'a.bank_id = c.id')
                ->join(array('d'=>'ourbank_master_gender'),'a.gender = d.id',array('name as sex'))
                ->join(array('e'=>'ourbank_grant'),'a.grant_id = e.id',array('name as grant'))
            ->join(array('f'=>'ourbank_master_department'),'a.department = f.id',array('name as department'));

		//die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    // view module
    public function getmodule($modulename)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('ourbank_modules'),array('module_id'))
                ->where('module_description=?',$modulename);
        $result=$this->fetchAll($select);
        return $result->toArray();
        //die ($select->__toString($select));
    }






    public function userSearch($post) {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_user'),array('id'),array('name as username','id as userid'))
                ->where('a.username like "%" ? "%"',$post['name'])
                ->where('b.id like "%" ? "%"',$post['designation'])
                ->where('c.id like "%" ? "%"',$post['bank'])
                ->where('e.id like "%" ? "%"',$post['grant_id'])
                ->join(array('b'=>'ourbank_master_designation'),'a.designation = b.id',array('name as desi_name'))
                ->join(array('c'=>'ourbank_office'),'a.bank_id = c.id')
                ->join(array('d'=>'ourbank_master_gender'),'a.gender = d.id',array('name as sex'))
                ->join(array('e'=>'ourbank_grant'),'a.grant_id = e.id',array('name as grant'));
                //die($select->__toString());		
        $result = $this->fetchAll($select);
        return $result->toArray();
    }



//view personal details
public function getpersonal($id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ob_personal_details'),array('id'))
                ->where('id=?',$id);
        $result=$this->fetchAll($select);
        return $result->toArray();
       //die ($select->__toString($select));
    }
//view address details
 public function getaddress($id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_address'),array('id'))
                ->where('id=?',$id);
     //  die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
//view contact details
public function getcontact($id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_contact'),array('id'))
                ->where('id=?',$id);
     //  die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
}erproduct_id)
	           	->join(array('b' => 'ourbank_product'),'a.product_id = b.id',array('b.shortname'));
		$result = $this->fetchAll($select);
		return $result->toArray(); // return get product short name
	}
        public function getAllOffer($name){
                    $this->db = $this->getAdapter();
                    $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
                    $sql = 'select * from ourbank_productsoffer where name = "'.$name.'"';
                    $result = $this->db->fetchALL($sql,array());
                    return $result;
                }
// // //         public function insertbaseOffer($input)
// // //                     {
// // //                         $this->db = $this->getAdapter();
// // //                         $this->db->insert('ourbank_productsoffer',$input);
// // //                     }

        public function genarateGlCode($header){
                $db = $this->getAdapter();
                        $sql = "select max(glsubcode) as glsubcode from ourbank_glsubcode where glcode_id =(select id from ourbank_glcode where header like '%".$header."%')";
                $result = $db->fetchOne($sql);
	       return $result; // //return liabilities values 
    }



//view personal details
public function getpersonal($id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ob_personal_details'),array('id'))
                ->where('id=?',$id);
        $result=$this->fetchAll($select);
        return $result->toArray();
       //die ($select->__toString($select));
    }
//view address details
 public function getaddress($id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_address'),array('id'))
                ->where('id=?',$id);
     //  die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
//view contact details
public function getcontact($id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_contact'),array('id'))
                ->where('id=?',$id);
     //  die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
}