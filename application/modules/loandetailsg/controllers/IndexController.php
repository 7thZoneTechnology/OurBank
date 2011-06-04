<?php
class Loandetailsg_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
    	$this->view->title = "Loans";
	$this->view->pageTitle = "Loans details";
	$this->view->type='loans';
<<<<<<< HEAD
	$globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }
=======
>>>>>>> c2b297ec8e2d968919cf910ee2d7a8b50b342452
        $this->view->loanModel = new Loandetailsg_Model_loandetails();
        $this->view->cl = new App_Model_Users ();
        $this->view->adm = new App_Model_Adm ();
        
         $globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];
 
                $storage = new Zend_Auth_Storage_Session();
                $data = $storage->read();
                if(!$data){
                 $this->_redirect('index/login');
                 }
    }

    public function indexAction() 
    {
	$loansearch = new Loandetailsg_Form_Search();
	$this->view->form = $loansearch;
	$loantransactions = new Loandisbursmentg_Model_loan();
<<<<<<< HEAD
        $errormsg=$this->_request->getParam('msg');
        if($errormsg==1)
        {
            echo "<font color='red'>Invalid account number</font>"; 
        }
        if($errormsg==2)
        {
            echo "<font color='red'>Value is required and can't be empty</font>";
        }
    }

    public function loandetailsAction() 
    {   $accNum=$this->_request->getParam('accNum');
	$this->view->details = $details=$this->view->loanModel->searchaccounts($this->_request->getParam('accNum'));
	foreach($this->view->details as $interest){
		$this->view->intesttype=$interest->interesttype;
	}
        if($this->view->details){
=======
    }

    public function loandetailsAction() 
    {
	$this->view->details = $this->view->loanModel->searchaccounts($this->_request->getParam('accNum'));
>>>>>>> c2b297ec8e2d968919cf910ee2d7a8b50b342452
	$this->view->instalments = $this->view->loanModel->loanInstalments($this->_request->getParam('accNum'));
	$this->view->paid = $this->view->loanModel->paid($this->_request->getParam('accNum'));
	$this->view->declainedpaid= $this->view->loanModel->declainedpaid($this->_request->getParam('accNum'));
	$this->view->unpaid = $this->view->loanModel->unpaid($this->_request->getParam('accNum'));
<<<<<<< HEAD
        }
        else {
            if(!$accNum)
                { $errorno=2; }
                else 
                {   $errorno=1; }
                $this->_redirect("/loandetailsg/index/index/msg/".$errorno);
        }
=======
>>>>>>> c2b297ec8e2d968919cf910ee2d7a8b50b342452
    }
}
