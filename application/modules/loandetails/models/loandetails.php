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
class Loandetails_Model_loandetails  extends Zend_Db_Table {
    protected $_name = 'ourbank_member';

        public function edit_loantypes()
        {
        $select=$this->select()
                                ->setIntegrityCheck(false)
                                ->join(array('a'=>'ourbank_master_loansource'),array('a.id'));
        $result=$this->fetchAll($select);
        return $result->toArray();
//         die ($select->__toString($select));
        }

	public function get_loandetails()
        {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_loandetails'),array('a.id'))
                ->join(array('b'=>'ourbank_familymember'),'b.id=a.member_id',array('b.name as membername'))
                ->join(array('c'=>'ourbank_master_loanpurpose'),'c.id=a.purpose_id',array('c.name as purposename'))
                ->join(array('d'=>'ourbank_master_loansource'),'d.id=a.source_id',array('d.name as sourcename'));
         //die ($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();

        }

//update the family details with respective to member id...
    public function update($loanId,$input = array()) {
    $where[] = "id = '".$loanId."'";
    $db = $this->getAdapter();
    $result = $db->update('ourbank_loandetails',$input,$where);
    }

    public function deleteFamily($param)
    {
        $db = $this->getAdapter();
        $db->delete('ourbank_loandetails',array('id = '.$param));
        return;
    }

}
