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
class Kootadefault_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle = "koota";
        $test = new DH_ClassInfo(APPLICATION_PATH .'/modules/kootadefault/controllers/');// create instance to get controller name 
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
//         if (($this->view->globalvalue[0]['id'] == 0)) {
//                 $this->_redirect('index/logout');
//         }
        $this->view->adm = new App_Model_Adm(); // create instance for common adm model page
        $module = $test->getControllerClassNames();
        $modulename = explode("_", $module[0]);
        $this->view->modulename = strtolower($modulename[0]);
        $this->view->db = new Kootadefault_Model_Kootadefault();
        $this->view->dateconvertor = new App_Model_dateConvertor();
    }

    public function addkootaAction() 
    {
//         if($this->_request->getParam('error')) { // display error message for wrong head selection
// 			$error = $this->_request->getParam('error');
// 			if($error == 1 ) {
// 				$this->view->error = "Improper Group head selection ! ";
// 			}
//                         if($error == 2 ) {
// 				$this->view->error = "Chose single member in a family ! ";
// 			}
//         }
        $app = $this->view->baseUrl();
        $this->view->pageTitle = "koota";
        $addForm = new Kootadefault_Form_Kootadefault();
        $this->view->form=$addForm;
           $hierarchy = $this->view->db->getofficehierarchy();
               foreach($hierarchy as $hiearchyids){
             $hiearchyid = $hiearchyids['hierarchyid'];
            }

        $kootadetails = $this->view->adm->getRecord('ourbank_office','officetype_id',$hiearchyid);
        foreach($kootadetails as $kootadetail) { 
            $addForm->koota->addMultiOption($kootadetail['id'],$kootadetail['name']);
        }
//            $this->view->groups = $this->view->db->GetGroups();

        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
         $formdata = $this->_request->getPost();
            if($addForm->isValid($formdata)) {

Zend_Debug::dump($formdata);
                if($this->_request->getPost('member_id')) {
                    $members = $this->_request->getPost('member_id');
                    $kootaid = $this->view->adm->addRecord("ourbank_koota",
                                            array('koota_id' => $formdata['koota'],
                                                    'penalty_latecoming' => $formdata['penaltylate'],
                                                    'penalty_notcoming' => $formdata['penaltyabsence'],
                                                    'rateinterest' => $formdata['interest'],
                                                    'register_date' => $this->view->dateconvertor->mysqlformat($formdata['Created_Date']))); //Insert koota general details and get pk id
                        foreach($members as $memberids){
							$member = explode('_',$memberids);
                            $this->view->adm->addRecord("ourbank_kootamembers",array('id' =>'',
                                                                                'koota_id' =>$kootaid,
                                                                                'member_id' =>$member[1])); 
                        } //add koota members with its koota id                 
                } else {
                    echo "Chose members";
                }
                $kootarefid = $this->view->adm->getsingleRecord('ourbank_koota','koota_id','id',$kootaid);
                $this->_redirect('kootacommonview/index/commonview/id/'.$kootarefid);
            }
        }
    }

    public function getgroupAction(){
        $this->_helper->layout->disableLayout();

        $kootaid = $this->_getParam('kootaid');
        $groups = $this->view->db->getgroupsforkoota($kootaid);
        $this->view->groups = $groups;
    }
    public function editkootaAction()
    {
        // check group head , and members are correct 
//         if($this->_request->getParam('error')) { // display error message for wrong head selection
//             $error = $this->_request->getParam('error');
//             if($error == 1 ) {
//                     $this->view->error = "Improper Group head selection ! ";
//             }
//             if($error == 2 ) {
//                     $this->view->error = "Chose single member in a family ! ";
//             }
//         }
 
        $app = $this->view->baseUrl();
        $kootaid=$this->_getParam('id');
        $this->view->kootaid=$kootaid;
        $this->view->title = "Edit koota Details"; 
//         // create instance for form page with baseurl
        $addForm = new Kootadefault_Form_Kootadefault();
        $addForm->Submit->setLabel('Update');
        $this->view->form=$addForm;

        $hierarchy = $this->view->db->getofficehierarchy();
               foreach($hierarchy as $hiearchyids){
             $hiearchyid = $hiearchyids['hierarchyid'];
            }

        $kootadetails = $this->view->adm->getRecord('ourbank_office','officetype_id',$hiearchyid);
        foreach($kootadetails as $kootadetail) { 
            $addForm->koota->addMultiOption($kootadetail['id'],$kootadetail['name']);
        }
        $result = $this->view->db->getkoota($kootaid);
         // assign values with respective form fields
        foreach($result as $koota){
        $addForm->koota->setValue($koota['koota_id']);
        $addForm->penaltylate->setValue($koota['penalty_latecoming']);
        $addForm->penaltyabsence->setValue($koota['penalty_notcoming']);
        $addForm->interest->setValue($koota['rateinterest']);
        $addForm->dateedit->setValue($this->view->dateconvertor->phpnormalformat($koota['register_date']));
        }
        $addForm->dateedit->readonly = true;
        $Existmembers = array();
        $Availgroups=$this->view->db->assignGroups($kootaid); //get assigned groups
           $this->view->groups = $Availgroups;
        $Availmembers=$this->view->db->assignMembers($kootaid); //get assigned members
            foreach($Availmembers as $availmembers){
            $Existmembers[] = $availmembers['member_id'];
            }
           $this->view->Existmembers = $Existmembers;
        $Newgroups=$this->view->db->GetGroups(); //get rest groups
           $this->view->newgroups = $Newgroups;

            if ($this->_request->isPost() && $this->_request->getPost('Submit')) 
            {  
                $formdata = $this->_request->getPost();
                $members = $this->_request->getPost('members'); // get selected members
                $kootadetails = $this->view->adm->getRecord('ourbank_koota','koota_id',$kootaid); // get koota details for particular id
                foreach($kootadetails as $getid){
                $kootatableid = $getid['id'];
                }
            $this->view->adm->addRecord("ourbank_koota_log",$kootadetails[0]);  // add koota details to log table
            $this->view->adm->updateRecord("ourbank_koota",$kootatableid,
                                            array('koota_id' =>$formdata['koota'],
                                                    'penalty_latecoming' => $formdata['penaltylate'],
                                                    'penalty_notcoming' => $formdata['penaltyabsence'],
                                                    'rateinterest' => $formdata['interest'],
                                                    'register_date' => $this->view->dateconvertor->mysqlformat($formdata['Created_Date']))); // update the koota details
                $kootamemberdetails = $this->view->adm->getRecord('ourbank_kootamembers','koota_id',$kootatableid); // get kootamembers details for particular id
                foreach($kootamemberdetails as $kootamemberDetails){
                $this->view->adm->addRecord("ourbank_kootamembers_log",
                                            array('record_id' =>'',
                                                  'id' =>$kootamemberDetails['id'],
                                                  'koota_id' => $kootamemberDetails['koota_id'],
                                                  'member_id' => $kootamemberDetails['member_id']));
                 } // add koota members details to log table
                $this->view->adm->deleteRecordwithparam("ourbank_kootamembers","koota_id",$kootatableid);
                foreach($members as $memberids){
                            $this->view->adm->addRecord("ourbank_kootamembers",array('id' =>'',
                                                                                'koota_id' =>$kootatableid,
                                                                                'member_id' =>$memberids)); 
                        } //add koota members with its koota id
                $this->_redirect('kootacommonview/index/commonview/id/'.$kootaid);
                }
        }
 public function deletekootaAction()
    {
//        $checkaccess = $access->accessRights('Group',$this->view->globalvalue[0]['name'],'activitydeleteAction');
//        if (($checkaccess != NULL)) {

        $this->view->kootaid= $kootaid = $this->_request->getParam('id');
        $deleteForm = new Kootadefault_Form_Delete();
        $this->view->form=$deleteForm; 

        if ($this->_request->isPost() && $this->_request->getPost('Submit')){
         $formdata = $this->_request->getPost();
                if($deleteForm->isValid($formdata)) {
                    $kootadetails = $this->view->adm->getRecord('ourbank_koota','koota_id',$kootaid); // get koota details for particular id
                    foreach($kootadetails as $getid){
                    $kootatableid = $getid['id'];
                    }
                    $this->view->adm->addRecord("ourbank_koota_log",$kootadetails[0]);  // add koota details to log table
                  $this->view->adm->deleteRecordwithparam("ourbank_koota","id",$kootatableid);
                    $kootamemberdetails = $this->view->adm->getRecord('ourbank_kootamembers','koota_id',$kootatableid); // get kootamembers details for particular id
                  $this->view->adm->deleteRecordwithparam("ourbank_kootamembers","koota_id",$kootatableid);
                            foreach($kootamemberdetails as $kootamemberDetails){
                            $this->view->adm->addRecord("ourbank_kootamembers_log",
                                                        array('record_id' =>'',
                                                            'id' =>$kootamemberDetails['id'],
                                                            'koota_id' => $kootamemberDetails['koota_id'],
                                                            'member_id' => $kootamemberDetails['member_id']));
                            } // add koota members details to log table
                    $this->_redirect('koota/index');
                }
	}
    }
}
