<?php
class Amounttransfer_IndexController extends Zend_Controller_Action {
    public function init() {
       $this->view->pageTitle='Transaction';
        $this->view->adm = new App_Model_Adm();

    }

    public function indexAction() {
            $form = new Transaction_Form_Membersearch();
            $this->view->form = $form;
    }

    public function transferAction() {
        $form = new Transaction_Form_Membersearch();
        $this->view->form = $form;

	if ($this->_request->isPost() && $this->_request->getPost('Search')) {
	    $formData = $this->_request->getPost();
            if ($this->_request->isPost()) {
     		$formData = $this->_request->getPost();
		if ($form->isValid($formData)) {
                    $accountNumber= $this->_request->getParam('member_id');
                    $savings = new Amounttransfer_Model_Amounttransfer();
                    $this->view->savingDetails = $savings->searchpersnolsavings($accountNumber);
                    if ($this->view->savingDetails) 
                    {
                        foreach($this->view->savingDetails as $savingDetails) 
                        {
                        $account_id  =  $savingDetails["account_id"];
                        $product_id  =  $savingDetails["product_id"];
                                                    $this->view->account_id  =  $account_id;
                            $this->view->product_id  =  $product_id;
                        }
                        $balance = $savings->balance($account_id); 
                        foreach($balance as $balance) 
                        {
                            $this->view->balance  =  $balance["balance"];
                        }
                    }
                    else
                    {
                            $this->view->error = "Record Not found..Try Again...";
                    }

                }
            }
        }
    }

    public function transfertoAction() {

	 $accountNumberFrom = $this->_request->getParam('member_id');
	 $accountNumberTo = $this->_request->getParam('accountto');
     $amount = $this->_request->getParam('amount');
  	 $account_id = $this->_request->getParam('account_id');
  	 $balance = $this->_request->getParam('balance');
  	$product = $this->_request->getParam('product_id');

if (($product <> 1) OR ($balance < $amount)) { echo  "It is not a savings account OR no enough balance"; } else {
 														$formdata1=array('transaction_id'=>'',
                                                    'account_id'=>$account_id,
                                                    'glsubcode_id_from'=>0,
                                                    'glsubcode_id_to'=>17,
                                                    'transaction_date'=>date("Y-m-d"),
                                                    'amount_to_bank'=>0,
                                                    'amount_from_bank'=>$amount,
                                                    'paymenttype_id'=>1,
                                                    'paymenttype_details'=>'',
                                                    'transactiontype_id'=>1,
                                                    'recordstatus_id'=>3,
													'reffering_vouchernumber'=>'',
													'transaction_description'=>'',
													'balance'=>$balance - $amount,
													'confirmation_flag'=>'',
													'created_by'=>1,
													'created_date'=>date("Y-m-d"));
	$id = $this->view->adm->addRecord("ourbank_transaction",$formdata1);
                    $savings = new Amounttransfer_Model_Amounttransfer();



		$result = $savings->getaccount($accountNumberTo);

                    foreach($result as $result) {
                    $acc  =  $result["id"];
                    }

 														$formdata2=array('transaction_id'=>'',
                                                    'account_id'=>$acc,
                                                    'glsubcode_id_from'=>0,
                                                    'glsubcode_id_to'=>17,
                                                    'transaction_date'=>date("Y-m-d"),
                                                    'amount_to_bank'=>$amount,
                                                    'amount_from_bank'=>0,
                                                    'paymenttype_id'=>1,
                                                    'paymenttype_details'=>'',
                                                    'transactiontype_id'=>1,
                                                    'recordstatus_id'=>3,
													'reffering_vouchernumber'=>'',
													'transaction_description'=>'',
													'balance'=>$balance + $amount,
													'confirmation_flag'=>'',
													'created_by'=>1,
													'created_date'=>date("Y-m-d"));
	$id = $this->view->adm->addRecord("ourbank_transaction",$formdata2);


						$this->_redirect('/transaction'); 

}
    }
}
