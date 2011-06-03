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
        $this->view->number=$number=count($count_loan);
        //load form with respective to number of family member
        $addForm = new Loandetails_Form_loandetails($number);
        $this->view->form=$addForm;
        //set the value of member name and sex
        foreach($count_loan as $count_loan1)
        {
            $b='source_id'.$count_loan1['id'];
            $addForm->$b->setValue($count_loan1['id']);
         
         }
        $intType = $this->view->adm->getRecord("ourbank_familymember","family_id",$this->view->memberid);
        for($j=1;$j<=$number;$j++)
        {   $int = "memberId".$j;
            foreach($intType as $intType1){ 
            $addForm->$int->addMultiOption($intType1['id'],$intType1['name']);
            }
        }
        $purpose = $this->view->adm->viewRecord("ourbank_master_loanpurpose","id","DESC");
        for($i=1;$i<=$number;$i++)
        {   $health_id = "purpose".$i;
            foreach($purpose as $purpose1){ 
            $addForm->$health_id->addMultiOption($purpose1['id'],$purpose1['name']);
            }
        }
        //insert the family health details 
        if ($this->_request->isPost() && $this->_request->getPost('submit')) 
        {
            $formData = $this->_request->getPost();
            if($addForm->isValid($formData)){

            for($i=1;$i<=$number;$i++)
            {	
                if ($this->_request->getParam('loanamount'.$i)) {
                    $this->view->adm->addRecord("ourbank_loandetails",array('id' => '',
                                                'family_id' => $this->_request->getParam('id'),
					        'member_id'=>$this->_request->getParam('memberId'.$i),
						'source_id'=>$this->_request->getParam('source_id'.$i),
						'interest'=>$this->_request->getParam('interest'.$i),
						'loanamount' => $this->_request->getParam('loanamount'.$i),
						'purpose_id'=>$this->_request->getParam('purpose'.$i),
						'outstanding_amount' => $this->_request->getParam('outstanding'.$i),
						'deposit' => $this->_request->getParam('deposit'.$i),
						'created_by'=>$this->view->createdby)); 
		}
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
        $this->view->loan_details=$count_loan = $family_model->edit_loantypes();
        $this->view->number=$number=count($count_loan);
        //load form with respective to number of family member
        $addForm = new Loandetails_Form_loandetails($number);
        $this->view->form=$addForm;
        //set the value of member name and sex
        foreach($count_loan as $count_loan1)
        {
            $b='source_id'.$count_loan1['id'];
            $addForm->$b->setValue($count_loan1['id']);
        }
        $intType = $this->view->adm->getRecord("ourbank_familymember","family_id",$this->view->memberid);
        for($j=1;$j<=$number;$j++)
        {   $int = "memberId".$j;
            foreach($intType as $intType1){ 
            $addForm->$int->addMultiOption($intType1['id'],$intType1['name']);
            }
        }
	$purpose = $this->view->adm->viewRecord("ourbank_master_loanpurpose","id","DESC");
        for($i=1;$i<=$number;$i++)
        {   $health_id = "purpose".$i;
            foreach($purpose as $purpose1){ 
            $addForm->$health_id->addMultiOption($purpose1['id'],$purpose1['name']);
            }
        }
        
        //set the value of health problem and other drop down box...
        $this->view->loandetails=$loandetails = $family_model->get_loandetails($member_id); 
        $i=1;
        foreach ($loandetails as $loandetails1) { 
            $c='loanamount'.$loandetails1['source_id'];
            $j = 'interest'.$loandetails1['source_id'];
            $d='purpose'.$loandetails1['source_id'];
            $g='outstanding'.$loandetails1['source_id'];
            $h='record_id'.$loandetails1['source_id'];
            $k='deposit'.$loandetails1['source_id'];
            $addForm->$c->setValue($loandetails1['loanamount']);
            $addForm->$j->setValue($loandetails1['interest']);
            $addForm->$d->setValue($loandetails1['purpose_id']);
            $addForm->$g->setValue($loandetails1['outstanding_amount']);
            $addForm->$h->setValue($loandetails1['id']);
            $addForm->$k->setValue($loandetails1['deposit']);

            $i++;
        }
        //update the family health details...
        if ($this->_request->isPost() && $this->_request->getPost('update')) 
        {
            $formData = $this->_request->getPost();  
            //update the family health is already exiting...
            if($addForm->isValid($formData)){

            for($i=1;$i<=$number;$i++)
            {
                $loan_id=$this->_request->getParam('record_id'.$i);
                if ($this->_request->getParam('record_id'.$i)) {
                    $family_model->update($loan_id,array(
                                           'family_id'=>$member_id,
       					        'member_id'=>$this->_request->getParam('memberId'.$i),
						'source_id'=>$this->_request->getParam('source_id'.$i),
						'interest'=>$this->_request->getParam('interest'.$i),
						'loanamount' => $this->_request->getParam('loanamount'.$i),
						'purpose_id'=>$this->_request->getParam('purpose'.$i),
						'outstanding_amount' => $this->_request->getParam('outstanding'.$i),
						'deposit' => $this->_request->getParam('deposit'.$i),
						'created_by'=>$this->view->createdby));  
                }
	    }
	    for($i=1; $i<=$number; $i++)
            {
                if (!$this->_request->getParam('record_id'.$i) && $this->_request->getParam('loanamount'.$i)) {
		       $this->view->adm->addRecord("ourbank_loandetails",array('id' => '',
					        'family_id'=>$member_id,
						'source_id'=>$this->_request->getParam('source_id'.$i),
						'interest_id'=>$this->_request->getParam('interest'.$i),
						'loanamount' => $this->_request->getParam('loanamount'.$i),
						'purpose_id'=>$this->_request->getParam('purpose'.$i),
						'outstanding_amount' => $this->_request->getParam('outstanding'.$i),
						'deposit' => $this->_request->getParam('deposit'.$i),
						'created_by'=>$this->view->createdby));  
		}
	   }
           $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
	} }
    }
}
