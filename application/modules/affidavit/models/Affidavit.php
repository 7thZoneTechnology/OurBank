<?php
class Affidavit_Model_Affidavit extends Zend_Db_Table 
{
    protected $_name = 'ourbank_group';

    public function getMember($membercode){

       	$this->db = Zend_Db_Table::getDefaultAdapter();
            $sql ="select distinct(name),
                        A.id as groupid, 
                        A.groupcode, 
                        A.name as group_name,
                        A.place,
                        A.group_created_date,
                        A.branch_id
                    from 
                        ourbank_group as A , 
                        ourbank_loanprocess as B 
                    where
                         A.groupcode like '%".$membercode ."%' and 
                         B.member_id = A.id and (B.membertype = 3 or B.membertype = 2)";
// //  echo $sql;
            $result = $this->db->fetchAll($sql,array($membercode));
            return $result;
    }

    public function fetchmembers($groupid){
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_groupmembers'),array('a.id'))
                        ->where('a.group_id ='.$groupid)
                        ->join(array('b' => 'ourbank_loanprocess'),'a.member_id=b.member_id')
                        ->where('b.membertype=2 or b.membertype=3')
                        ->where('b.status=5')
                        ->join(array('c' => 'ourbank_familymember'),'c.id=b.member_id', array('c.name as membername', 'c.village_id', 'c.alias', 'c.age'));
//                        die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

public function fetchrepresentative($groupid)
{
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_group_representatives'),array('a.id'))
                        ->where('a.group_id ='.$groupid)
                        ->join(array('b' => 'ourbank_familymember'),'a.representative_id=b.id', array('b.name as membername'));
//                        die($select->__toString($select));
//         return $this->fetchAll($select);
        $result = $this->fetchAll($select);
        return $result->toArray();
}

public function fetchvillagedetails($villageid)
{
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_master_village'))
                        ->where('a.village_id ='.$villageid)
                        ->join(array('b' => 'ourbank_master_taluklist'),'a.taluk_id=b.id', array('b.name as talukname'))
                        ->join(array('c' => 'ourbank_master_districtlist'),'a.district_id=c.id', array('c.name as distname'))
                        ->join(array('d' => 'ourbank_master_villagelist'),'a.village_id=d.village_id', array('d.name as villagename'));

                       // die($select->__toString($select));
//         return $this->fetchAll($select);

        $result = $this->fetchAll($select);
        return $result->toArray();
}
public function getbankdetails($branchid) 
{ //echo $branchid;
        $select = $this->select()
                       ->setIntegrityCheck(false)
//                         ->from(array('a' => 'ourbank_master_bank'), array('a.name as bankname','a.branch'))
//                         ->where('a.serialno ='.$groupid);

                        ->from(array('a' => 'ourbank_master_branch'), array('a.name as branch'))
                        ->where('a.id ='.$branchid)
                        ->join(array('b' => 'ourbank_master_bank'),'a.bank_id=b.id', array('b.name as bankname'));

//                        die($select->__toString($select));
//         return $this->fetchAll($select);
        $result = $this->fetchAll($select);
        return $result->toArray();
}

}
