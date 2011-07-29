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
class Holiday_IndexController extends Zend_Controller_Action
{
	public function init() 
	{
		$this->view->pageTitle='Holiday';
      $storage = new Zend_Auth_Storage_Session();
       $data = $storage->read();
       if(!$data){
               $this->_redirect('index/login'); // once session get expired it will redirect to Login page
       }

       $sessionName = new Zend_Session_Namespace('ourbank');
       $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id

       $login=new App_Model_Users();
       $loginname=$login->username($userid);
       foreach($loginname as $loginname) {
           $this->view->username=$loginname['username']; // get the user name
       }
 
		$this->view->adm = new App_Model_Adm();
	}

	public function indexAction() 
	{
               
		$this->view->title = "Holiday";

	$searchForm = new Holiday_Form_Search();
       $this->view->form = $searchForm;
$officename = $this->view->adm->viewRecord("ourbank_officehierarchy","id","DESC");
			foreach($officename as $officename){
				$searchForm->s2->addMultiOption($officename['id'],$officename['type']);
			}
	$holiday = new Holiday_Model_Holiday();
// 
	if($_POST)
            $postedvalues = $this->view->adm->commonsearchquery($_REQUEST,1);
	else
	   $postedvalues = $this->view->adm->commonsearchquery($_REQUEST,2); 

   $result = $holiday->SearchHoliday($postedvalues);
		$this->view->holiday = $result;

        $page = $this->_getParam('page',1);
        $this->view->paginator = $this->view->adm->commonsearch($result,$page);
        $this->view->requestvalues=$this->view->adm->encodedvalue($postedvalues);

	}
	public function holidayaddAction() 
	{
//calling holiday form		
		$holidayForm = new Holiday_Form_Holiday();
		$this->view->form = $holidayForm;
//listing office names
$officename = $this->view->adm->viewRecord("ourbank_officehierarchy","id","DESC");
			foreach($officename as $officename){
				$holidayForm->office_id->addMultiOption($officename['id'],$officename['type']);
			}
//submit action
		if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
				$formData = $this->_request->getPost();
				if ($this->_request->isPost()) {
					if ($holidayForm->isValid($formData)) {
//getting the values from search form   			
$dateconvert= new App_Model_dateConvertor();

									 $formdata1=array('name'=>$formData['name'],
                                    					'office_id'=>$formData['office_id'],
                                    					'holiday_from'=>$dateconvert->mysqlformat($formData['holiday_from']),
                                    					'holiday_upto'=>$dateconvert->mysqlformat($formData['holiday_upto']),
                                    					'repayment_date'=>$dateconvert->mysqlformat($formData['repayment_date']),
                                    					'created_by'=>$this->view->createdby
														);		

					$id = $this->view->adm->addRecord("ourbank_holiday",$formdata1);
						$this->_redirect('/holiday');
				}
			}
		}
		
	}
	
	public function holidayeditAction() 
	{
//calling the holiday form
			$holidayForm = new Holiday_Form_Holiday();
			$this->view->form = $holidayForm;
//getting id
			$id=$this->_getParam('id');
			$this->view->id = $id;
// calling holiday model
			$holiday = new Holiday_Model_Holiday;
//listing office names
			$officename = $this->view->adm->viewRecord("ourbank_officehierarchy","id","DESC");
			foreach($officename as $officename){
				$holidayForm->office_id->addMultiOption($officename['id'],$officename['type']);
			}
//displaying the values to edit
        	$result = $holiday->getHoliday($id);
   			$dateconvert= new App_Model_dateConvertor();
			foreach($result as $holidaydetails) {
				$this->view->form->name->setValue($holidaydetails['name']);
				$this->view->form->office_id->setValue($holidaydetails['office_id']);
				$this->view->form->holiday_from->setValue($dateconvert->normalformat($holidaydetails['holiday_from']));
				$this->view->form->holiday_upto->setValue($dateconvert->normalformat($holidaydetails['holiday_upto']));
				$this->view->form->repayment_date->setValue($dateconvert->normalformat($holidaydetails['repayment_date']));

		}
//update action					
        if ($this->_request->isPost() && $this->_request->getPost('Update')) {
	    if ($this->_request->isPost()) {
		$formData = $this->_request->getPost();
		if ($holidayForm->isValid($formData)) {
//update and edit
			$formdata1=array('name'=>$formData['name'],
			'office_id'=>$formData['office_id'],
			'holiday_from'=>$dateconvert->mysqlformat($formData['holiday_from']),
			'holiday_upto'=> $dateconvert->mysqlformat($formData['holiday_upto']),
			'repayment_date'=> $dateconvert->mysqlformat($formData['repayment_date']),
			'created_by'=>$this->view->createdby);			


  					$previousdata = $this->view->adm->editRecord("ourbank_holiday",$id);
					$this->view->adm->updateLog("ourbank_holiday_log",$previousdata[0],$this->view->createdby);
					//update 					
					$this->view->adm->updateRecord("ourbank_holiday",$id,$formdata1);
					$this->_redirect("/holiday");

}
				}
 			}
    }
	public function holidayviewAction() 
	{
		//Acl
        $id=$this->_request->getParam('id');
			$holiday = new Holiday_Model_Holiday;
			$this->view->holidaydetails=$holiday->getHoliday($id);
	}	
	public function holidaydeleteAction() 
	{
//calling the delete form
 		$delform = new Category_Form_Delete();
		$this->view->deleteform = $delform;
//getting the id
		$id = $this->_getParam('id');
		$this->view->id = $id;
//calling holiday model
		$holiday = new Holiday_Model_Holiday;
		$this->view->holidaydetails=$holiday->getHoliday($id);
//Delete action

		if($this->_request->isPost() && $this->_request->getPost('Delete')) {
			$formdata = $this->_request->getPost();
				if ($delform->isValid($formdata)) { 
       $redirect = $this->view->adm->deleteRecord("ourbank_holiday",$id);
					//update
            $this->_redirect('/holiday');
			
		}}
	}
}
