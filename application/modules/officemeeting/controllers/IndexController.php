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
class Officemeeting_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle='Office meetings';
       $globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];
				$storage = new Zend_Auth_Storage_Session();
        		$data = $storage->read();
        		if(!$data){
           		 $this->_redirect('index/login');
        			}
//         if (($this->view->globalvalue[0]['id'] == 0)) {
//             $this->_redirect('index/logout');
//         }
        $this->view->adm = new App_Model_Adm();
        $this->view->dateconvert = new App_Model_dateConvertor();

        $test = new DH_ClassInfo(APPLICATION_PATH . '/modules/meetingindex/controllers/');
        $module = $test->getControllerClassNames();
        $modulename = explode("_", $module[0]);
        $this->view->modulename = strtolower($modulename[0]);
    }

    public function indexAction()
    {
        $this->view->pageTitle='Office meetings';
    }

    public function meetingaddAction()  
    { 
        //Acl
        // 		$access = new App_Model_Access();
        // 		$checkaccess = $access->accessRights('Institution',$this->view->globalvalue[0]['name'],'addinstitutionAction');
        // 		if (($checkaccess != NULL)) {
        //add
        $path = $this->view->baseUrl();
        $this->view->title = "New Meeting";
        $this->view->pageTitle='Office meetings';

        $meetingForm = new Officemeeting_Form_Meeting($path);
        $this->view->meetingForm = $meetingForm;
        $meeting = new Officemeeting_Model_Meeting();

        //load office names in the drop down list box
        $office = new Officemeeting_Model_Meeting();
        $officelevel = $this->view->adm->viewRecord("ourbank_officehierarchy","id","ASC");
        foreach($officelevel as $officelevel1){
        $meetingForm->institute_bank_id->addMultiOption($officelevel1['id'],$officelevel1['type']);
        }

        $frequency = $this->view->adm->viewRecord("ourbank_master_frequencypayment","id","ASC");
        foreach($frequency as $frequency1) {
            $meetingForm->meeting_day->addMultiOption($frequency1['id'],$frequency1['name']);
        }

        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
            $formData = $this->_request->getPost();
            if ($meetingForm->isValid($formData)) { print_r($formData);

                $formdata1=array('name'=>$formData['meeting_name'],
                                    'officelevel'=>$formData['institute_bank_id'],
                                    'office_id'=>$formData['group_name'],
                                    'place'=>$formData['meeting_place'],
                                    'frequency'=>$formData['meeting_day'],
                                    'created_by'=>$this->view->createdby);

                $id = $this->view->adm->addRecord("ourbank_officemeeting",$formdata1);
                $this->_redirect('/officemeetingindex');
                }
        }
// 		} else {
// 		$this->_redirect('index/index');
// 		}
        }

    public function meetingeditAction()
    {
//Acl
//$access = new App_Model_Access();
//$checkaccess = $access->accessRights('Institution',$this->view->globalvalue[0]['name'],'addinstitutionAction');
//if (($checkaccess != NULL)) {
//edit
        $this->view->pageTitle='Office meetings';
        $path = $this->view->baseUrl();
        $this->view->title = "Edit Meeting";
        $this->view->meeting_id=$meeting_id = $this->_getParam('meeting_id');
        $meetingForm = new Officemeeting_Form_Meeting($path);
        $this->view->meetingForm = $meetingForm;
        $meeting = new Officemeeting_Model_Meeting();

        //load office names in the drop down list box
        $office = new Officemeeting_Model_Meeting();
        $officelevel = $this->view->adm->viewRecord("ourbank_officehierarchy","id","ASC");
        foreach($officelevel as $officelevel1){
        $meetingForm->institute_bank_id->addMultiOption($officelevel1['id'],$officelevel1['type']);
        }

        $days = $this->view->adm->viewRecord("ourbank_master_frequencypayment","id","ASC");
        foreach($days as $days) {
            $meetingForm->meeting_day->addMultiOption($days['id'],$days['name']);
        }
        $fetchMeetingDetails=$meeting->fetchMeetingdetailsForID($meeting_id);

        $officeleveid=$fetchMeetingDetails[0]['officelevel'];
        $officenames=$office->fetchofficenames($officeleveid);
        foreach($officenames as $officenames) {
            $meetingForm->group_name->addMultiOption($officenames['id'],$officenames['name']);
        }
        foreach($fetchMeetingDetails as $meetings) {
            $this->view->meetingForm->meeting_name->setValue($meetings['name']);
            $this->view->meetingForm->institute_bank_id->setValue($meetings['officelevel']);
            $this->view->meetingForm->group_name->setValue($meetings['office_id']);
            $this->view->meetingForm->meeting_place->setValue($meetings['place']);
            $this->view->meetingForm->meeting_day->setValue($meetings['wid']);
            $formdata2=array('id'=>$meetings['id'],'name'=>$meetings['name'],
                    'officelevel'=>$meetings['officelevel'],
                    'office_id'=>$meetings['office_id'],
                    'place'=>$meetings['place'],
                    'frequency'=>$meetings['wid'],
                    'created_by'=>$this->view->createdby);

        }

        $meetingForm->meeting_name->removeValidator('Db_NoRecordExists');

        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
            $id = $this->_getParam('meeting_id');
            $formData = $this->_request->getPost();
            $this->view->meeting_id=$meeting_id = $this->_getParam('meeting_id');
            if ($meetingForm->isValid($formData)) {
                $formdata1=array('name'=>$formData['meeting_name'],
                                    'officelevel'=>$formData['institute_bank_id'],
                                    'office_id'=>$formData['group_name'],
                                    'place'=>$formData['meeting_place'],
                                    'frequency'=>$formData['meeting_day'],
                                    'created_by'=>$this->view->createdby);
               $this->view->adm->updateLog("ourbank_officemeeting_log",$formdata2,$this->view->createdby);
                //update 					
                $this->view->adm->updateRecord("ourbank_officemeeting",$id,$formdata1);
               $this->_redirect('/officemeetingcommonview/index/index/meeting_id/'.$id);
            }
        }
// 		} else {
// 		$this->_redirect('index/index');
// 		}
    }

    public function meetingviewAction() {
    }

    public function meetingdeleteAction() {
        $this->view->pageTitle='Office meetings';
//Acl
// 		$access = new App_Model_Access();
// 		$checkaccess = $access->accessRights('Institution',$this->view->globalvalue[0]['name'],'addinstitutionAction');
// 		if (($checkaccess != NULL)) {

        $this->view->id=$meeting_id = $this->_getParam('meeting_id');
        $deleteForm=new App_Form_Delete();
        $this->view->deleteForm=$deleteForm;
        if($this->_request->isPost() && $this->_request->getPost('Delete')) {
            $formdata = $this->_request->getPost();
            if($deleteForm->isValid($formdata)) {
                $redirect = $this->view->adm->deleteAction("ourbank_officemeeting",$this->view->modulename,$this->view->id);
                $this->_redirect("/".$redirect);
            }
        }

// 		} else {
// 		$this->_redirect('index/index');
// 		}
    }

    public function fetchofficeAction()
    {
        $this->_helper->layout->disableLayout();

        $path = $this->view->baseUrl();
        $meetingForm = new Meeting_Form_Meeting($path);
        $this->view->meetingForm = $meetingForm;
        $officeID=$this->_request->getParam('officeID');

        $meeting = new Officemeeting_Model_Meeting();
        $office=$meeting->fetchofficenames($officeID);

        foreach($office as $office) {
            $meetingForm->group_name->addMultiOption($office['id'],$office['name']);
        }
    }

}
