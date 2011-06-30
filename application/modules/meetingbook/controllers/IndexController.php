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
class Meetingbook_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->pageTitle = $this->view->translate("Meeting book");

        /* Initialize action controller here */

        $users = new App_Model_Users();
                $this->view->createdby = $users->checkSession();
                if($this->view->createdby == 0){
                        $this->_redirect('index/login'); // once session get expired it will redirect to Login page
                }

    /*    $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data)
        {
            $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }
        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id
        $globalsession=new App_Model_Users();
        $loginname=$globalsession->username($userid);
        foreach($loginname as $loginname) 
        {
            $this->view->username=$loginname['username']; // get the user name
        } */

        $this->view->adm = new App_Model_Adm();
        $this->view->dateconvert = new App_Model_dateConvertor();

        $test = new DH_ClassInfo(APPLICATION_PATH . '/modules/meetingbookindex/controllers/');
        $module = $test->getControllerClassNames();
        $modulename = explode("_", $module[0]);
        $this->view->modulename = strtolower($modulename[0]);
        $this->view->savings=new Meetingbook_Model_Savings();
        $this->view->loanModel=new Meetingbook_Model_Loanrepayment();
    }

    public function indexAction() 
    {
    }

    public function attendanceaddAction() 
    {

//for attendance
    function array_search_values( $m_needle, $a_haystack, $b_strict = false){
    return array_intersect_key( $a_haystack, array_flip( array_keys( $a_haystack, $m_needle, $b_strict)));
}

        $path = $this->view->baseUrl();
        $attendanceform=new Meetingbook_Form_Attendance($path);
        $this->view->attendanceform=$attendanceform;
        $flag=1;

        //dropdown meeting list
        $meeting = $this->view->adm->viewRecord("ourbank_group","id","DESC");
        foreach($meeting as $meeting1){ 
            $attendanceform->meeting_name->addMultiOption($meeting1['id'],$meeting1['name']);
        }

        $insertattendance=new Meetingbook_Model_Meetingbook();
       //$this->view->createdby = $this->view->globalvalue[0]['id'];

	//listing discussion dropdown
        $this->view->discussionlist=$insertattendance->discussionlist();
        $this->view->decissionlist=$insertattendance->decissionlist();

        if ($this->_request->isPost() && $this->_request->getPost('Submit')) 
        {
         $formData = $this->_request->getPost();  //echo '<pre>'; print_r($formData);
         $accNum=$this->_request->getPost('accNum');
            if ($attendanceform->isValid($formData))
            {
    if($accNum) {
                $insertattendance=new Meetingbook_Model_Meetingbook();
                $member_id=array();
                $formData = $this->_request->getPost(); 
                $member_id=$this->_request->getPost('member_id');
        	$convertdate = new App_Model_dateConvertor();
		$meeting_date=$convertdate->phpmysqlformat($formData['meeting_date']);
                $date=$meeting_date;
                $amount=$this->_request->getPost('savingspaid');
		//insert attendance details
               $maxid1=$insertattendance->fetchmaxid($formData['meeting_name']); 
                  if($maxid1[0]['meetingno']=="") { $maxid='1'; 
                        } else { $maxid=$maxid1[0]['meetingno'];  }


           //savings details insertion
          $this->view->details = $this->view->savings->search($this->_request->getParam('accNum'));
          $totsavings=$this->_request->getPost('totsavingspaid');
          $description=$this->_request->getPost('notes');
          $type = 1;
          $transactionMode =1;
            //for getting common transaction id
     $totsavings=$formData['overallpaid'];
     $groupaccID=$formData['groupaccID'];
     $tranId = $this->view->savings->getTransactionID($groupaccID,$totsavings,$date,$type,$transactionMode,$description);

     $this->view->savings->deposit($accNum,$totsavings,$date,$type,$transactionMode,$description,$tranId);

       		    foreach ($this->view->details as $details) {
       		       $accID = $details->accId;
       		    }
          $group = $this->view->savings->getMember($accNum);
          $amount=$this->_request->getPost('savingspaid'); 
                    //inserting individual members savings
                    $id=0;
                    foreach ($group as $group)  { //echo $group->id;
                         if (($group->id) != 0) { 
                            $this->_request->getParam($group->id);
                            $this->view->adm->addRecord("ourbank_group_savingstransaction", 
                                            array('transaction_id' => $tranId,
                                            'account_id' => $accID,
                                            'transaction_date' => $date,
                                            'transaction_type' => 1,
                                            'transaction_amount' => $amount[$id],
                                            'member_id' => $group->id,
                                            'transacted_by' => $this->view->createdby));
                        $id++;
                         }
                    }
//end of savings details insertion 


//start loan repayment
        $loanaccNum = $this->_request->getParam('loanaccNum'); //print_r($accNum[0]);
        $loanamount=$this->_request->getParam('loanpaid');
        $this->view->details = $this->view->loanModel->searchaccounts($loanaccNum);
        $this->view->paid = $this->view->loanModel->paid($loanaccNum);
        $this->view->unpaid = $this->view->loanModel->unpaid($loanaccNum);
        $instalments = $this->view->loanModel->loanInstalments($loanaccNum);

        $increment=0;
foreach($loanaccNum as $loanaccNum){
        if($loanaccNum){
        $data = array('date' => $date,
                'amount' => $loanamount[$increment],
                'paymentMode' =>1,
                'description' => $description,
                'accNum' => $loanaccNum,
                'transID' => $tranId);

  $this->view->details = $this->view->loanModel->searchaccounts($loanaccNum);

            foreach ($this->view->details as $details) 
            {
                $intType = $details->interesttype; // Intereset type  
            }
                switch ($intType) 
                    {
                        CASE 1:
                                $int = $this->view->loanModel->declain($data);
                                BREAK;
                        CASE 2:
                                $int = $this->view->loanModel->emi($data);
                                BREAK;
                        CASE 3:
                                BREAK;
                    }
        $array = $this->view->loanModel->insertTran($data);
}
$increment++;
} //end of the loan repayment

                 //member attendance insertion
                 $attendance_id=$this->view->adm->addRecord("ourbank_attendance",array('id' => '',
                                                'transaction_id'=>$tranId,
                                                'week_no'=>$maxid,
						'meeting_id' => $formData['meeting_name'],
						'meeting_date'=> $meeting_date,
						'notes'=> $formData['notes'],
                                                'time'=> $formData['meeting_time'],
                                                'resolution'=> $formData['resolution'],
                                            	'created_date'=>date("y/m/d H:i:s"),
						'created_by' => $this->view->createdby));

$loop=$formData['length'];
//-------for absent fee and income  ---------
$flag1=0;
for($i=0; $i<$loop; $i++){
if(array_search_values( 'absent_'.$i, $formData)){
$absentees_id[]= array_search_values( 'absent_'.$i, $formData); 
$flag1 = 1;
}
}
if($flag1 ==1){
for($i=0;$i<count($absentees_id);$i++){
 foreach ($absentees_id[$i] as $key => $value) {
}
}
}
$abs1=($i)*$formData['absentfee'];
                            if($abs1){
                        $this->view->adm->addRecord("ourbank_Income", 
                                            array('Income_id' => '',
                                            'office_id' => $formData['officeid'],
                                            'glsubcode_id_from' => $formData['absentglsubcode'],
                                            'tranasction_id' => $tranId,
                                            'credit' => $abs1,
                                            'recordstatus_id'=>3));
                                    }
if($flag1 ==1){
for($i=0;$i<count($absentees_id);$i++){
 foreach ($absentees_id[$i] as $key => $value) {
                if($key) {
                 $this->view->adm->addRecord("ourbank_memberattendance",array('id' => '',
                                            'attendance_id'=>$attendance_id,
                                                'member_id'=>$key,
                                                'attendance_type'=>1,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
                    }
            }

}
}

//-------for late fee and income  ---------
$flag2=0;
for($j=0; $j<$loop; $j++){
if(array_search_values( 'late_'.$j, $formData)){
$latemember_id[]= array_search_values( 'late_'.$j, $formData); 
$flag2=1;
}
}
if($flag2 ==1) {
for($j=0;$j<count($latemember_id);$j++){
 foreach ($latemember_id[$j] as $key => $value) {
//echo $key."<br>";
}
}
}
$abs2=($j)*$formData['latefee'];
                    if($abs2){
                    $this->view->adm->addRecord("ourbank_Income", 
                                            array('Income_id' => '',
                                            'office_id' => $formData['officeid'],
                                            'glsubcode_id_from' => $formData['lateglsubcode'],
                                            'tranasction_id' => $tranId,
                                            'credit' => $abs2,
                                            'recordstatus_id'=>3));
                            }
if ($flag2 == 1) {
for($j=0;$j<count($latemember_id);$j++){
 foreach ($latemember_id[$j] as $key => $value) {
                if($key) {
                 $this->view->adm->addRecord("ourbank_memberattendance",array('id' => '',
                                            'attendance_id'=>$attendance_id,
                                                'member_id'=>$key,
                                                'attendance_type'=>2,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
                        }
                }
}
}

		//insert discussion table
		 $discussion=$this->_request->getPost('discussionlist'); 
		 if($discussion) {
				foreach($discussion as $discussion1)
					 { 
                 $this->view->adm->addRecord("ourbank_discussion",array('id' => '',
                                            'attendance_id'=>$attendance_id,
						'discussion_id'=>$discussion1,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
			} }
		//insert decision table
		$decision=$this->_request->getPost('decisionlist'); 
		if($decision) {
				foreach($decision as $decision1)
					 { 
                 $this->view->adm->addRecord("ourbank_decision",array('id' => '',
                                            'attendance_id'=>$attendance_id,
						'decision_id'=>$decision1,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
			} } 
                $this->_redirect('meetingbookindex/index');
    } else { 
            $this->view->result="<p style='color:red'>This Group Savings Account is closed<p>";
            }
        }
    }
}

    public function attendanceeditAction() 
    {
function array_search_values( $m_needle, $a_haystack, $b_strict = false){
    return array_intersect_key( $a_haystack, array_flip( array_keys( $a_haystack, $m_needle, $b_strict)));
}
		//Acl
// 		$acl = new App_Model_Acl();
// 		$access = new App_Model_Access();
// 		$role = $access->getRole($this->view->id);
// 		
// 		$accessid = $access->accessRights('Attendance',$role,"attendanceeditAction");
// 		$checkaccess = $acl->isAllowed($role,'Attendance',$accessid);
// 		if(($role) && ($checkaccess != NULL)) {

		//edit
        $path = $this->view->baseUrl();
        $attendanceform=new Meetingbook_Form_Attendance($path);
        $this->view->attendanceform=$attendanceform;

        $this->view->attendance_id=$attendance_id=$this->_request->getParam('attendance_id');

        $meeting = new Meeting_Model_Meeting();
        $result = $meeting->fetchAllmeetingdetails(); 

        $convertdate = new App_Model_dateConvertor();//Object for date convertor

        $fetchattendance=new Meetingbook_Model_Meetingbook();

	//listing discussion dropdown
        $this->view->discussionlist=$fetchattendance->discussionlist();
        $this->view->decissionlist=$fetchattendance->decissionlist();

	$this->view->editdiscussion=$fetchattendance->getdiscussion($attendance_id);
	$this->view->editdecision=$fetchattendance->getdecision($attendance_id);

        $memberattendance=$fetchattendance->fetchmemberttendance($attendance_id); 
        if($memberattendance){
        $fetchattendance1=$fetchattendance->fetchattendancedetailsforID($attendance_id);  
        } else {
        $fetchattendance1=$fetchattendance->fetchattendancedetailsforID1($attendance_id);  
        }
// //         Zend_Debug::dump($fetchattendance1);

        $meeting = $this->view->adm->viewRecord("ourbank_group","id","DESC");
        foreach($meeting as $meeting1){ 
            $attendanceform->meeting_name->addMultiOption($meeting1['id'],$meeting1['name']);
        }

        foreach($fetchattendance1 as $fetchattendance1) {
            foreach($result as $result) {
                if($result['id'] == $fetchattendance1['meeting_id']){
            $attendanceform->meeting_name->addMultiOption($result['id'],$result['name']);}
        }

            //attendance details
            $this->view->attendanceform->resolution->setValue($fetchattendance1['resolution']);
            $this->view->groupid=$fetchattendance1['meeting_id'];
            $this->view->attendanceform->meeting_name->setValue($fetchattendance1['meeting_id']); 
            $this->view->weekno=$fetchattendance1['meeting'];
            $this->view->vNo=$vNo=$fetchattendance1['transaction_id'];

            $this->view->attendanceform->meeting_time->setValue($fetchattendance1['attendancetime']); 
            $this->view->attendanceform->meeting_date->setValue($convertdate->phpnormalformat($fetchattendance1['meeting_date']));
	    $this->view->attendanceform->notes->setValue($fetchattendance1['notes']);
        }
        //Fetches all the memberes in that group of particular meeting ID
$transId=$this->view->vNo;
echo "<script>getMembers(".$fetchattendance1['meeting_id'].",'".$path."',".$attendance_id.",".$transId.");</script>";
echo "<script>getMeeting(".$fetchattendance1['meeting_id'].",'".$path."',".$attendance_id.");</script>";

        //fetch savings details
//         $this->view->savingsdetails=$this->view->savings->fetchsavingsdetails($vNo); 
// echo '<pre>'; print_r($this->view->savingsdetails); 

	//update
        if($this->_request->isPost() && $this->_request->getPost('Update')) {
            $attendance_id=$this->_request->getParam('attendance_id');

                $member_id=array();
                $formData = $this->_request->getPost(); 
                $member_id=$this->_request->getPost('member_id');
        	$convertdate = new App_Model_dateConvertor();
		$meeting_date=$convertdate->phpmysqlformat($formData['meeting_date']);
                $date=$meeting_date;

         $accNum=$this->_request->getPost('accNum');
            if ($attendanceform->isValid($formData))
            {
    if($accNum) {
                $insertattendance=new Meetingbook_Model_Meetingbook();
                $member_id=array();
                $formData = $this->_request->getPost(); 
                $member_id=$this->_request->getPost('member_id');
        	$convertdate = new App_Model_dateConvertor();
		$meeting_date=$convertdate->phpmysqlformat($formData['meeting_date']);
                $date=$meeting_date;
                $amount=$this->_request->getPost('savingspaid');
		//insert attendance details
               $maxid1=$insertattendance->fetchmaxid($formData['meeting_name']); 
                  if($maxid1[0]['meetingno']=="") { $maxid='1'; 
                        } else { $maxid=$maxid1[0]['meetingno'];  }


           //savings details insertion
          $this->view->details = $this->view->savings->search($this->_request->getParam('accNum'));
          $totsavings=$this->_request->getPost('totsavingspaid');
          $description=$this->_request->getPost('notes');
          $type = 1;
          $transactionMode =1;

     //update existing transaction id as inactive
     $this->view->savings->updateRecord("ourbank_transaction",$vNo,array('recordstatus_id' => 2));
     $this->view->savings->updateRecord("ourbank_Assets",$vNo,array('record_status' => 2));
     $this->view->savings->updateRecord("ourbank_Liabilities",$vNo,array('record_status' => 2));
     $this->view->savings->updateRecord1("ourbank_Income",$vNo,array('recordstatus_id' => 2));
     //for getting common transaction id
     $totsavings=$formData['overallpaid'];
     $groupaccID=$formData['groupaccID'];
     $tranId = $this->view->savings->getTransactionID($groupaccID,$totsavings,$date,$type,$transactionMode,$description);

     $this->view->savings->deposit($accNum,$totsavings,$date,$type,$transactionMode,$description,$tranId);

       		    foreach ($this->view->details as $details) {
       		       $accID = $details->accId;
       		    }
          $group = $this->view->savings->getMember($accNum);
          $amount=$this->_request->getPost('savingspaid'); 
                    //inserting individual members savings
                    $id=0;
                    foreach ($group as $group)  { //echo $group->id;
                         if (($group->id) != 0) { 
                            $this->_request->getParam($group->id);
                            $this->view->adm->addRecord("ourbank_group_savingstransaction", 
                                            array('transaction_id' => $tranId,
                                            'account_id' => $accID,
                                            'transaction_date' => $date,
                                            'transaction_type' => 1,
                                            'transaction_amount' => $amount[$id],
                                            'member_id' => $group->id,
                                            'transacted_by' => 1));
                        $id++;
                         }
                    }
//end of savings details insertion 


//start loan repayment
        $loanaccNum = $this->_request->getParam('loanaccNum'); //print_r($accNum[0]);
        $loanamount=$this->_request->getParam('loanpaid');
        $this->view->details = $this->view->loanModel->searchaccounts($loanaccNum);
        $this->view->paid = $this->view->loanModel->paid($loanaccNum);
        $this->view->unpaid = $this->view->loanModel->unpaid($loanaccNum);
        $instalments = $this->view->loanModel->loanInstalments($loanaccNum);

        $increment=0;
foreach($loanaccNum as $loanaccNum){
        if($loanaccNum){
        $data = array('date' => $date,
                'amount' => $loanamount[$increment],
                'paymentMode' =>1,
                'description' => $description,
                'accNum' => $loanaccNum,
                'transID' => $tranId);

  $this->view->details = $this->view->loanModel->searchaccounts($loanaccNum);

            foreach ($this->view->details as $details) 
            {
                $intType = $details->interesttype; // Intereset type  
            }
                switch ($intType) 
                    {
                        CASE 1:
                                $int = $this->view->loanModel->declain($data);
                                BREAK;
                        CASE 2:
                                $int = $this->view->loanModel->emi($data);
                                BREAK;
                        CASE 3:
                                BREAK;
                    }
        $array = $this->view->loanModel->insertTran($data);
}
$increment++;
} //end of the loan repayment

	   // for attendance log details
		$attendancelog = $this->view->adm->getRecord('ourbank_attendance','id',$attendance_id); 
		for ($j = 0 ; $j< count($attendancelog); $j++) { 
			$this->view->adm->addRecord("ourbank_attendance_log",$attendancelog[$j]);
		   }

	   // for member log details
		$memberlog=$fetchattendance->fetchmemberlog($attendance_id);
		for ($j = 0 ; $j< count($memberlog); $j++) { 
			$this->view->adm->addRecord("ourbank_memberattendance_log",$memberlog[$j]);
		   }

	   // for discussion log details
		$discussionlog=$fetchattendance->fetchdiscussionlog($attendance_id);
		for ($j = 0 ; $j< count($discussionlog); $j++) { 
			$this->view->adm->addRecord("ourbank_discussion_log",$discussionlog[$j]);
		   }

	   // for decision log details
		$decisionlog=$fetchattendance->fetchdecisionlog($attendance_id);
		for ($j = 0 ; $j< count($decisionlog); $j++) { 
			$this->view->adm->addRecord("ourbank_decision_log",$decisionlog[$j]);
		   }

	    //update record
            $fetchattendance->attendance($attendance_id);


            $updateAttendance=new Meetingbook_Model_Meetingbook();
            $member_id=array();
            $formData = $this->_request->getPost();
            $member_id=$this->_request->getPost('member_id');

                 $this->view->adm->updateRecord("ourbank_attendance",$attendance_id,
                                                array('id' => $attendance_id,
                                                'transaction_id'=>$tranId,
                                                'week_no'=>$this->view->weekno,
						'meeting_id' => $formData['meeting_name'],
						'meeting_date'=> $meeting_date,
						'notes'=> $formData['notes'],
                                                'time'=> $formData['meeting_time'],
                                                'resolution'=> $formData['resolution'],
                                           	'created_date'=>date("y/m/d H:i:s"),
						'created_by' => $this->view->createdby
                                            ));

$loop=$formData['length'];
//-------for absent fee and income  ---------
for($i=0; $i<$loop; $i++){
if(array_search_values( 'absent_'.$i, $formData)){
$absentees_id[]= array_search_values( 'absent_'.$i, $formData); 

}
}
for($i=0;$i<count($absentees_id);$i++){
 foreach ($absentees_id[$i] as $key => $value) {
//echo $key."<br>";
}

}
$abs1=($i)*$formData['absentfee'];
                    if($abs1){
                    $this->view->adm->addRecord("ourbank_Income", 
                                            array('Income_id' => '',
                                            'office_id' => $formData['officeid'],
                                            'glsubcode_id_from' => $formData['absentglsubcode'],
                                            'tranasction_id' => 1,
                                            'credit' => $abs1,
                                            'recordstatus_id'=>3));
                            }

for($i=0;$i<count($absentees_id);$i++){
 foreach ($absentees_id[$i] as $key => $value) {
                if($key) {
                 $this->view->adm->addRecord("ourbank_memberattendance",array('id' => '',
                                            'attendance_id'=>$attendance_id,
                                                'member_id'=>$key,
                                                'attendance_type'=>1,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
                    }
            }

}

//-------for late fee and income  ---------
for($j=0; $j<$loop; $j++){
if(array_search_values( 'late_'.$j, $formData)){
$latemember_id[]= array_search_values( 'late_'.$j, $formData); 
}
}
for($j=0;$j<count($latemember_id);$j++){
 foreach ($latemember_id[$j] as $key => $value) {
//echo $key."<br>";
}

}
$abs2=($j)*$formData['latefee'];
                        if($abs2){
                        $this->view->adm->addRecord("ourbank_Income", 
                                            array('Income_id' => '',
                                            'office_id' => $formData['officeid'],
                                            'glsubcode_id_from' => $formData['lateglsubcode'],
                                            'tranasction_id' => 1,
                                            'credit' => $abs2,
                                            'recordstatus_id'=>3));
                                }

for($j=0;$j<count($latemember_id);$j++){
 foreach ($latemember_id[$j] as $key => $value) {
                if($key) {
                 $this->view->adm->addRecord("ourbank_memberattendance",array('id' => '',
                                            'attendance_id'=>$attendance_id,
                                                'member_id'=>$key,
                                                'attendance_type'=>2,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
                        }
                }
}

		//insert discussion table
		 $discussion=$this->_request->getPost('discussionlist'); 
		 if($discussion) {
				foreach($discussion as $discussion1)
					 { 
                 $this->view->adm->addRecord("ourbank_discussion",array('id' => '',
                                            'attendance_id'=>$attendance_id,
						'discussion_id'=>$discussion1,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
			} }
		//insert decision table
		$decision=$this->_request->getPost('decisionlist'); 
		if($decision) {
				foreach($decision as $decision1)
					 { 
                 $this->view->adm->addRecord("ourbank_decision",array('id' => '',
                                            'attendance_id'=>$attendance_id,
						'decision_id'=>$decision1,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
			} } 


                $this->_redirect('meetingbookindex/index');
        }
    } else { 
            $this->view->result="<p style='color:red'>This Group Savings Account is closed<p>";
            }
        }
// 		} else {
// 		$this->_redirect('index/index');
// 		}
	}

	public function attendanceviewAction() {
	}

    public function attendancedeleteAction() 
    {
		//Acl
// 		$acl = new App_Model_Acl();
// 		$access = new App_Model_Access();
// 		$role = $access->getRole($this->view->id);
// 		
// 		$accessid = $access->accessRights('Attendance',$role,"attendanceeditAction");
// 		$checkaccess = $acl->isAllowed($role,'Attendance',$accessid);
// 		if(($role) && ($checkaccess != NULL)) {

		//delete
        $this->view->attendance_id=$attendance_id=$this->_request->getParam('attendance_id');
        $deleteForm=new App_Form_Delete();
        $this->view->deleteForm=$deleteForm;
        $fetchattendance=new Meetingbook_Model_Meetingbook();

        if($this->_request->getPost('Delete')) {
		$formData = $this->_request->getPost();

	   // for attendance log details
		$attendancelog = $this->view->adm->getRecord('ourbank_attendance','id',$attendance_id); 
		for ($j = 0 ; $j< count($attendancelog); $j++) { 
			$this->view->adm->addRecord("ourbank_attendance_log",$attendancelog[$j]);
		   }

	   // for member log details

			$memberlog=$fetchattendance->fetchmemberlog($attendance_id);
		for ($j = 0 ; $j< count($memberlog); $j++) { 
			$this->view->adm->addRecord("ourbank_memberattendance_log",$memberlog[$j]);
		   }

	   // for discussion log details
			$discussionlog=$fetchattendance->fetchdiscussionlog($attendance_id);
		for ($j = 0 ; $j< count($discussionlog); $j++) { 
			$this->view->adm->addRecord("ourbank_discussion_log",$discussionlog[$j]);
		   }

	   // for decision log details
			$decisionlog=$fetchattendance->fetchdecisionlog($attendance_id);
		for ($j = 0 ; $j< count($decisionlog); $j++) { 
			$this->view->adm->addRecord("ourbank_decision_log",$decisionlog[$j]);
		   }

                $this->view->adm->deleteRecord('ourbank_attendance',$attendance_id);
		$fetchattendance->deletememberattendance($attendance_id);
		$fetchattendance->deletediscussion($attendance_id);
		$fetchattendance->deletedecision($attendance_id);

                $this->_redirect('meetingbookindex/index');
        }
// 		} else {
// 		$this->_redirect('index/index');
// 		}
   }

    public function fetchmembersAction() 
    {
        $this->_helper->layout->disableLayout();
        $path = $this->view->baseUrl();
        $meeting_ID=$this->_request->getParam('meeting_ID');
        $fetchMembers=new Meetingbook_Model_Attend();
        $this->view->members=$aa=$fetchMembers->fetchMembers($meeting_ID); 
    }

    public function fetchmeetingAction() 
    {
        $this->_helper->layout->disableLayout();
        $path = $this->view->baseUrl();
        $meeting_ID=$this->_request->getParam('meeting_ID');
        $fetchMembers=new Meetingbook_Model_Attend();
        $this->view->members=$fetchMembers->fetchmeeting($meeting_ID); 
        $loanofficer=$fetchMembers->fetchloanofficer($meeting_ID); 
        if($loanofficer){ 
        $this->view->loanofficer=$loanofficer[0]['loanofficer']; }
        //fetch week no
 	$meetingweek=$fetchMembers->meetingweek($meeting_ID); 
        $this->view->meetingweek=$meetingweek[0]['weekno'];
    }


    public function fetchmemberseditAction() 
    {
        $this->_helper->layout->disableLayout();
        $path = $this->view->baseUrl();
	$fetchMembers=new Meetingbook_Model_Attend();
        $transID=$this->_request->getParam('transID');
            

    $this->view->savingsdetails=$this->view->savings->fetchsavingsdetails($transID); 
//     $this->view->loandetails=$this->view->savings->fetchloandetails($transID);
//         echo '<pre>'; print_r($this->view->savingsdetails);

        $this->view->members=$aa=$fetchMembers->fetchMembers($this->_request->getParam('meeting_ID')); 
        $check=array();
        $fetchMembersForAttendance=new Meetingbook_Model_Meetingbook();
        $fetchMembersForAttendance1=$fetchMembersForAttendance->assignMembers($this->_request->getParam('attendance_id')); 
        foreach($fetchMembersForAttendance1 as $fetchMembersForAttendance2){
            $check[]=$fetchMembersForAttendance2['member_id'].'_'.$fetchMembersForAttendance2['attendance_type'];
        }
        $this->view->val=$check;
    }

}
