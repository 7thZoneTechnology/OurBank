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
class Dropdown_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle='Drop Down Settings';
		$this->view->adm = new App_Model_Adm();   	
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
}
  public function newtableAction() 
    {
		$addform=new Dropdown_Form_Dropdown();
        $this->view->form=$addform;

		if ($this->_request->isPost() && $this->_request->getPost('Create')) {
		$tablename=$this->_request->getParam('name');
		$description=$this->_request->getParam('description');

		if ((!$tablename) or (!$description)) {echo "Please enter the table name and description";} else {
		$settings = new Dropdown_Model_Dropdown;
		$table=$settings->Createtable($tablename);	
		$formdata1=array('id'=>'',
						'name'=>$tablename,
						'descriptions'=>$description);
		$id = $this->view->adm->addRecord('ourbank_master_mastertables',$formdata1);
		$this->_redirect('/dropdown');
		}


	}

}
    public function indexAction() 
    {
        $path =  $this->view->baseUrl();

        $addform=new Dropdown_Form_Drop($path);
        $this->view->form=$addform;
		$this->view->title = "Drop Down";
		//echo $tableName;
		$mastertable = $this->view->adm->viewRecord("ourbank_master_mastertables","id","DESC");
		foreach($mastertable as $mastertable) {
				$addform->name->addMultiOption($mastertable['name'],$mastertable['descriptions']);
			}		

}
public function nameAction()
{


        $app = $this->view->baseUrl();
        $this->_helper->layout->disableLayout();
        $tablename = $this->_request->getParam('names');
        $this->view->tableName = $tablename;
        $tabledata = new Dropdown_Model_Dropdown();
        $tabledatas = $tabledata->tabledata($tablename);
// Zend_Debug::dump($tabledatas);
        $this->view->tabledata = $tabledatas;
        }

public function addAction() 
    {
 $path = $this->view->baseUrl();
$dropdownForm = new Dropdown_Form_Settings($path);
        $this->view->form = $dropdownForm;
$tName=$this->_request->getParam('name');

 		$id=$this->_request->getParam('id');
		$this->view->tableName =$tName;
		$this->view->id =$id;
        $dropdown = new Dropdown_Model_Dropdown();
		$statename = $this->view->adm->viewRecord("ourbank_master_state","id","DESC");
		foreach($statename as $statename){
				$dropdownForm->state->addMultiOption($statename['id'],$statename['name']);
			}
		$districtname = $this->view->adm->viewRecord("ourbank_master_districtlist","id","DESC");
		foreach($districtname as $districtname){
				$dropdownForm->district->addMultiOption($districtname['id'],$districtname['name']);
			}
		$taluklist = $this->view->adm->viewRecord("ourbank_master_taluklist","id","DESC");
		foreach($taluklist as $taluklist){
				$dropdownForm->taluk->addMultiOption($taluklist['id'],$taluklist['name']);
			}
		$gillapanchayath = $this->view->adm->viewRecord("ourbank_master_gillapanchayath","id","DESC");
		foreach($gillapanchayath as $gillapanchayath){
				$dropdownForm->gillapanchayath->addMultiOption($gillapanchayath['id'],$gillapanchayath['name']);
			}
		$village = $this->view->adm->viewRecord("ourbank_master_villagelist","id","DESC");
		foreach($village as $village){
				$dropdownForm->village->addMultiOption($village['id'],$village['name']);
			}
		$bank = $this->view->adm->viewRecord("ourbank_master_bank","id","DESC");
		foreach($bank as $bank){
				$dropdownForm->bank->addMultiOption($bank['id'],$bank['name']);
			}
		if ($this->_request->isPost() && $this->_request->getPost('Save')) {
			if($tName == 'ourbank_master_districtlist') {
 		$id=$this->_request->getParam('state');
 		$common=$this->_request->getParam('commonname');

									$formdata1=array('id'=>'',
									'state_id'=>$id,
									'name'=>$common);
						$id = $this->view->adm->addRecord($tName,$formdata1);
 			$this->_redirect('/dropdown');
}
	if($tName == 'ourbank_master_hoblilist') {
 		$id=$this->_request->getParam('taluk');
 		$common=$this->_request->getParam('commonname');

									$formdata1=array('id'=>'',
									'taluk_id'=>$id,
									'name'=>$common);
						$id = $this->view->adm->addRecord($tName,$formdata1);
 			$this->_redirect('/dropdown');


}
		if($tName == 'ourbank_master_villagelist') {
 		$id=$this->_request->getParam('gillapanchayath');
 		$common=$this->_request->getParam('commonname');

									$formdata1=array('id'=>'',
									'gp_id'=>$id,
									'name'=>$common);
						$id = $this->view->adm->addRecord($tName,$formdata1);
 			$this->_redirect('/dropdown');


}
if($tName == 'ourbank_master_taluklist') {
 		$id=$this->_request->getParam('district');
 		$common=$this->_request->getParam('commonname');

									$formdata1=array('id'=>'',
									'district_id'=>$id,
									'name'=>$common);
						$id = $this->view->adm->addRecord($tName,$formdata1);
 			$this->_redirect('/dropdown');


}
	if($tName == 'ourbank_master_gillapanchayath') {
 		$id=$this->_request->getParam('hobli');
 		$common=$this->_request->getParam('commonname');

									$formdata1=array('id'=>'',
									'hobli_id'=>$id,
									'name'=>$common);
						$id = $this->view->adm->addRecord($tName,$formdata1);
 			$this->_redirect('/dropdown');


}

if($tName == 'ourbank_master_branch') {
 		$id=$this->_request->getParam('bank');
 		$common=$this->_request->getParam('commonname');

									$formdata1=array('id'=>'',
									'bank_id'=>$id,
									'created_by'=>$this->view->createdby,
									'name'=>$common);
						$id = $this->view->adm->addRecord($tName,$formdata1);
 			$this->_redirect('/dropdown');


}
if($tName == 'ourbank_master_habitation') {
 		$village=$this->_request->getParam('village');
 		$common=$this->_request->getParam('commonname');

									$formdata1=array('id'=>'',
									'village_id'=>$village,
									'created_by'=>$this->view->createdby,
									'name'=>$common);
						$id = $this->view->adm->addRecord($tName,$formdata1);
 			$this->_redirect('/dropdown');

}
if($tName == 'ourbank_master_mastertables') {
 		$description=$this->_request->getParam('description');
 		$commonname=$this->_request->getParam('commonname');
 		
									$formdata1=array('id'=>'',
									'descriptions'=>$description,
									'name'=>$commonname);
						$id = $this->view->adm->addRecord($tName,$formdata1);
$settings = new Dropdown_Model_Dropdown;
		$table=$settings->Createtable($commonname);

 			$this->_redirect('/dropdown');


}
 		$commonname=$this->_request->getParam('commonname');

									$formdata1=array('id'=>'',
									'name'=>$commonname);
						$id = $this->view->adm->addRecord($tName,$formdata1);
 			$this->_redirect('/dropdown');

}

	}
 public function commonviewAction() 
    {
		$tName=$this->_request->getParam('name');
 		$id=$this->_request->getParam('id');
		$settings = new Dropdown_Model_Dropdown;
		$this->view->details=$settings->getdetails($tName,$id);
		$this->view->tableName =$tName;
		$this->view->id = $id;
	}
public function editAction() 
    {
  			$tName=$this->_request->getParam('name');
			$this->view->tableName = $tName;

			$id=$this->_request->getParam('id');
		    $this->view->id = $id;
			$settings = new Dropdown_Model_Dropdown;

 		$path = $this->view->baseUrl();
 		$dropdownForm = new Dropdown_Form_Settings($path);
        $this->view->form = $dropdownForm;
// //   	$tName=$this->_request->getParam('name');
// // 		$this->view->tableName =$tName;
 		if ($this->_request->isPost() && $this->_request->getPost('Update')) 
			{
	    		 $Name=$this->_request->getParam('commonname');

   				$tName=$this->_request->getParam('name');
				if ($Name=='') {
						 echo "value cant be empty"; 
				} else {
							$id=$this->_request->getParam('id');

  							$Name=$this->_request->getParam('commonname');
 							$formdata1=array('name'=>$Name);		
//Zend_Debug::dump($dropdownForm->getValues());
  							$previousdata = $this->view->adm->editRecord($tName,$id);
							$this->view->adm->updateRecord($tName,$id,$formdata1);
							$this->_redirect('/dropdown');
				}
		} else {
// // 			$dropdownForm = new Dropdown_Form_Settings($path);
// //        		 $this->view->form = $dropdownForm;
 			$statename = $this->view->adm->viewRecord("ourbank_master_state","id","DESC");
		foreach($statename as $statename){
				$dropdownForm->state->addMultiOption($statename['id'],$statename['name']);
			}
		$districtname = $this->view->adm->viewRecord("ourbank_master_districtlist","id","DESC");
		foreach($districtname as $districtname){
				$dropdownForm->district->addMultiOption($districtname['id'],$districtname['name']);
			}
		$taluklist = $this->view->adm->viewRecord("ourbank_master_taluklist","id","DESC");
		foreach($taluklist as $taluklist){
				$dropdownForm->taluk->addMultiOption($taluklist['id'],$taluklist['name']);
			}
	
		$hobli = $this->view->adm->viewRecord("ourbank_master_hoblilist","id","DESC");
		foreach($hobli as $hobli){
				$dropdownForm->hobli->addMultiOption($hobli['id'],$hobli['name']);
			}
		$gillapanchayath = $this->view->adm->viewRecord("ourbank_master_gillapanchayath","id","DESC");
		foreach($gillapanchayath as $gillapanchayath){
				$dropdownForm->gillapanchayath->addMultiOption($gillapanchayath['id'],$gillapanchayath['name']);
			}
		$village = $this->view->adm->viewRecord("ourbank_master_villagelist","id","DESC");
		foreach($village as $village){
				$dropdownForm->village->addMultiOption($village['id'],$village['name']);
			}
		$bank = $this->view->adm->viewRecord("ourbank_master_bank","id","DESC");
		foreach($bank as $bank){
				$dropdownForm->bank->addMultiOption($bank['id'],$bank['name']);
			}

			$id=$this->_request->getParam('id');
			$tName=$this->_request->getParam('name');
			$this->view->ff = $tName; 
			 $namedetails = $settings->getdetails($tName,$id);

				switch($tName){
					case 'ourbank_master_gillapanchayath': {
						foreach($namedetails as $holidaydetails) {
			            $this->view->form->commonname->setValue($holidaydetails['habit']);
						$this->view->form->hobli->setValue($holidaydetails['hobli_id']);
						$this->view->form->taluk->setValue($holidaydetails['taluk_id']);
						$this->view->form->district->setValue($holidaydetails['district_id']);
						$this->view->form->state->setValue($holidaydetails['state_id']);
						}
					}break;
					case 'ourbank_master_habitation': {
						foreach($namedetails as $holidaydetails) {
			            $this->view->form->commonname->setValue($holidaydetails['habit']);
						$this->view->form->village->setValue($holidaydetails['village_id']);
						$this->view->form->gillapanchayath->setValue($holidaydetails['gp_id']);
						$this->view->form->hobli->setValue($holidaydetails['hobli_id']);
						$this->view->form->taluk->setValue($holidaydetails['taluk_id']);
						$this->view->form->district->setValue($holidaydetails['district_id']);
						$this->view->form->state->setValue($holidaydetails['state_id']);
						}
					}break;
					case 'ourbank_master_villagelist': {
						foreach($namedetails as $holidaydetails) {
			            $this->view->form->commonname->setValue($holidaydetails['habit']);
						$this->view->form->gillapanchayath->setValue($holidaydetails['gp_id']);
						$this->view->form->hobli->setValue($holidaydetails['hobli_id']);
						$this->view->form->taluk->setValue($holidaydetails['taluk_id']);
						$this->view->form->district->setValue($holidaydetails['district_id']);
						$this->view->form->state->setValue($holidaydetails['state_id']);
						}
					}break;
					case 'ourbank_master_hoblilist': {
					foreach($namedetails as $holidaydetails) {
						$this->view->form->commonname->setValue($holidaydetails['habit']);
						$this->view->form->taluk->setValue($holidaydetails['taluk_id']);
						$this->view->form->district->setValue($holidaydetails['district_id']);
						$this->view->form->state->setValue($holidaydetails['state_id']);
															}
										}break;
					case 'ourbank_master_taluklist': {
					foreach($namedetails as $holidaydetails) {
						$this->view->form->commonname->setValue($holidaydetails['habit']);
						$this->view->form->district->setValue($holidaydetails['district_id']);
						$this->view->form->state->setValue($holidaydetails['state_id']);
															}
										}break;
					case 'ourbank_master_districtlist': {
					foreach($namedetails as $holidaydetails) {
						$this->view->form->commonname->setValue($holidaydetails['habit']);
						$this->view->form->state->setValue($holidaydetails['state_id']);
															}
										}break;
					case 'ourbank_master_branch': {
					foreach($namedetails as $holidaydetails) {
						$this->view->form->commonname->setValue($holidaydetails['habit']);
						$this->view->form->bank->setValue($holidaydetails['accounttype_id']);
															}
										}break;
					case 'ourbank_master_mastertables': {
					foreach($namedetails as $holidaydetails) {
						$this->view->form->commonname->setValue($holidaydetails['habit']);
						$this->view->form->description->setValue($holidaydetails['descriptions']);
															}
										}break;
									}
					foreach($namedetails as $holidaydetails) {
						$this->view->form->commonname->setValue($holidaydetails['habit']); }
				}
 }
public function deleteAction() 

    {
		$dropdownForm = new Dropdown_Form_Delete();
        $this->view->form = $dropdownForm;
 		$id=$this->_request->getParam('id');
		$this->view->id = $id;
		$tName=$this->_request->getParam('name');
		$this->view->ff = $tName;
		if($this->_request->isPost() && $this->_request->getPost('Delete')) {
			$formdata = $this->_request->getPost();
			if ($dropdownForm->isValid($formdata)) { 
 				$id=$this->_request->getParam('id');
				$this->view->id = $id;
				$tName=$this->_request->getParam('name');
				$this->view->ff = $tName;
				//deleting  record
       			$redirect = $this->view->adm->deleteRecord($tName,$id);
				//update
            	$this->_redirect('/dropdown');

			}
		}
	}
    public function districtAction() {
        $path = $this->view->baseUrl();
        $this->_helper->layout()->disableLayout();
		$dropdownForm = new Dropdown_Form_Settings($path);
        $this->view->form = $dropdownForm;
     	$state=$this->_request->getParam('state');
        $getdistrict = new Dropdown_Model_Dropdown();
        $district=$getdistrict->district($state);
 		foreach($district as $eacharraysent) {
        $dropdownForm->district->addMultiOption($eacharraysent['id'],$eacharraysent['name']);
        }
}

    public function talukAction() {
        $path = $this->view->baseUrl();
        $this->_helper->layout()->disableLayout();
		$dropdownForm = new Dropdown_Form_Settings($path);
        $this->view->form = $dropdownForm;
     	$district=$this->_request->getParam('district');
        $gettaluk = new Dropdown_Model_Dropdown();
        $taluk=$gettaluk->taluk($district);
 		foreach($taluk as $eacharraysents) { 
        $dropdownForm->taluk->addMultiOption($eacharraysents['id'],$eacharraysents['name']);
        }
}
		public function hobliAction() {
        $path = $this->view->baseUrl();
        $this->_helper->layout()->disableLayout();
		$dropdownForm = new Dropdown_Form_Settings($path);
        $this->view->form = $dropdownForm;
     	$taluk=$this->_request->getParam('taluk');
        $gethobli = new Dropdown_Model_Dropdown();
        $hobli=$gethobli->hobli($taluk);
 		foreach($hobli as $eacharraysent) {
        $dropdownForm->hobli->addMultiOption($eacharraysent['id'],$eacharraysent['name']);
        }}

		public function gillapanchayathAction() {
        $path = $this->view->baseUrl();
        $this->_helper->layout()->disableLayout();
		$dropdownForm = new Dropdown_Form_Settings($path);
        $this->view->form = $dropdownForm;
     	$hobli=$this->_request->getParam('hobli');
        $getgillapanchayath = new Dropdown_Model_Dropdown();
        $gillapanchayath=$getgillapanchayath->gillapanchayath($hobli);
 		foreach($gillapanchayath as $eacharraysent) {
        $dropdownForm->gillapanchayath->addMultiOption($eacharraysent['id'],$eacharraysent['name']);
        }}
		public function villageAction() {
        $path = $this->view->baseUrl();
        $this->_helper->layout()->disableLayout();
		$dropdownForm = new Dropdown_Form_Settings($path);
        $this->view->form = $dropdownForm;
     	$gillapanchayath=$this->_request->getParam('gillapanchayath');
        $getvillage = new Dropdown_Model_Dropdown();
        $village=$getvillage->village($gillapanchayath);
 		foreach($village as $eacharraysent) {
        $dropdownForm->village->addMultiOption($eacharraysent['id'],$eacharraysent['name']);
        }
	}

}
