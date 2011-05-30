<?php
class Groupprofile_Model_Groupprofile extends Zend_Db_Table 
{
    protected $_name = 'ourbank_accounts';
    public function finduser($userid)
    {
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_user'),array('id'),array('a.id','a.name as username','a.designation'))
                ->where('a.id=?',$userid)
                ->join(array('b'=>'ourbank_office'),'a.bank_id=b.id',array('b.name as officename','b.officetype_id'))
                ->join(array('c'=>'ourbank_master_designation'),'c.id=a.designation',array('c.name as designation'))
                ->where('c.department_id=4');
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
    public function getMember($code)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT
                A.id,
                A.name,
                A.familycode,
                A.age,
                D.name as education,
                E.name as profession,
                G.name as catse,
                H.acre as acre,
                H.gunta as gunta,
                I.name as subcatse
                FROM
                ourbank_familymember A,
		ourbank_groupmembers B,
		ourbank_group C,
		ourbank_master_educationtype D,
		ourbank_master_profession E,
		ourbank_family Z,
                ourbank_master_castetype G,
                ourbank_agriculture H,
                ourbank_master_subcaste I
                WHERE
                C.groupcode = $code AND
               	C.id = B.group_id AND
		B.member_id  = A.id AND
		D.id = A.eductaion_id AND
		E.id = A.profession_id AND
		B.member_id = A.id AND 
		A.family_id = Z.id AND
		Z.caste_id = G.id AND
                H.family_id = Z.id AND
                I.id = subcaste_id
                ";
        $result = $db->fetchAll($sql);
        return $result;
    }
    public function groupDeatils($code)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT
                count(A.id) as groupNum,
                A.id,
                A.name,
                A.familycode,
                C.name as groupname,
                C.groupcode as groupcode,
                D.name as officename
                FROM
                ourbank_familymember A,
		ourbank_groupmembers B,
		ourbank_group C,
		ourbank_office D
                WHERE
                C.groupcode = $code AND
               	C.id = B.group_id AND
		B.member_id  = A.id AND
		C.village_id = D.id
                ";
        $result = $db->fetchAll($sql);
        return $result;
    }
}
