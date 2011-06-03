<?php
class Maintenance_DayendController extends Zend_Controller_Action
{
    public function init()
    {
        $this->view->pageTitle = "Day end";
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }
// 	$sessionName = new Zend_Session_Namespace('ourbank');
// 	$this->view->createdby = $sessionName->primaryuserid;
	$this->_flashMessenger = $this->_helper->getHelper('FlashMessenger');
    }
    public function indexAction()
    {
        $this->view->title = "Day end";
        $transaction = new Maintenance_Model_Dayend();
        $this->view->paginator = $transaction->transactionByDate();
        if ($this->_request->getPost('DayEndProcess')) {
            $totalVoucher = $this->_request->getPost('totalVNo');
            for($i = 1; $i<=$totalVoucher; $i++) {
                $inputData = array('recordstatus_id' => 1,
                                'confirmation_flag' => 1);
                $transaction->transactionUpdate($this->_request->getPost('VoucherNo'.$i),$inputData);
                //$vResult = $transaction->transactionVoucher($this->_request->getPost('VoucherNo'.$i));

            }
        $this->_redirect('/maintenance/dayend');
        }
    }
}
