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
                ->join(array('b'=>'ourbank_master_realtionshiptype'),'a.relationship_id=b.id',array('b.name_regional as relationname'))
                ->join(array('c'=>'ourbank_master_educationtype'),'a.eductaion_id=c.id',array('c.name_regional as qualifyname'))
                ->join(array('l'=>'ourbank_master_employmenttype'),'a.employment_status=l.id',array('l.name_regional as employmentname'))
                ->join(array('f'=>'ourbank_master_bank'),'a.bank=f.id',array('f.name_regional as bankname'))
                ->join(array('g'=>'ourbank_master_branch'),'a.branch_po=g.id',array('g.name_regional as branchname'))
                ->join(array('i'=>'ourbank_master_bloodtype'),'i.id=a.blood_id',array('i.name_regional as blood'))
                ->join(array('h'=>'ourbank_master_maritalstatus'),'a.maritalstatus_id=h.id',array('h.name_regional as maritalname'))
                ->join(array('j'=>'ourbank_master_gender'),'a.gender_id = j.id',array('j.name_regional as gendername'))
            ->join(array('m'=>'ourbank_master_cbopromoter'),'a.promoter_id=m.id',array('m.name_regional as promoter'))
            ->join(array('n'=>'ourbank_master_cbos'),'a.cbo_id=n.id',array('n.name as cbos'))
            ->join(array('r'=>'ourbank_master_accountype'),'a.accouttype_id =r.id',array('r.name_regional as accountype'));
//        die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

        public function getentitlement($id){
	$select=$this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a'=>'ourbank_memberentitlememnt'),array('a.id'),array('a.entitlement_id'))
                    ->join(array('c'=>'ourbank_master_entitlements'),'c.id=a.entitlement_id',array('c.name_regional as entitlename'))
                    ->where('a.member_id=?',$id);
       // die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
        }

        public function checkuidmodel($uid){
        $select=$this->select()
                    ->setIntegrityCheck(false)
                ->from(array('a'=>'ourbank_familymember'),array('a.uid'))
		->where('a.uid=?',$uid);
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
        }

        public function getprofession($id){
	$select=$this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a'=>'ourbank_memberprofession'),array('a.id'),array('a.profession_id'))
                    ->join(array('c'=>'ourbank_master_profession'),'c.id=a.profession_id',array('c.name_regional as professionname'))
                    ->where('a.member_id=?',$id);
         // die($select->__toString($select));
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
                ->join(array('a'=>'ourbank_master_branch'),array('a.id'),array('a.id','a.name_regional as branchname'))
                ->where('a.bank_id=?',$bank_id);
//        die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getcbolist($kootaid)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_master_cbopromoter'),array('a.id'),array('a.id','a.name_regional'))
                ->where('a.koota_id =?',$kootaid);
//        die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getcbo($cbo_id)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_master_cbos'),array('a.id'),array('a.id','a.name_regional as cboname'))
                ->where('a.cbopromoter_id=?',$cbo_id);
//        die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getbank($type_id,$gpid)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_master_bank'),array('a.id'),array('a.id as bank_id','a.name_regional as bankname'))
                ->join(array('b'=>'ourbank_master_village'),'b.village_id=a.village_id')
                ->where('b.panchayath_id = ?',$gpid)
                ->where('a.accounttype_id =?',$type_id);
	   //     die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getgpid($villageid)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_master_village'),array('a.id'),array('a.panchayath_id'))
                 ->where('a.village_id =?',$villageid);
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

    public function deleterecord($table,$param)  
    {
        $db = $this->getAdapter();
        $db->delete($table,array('member_id = '.$param));
        return;
    }

    public function update($member_id,$input = array()) {
    $where[] = "id = '".$member_id."'";
    $db = $this->getAdapter();
    $result = $db->update('ourbank_familymember',$input,$where);
    }

}


