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
class Incomedetails_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
//it is create session and implement ACL concept...
        $this->view->pageTitle=$this->view->translate('Income details');
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
        $this->view->familycommon = new Familycommonview_Model_familycommonview();
    }

    public function indexAction() 
    {
    }

//add family health add action
    public function addAction() 
    {

        $this->view->title = $this->view->translate("Add Income details");
        $this->view->memberid=$member_id=$this->_getParam('id');
        $this->view->membername = $this->view->familycommon->getfamily($member_id);
        $this->view->insurance=$this->view->familycommon->getinsurance($member_id);

	$this->view->submoduleid =$moduleid= $this->_getParam('subId');
	//count number of family members
        $family_model=new incomedetails_Model_incomedetails();
        $this->view->income_details=$count_loan = $family_model->editIncometypes();
        $this->view->number=$number=count($count_loan);
	//load form with respective to number of family member
        $addForm = new incomedetails_Form_incomedetails($number);
        $this->view->form=$addForm;
	//set the value of member name and sex
	
        foreach($count_loan as $count_loan1){
            $b='source_id'.$count_loan1['id'];
          $addForm->$b->setValue($count_loan1['id']);
         }

	//insert the family health details 
        if ($this->_request->isPost() && $this->_request->getPost('submit')) 
        {
            $flag = false;
            $formData = $this->_request->getPost();
            if($addForm->isValid($formData)){
            $moduleid= $this->_getParam('subid');
                for($i=1;$i<=$number;$i++)
                {	if($this->_request->getParam('incomeamount'.$i)){
                    $flag = true;
                    $this->view->adm->addRecord("ourbank_incomedetails",array('id' => '',
                                                'member_id'=>$member_id,
                                                'submodule_id'=>$moduleid ,
                                                'income_id'=>$this->_request->getParam('source_id'.$i),
                                                'value' => $this->_request->getParam('incomeamount'.$i),
                                                'created_date'=>date("y/m/d H:i:s"),
                                                'created_by'=>$this->view->createdby
                                                ));
                    }
                }
             if($flag == true){
                $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
            } else {
                $this->view->error = '"There is no proper Income detail"  - Click Back button to cancel';
                }
            } 
        }
    }

//edit family health details
    public function editAction() 
    {

	$moduleid= $this->_getParam('subId');
        $this->view->title = $this->view->translate("Edit Income Details");
        $this->view->memberid=$member_id=$this->_getParam('id');
        $this->view->membername = $this->view->familycommon->getfamily($this->_getParam('id'));
        $this->view->insurance=$this->view->familycommon->getinsurance($this->_getParam('id'));

	$this->view->submoduleid =$moduleid= $this->_getParam('subId');
	//count number of family members
        $family_model=new incomedetails_Model_incomedetails();
        $this->view->income_details=$count_income = $family_model->editIncometypes();
        $this->view->number=$number=count($count_income);
	//load form with respective to number of family member
        $addForm = new incomedetails_Form_incomedetails($number);
        $this->view->form=$addForm;
	//set the value of member name and sex

        
        foreach($count_income as $count_income1){
            
            $b='source_id'.$count_income1['id'];
            $addForm->$b->setValue($count_income1['id']);
            
         }
        

	// // //set the value of expense...
        $this->view->incomedetails=$detailsdetails = $family_model->getIncomedetails($member_id); 
        $i=1;
        foreach($detailsdetails as $detailsdetails1){ 
        $c='incomeamount'.$detailsdetails1['income_id'];
        //$d='source_id'.$i;
        $addForm->$c->setValue($detailsdetails1['value']);
       // $addForm->$d->setValue($detailsdetails1['income_id']);
        $i++;
        }

	//update the family health details...
        if ($this->_request->isPost() && $this->_request->getPost('update')) 
        {
            $flag = false;
            $formData = $this->_request->getPost();
            if($addForm->isValid($formData)){
		$moduleid= $this->_getParam('subid');  
 		$expensedb = new Incomedetails_Model_Incomedetails ();
            $editExpense = $expensedb->getIncomedetails($member_id);
            for ($j = 0 ; $j< count($editExpense); $j++) {
                $this->view->adm->addRecord("ourbank_incomedetails_log",$editExpense[$j]);
            }

            $expensedb->deleteincome($member_id);


	    for($i=1;$i<=$number;$i++)
            {	

                if($this->_request->getParam('incomeamount'.$i)){
                $this->view->adm->addRecord("ourbank_incomedetails",array('id' => '',
                                            'member_id'=>$member_id,
                                            'submodule_id'=>$moduleid ,
                                            'income_id'=>$this->_request->getParam('source_id'.$i),
                                            'value' => $this->_request->getParam('incomeamount'.$i),
                                            'created_date'=>date("y/m/d H:i:s"),
                                            'created_by'=>$this->view->createdby
                                            ));
		}
		}
                          $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
		}
            }
        }
	
}
