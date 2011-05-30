<?php
class Transaction_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
	$this->view->title = "Transaction";
        $this->view->pageTitle='Transaction';
    }

    public function indexAction() 
    {
        $transaction = new Transaction_Model_Transaction();
        $this->view->tran  = $transaction->transactionByDate();

    }
}

