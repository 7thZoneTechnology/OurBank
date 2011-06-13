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
class Groupprofile_IndexController extends Zend_Controller_Action 
{
    public function init()
    {
        $this->view->pageTitle = 'Group Profile';
        $this->view->title = 'Loan Process';
        $this->view->accounts = new Groupprofile_Model_Groupprofile();

        /* Initialize action controller here */
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data)
        {
            $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }
        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id
        $this->view->cl = new App_Model_Users ();
        $loginname= $this->view->cl->username($userid);
        foreach($loginname as $loginname) 
        {
            $this->view->username=$loginname['username']; // get the user name
        }

        $this->view->adm = new App_Model_Adm ();
        $finduser = $this->view->accounts->finduser($this->view->createdby);

    }
    public function indexAction()
    {
       $accountsForm = $this->view->form = new Loanprocess_Form_Search();
        if ($this->_request->isPost()) 
            {
            $formData = $this->_request->getPost();
            if ($accountsForm->isValid($formData)) 
                    {
                    $membercode = $this->_request->getParam('membercode');
                    if (substr($membercode,4,1) == 2 || substr($membercode,4,1) == 3) 
                        {
                            $this->view->group = $group = $this->view->accounts->group($membercode);
                            $this->view->groupDeatils = $this->view->accounts->groupDeatils($membercode);
                                $addForm = new Loanprocess_Form_Loanprocess(count($this->view->group));
                                $this->view->form=$addForm;
                                $this->view->membercode = $membercode;
                                $purpose = $this->view->adm->viewRecord("ourbank_master_loanpurpose","id","DESC");
                                for($i=1;$i<=count($this->view->group);$i++)
                                {
                                    $id = "purpose_id".$i;
                                    foreach($purpose as $purpose1) 
                                    {
                                        $addForm->$id->addMultiOption($purpose1['id'],$purpose1['name']);
                                    }
                                }
                        }
                        else
                        {
                           $this->view->error = "Record Not Found ... ";
                        }
                    }
             }
    }

}

