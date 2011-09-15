<?php
class Loanprocess_Model_Loanprocess extends Zend_Db_Table 
{
     protected $_name = 'ourbank_accounts';

        public function Availbility($membercode,$Type){
            if($Type == 2 or $Type == 3){
                $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_group'),array('id as groupid'))
                ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.group_id',array('b.member_id as id'))
                ->where('a.groupcode=?',$membercode);
            }
            if($Type ==1){
                  $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_familymember'),array('id'))
                ->join(array('b' => 'ourbank_groupmembers'),'b.member_id=a.id',array('b.id as groupid'))
                ->where('a.familycode=?',$membercode);
            }
           // die($select->__toString($select));
            $result=$this->fetchAll($select);
            return $result->toArray(); // return group member details
        }

        public function getgroup($membercode,$Type)
        {
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_group'),array('id'),array('a.id as groupid','a.name as name','a.groupcode as code',''))
        ->where('a.groupcode = '.$membercode)
        ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.group_id',array('b.id as memid'))
        ->join(array('d'=>'ourbank_familymember'),'d.id=b.member_id',array('d.name as memname'))
        ->join(array('c' => 'ourbank_loanprocess'),'b.member_id = c.member_id',array('c.id as requestid','c.request_amount as Amount','c.created_date as requestdate'))
        ->join(array('e' => 'ourbank_master_loanpurpose'),'e.id = c.purpose',array('e.name as purposename'))
        ->where('c.membertype=2 or c.membertype=3');
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray(); // return group member details

        }

        public function viewrequest($memcode,$Type)
        {
         if($Type == 2 or $Type == 3){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_group'),array('id'),array('a.id as memid','a.name as name','a.groupcode as code',''))
        ->where('a.groupcode = '.$memcode)
        ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.group_id',array('b.id'))
        ->join(array('c' => 'ourbank_loanprocess'),'b.member_id = c.member_id',array('sum(c.request_amount) as Amount','c.created_date as requestdate','c.status as statusid'))
        ->join(array('d' => 'ourbank_master_loanstatus'),'d.id = c.status',array('d.name as status','d.officehierarchy_id as levelid'))
        ->where('c.membertype=2 or c.membertype=3')
        ->group('a.groupcode');
        }

        if($Type ==1){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_familymember'),array('id'),array('a.id as memid','a.name as name','a.familycode as code'))
        ->where('a.familycode = '.$memcode)
        ->join(array('b' => 'ourbank_loanprocess'),'b.member_id = a.id',array('b.id as processid','request_amount as Amount','purpose','b.status as statusid'))
        ->where('b.membertype=1')
        ->join(array('c' => 'ourbank_master_loanstatus'),'c.id = b.status',array('c.name as status','c.officehierarchy_id as levelid'))
        ->join(array('d' => 'ourbank_master_loanpurpose'),'b.purpose = d.id',array('name as purpose'));
        }
       // die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray(); // return group member details
        }

        public function processnotes($memgroupid,$Type,$memstatudid)
        {
         if($Type == 2 or $Type == 3){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_loanprocess_details'),array('id')) 
        ->join(array('b' => 'ourbank_master_loanstatus'),'b.id=a.status',array('b.name as statusname'))
        ->join(array('c' => 'ourbank_user'),'c.id=a.created_by',array('c.name as officername'))
        ->where('a.mem_group_id = '.$memgroupid)
        ->where('a.status = '.$memstatudid)
        ->where('a.type=2 or a.type=3');
        }

        if($Type == 1){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_loanprocess_details'),array('id')) 
        ->join(array('b' => 'ourbank_master_loanstatus'),'b.id=a.status',array('b.name as statusname'))
        ->join(array('c' => 'ourbank_user'),'c.id=a.created_by',array('c.name as officername'))
        ->where('a.mem_group_id = '.$memgroupid)
        ->where('a.status = '.$memstatudid)
        ->where('a.type=1');
        }
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray(); // return group member details

        }

        public function searchStatus($membercode,$Type,$status){
        if($Type == 2 or $Type == 3){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_group'),array('id'),array('a.id as memid','a.name as name','a.groupcode as code',''))
        ->where('a.groupcode = '.$membercode)
        ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.group_id',array('b.id'))
        ->join(array('c' => 'ourbank_loanprocess'),'b.member_id = c.member_id',array('sum(c.request_amount) as Amount','c.created_date as requestdate'))
        ->join(array('d' => 'ourbank_master_loanstatus'),'d.id = c.status',array('d.name as status','d.officehierarchy_id as levelid'))
        ->where('c.membertype=2 or c.membertype=3')
        ->where('c.status=?',$status)
        ->group('a.groupcode');
        }
 
        if($Type ==1){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_familymember'),array('id'),array('a.id as memid','a.name as name','a.familycode as code'))
        ->where('a.familycode = '.$membercode)
        ->join(array('b' => 'ourbank_loanprocess'),'b.member_id = a.id',array('b.id as processid','request_amount as Amount','purpose','status'))
        ->where('b.status=?',$status)
        ->where('b.membertype=1')
        ->join(array('c' => 'ourbank_master_loanstatus'),'c.id = b.status',array('c.name as status','c.officehierarchy_id as levelid'))
        ->join(array('d' => 'ourbank_master_loanpurpose'),'b.purpose = d.id',array('name as purpose'));
        }
       // die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray(); // return group member details
        }

    public function checkrequest($membercode,$Type){
        if($Type == 2 or $Type == 3){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_group'),array('id'),array('a.id as memid'))
        ->where('a.groupcode = '.$membercode)
        ->join(array('e' => 'ourbank_groupmembers'),'e.group_id = a.id',array('e.id'))
        ->join(array('b' => 'ourbank_loanprocess'),'b.member_id = e.member_id',array('b.id as processid','request_amount','purpose','status'))
        ->join(array('c' => 'ourbank_master_loanstatus'),'c.id = b.status',array('c.name as status','c.officehierarchy_id as levelid'))
        ->join(array('d' => 'ourbank_master_loanpurpose'),'b.purpose = d.id',array('name as purpose'));
        }
        if($Type ==1){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a' => 'ourbank_familymember'),array('id'),array('a.id as memid'))
        ->where('a.familycode = '.$membercode)
        ->join(array('b' => 'ourbank_loanprocess'),'b.member_id = a.id',array('b.id as processid','request_amount','purpose','status'))
        ->join(array('c' => 'ourbank_master_loanstatus'),'c.id = b.status',array('c.name as status','c.officehierarchy_id as levelid'))
        ->join(array('d' => 'ourbank_master_loanpurpose'),'b.purpose = d.id',array('name as purpose'));
        }
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray(); // return group member details
    }

    public function searchActive($code,$groupid){
            $this->db = Zend_Db_Table::getDefaultAdapter();
            $sql = "select * from ourbank_loanprocess where member_id  = '$code' and membertype = '$groupid' and status != 0";
//             echo $sql;
            $result = $this->db->fetchAll($sql,array($code,$groupid));
            return $result;
        }
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

       public function findhierarchy($levelid)
       {
           $select=$this->select()
                   ->setIntegrityCheck(false)
                   ->join(array('a'=>'ourbank_officehierarchy'),array('a.id'))
                   ->where('a.id=?',$levelid);
            //die($select->__toString($select));
            $result=$this->fetchAll($select);
            return $result->toArray();
       }
 public function Searchloanprocess($code){
        
        	$keyvalue = array_filter($code);
		$searchcounter = count($keyvalue);
	if($searchcounter > 0) {

$member_id=$code['s1'];
        
        $this->db = Zend_Db_Table::getDefaultAdapter();
         $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            $sql = "SELECT 
                a.groupcode as code,
                a.name as name, 
                '' as uid,
                sum(c.request_amount) as Amount,
                a.groupcode as groupcode,
                c.created_date  requestdate, 
                d.name as status
                from 
                ourbank_group a, ourbank_groupmembers b, ourbank_loanprocess c, ourbank_master_loanstatus d
                where 
                a.id=b.group_id
                and b.member_id = c.member_id and  (c.membertype = 2 or c.membertype = 3 )
                and d.id = c.status
                and c.status!=0
                and (a.groupcode like '".$member_id."%') 
                group by a.groupcode
                union
                SELECT 
                e.familycode as code, 
                e.name as name, 
                e.uid as uid,
                c.request_amount as Amount, 
                b.member_id as memberid, 
                c.created_date  requestdate, 
                d.name as status
                from 
                ourbank_group a, ourbank_groupmembers b, ourbank_loanprocess c, ourbank_master_loanstatus d, ourbank_familymember e
                where 
                a.id=b.group_id
                and b.member_id = c.member_id and  c.membertype = 1
                and e.id=b.member_id
                and d.id = c.status
                and c.status!=0
                and (e.familycode like '".$member_id."%')";
            //  echo $sql;
            $result = $this->db->fetchAll($sql,$member_id);
            return $result;
            }else{ return 0;}
        }

    public function searchmemberdetails($groupid,$type){
            if($type == 2 or $type == 3){
           $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_group'),array('id'),array('groupcode as code','name'))
                ->where('a.id = '.$groupid)
                ->join(array('b' => 'ourbank_office'),'b.id  = a.village_id',array('name as villagename'));
            } 
        if($type == 1){
           $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_familymember'),array('id'),array('familycode as code','name','uid'))
                ->where('a.id = '.$groupid)
                ->join(array('b' => 'ourbank_office'),'b.id  = a.village_id',array('name as villagename'));
            }
//         die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray(); //  return group member details
        }

   

    public function Updatestatus($status,$memberid){ //print_r($data); print_r($where);
                $this->db = Zend_Db_Table::getDefaultAdapter();
                        $data = array('status'=> $status);
                        $where='id='.$memberid;
                $this->db->update('ourbank_loanprocess',$data,$where);
            }

    public function insertJlgvalues($formdata,$createdby){
                $this->db = Zend_Db_Table::getDefaultAdapter();

            $data = array('id'=> '',
                          'date_formation'=>$formdata['dateofformation'],
                          'existloan'=>$formdata['loantaken'],
                        'bankname'=>$formdata['branchname'],
                        'limitenjoy'=>$formdata['limitenjoy'],
                        'account_number'=>$formdata['accno'],
                        'date_advance'=>$formdata['dateofadvance'],
                        'date_closure'=>$formdata['dateofclosure'],
                        'total_members'=>$formdata['totalmembers'],
                        'debarred'=>$formdata['anymember'],
                        'periodical_meeting'=>$formdata['periodicalmeeting'],
                        'bank_jlgarea'=>$formdata['otherbankbranch'],
                        'repayment_installment'=>$formdata['repaymentinstallment'],
                        'interest_rate'=>$formdata['interestrate'],
                        'application_source'=>$formdata['appsource'],
                        'existJLGmembers'=>$formdata['samevillageavailability'],
                        'declaration_member'=>$formdata['declaration'],
                        'rotated_period'=>$formdata['rotatedperiod'],
                        'jlgotherbank'=>$formdata['Jlgothrbankacc'],
                        'memberotherbank'=>$formdata['memberothrbankacc'],
                        'bclink'=>$formdata['memavailbc'],
                        'statutory_requirement'=>$formdata['statuoryreq'],
                        'jlgmeetingfrom'=>$formdata['meetingregisterfrom'],
                        'jlgmeetingto'=>$formdata['meetingregisterto'],
                        'savingregisterfrom'=>$formdata['savingregisterfrom'],
                        'savingregisterto'=>$formdata['savingregisterto'],
                        'lendingregisterfrom'=>$formdata['internalregfrom'],
                        'lendingregisterto'=>$formdata['internalregto'],
                        'jlgpassbook'=>$formdata['jlgpassbook'],
                        'totalsaving'=>$formdata['totalsaving'],
                        'totalinterest'=>$formdata['totalinterest'],
                        'revolvingfund'=>$formdata['revolvingfund'],
                        'subsidy'=>$formdata['onssubsidy'],
                        'totalcorpus'=>$formdata['totalcorpus'],
                        'internallendamt'=>$formdata['internallend'],
                        'otherexpense'=>$formdata['otherexpense'],
                        'cashonhand'=>$formdata['cashonhand'],
                        'amountinbank'=>$formdata['amountinbank'],
//                         'remarks'=>$formdata['remarks'],
                        'created_by'=>$createdby,
                        'created_date'=>date('Y-m-d'));
            $this->db->insert('ourbank_jlgadvances',$data);
    }
    public function searchgroupdetails($membercode){
            $this->db = Zend_Db_Table::getDefaultAdapter();
                $sql = "select id,name,groupcode from ourbank_group where groupcode like '%' '$membercode' '%'";
                $result = $this->db->fetchAll($sql);
            return $result;
    }

    public function getgroupName($groupid){
            $this->db = Zend_Db_Table::getDefaultAdapter();
                $sql = "select 
                            a.name as groupname,
                            a.groupcode  as groupcode,
                            b.name as villagename
                        from
                            ourbank_group as a,
                            ourbank_master_villagelist as b
                        where 
                            a.id = $groupid and
                            a.village_id = b.id";
                $result = $this->db->fetchAll($sql);
            return $result;
    }

 public function getAttendance($groupid){
                    $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a' => 'ourbank_meeting'),array('id'),array('id as noofmeetings'))
                        ->where('a.group_id  = '.$groupid)
                        ->join(array('b' => 'ourbank_attendance'),'b.meeting_id = a.id',array('id as attendanceid'))
                        ->join(array('c' => 'ourbank_memberattendance'),'c.attendance_id  = b.id',array('count(member_id) as Absentees'));

            $result=$this->fetchAll($select);
            return $result->toArray();
    }
    public function Countmeetings($groupid){
                $this->db = Zend_Db_Table::getDefaultAdapter();
                    $sql = "select 
                                count(a.id) as Numberofmeetings
                            from 
                                ourbank_meeting as a
                            where 
                                a.group_id = $groupid";
                    $result = $this->db->fetchAll($sql);
                return $result;
        } 
    public function Countgroupmembers($groupid){
                $this->db = Zend_Db_Table::getDefaultAdapter();
                    $sql = "select 
                                count(a.member_id) as Totalmembers
                            from 
                                ourbank_groupmembers as a
                            where 
                                a.group_id = $groupid";
                    $result = $this->db->fetchAll($sql);
                return $result;
        }

    public function getMember($code)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT
                A.id,
                A.name,
                A.familycode,
                A.uid
                FROM
                ourbank_familymember A,
		ourbank_groupmembers B,
		ourbank_group C
                WHERE
                C.groupcode = $code AND
               	C.id = B.group_id AND
		B.member_id  = A.id 
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
