<?php
class Loanscommonview_IndexController extends Zend_Controller_Action
{
    public function init()
    {
        $this->view->pageTitle='Loans';
        $sessionName = new Zend_Session_Namespace('ourbank');
        $this->view->createdby = $sessionName->primaryuserid;
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
        $this->view->title = "View Loan";

        $this->view->id = $offerproduct_id = (int)$this->_getParam('id');
        $loan = new Loans_Model_Loan();
        $result = $loan->viewLoanmy($offerproduct_id);
        $this->view->loan = $result;

        $offerproduct_id = $loan->getofferproductid($offerproduct_id);
        foreach($offerproduct_id as $offerproduct_id) {
                $offerproduct_id = $offerproduct_id['id'];
        }
        $interest = new Loans_Model_Loan();
        $result = $interest->viewLoan3($offerproduct_id);
        $this->view->interest = $result;
    }
}