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
class Loandetails_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        //it is create session and implement ACL concept...
        $this->view->pageTitle=$this->view->translate('Family loan details');
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();/*
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];*/
        $sessionName = new Zend_Session_Namespace('ourbank');
        $this->view->createdby = $sessionName->primaryuserid;
//         if (($this->view->globalvalue[0]['id'] == 0)) {
//             $this->_redirect('index/logout');
//         }
        $this->view->adm = new App_Model_Adm();
        $this->view->familycommon = new Familycommonview_Model_familycommonview();

    }

    public function indexAction() 
    {
    }

    //add family health add action
    public function addAction() 
    {
        $this->view->title = $this->view->translate("Add loan details");
        $this->view->memberid=$member_id=$this->_getParam('id');
        $this->view->membernames = $this->view->familycommon->getfamily($member_id);
        $this->view->insurance=$this->view->familycommon->getinsurance($member_id);
        //count number of family members
        $family_model=new Loandetails_Model_loandetails();
        $this->view->loanDetails=$count_loan = $family_model->edit_loantypes();
        //load form with respective to number of family member
        $addForm = new Loandetails_Form_loandetails();
        $this->view->form=$addForm;
        //set the value of member name and sex
        $this->view->familymember = $this->view->adm->getRecord("ourbank_familymember","family_id",$this->view->memberid);

        $this->view->purpose = $this->view->adm->viewRecord("ourbank_master_loanpurpose","id","DESC");
       
        //insert the family health details 
        if ($this->_request->isPost() && $this->_request->getPost('submit')) 
        {
            $formData = $this->_request->getPost();
            if($addForm->isValid($formData)){

                    $source=$this->_getParam('source');
                    $member=$this->_getParam('member');
                    $loan=$this->_getParam('loan');
                    $interest=$this->_getParam('interest');
                    $outstanding=$this->_getParam('outstanding');
                    $purpose=$this->_getParam('purpose');
                    $deposit=$this->_getParam('savingamount');
                    $count=count($source);

            for($i = 0; $i< $count; $i++) 
            {
                $loandetails = array('source_id' => $source[$i],
                                    'member_id' => $member[$i],
                                    'loanamount' => $loan[$i],
                                    'interest'=>$interest[$i],
                                    'outstanding_amount' => $outstanding[$i],
                                    'purpose_id' => $purpose[$i],
                                    'deposit' => $deposit[$i],
                                   );
               $lastid=$this->view->adm->addRecord("ourbank_loandetails",$loandetails);

            }
             $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
             }
        }
    }

    //edit family health details
    public function editAction() 
    {
        $this->view->title = $this->view->translate("Edit health information");
        $this->view->memberid=$member_id=$this->_getParam('id');
        $this->view->membernames = $this->view->familycommon->getfamily($member_id);
        $this->view->insurance=$this->view->familycommon->getinsurance($member_id);
        //count number of family members
        $family_model=new Loandetails_Model_loandetails();
        $this->view->loanDetails=$count_loan = $family_model->edit_loantypes();

        //load form with respective to number of family member
        $addForm = new Loandetails_Form_loandetails();
        $this->view->form=$addForm;
        //set the value of member name and sex
        $this->view->familymember = $this->view->adm->getRecord("ourbank_familymember","family_id",$this->view->memberid);

        $this->view->purpose = $this->view->adm->viewRecord("ourbank_master_loanpurpose","id","DESC");
        
        //set the value of health problem and other drop down box...
        $this->view->loandetails=$loandetails = $family_model->get_loandetails(); 

        foreach($loandetails as $loandetails1){
        $recordarray[]=$loandetails1['id'];
        }

        //update the family health details...
        if ($this->_request->isPost() && $this->_request->getPost('update')) 
        {
            $formData = $this->_request->getPost();  
            //update the family health is already exiting...
            if($addForm->isValid($formData)){
                    $source=$this->_getParam('source');
                    $member=$this->_getParam('member');
                    $loan=$this->_getParam('loan');
                    $interest=$this->_getParam('interest');
                    $outstanding=$this->_getParam('outstanding');
                    $purpose=$this->_getParam('purpose');
                    $deposit=$this->_getParam('savingamount');
                    $recordid=$this->_getParam('recordid');
                    $count=count($source);

            for($i = 0; $i< $count; $i++) 
            {
             if($recordid[$i]!="") {
                $loandetails = array('source_id' => $source[$i],
                                    'member_id' => $member[$i],
                                    'loanamount' => $loan[$i],
                                    'interest'=>$interest[$i],
                                    'outstanding_amount' => $outstanding[$i],
                                    'purpose_id' => $purpose[$i],
                                    'deposit' => $deposit[$i],
                                   );
               $family_model->update($recordid[$i],$loandetails);
            }
// check the i value with Exist members value to add new members 
            else
            {
                $loandetails = array('source_id' => $source[$i],
                                    'member_id' => $member[$i],
                                    'loanamount' => $loan[$i],
                                    'interest'=>$interest[$i],
                                    'outstanding_amount' => $outstanding[$i],
                                    'purpose_id' => $purpose[$i],
                                    'deposit' => $deposit[$i],
                                   );
               $lastid=$this->view->adm->addRecord("ourbank_loandetails",$loandetails);
            }
            }
            $deletearray=array_diff($recordarray,$recordid);
            foreach($deletearray as $deltearr){
            $family_model->deleteFamily($deltearr);
            }
            }

           $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
	} 
    }
}
