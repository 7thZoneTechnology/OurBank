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
class Agriculture_Model_agriculture  extends Zend_Db_Table {
    protected $_name = 'ourbank_member';

        public function edit_landtypes()
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_master_landtypes'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
//         die ($select->__toString($select));
        }
 public function ownershiptypes()
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_master_ownershiptype'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
//         die ($select->__toString($select));
        }

  public function getagriculturedetails($mebmerid)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_agriculture'),array('a.id'))
                        ->join(array('b'=>'ourbank_master_landtypes'),'b.id=a.land_id',array('b.name as landtypename'))
                        ->join(array('c'=>'ourbank_master_ownershiptype'),'c.id=a.acquistion_id',array('c.name as ownership'))
                        ->join(array('d'=>'ourbank_master_villagelist'),'d.id=a.villagename',array('d.name_regional as village'))
                        ->join(array('e'=>'ourbank_master_landacquisition'),'e.id=a.landowner_name',array('e.name as ownername'))
                        ->where('a.family_id=?',$mebmerid);
//         die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
        public function getlog_details($mebmerid)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_agriculture'),array('a.id'))
                        ->where('a.family_id=?',$mebmerid);
//         die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }


       public function deleteagri($param)  
    {
        $db = $this->getAdapter();
                    //$db->delete("ourbank_cropdetails",array('member_id = '.$param));
        $db->delete("ourbank_agriculture",array('family_id = '.$param));

    // $db->exec("delete from ourbank_cropdetails where member_id = $param");
        return;
    }

 public function owner($id)
        {
        $select=$this->select()
            ->setIntegrityCheck(false)

            ->join(array('b'=>'ourbank_master_landacquisition'),array('b.id as landowner_name','b.name'));


        $result=$this->fetchAll($select);
        return $result->toArray();
        }
 public function village($id)
        {
        $select=$this->select()
            ->setIntegrityCheck(false)
            ->join(array('a'=>'ourbank_family'),array('a.id'))
            ->join(array('b'=>'ourbank_master_village'),'b.village_id=a.rev_village_id')
            ->join(array('c'=>'ourbank_master_villagelist'),'c.panchayath_id=b.panchayath_id',array('c.name_regional as villagenames'))


/*            ->join(array('e'=>'ourbank_master_subcaste'),'e.id =a.subcaste_id',array('e.name as subcaste'))*/
 			 ->where('a.id=?',$id);
    //  die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
        }
}
