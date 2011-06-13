<?php
class Sbwithdrawal_Model_Sbwithdrawal extends Zend_Db_Table 
{
    protected $_name = 'ourbank_group';
    public function getMember($membercode){

$select=$this->select()
       ->setIntegrityCheck(false)
       ->join(array('a' => 'ourbank_group'),array('id'),array('id as groupid','groupcode','name as  group_name'))
       ->where('groupcode like "%" ? "%"',$membercode)
       ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.group_id',array('b.member_id as memid'))
       ->join(array('d'=>'ourbank_familymember'),'d.id=b.member_id',array('d.name as memname'))
       ->joinLeft(array('c' => 'ourbank_loanprocess'),'b.member_id = c.member_id')
       ->where('c.membertype=2 or c.membertype=3');
//        die($select->__toString($select));
       $result=$this->fetchAll($select);
       return $result->toArray(); // return group member details


    }

// // get group whole details
        public function getgroupwholedetails($id,$membertype)
        {
        $select=$this->select()
            ->setIntegrityCheck(false)
            ->join(array('a' => 'ourbank_group'),array('id'),array('name as groupname','id as groupid','group_created_date','groupcode'))
            ->where('a.id = '.$id)
            ->join(array('b' => 'ourbank_accounts'),'b.member_id = a.id',array('account_number as savingsaccountnumber'))
            ->where('b.membertype_id = '.$membertype)
            ->join(array('c' => 'ourbank_group_representatives'),'c.group_id ='.$id,array('representative_id'))
            ->join(array('d' => 'ourbank_groupmembers'),'d.group_id ='.$id,array('member_id as groupmembers'))
            ->where('d.groupmember_status  = 1 or d.groupmember_status  = 3')
            ->join(array('e' => 'ourbank_familymember'),'e.id = d.member_id',array('name as groupmembersname'))
            ->where('e.id = d.member_id or e.id = c.representative_id')
            ->group('b.member_id');
//         die($select->__toString($select));
       $result=$this->fetchAll($select);
       return $result->toArray();
    }

    // get Group members details
    public function getgroupmembers($id) {
	$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_groupmembers'),array('id'),array('member_id as memberid'))
                       ->where('a.group_id  = '.$id)
			->join(array('b' => 'ourbank_familymember'),'a.member_id = b.id',array('name as membername'));
			
	return $this->fetchAll($select);
    } 
// get Group members details
    public function getrepmembers($id) {
	$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_group_representatives'),array('id'),array('representative_id as memberid'))
                       ->where('a.group_id  = '.$id)
			->join(array('b' => 'ourbank_familymember'),'a.representative_id = b.id',array('name as membername'));
			
	return $this->fetchAll($select);
    }
}
