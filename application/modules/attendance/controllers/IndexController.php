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
class Attendance_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->pageTitle = $this->view->translate("Attendance");

        /* Initialize action controller here */
        $storage = new Zend_Auth_Storage_Session();
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
        }

        $this->view->adm = new App_Model_Adm();
        $this->view->dateconvert = new App_Model_dateConvertor();

        $test = new DH_ClassInfo(APPLICATION_PATH . '/modules/attendanceindex/controllers/');
        $module = $test->getControllerClassNames();
        $modulename = explode("_", $module[0]);
        $this->view->modulename = strtolower($modulename[0]);
    }

    public function indexAction() 
    {
    }

    public function attendanceaddAction() 
    {
		//Acl
// 		$access = new App_Model_Access();
// 		$checkaccess = $access->accessRights('Attendance',$this->view->globalvalue[0]['name'],'attendanceaddAction');
// 		if (($checkaccess != NULL)) {

		//add
        $path = $this->view->baseUrl();
        $attendanceform=new Attendance_Form_Attendance($path);
        $this->view->attendanceform=$attendanceform;
        $flag=1;

        //dropdown meeting list
        $meeting = $this->view->adm->viewRecord("ourbank_meeting","id","DESC"); //echo '<pre>'; print_r($meeting);
        foreach($meeting as $meeting1){ 
            $attendanceform->meeting_name->addMultiOption($meeting1['id'],$meeting1['name']);
        }
//         //dropdown weekdays
//         $days = $this->view->adm->viewRecord("ourbank_master_weekdays","id","ASC");
//         foreach($days as $days) {
//             $attendanceform->meeting_day->addMultiOption($days['id'],$days['name']);
//         }

        $insertattendance=new Attendance_Model_Attendance();
       // $Meeting_id_From_attendance=$insertattendance->fetchMeetingIDforComparision();

	//listing discussion dropdown
        $this->view->discussionlist=$insertattendance->discussionlist();
        $this->view->decissionlist=$insertattendance->decissionlist();
	//echo '<pre>'; print_r($discussionlist);  


        if ($this->_request->isPost() && $this->_request->getPost('Submit')) 
        {
            $formData = $this->_request->getPost();  //echo '<pre>'; print_r($formData);
            if ($attendanceform->isValid($formData))
            { 
                $insertattendance=new Attendance_Model_Attendance();
                $member_id=array();
                $formData = $this->_request->getPost(); 
                $member_id=$this->_request->getPost('member_id');
        	$convertdate = new App_Model_dateConvertor();
		$meeting_date=$convertdate->phpmysqlformat($formData['meeting_date']);
		//insert attendance details
               $maxid1=$insertattendance->fetchmaxid($formData['meeting_name']); 
                  if($maxid1[0]['meetingno']=="") { $maxid='1'; 
                        } else { $maxid=$maxid1[0]['meetingno'];  }
                 $attendance_id=$this->view->adm->addRecord("ourbank_attendance",array('id' => '',
                                                'week_no'=>$maxid,
						'meeting_id' => $formData['meeting_name'],
						'meeting_date'=> $meeting_date,
						'notes'=> $formData['notes'],
                                                'time'=> $formData['meeting_time'],
                                                'resolution'=> $formData['resolution'],
                                                'created_date'=>date("y/m/d H:i:s"),
						'created_by' => $this->view->createdby
                                            ));

		//insert member details to table
		 $memberid=$this->_request->getPost('member_id'); 
		 if($memberid) {
				foreach($memberid as $memberid1)
					 { 
                 $this->view->adm->addRecord("ourbank_memberattendance",array('id' => '',
                                            'attendance_id'=>$attendance_id,
						'member_id'=>$memberid1,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
			} }

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
                $this->_redirect('attendanceindex/index');
            } 
        }
// 		} else {
// 		$this->_redirect('index/index');
// 		}
    }

    public function attendanceeditAction() 
    {
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
        $attendanceform=new Attendance_Form_Attendance($path);
        $this->view->attendanceform=$attendanceform;

        $this->view->attendance_id=$attendance_id=$this->_request->getParam('attendance_id');

        $meeting = new Meeting_Model_Meeting();
        $result = $meeting->fetchAllmeetingdetails(); 

        $convertdate = new App_Model_dateConvertor();//Object for date convertor

        $fetchattendance=new Attendance_Model_Attendance();

	//listing discussion dropdown
        $this->view->discussionlist=$fetchattendance->discussionlist();
        $this->view->decissionlist=$fetchattendance->decissionlist();

	//dropdown
	//$this->view->editdiscussion=$this->view->adm->viewRecord("ourbank_discussion",$attendance_id,'asc');

	$this->view->editdiscussion=$fetchattendance->getdiscussion($attendance_id);
	$this->view->editdecision=$fetchattendance->getdecision($attendance_id);

        $memberattendance=$fetchattendance->fetchmemberttendance($attendance_id); //print_r($memberattendance);
        if($memberattendance){
        $fetchattendance1=$fetchattendance->fetchattendancedetailsforID($attendance_id);  //echo '<pre>'; print_r($fetchattendance1); 
        } else {
        $fetchattendance1=$fetchattendance->fetchattendancedetailsforID1($attendance_id);  //echo '<pre>';
        }

        //foreach($fetchattendance1 as $fetchattendance2) { $getMemberID[]=$fetchattendance2['member_id'];}

        $meeting = $this->view->adm->viewRecord("ourbank_meeting","id","DESC"); //echo '<pre>'; print_r($meeting);
        foreach($meeting as $meeting1){ 
            $attendanceform->meeting_name->addMultiOption($meeting1['id'],$meeting1['name']);
        }

        foreach($fetchattendance1 as $fetchattendance1) {
            foreach($result as $result) {
                if($result['id'] == $fetchattendance1['meeting_id']){
            $attendanceform->meeting_name->addMultiOption($result['id'],$result['name']);}
        }

        //dropdown weekdays
//         $days = $this->view->adm->viewRecord("ourbank_master_weekdays","id","ASC");
//         foreach($days as $days) {
//             $attendanceform->meeting_day->addMultiOption($days['id'],$days['name']);
//         }
            //attendance details

            $this->view->attendanceform->resolution->setValue($fetchattendance1['resolution']);
            $this->view->attendanceform->meeting_name->setValue($fetchattendance1['meeting_id']);

            $this->view->attendanceform->meeting_time->setValue($fetchattendance1['attendancetime']); 
//echo $fetchattendance1['day'];
            $this->view->attendanceform->meeting_date->setValue($convertdate->phpnormalformat($fetchattendance1['meeting_date']));
	    $this->view->attendanceform->notes->setValue($fetchattendance1['notes']);
        }
        //Fetches all the memberes in that group of particular meeting ID
        echo "<script>getMembers(".$fetchattendance1['meeting_id'].",'".$path."',".$attendance_id.");</script>";
        echo "<script>getMeeting(".$fetchattendance1['meeting_id'].",'".$path."',".$attendance_id.");</script>";

	//update
        if($this->_request->isPost() && $this->_request->getPost('Update')) {
            $attendance_id=$this->_request->getParam('attendance_id');

                $member_id=array();
                $formData = $this->_request->getPost(); 
                $member_id=$this->_request->getPost('member_id');
        	$convertdate = new App_Model_dateConvertor();
		$meeting_date=$convertdate->phpmysqlformat($formData['meeting_date']);

	   // for attendance log details
		$attendancelog = $this->view->adm->getRecord('ourbank_attendance','id',$attendance_id); 
		for ($j = 0 ; $j< count($attendancelog); $j++) { 
			$this->view->adm->addRecord("ourbank_attendance_log",$attendancelog[$j]);
		   }

	   // for member log details

			$memberlog=$fetchattendance->fetchmemberlog($attendance_id);
		for ($j = 0 ; $j< count($memberlog); $j++) { //echo '<pre>'; print_r($memberlog[$j]);
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


            $updateAttendance=new Attendance_Model_Attendance();

            $member_id=array();
            $formData = $this->_request->getPost();
            $member_id=$this->_request->getPost('member_id'); //echo '<pre>'; print_r($formData);



      /*      if($member_id) {
                for($aa=0;$aa<sizeof($member_id);$aa++) {
                    $updateAttendance->insertattendance($formData,$member_id[$aa],$attendance_id,$this->view->createdby);
                }
            } else {
            $updateAttendance->insertattendance($formData,'0',$attendance_id,$this->view->createdby);
            } */
               $maxid1=$updateAttendance->fetchmaxid($formData['meeting_name']); 
                  if($maxid1[0]['meetingno']=="") { $maxid='1'; 
                        } else { $maxid=$maxid1[0]['meetingno'];  }

		//insert attendance details
                 $attendance_id=$this->view->adm->addRecord("ourbank_attendance",array('id' => '',
						'meeting_id' => $formData['meeting_name'],
                                            'week_no'=>$maxid,
						'meeting_date'=> $meeting_date,
						'notes'=> $formData['notes'],
                                                'time'=> $formData['meeting_time'],
                                                'resolution'=> $formData['resolution'],
                                           	'created_date'=>date("y/m/d H:i:s"),
						'created_by' => $this->view->createdby
                                            ));

		 $memberid=$this->_request->getPost('member_id'); 
		 if($memberid) {
				foreach($memberid as $memberid1)
					 { 
                 $this->view->adm->addRecord("ourbank_memberattendance",array('id' => '',
                                            'attendance_id'=>$attendance_id,
						'member_id'=>$memberid1,
                                            'created_date'=>date("y/m/d H:i:s")
                                            ));
			} }

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


                $this->_redirect('attendanceindex/index');
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
        $fetchattendance=new Attendance_Model_Attendance();

        if($this->_request->getPost('Delete')) {
		$formData = $this->_request->getPost();

	   // for attendance log details
		$attendancelog = $this->view->adm->getRecord('ourbank_attendance','id',$attendance_id); 
		for ($j = 0 ; $j< count($attendancelog); $j++) { 
			$this->view->adm->addRecord("ourbank_attendance_log",$attendancelog[$j]);
		   }

	   // for member log details

			$memberlog=$fetchattendance->fetchmemberlog($attendance_id);
		for ($j = 0 ; $j< count($memberlog); $j++) { //echo '<pre>'; print_r($memberlog[$j]);
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

//                 $formData = $this->_request->getPost();
//                 $attendance_details1=$this->view->adm->editrecord('ourbank_attendance',$attendance_id);
//                 echo "<pre>";print_r($attendance_details1);
//                 foreach($attendance_details1 as $attendance_details) {
//                     $this->view->adm->addRecord('ourbank_attendance_log',$attendance_details);

                $this->view->adm->deleteRecord('ourbank_attendance',$attendance_id);
		$fetchattendance->deletememberattendance($attendance_id);
		$fetchattendance->deletediscussion($attendance_id);
		$fetchattendance->deletedecision($attendance_id);

                $this->_redirect('attendanceindex/index');
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
        $fetchMembers=new Attendance_Model_Attend();
	$this->view->fetchgroupid=$groupid1=$fetchMembers->fetchgroupid($meeting_ID);
	$groupid= $groupid1[0]['group_id']; //echo '<pre>'; print_r($groupid);

        $this->view->members=$aa=$fetchMembers->fetchMembers($meeting_ID,$groupid); 
    }

    public function fetchmeetingAction() 
    {
        $this->_helper->layout->disableLayout();
        $path = $this->view->baseUrl();
        $meeting_ID=$this->_request->getParam('meeting_ID');
        $fetchMembers=new Attendance_Model_Attend();
	$this->view->fetchgroupid=$groupid1=$fetchMembers->fetchgroupid($meeting_ID);
	$groupid= $groupid1[0]['group_id']; //echo '<pre>'; print_r($groupid);

        $this->view->members=$aa=$fetchMembers->fetchMembers($meeting_ID,$groupid); 
    }


    public function fetchmemberseditAction() 
    {
        $this->_helper->layout->disableLayout();
        $path = $this->view->baseUrl();
        $meeting_ID=$this->_request->getParam('meeting_ID'); 
        $attendance_id=$this->_request->getParam('attendance_id'); 

	$fetchMembers=new Attendance_Model_Attend();
	$this->view->fetchgroupid=$groupid1=$fetchMembers->fetchgroupid($meeting_ID);
	$groupid= $groupid1[0]['group_id']; //echo '<pre>'; print_r($groupid);

        $this->view->members=$aa=$fetchMembers->fetchMembers($meeting_ID,$groupid);
        $check=array();
        $fetchMembersForAttendance=new Attendance_Model_Attendance();
        $fetchMembersForAttendance1=$fetchMembersForAttendance->assignMembers($attendance_id); //print_r($fetchMembersForAttendance1);
        foreach($fetchMembersForAttendance1 as $fetchMembersForAttendance2){
            $check[]=$fetchMembersForAttendance2['member_id'];
        }
        $this->view->val=$check;
    }

}
