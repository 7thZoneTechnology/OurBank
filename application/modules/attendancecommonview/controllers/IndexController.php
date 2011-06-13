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
class Attendancecommonview_IndexController extends Zend_Controller_Action{

	public function init() 
        {
		$this->view->pageTitle=$this->view->translate("Attendance");

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
	}

	public function indexAction() {
		//Acl
// 		$access = new App_Model_Access();
// 		$checkaccess = $access->accessRights('Attendance',$this->view->globalvalue[0]['name'],'attendanceaddAction');
// 		if (($checkaccess != NULL)) {

		//view
		$this->view->title = $this->view->translate("Attendance");
		$path = $this->view->baseUrl();

		$this->view->attendance_id=$attendance_id=$this->_request->getParam('attendance_id');
		$this->view->week=$week=$this->_request->getParam('week');
		$fetchattendance=new Attendancecommonview_Model_attendanceview();
		$this->view->fetchattendance=$fetchattendance1=$fetchattendance->fetchattendancedetailsforID($attendance_id,$week);  
		foreach($fetchattendance1 as $fetchattendance1){$this->view->count1=10; }
		//fetch member absentees
		$this->view->absentees=$absentees=$fetchattendance->absentmembers($attendance_id); 
		
		//fetch discussion 
		$this->view->attendancediscussion=$discussion=$fetchattendance->attendancediscussion($attendance_id);
		//fetch decision
		$this->view->attendancedecision=$decision=$fetchattendance->attendancedecision($attendance_id);

// 		} else {
// 		$this->_redirect('index/index');
// 		}
	}
}

