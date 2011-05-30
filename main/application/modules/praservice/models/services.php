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
class Praservice_Model_services  extends Zend_Db_Table {
    protected $_name = 'ourbank_member';

        public function get_servicesdetails()
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_master_servicesectors'),array('a.id'));
        //die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();

        }

	public function get_service($member_id)
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('b'=>'ourbank_praservice'),array('b.id'))
                                ->where('member_id=?',$member_id);
        $result=$this->fetchAll($select);
        return $result->toArray();
        }


        public function deleteservice($param)  
        {
            $db = $this->getAdapter();
                        
            $db->delete("ourbank_praservice",array('family_id = '.$param));
    
            return;
        }    
 public function getfamilymemberdetails($familyid){
            $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_familymember'),array('a.id'),array('name as membername','id as memberid'))
                ->join(array('b'=>'ourbank_family'),'b.id = a.family_id')
                ->where('b.id='.$familyid);
            $result=$this->fetchAll($select);
            return $result->toArray(); // return family memberdetails
        }


}
