<?php
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

class Groupmdefault_Model_groupdefault extends Zend_Db_Table {
   	protected $_name = 'ourbank_member'; // set ourbank_member is a parent table

        public function getofficehierarchy()
        {
         $db = $this->getAdapter();
        $sql = "SELECT id as hierarchyid FROM `ourbank_officehierarchy` where Hierarchy_level in (SELECT max(Hierarchy_level) FROM `ourbank_officehierarchy`)";
        $result = $db->fetchAll($sql);
        return $result;
        }
	
        // get branch members based on SHG or JLG basis
	public function GetBranchMembers($branchid,$type) {
        $db = $this->getAdapter();
        if($type == 2){
	$sql = "select * from ourbank_familymember 
            where ((family_id in (select id from ourbank_family where village_id = $branchid)) and (gender_id = 2))
            and id not in
            (select member_id from ourbank_groupmembers 
            where (groupmember_status = 3 or groupmember_status = 1) and id in (select id from ourbank_groupmembers where (groupmember_status = 3 or groupmember_status = 1))) order by(family_id)";
        } 
        else{
	$sql = "select * from ourbank_familymember 
            where (family_id in (select id from ourbank_family where village_id = $branchid)) 
            and id not in
            (select member_id from ourbank_groupmembers 
            where (groupmember_status = 3 or groupmember_status = 1) and id in (select id from ourbank_groupmembers where (groupmember_status = 3 or groupmember_status = 1))) order by(family_id)";
        }
	$result = $db->fetchAll($sql);
	return $result;
	}
       
   public function GetExistMembers($branchid,$type) {
        $db = $this->getAdapter();
	$sql = "SELECT distinct(`family_id`) FROM `ourbank_familymember` WHERE `id` in (SELECT `member_id` FROM `ourbank_groupmembers` WHERE `group_id` in (select `id` FROM `ourbank_group` WHERE `village_id` = $branchid and substr(`groupcode`,5,1) = $type))";
	$result = $db->fetchAll($sql);
	return $result;
	}
	public function Getgrouphead($group_id){
            $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_group'),array('id'),array('head'))
                ->where('a.id = '.$group_id)
                ->join(array('b' => 'ourbank_familymember'),'b.id  = a.head',array('name'));
        $result=$this->fetchAll($select);
        return $result->toArray(); //  return group head member
	}

        public function Getbranch($bankid){
            $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_master_branch'),array('id'))
                ->where('a.bank_id = '.$bankid);
// die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray(); //  return respective bank branch names
	}



// 	public function GetBranchMembers1($branchid,$group_id) {
// 	$db = $this->getAdapter();
// 	$sql = "select * from ourbank_familymember 
// 		where (family_id in (select id from ourbank_family where village_id = $branchid)) 
// 		and id not in
// 		(select member_id from ourbank_groupmembers 
// 		where groupmember_status = 3 or groupmember_status = 1)";
// 			$result = $db->fetchAll($sql);
// 	return $result; // get branch members for branch id , group id
// 	
// 	}

        //get glsubcode 
        public function getpenaltyglcode($ledgertypeid,$header)
        {
            $this->db = $this->getAdapter();
            $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            $result = $this->db->fetchRow("SELECT max(glcode) as glcode,id as glcodeid
                                            FROM  ourbank_glcode
                                            where (ledgertype_id = '$ledgertypeid' and header like '%".$header."%')");
            return $result;
        } 
        //get glsubcode 
        public function checkavailid($header)
        {
            $this->db = $this->getAdapter();
            $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            $result = $this->db->fetchRow("SELECT *
                                            FROM  ourbank_glsubcode
                                            where (header like '%".$header."%')");
            return $result;
        }

//subcode insert
            public function insertGlsubcode($input)
        {
            $this->db = $this->getAdapter();
            $this->db->insert('ourbank_glsubcode',$input);
            return '1';
        }
        public function GetAllvillagemembers($branchid){
            $db = $this->getAdapter();
	$sql = "select * from ourbank_familymember 
		where (family_id in (select id from ourbank_family where village_id = $branchid)) order by family_id";
			$result = $db->fetchAll($sql);
	return $result; // get branch members for branch id , group id

        }

        public function getfamilyMembersforedit($familyid){
        $db = $this->getAdapter();
                $sql = "select * from ourbank_familymember 
                        where (family_id  = $familyid)";
                                $result = $db->fetchAll($sql);
                return $result; // get family members 
        }

        public function getsingleRecord($familyid){
        $db = $this->getAdapter();
                $sql = "select id from ourbank_familymember 
                        where (family_id  = $familyid && breadwinner_id = 1)";
                                $result = $db->fetchOne($sql);
                return $result; // get family members 
        }


        public function fetchAllgroupmembers() {
	$db = $this->getAdapter();
	$sql = "select * from ourbank_groupmembers"; 
		$result = $db->fetchAll($sql);
	return $result; // return group details for particular group id
		
	}

	public function getgroupdetails($group_id) {
	$db = $this->getAdapter();
	$sql = "select * from ourbank_group 
		where id = $group_id";
		$result = $db->fetchAll($sql);
	return $result; // return group details for particular group id
		
	}
	public function assignMembers($group_id) {
			$select=$this->select()
				->setIntegrityCheck(false)
				->join(array('a' => 'ourbank_groupmembers'),array('id'),array('member_id'))
				->where('a.group_id = '.$group_id)
				->where('a.groupmember_status = 3 or a.groupmember_status = 1')
				->join(array('b' => 'ourbank_familymember'),'b.id  = a.member_id');
			$result=$this->fetchAll($select);
			return $result->toArray(); // return assigned members for group
	}

        public function representatives($group_id) {
			$select=$this->select()
				->setIntegrityCheck(false)
				->join(array('a' => 'ourbank_group_representatives'),array('id'),array('representative_id'))
				->where('a.group_id = '.$group_id)
				->join(array('b' => 'ourbank_familymember'),'b.id  = a.representative_id');
			$result=$this->fetchAll($select);
			return $result->toArray(); // return assigned members for group
	}
	public function UpdateGroupdetails($groupid) {
		$where = 'group_id = '.$groupid;
		$db = $this->getAdapter();
		$db->delete('ourbank_groupmembers',$where); // delete group details
	
	}
public function UpdateGroupreps($groupid) {
		$where = 'group_id = '.$groupid;
		$db = $this->getAdapter();
		$db->delete('ourbank_group_representatives',$where); // delete group details
	
	}

        public function getProductid($grouptype){
        $db = $this->getAdapter();
        $sql = "SELECT `id` FROM `ourbank_productsoffer` WHERE (shortname like('ps') && `applicableto` = 4)";
// echo $sql;
         $result = $db->fetchOne($sql); // return the product id details for that group 
	 return $result;

        }
        public function getAccountstatus($groupid,$typeid){
		$select = $this->select()
			->setIntegrityCheck(false)
			->join(array('a' => 'ourbank_accounts'),array('id'),array('status_id'))
			->where('a.member_id ='.$groupid)
			->where('a.membertype_id ='.$typeid);
		$result= $this->fetchAll($select);
		return $result->toArray(); // return the status of group 
	}  

         public function getbreadwinner($familyid) {
                $db = $this->getAdapter();
                    $sql = "select id,family_id,breadwinner_id,name from ourbank_familymember where family_id ='".$familyid."' and breadwinner_id = 1";

                    $result = $db->fetchAll($sql); // return the breadwinner details for that group 
	       return $result;
            }


}
