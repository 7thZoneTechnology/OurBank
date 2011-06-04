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
?>

<?php
class Meetingbookcommonview_IndexController extends Zend_Controller_Action{

	public function init() {
		$this->view->pageTitle=$this->view->translate("Meeting book");

	 $globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];
				$storage = new Zend_Auth_Storage_Session();
        		$data = $storage->read();
        		if(!$data){
           		 $this->_redirect('index/login');
        			}
// 		if (($this->view->globalvalue[0]['id'] == 0)) {
// 			$this->_redirect('index/logout');
// 		}
		$this->view->adm = new App_Model_Adm();
		$this->view->dateconvert = new App_Model_dateConvertor();
	}

	public function indexAction() {
		//Acl
// 		$access = new App_Model_Access();
// 		$checkaccess = $access->accessRights('Attendance',$this->view->globalvalue[0]['name'],'attendanceaddAction');
// 		if (($checkaccess != NULL)) {

		//view
		$this->view->title = $this->view->translate("Meeting book");
		$path = $this->view->baseUrl();

		$this->view->attendance_id=$attendance_id=$this->_request->getParam('attendance_id');
		$this->view->week=$week=$this->_request->getParam('week');
		$this->view->transaction_id=$transaction_id=$this->_request->getParam('transID');
                $this->view->meetingweek=$week;
		$fetchattendance=new Meetingbookcommonview_Model_attendanceview();
		$this->view->fetchattendance=$fetchattendance1=$fetchattendance->fetchattendancedetailsforID($attendance_id,$week); 
                $meeting_ID=$fetchattendance1[0]['meeting_id'];
		foreach($fetchattendance1 as $fetchattendance1){$this->view->count1=10; }
		//fetch member absentees
		$this->view->absentees=$absentees=$fetchattendance->absentmembers($attendance_id); 

		//fetch late member 
		$this->view->latecomer=$latecomer=$fetchattendance->latemembers($attendance_id); 
		
		//fetch discussion 
		$this->view->attendancediscussion=$discussion=$fetchattendance->attendancediscussion($attendance_id);
		//fetch decision
		$this->view->attendancedecision=$decision=$fetchattendance->attendancedecision($attendance_id);

        $fetchMembers=new Meetingbook_Model_Attend();
	$this->view->fetchgroupid=$fetchMembers->fetchgroupid($meeting_ID); 
	$groupid= $meeting_ID; //$this->view->fetchgroupid[0]['group_id'];

        $meetingbook = new Meetingbookreport_Model_Meetingbook();
        $this->view->groupmembers=$meetingbook->fetchMembers($meeting_ID,$groupid); 
//         echo '<pre>'; print_r($this->view->groupmembers);

        $this->view->members=$fetchMembers->fetchmeeting($meeting_ID,$groupid); 
        $loanofficer=$fetchMembers->fetchloanofficer($groupid); 
        if($loanofficer){ 
        $this->view->loanofficer=$loanofficer[0]['loanofficer']; }

        $check=array();
        $fetchMembersForAttendance=new Meetingbook_Model_Meetingbook();
        $fetchMembersForAttendance1=$fetchMembersForAttendance->assignMembers($attendance_id); 
//         echo '<pre>';print_r($fetchMembersForAttendance1);
        foreach($fetchMembersForAttendance1 as $fetchMembersForAttendance2){
            $check[]=$fetchMembersForAttendance2['member_id'];
        }
        $this->view->val=$check;

// 		} else {
// 		$this->_redirect('index/index');
// 		}
	}
}

