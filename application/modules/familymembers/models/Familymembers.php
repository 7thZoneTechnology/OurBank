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
class Familymembers_Model_Familymembers  extends Zend_Db_Table {
    protected $_name = 'ourbank_family';

    public function getfamilydetails($mebmerid)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_familymember'),array('a.id'))
                ->where('a.family_id =?',$mebmerid)
                ->join(array('b'=>'ourbank_master_realtionshiptype'),'a.relationship_id=b.id',array('b.name as relationname'))
                ->join(array('c'=>'ourbank_master_educationtype'),'a.eductaion_id=c.id',array('c.name as qualifyname'))
                ->join(array('d'=>'ourbank_master_entitlements'),'a.entitlements=d.id',array('d.name as entitlementsname'))
                ->join(array('l'=>'ourbank_master_employmenttype'),'a.employment_status=l.id',array('l.name as employmentname'))
                ->join(array('e'=>'ourbank_master_profession'),'a.profession_id=e.id',array('e.name as proffessionname'))
                ->join(array('f'=>'ourbank_master_bank'),'a.bank=f.id',array('f.name as bankname'))
                ->join(array('g'=>'ourbank_master_branch'),'a.branch_po=g.id',array('g.name as branchname'))
                ->join(array('i'=>'ourbank_master_bloodtype'),'i.id=a.blood_id',array('i.name as blood'))
                ->join(array('h'=>'ourbank_master_maritalstatus'),'a.maritalstatus_id=h.id',array('h.name as maritalname'))
                ->join(array('j'=>'ourbank_master_gender'),'a.gender_id = j.id',array('j.name as gendername'));
//        die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getfamilydetails1($mebmerid)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_familymember'),array('a.id'))
                ->where('a.family_id=?',$mebmerid);
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getbranch($bank_id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_master_branch'),array('a.id'),array('a.id','a.name as branchname'))
                ->where('a.bank_id=?',$bank_id);
//        die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function deleteFamily($param)  
    {
        $db = $this->getAdapter();
        $db->delete('ourbank_familymember',array('id = '.$param));
        return;
    }

    public function update($member_id,$input = array()) {
    $where[] = "id = '".$member_id."'";
    $db = $this->getAdapter();
    $result = $db->update('ourbank_familymember',$input,$where);
    }
}

?>

