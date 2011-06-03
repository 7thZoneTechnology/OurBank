<?php
class Memberldeatils_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
    	$this->view->title = "Reports";
	$this->view->pageTitle = "Loans ledger";
        $this->view->type = "generalFields";
        $this->view->loanModel = new Memberldeatils_Model_Memberldeatils();
        $this->view->cl = new App_Model_Users ();
        $this->view->adm = new App_Model_Adm ();
                $this->view->globalvalue = $this->view->cl->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];


	$storage = new Zend_Auth_Storage_Session();
        		$data = $storage->read();
        		if(!$data){
           		 $this->_redirect('index/login');
                        }	
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
	$this->view->details = $this->view->loanModel->searchaccounts($this->_request->getParam('accNum'));
	$this->view->tran = $this->view->loanModel->loanInstalments($this->_request->getParam('accNum'));
	$this->view->paid = $this->view->loanModel->paid($this->_request->getParam('accNum'));
	$this->view->unpaid = $this->view->loanModel->unpaid($this->_request->getParam('accNum'));
    }
}
