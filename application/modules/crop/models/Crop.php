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
class Crop_Model_Crop  extends Zend_Db_Table 
{
    protected $_name = 'ourbank_cropdetails';

   public function edit_landtypes()
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_master_landtypes'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
//         die ($select->__toString($select));
        }

    public function getCrop()
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_master_crop'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
 public function getSeason()
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_master_seasons'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
  public function getUnits()
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_master_units'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }


    public function deletecrop($param)  
    {
        $db = $this->getAdapter();
                    //$db->delete("ourbank_master_cropdetails",array('member_id = '.$param));
        $db->delete("ourbank_cropdetails",array('family_id = '.$param));

    // $db->exec("delete from ourbank_master_cropdetails where member_id = $param");
        return;
    }
    public function getCropdetails($mebmerid)
    {
        $select=$this->select($param)
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_cropdetails'),array('a.id'))
                        ->where('a.family_id=?',$mebmerid);
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
}
