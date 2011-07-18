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

    public function group($code)
    {


  $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_group'),array('id'))
                ->where('a.groupcode=?',$code)
                 ->join(array('b'=>'ourbank_groupmembers'),'a.id = b.group_id',array('b.member_id'))
                ->join(array('c'=>'ourbank_familymember'),'b.member_id =c.id',array('c.name as membername','age','familycode'))
                ->join(array('d'=>'ourbank_master_educationtype'),'c.eductaion_id =d.id',array('d.name as education'))
                ->join(array('e'=>'ourbank_family'),'c.family_id =e.id',array('e.caste_id'))
                ->join(array('f'=>'ourbank_master_castetype'),'e.caste_id =f.id',array('f.name as caste'))

//                ->join(array('g'=>'ourbank_memberprofession'),'b.member_id =g.member_id',array('g.profession_id'))
               ->join(array('h'=>'ourbank_master_profession'),'c.employment_status= h.id',array('h.name as profession'))

//                 ->where('c.department_id=4')



;
    // die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();








//         $db = Zend_Db_Table::getDefaultAdapter();
//         $db->setFetchMode(Zend_Db::FETCH_OBJ);
//         $sql = "SELECT
//                 A.id,
//                 A.name,
//                 A.familycode,
//                 A.age,
//                 D.name as education,
//                 A.promoter_id as profession,
//                 G.name as caste,
//                 H.name as land        FROM
// 
//                 ourbank_familymember A,
// 		        ourbank_groupmembers B,
// 					   ourbank_group C,
// 		ourbank_master_educationtype D,
// 		    ourbank_memberprofession E,
// 		              ourbank_family Z,
//             ourbank_master_castetype G,
//             ourbank_master_landtypes H,
// 			     ourbank_agriculture J WHERE
//                 C.groupcode = $code AND
//                	C.id = B.group_id AND
// 				B.member_id  = A.id AND
// 				D.id = A.eductaion_id AND
// 				E.member_id = A.promoter_id   AND
// 				B.member_id = A.id AND 
// 				A.family_id = Z.id AND
// 				H.id  = J.land_id  AND
// 				Z.caste_id = G.id ";
// 	//echo $sql;
//         $result = $db->fetchAll($sql);
//         return $result;
    }
    
    
    public function landDetails($mebercode)
    {
    $select=$this->select()
                ->setIntegrityCheck(false)
                 ->join(array('a'=>'ourbank_group'),array('id'))
                ->where('a.groupcode=?',$mebercode)
                ->join(array('b'=>'ourbank_groupmembers'),'a.id = b.group_id',array('b.member_id'))
                ->join(array('c'=>'ourbank_agriculture'),'c.landowner_name =b.member_id',array('c.land_id'))
                ->join(array('d'=>'ourbank_master_landtypes'),'d.id =c.land_id',array('d.name'));
            
   //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();

    
    
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
		C.village_id = D.id ";

//echo $sql;


		$result = $db->fetchAll($sql);
        return $result;
    }
}
