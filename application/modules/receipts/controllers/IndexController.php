<?php
class Receipts_IndexController extends Zend_Controller_Action {

	public function init() {
		$this->view->pageTitle='Receipt and payment';
		$this->view->title = "Transaction";
        $this->view->adm = new App_Model_Adm();
	$this->view->dateconvertor = new App_Model_dateConvertor();
	}

	public function indexAction() {
		$storage = new Zend_Auth_Storage_Session();
		$data = $storage->read();
		if(!$data){
			$this->_redirect('index/login');
		}
                $path = $this->view->baseUrl();

		$receiptsform = new Receipts_Form_Receipts($path);
		$this->view->form = $receiptsform;
                $receipts= new Receipts_Model_Receipts();

                $mainBranch = $receipts->getHeadOffice();
                    foreach($mainBranch as $mainBranch) {
                    $receiptsform->officeType->addMultiOption($mainBranch['id'],$mainBranch['name']);
                }

                $glcode=$receipts->listOfglcode();
                foreach($glcode as $glcodes) {
                    $receiptsform->fromglcode->addMultiOption($glcodes['id'],$glcodes['header']);

                    $receiptsform->toglcode->addMultiOption($glcodes['id'],$glcodes['header']." -[".$glcodes['glcode']."]");
                }

		$select = $receipts->paymenttype();
		foreach ($select as $paymenttype1){
			$receiptsform->paymenttype->addMultiOption($paymenttype1['id'],$paymenttype1['description']);
		}


		if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
			$formData = $this->_request->getPost();
			if ($this->_request->isPost()) {
				$paymenttype=$this->view->paymenttype=$this->_request->getParam('paymenttype');
				if( $paymenttype ==1 || $paymenttype ==""  ) {
					$receiptsform->paymenttype_details->setRequired(false);
				}
				if ($receiptsform->isValid($formData)) {
					$branchid = $this->_request->getParam('subOffice1');
					$fromglcode = $this->_request->getParam('fromglcode');
					$fromglsubcodeid = $this->_request->getParam('glsubcodeid');
					$toglcode = $this->_request->getParam('toglcode');
					$toglsubcodeid = $this->_request->getParam('toglsubcodeid');
					$amount = $this->_request->getParam('amount');
					$transactiondate = $this->_request->getParam('transactiondate');
					$description = $this->_request->getParam('description');
					$paymenttype_details = $this->_request->getParam('paymenttype_details');

                                        $receipts= new Receipts_Model_Receipts();

                                       $fromledgercode=$receipts->listOfledgercode($fromglcode);
                                       foreach($fromledgercode as $fromledgercodes) {
                                            $fromledgertype=$fromledgercodes['description'];
                                       }


                                        $toledgercode=$receipts->listOfledgercode($toglcode);
                                        foreach($toledgercode as $toledgercodes) {
                                            $toledgertype=$toledgercodes['description'];
                                        }


                                        if($toglsubcodeid=="") {
                                            echo "select the to GL code again";
                                        }elseif($branchid=="") {
                                            echo "select the Office type again";
                                        } elseif($fromglsubcodeid=="")  {
                                            echo "select the from GL code again";
                                        } else {

                        $sessionName = new Zend_Session_Namespace('ourbank');
                        $user_id = $sessionName->primaryuserid;
                        $receipts= new Receipts_Model_Receipts();
                        if($fromglcode) {
                            if($fromledgertype=="Income") {
                                $tablenamefrom="ourbank_Income";
                            } elseif($fromledgertype=="Expenditure") {
                                $tablenamefrom="ourbank_Expenditure";
                            }elseif($fromledgertype=="Assets") {
                                $tablenamefrom="ourbank_Assets";
                            } elseif($fromledgertype=="Liabilities") {
                                $tablenamefrom="ourbank_Liabilities";
                            }
                        }

                        if($toledgertype=="Income") {
                            $tablenameto="ourbank_Income";
                        } elseif($toledgertype=="Expenditure") {
                            $tablenameto="ourbank_Expenditure";
                        }elseif($toledgertype=="Assets") {
                            $tablenameto="ourbank_Assets";
                        } elseif($toledgertype=="Liabilities") {
                            $tablenameto="ourbank_Liabilities";
                        }

			$Transactiondata = (array('transaction_id'=>'',
					'account_id' => '',
					'glsubcode_id_from' => $fromglsubcodeid,
					'glsubcode_id_to' => $toglsubcodeid,
					'transaction_date'=>$transactiondate,
					'amount_to_bank'=>$amount,
					'amount_from_bank'=>'',
					'paymenttype_id'=>$paymenttype,
					'transactiontype_id'=>'1',
					'recordstatus_id'=>'3',
					'reffering_vouchernumber'=>$paymenttype_details,
					'transaction_description'=>$description,
					'balance'=>'',
					'confirmation_flag'=>'',
					'created_by'=>$user_id,
					'created_date'=>date("Y-m-d")
			));
			$transaction_id=$receipts->addtransactions($Transactiondata);

                        if($fromglcode) {
                            $receipts->addfromaccounts($tablenamefrom,$branchid,$fromglsubcodeid,$toglsubcodeid,$transaction_id,$amount);
                        }
                        $receipts->addtoaccounts($tablenameto,$branchid,$fromglsubcodeid,$toglsubcodeid,$transaction_id,$amount);
                                        }
                                }
                        }
			$this->_redirect('transaction');

		}
// 			$this->_redirect('transaction');

	}

        function glsubcodeAction()
        {
	       $this->_helper->layout->disableLayout();
               $glcode=$this->_request->getParam('glcode');

               $receipts= new Receipts_Model_Receipts();
               $this->view->glsubcodeid=$receipts->listOfglsubcode($glcode);
	}

        function getglsubcodeAction()
        {
	       $this->_helper->layout->disableLayout();
               $glcode=$this->_request->getParam('glcode');

               $receipts= new Receipts_Model_Receipts();
               $this->view->glsubcodeid=$receipts->listOfglsubcode($glcode);
	}
 public function getbranchAction() 
    {
        $this->_helper->layout->disableLayout();
        $office_id = $this->_request->getParam('id');

        $individual = new Receipts_Model_Receipts();
        $this->view->branchs = $individual->getBranchEdit($office_id);

    }
}

