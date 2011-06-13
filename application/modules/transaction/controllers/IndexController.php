<?php
class Transaction_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
	$this->view->title = "Transaction";
        $this->view->pageTitle='Transaction';
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
        $transaction = new Transaction_Model_Transaction();
        $this->view->tran  = $transaction->transactionByDate();

    }
}

