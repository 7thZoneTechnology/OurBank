<?php
class Loandetailsg_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
    	$this->view->title = "Loans";
	$this->view->pageTitle = "Loans details";
	$this->view->type='loans';
	$globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
        $this->view->loanModel = new Loandetailsg_Model_loandetails();
        $this->view->cl = new App_Model_Users ();
        $this->view->adm = new App_Model_Adm ();
    }

    public function indexAction() 
    {
	$loansearch = new Loandetailsg_Form_Search();
	$this->view->form = $loansearch;
	$loantransactions = new Loandisbursmentg_Model_loan();
        $errormsg=$this->_request->getParam('msg');
        if($errormsg==1)
        {
            echo "<font color='red'>Invalid account number</font>"; 
        }
    }

    public function loandetailsAction() 
    {
	$this->view->details = $this->view->loanModel->searchaccounts($this->_request->getParam('accNum'));
        if($this->view->details){
	$this->view->instalments = $this->view->loanModel->loanInstalments($this->_request->getParam('accNum'));
	$this->view->paid = $this->view->loanModel->paid($this->_request->getParam('accNum'));
	$this->view->unpaid = $this->view->loanModel->unpaid($this->_request->getParam('accNum'));
        }
        else {
             $this->_redirect("/loandetailsg/index/index/msg/1");
        }
    }
}
