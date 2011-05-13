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
/*
 *  model page for fetch and return office details
 */
class Officecommonview_Model_officecommonview extends Zend_Db_Table 
{
    protected $_name = 'ourbank_member';

	//get posted office id
    public function getoffice($id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
               ->join(array('a' => 'ourbank_office'),array('a.id'))
               ->join(array('b'=>'ourbank_officehierarchy'),'b.id=a.officetype_id',array('b.type'))
                ->where('a.id = ?',$id);
        $result=$this->fetchAll($select);
	//return office details
        return $result->toArray();
    }


    public function getmodule($modulename)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('ourbank_modules'),array('module_id'))
                        ->where('module_description=?',$modulename);
        $result=$this->fetchAll($select);
	//return office id, address and contact details
        return $result->toArray();
    }

        public function findlastlevel()
        {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT MAX(id) as lastid FROM `ourbank_officehierarchy`";
        $result = $this->db->fetchAll($sql,array());
        return $result;
        }

       public function getvillageaddress($villageid)
       {
         $select = $this->select()
               ->setIntegrityCheck(false)  
               ->join(array('a' => 'ourbank_master_villagelist'),array('a.id'),array('a.name','a.id as villageid'))
               ->join(array('b'=>'ourbank_master_village'),'b.village_id=a.village_id',array('b.id'))
                ->join(array('c'=>'ourbank_master_taluklist'),'c.id=b.taluk_id',array('c.name as talukname'))
                ->join(array('d'=>'ourbank_master_districtlist'),'d.id=b.district_id',array('d.name as districtname'))
                ->join(array('e'=>'ourbank_master_hoblilist'),'e.id=b.hobli_id',array('e.name as hobliname'))
                ->join(array('f'=>'ourbank_master_gillapanchayath'),'f.id=b.panchayath_id',array('f.name as panchayathname'))
               ->where('a.village_id  = ?',$villageid);
         //die($select->__toString($select));
         $result = $this->fetchAll($select);
         return $result->toArray();
       }

}
