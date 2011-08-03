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
class Memberldeatils_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
    	$this->view->title = "Reports";
	$this->view->pageTitle = "Loans ledger";
        $this->view->type = "generalFields";
        $this->view->loanModel = new Memberldeatils_Model_Memberldeatils();
        $this->view->adm = new App_Model_Adm ();

        /* Initialize action controller here */
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data)
        {
            $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }
        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id
        $this->view->cl=new App_Model_Users();
        $loginname= $this->view->cl->username($userid);
        foreach($loginname as $loginname) 
        {
            $this->view->username=$loginname['username']; // get the user name
        }

    }

    public function indexAction() 
    {
	$loansearch = new Loandetailsg_Form_Search();
	$this->view->form = $loansearch;
	$loantransactions = new Loandisbursmentg_Model_loan();
    }

    public function loandetailsAction() 
    {
        $loansearch = new Loandetailsg_Form_Search();
        $this->view->form = $loansearch;
        $accnum = $this->_request->getParam('accNum');
        if ($accnum != '')
        {
            $this->view->details = $this->view->loanModel->searchaccounts($this->_request->getParam('accNum'));
            if ($this->view->details)
            {
                $this->view->tran = $this->view->loanModel->loanInstalments($this->_request->getParam('accNum'));
                $this->view->paid = $this->view->loanModel->paid($this->_request->getParam('accNum'));
                $this->view->unpaid = $this->view->loanModel->unpaid($this->_request->getParam('accNum'));
            }
            else
            {
                $this->view->error = "Record Not Found...Try again ";
            }
        }
        else
        {
            $this->view->error = "Value is required and can't be empty";
        }
    }
}
