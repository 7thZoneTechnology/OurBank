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
class Infrastructure_Model_infrastructure  extends Zend_Db_Table {
    protected $_name = 'ourbank_member';

	public function housetype()
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_master_housingtype'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
        }

	public function houseownership()
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_master_ownershiptype'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
        }


	public function cookingfuel()
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_master_cookingfuel'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
        }

        public function deleteinfrastructure($param)  
        {
		echo $param;
            $db = $this->getAdapter();                 
            $db->delete("ourbank_infrastructure",array('member_id = '.$param));
            return;
        }    

//edit housingtype,ownership,cookfuel infrastructure

         public function edithousingtype($mebmerid)
	{

	$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_infrastructure'),array('a.id'),array('a.housetype_id'))
			->where('a.member_id=?',$mebmerid)
			->where("a.housetype_id != '0'");
	//die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
	}
         public function editownership($mebmerid)
	{
	$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_infrastructure'),array('a.id'))
			->join(array('b'=>'ourbank_master_ownershiptype'),'b.id=a.ownership_id',array('b.name'))
			->where('a.member_id=?',$mebmerid);
	//die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
	}
         public function editcookfuel($mebmerid)
	{
	$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_infrastructure'),array('a.id'))
			->join(array('b'=>'ourbank_master_cookingfuel'),'b.id=a.fuel_id',array('b.name'))
			->where('a.member_id=?',$mebmerid);
	//die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
	}

}
