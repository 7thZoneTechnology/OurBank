<?php
class Loandisbursmentg_IndexController extends Zend_Controller_Action {
    public function init() 
    {
    	$this->view->title = "Loans";
        $this->view->pageTitle = "Loans disbursement";
	$this->view->type='loans';
	$globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }
        $this->view->loanModel = new Loandisbursmentg_Model_loan();
        $this->view->cl = new App_Model_Users ();
        $this->view->dateconvector = new App_Model_dateConvertor();
        $this->view->adm = new App_Model_Adm ();

    }
    public function indexAction() 
    {
	$loansearch = new Loandisbursmentg_Form_Search();
	$this->view->form = $loansearch;
	$this->view->transactiontype='Loan transaction';

	if ($this->_request->isPost() && $this->_request->getPost('Search')) {
    	    $formData = $this->_request->getPost();
	    if ($this->_request->isPost()) {
		$formData = $this->_request->getPost();
		if ($loansearch->isValid($formData)) {
		    $search = $this->view->loanModel->searchaccounts($this->_request->getParam('accNum'));
		    if (!$search) {
                        echo "Enter a valid Number";
		    } else {
                        if(COUNT($search)=='1') {

                            foreach($search as $account) {
                               $accountnumber=$account->number;
                            }
                            $this->_redirect("/loandisbursmentg/index/disbursment/accNum/".base64_encode($accountnumber));
                        } else {
                        $this->view->accounts = $search;
                        }
		   }
		}
	    }
	}
    }

    public function disbursmentAction() 
    {
        $this->view->pageTitle='Loan disbursement';
        $this->view->accNum = $accNum = base64_decode($this->_request->getParam('accNum'));
        $this->view->details = $details= $this->view->loanModel->searchaccounts($accNum);
        $this->view->disbursedetails = $this->view->loanModel->getdisbursementdetails($accNum);
        foreach($this->view->details as $details) {
        $this->view->loanamount=$loanamount=$details->amount;
        }
        $this->view->disbursed=$disbursed=0;
        if($this->view->disbursedetails){
        foreach($this->view->disbursedetails as $disbursedbalance){
        $this->view->disbursed=$disbursed+=$disbursedbalance['amount_disbursed'];
        $firstdisbursedate[]=$disbursedbalance['loandisbursement_date'];
        }
        }
        else{ $this->view->disbursed=$disbursed=0; }
//         print_r($firstdisbursedate);
        $this->view->balance=$balance=$loanamount-$disbursed;
        $this->view->fee = $this->view->loanModel->getFee($accNum);
        $loanForm = $this->view->loan = new Loandisbursmentg_Form_loandisbursement($balance);
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
            $formData = $this->_request->getPost();
            if ($loanForm->isValid($formData)) {
                $accNum = base64_decode($this->_request->getParam('accNum'));
                $disbursedate=$this->view->dateconvector->phpmysqlformat($this->_request->getPost('date'));
                $disburseamount=$this->_request->getPost('Amount');
                //Make the loan acc active
                $this->view->loanModel->active($accNum);
                $search = $this->view->loanModel->searchaccounts($accNum);
                //Zend_Debug::dump($search);
                foreach($search as $search) {
                    $gl = $search->gl;
                    $accId = $search->accId;
                    $intType = $search->interesttype; // Interest type
                    $installments = $search->installments;
                    $interest = $search->interest;
                    $amount = $search->amount;
                    $number = $search->number;
                    $sAccId = $search->sAccId; 
                    $officeid = $search->officeid;
                }
                // calculation of fee
                $feeamount = 0;
                foreach ($this->view->fee as $fee) {
                    $feeValue = $fee->value;
                    $feeType = $fee->amountype_id;
                    $feeGl = $fee->feeGl;
                    //1 is flat 2 is Percentage
                    if ($feeType == 2) {
                        $feeamount = $feeamount + (($disburseamount * $feeValue)/100);
                    } else if ($feeType == 1) {
                        $feeamount = $feeamount + $feeValue;
                    }
                }
                //Passing a transfer entry to transaction
                $data = array('account_id' => $accId,
                            'glsubcode_id_to' => $gl,
                            'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                            'amount_from_bank' => $this->_request->getPost('Amount'),
                            'paymenttype_id'=> 5,
                            'transactiontype_id' => 2,
                            'recordstatus_id'=> 3,
                            'transaction_description'=> $this->_request->getPost('description') ,
                            'confirmation_flag'=>0,
                            'created_by'=>1);
                $tranID = $this->view->adm->addRecord('ourbank_transaction',$data);
                //Passing an entry to loan disbursement table
                $input = array('transaction_id' => $tranID,
                            'account_id' => $accId,
                            'loandisbursement_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                            'accountdisbursement_id' => 1,
                            'disbursed_by'=>1,
                            'amount_disbursed' => $this->_request->getPost('Amount'),
                            'transaction_description'=> $this->_request->getPost('description'),
                            'recordstatus_id'=>3);
                $tranID = $this->view->adm->addRecord('ourbank_loan_disbursement',$input);
                if ($intType == 2) {
                    if($loanamount==$balance){
                    $emi =0;$roi=0;
                    $cb=$disburseamount;
                    $date = $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date'));
                    //EMI ie., decling capital
                    $rpm = $interest/100/12;
                    $emi = (($disburseamount)*($rpm)*pow((1+$rpm),$installments))/(pow((1+$rpm),$installments)-1);
                    for ($i=0; $i<$installments; $i++) {
                        $date = $this->dateAction($date,30,0,0);
                        //$roi = rate of interest
                        $status = ($i == 0) ? 4: 3;
                        $roi =$cb*$rpm;
                        $cb = $cb - ($emi - $roi);
                        //echo "<br>Date: ".$date." Roi: ".$roi." Emi: ".$emi." Balance: ".$cb."<br>";
                        $instl = array('account_id' => $accId,
                                        'installment_id' => $i+1,
                                        'installment_date' => $date,
                                        'installment_amount' => $emi,
                                        'installment_interest_amount'=> $roi,
                                        'installment_principal_amount' => round(($emi - $roi),2),
                                        'reduced_prinicipal_balance'=> round($cb,2),
                                        'installment_status' => $status,
                                        'created_by' => 1);
                    $this->view->adm->addRecord('ourbank_installmentdetails',$instl);
                    }
                    }
                    else
                    {
                    $lastpaiddetails=$this->view->loanModel->findlastpaid($accNum);
                    $remaininginstallment=$this->view->loanModel->remaininginstallmemnt($accNum);
                    $newstart=$remaininginstallment[0]['installment_id'];

                    if($lastpaiddetails){
                    $oldpaid=$lastpaiddetails[0]['paidamount'];
                    $oldbalance=$disbursed-$oldpaid;
                    $remaindays=$this->view->dateconvector->dateDiff($disbursedate,$lastpaiddetails[0]['paid_date']);
                    $oldinterest=($oldbalance*$remaindays*$interest)/36500;
                    $totaloldamount=$oldbalance+$oldinterest;
                    $newinstallment=$remaininginstallment[0]['countnumber'];
                    }
                    else
                    {
                    $withoutpaid=$this->view->loanModel->findwithoutpaid($accNum);
                    $oldbalance=$this->view->disbursed;
                    $remaindays=$this->view->dateconvector->dateDiff($disbursedate,$firstdisbursedate[0]);
                    $oldinterest=($oldbalance*$remaindays*$interest)/36500;
                    $totaloldamount=$oldbalance+$oldinterest;
                    $newinstallment=$installments;
                    }
                    $newamount=$totaloldamount+$disburseamount;
                    $emi =0;$roi=0;
                    $cb=$newamount;
                    $date = $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date'));
                    //EMI ie., decling capital
                    $rpm = $interest/100/12;
                    $emi = (($newamount)*($rpm)*pow((1+$rpm),$newinstallment))/(pow((1+$rpm),$newinstallment)-1);

                    $updatevalue = array('installment_status'=>7);
                    $this->view->loanModel->updateold($accId,$updatevalue);

                    for ($i=$newstart-1; $i<$installments; $i++) {
                        $date = $this->dateAction($date,30,0,0);
                        //$roi = rate of interest
                        $status = ($i == $newstart-1) ? 4: 3;
                        $roi =$cb*$rpm;
                        $cb = $cb - ($emi - $roi);
                        //echo "<br>Date: ".$date." Roi: ".$roi." Emi: ".$emi." Balance: ".$cb."<br>";
                        $instl = array('account_id' => $accId,
                                        'installment_id' => $i+1,
                                        'installment_date' => $date,
                                        'installment_amount' => $emi,
                                        'installment_interest_amount'=> $roi,
                                        'installment_principal_amount' => round(($emi - $roi),2),
                                        'reduced_prinicipal_balance'=> round($cb,2),
                                        'installment_status' => $status,
                                        'created_by' => 1);
                    $this->view->adm->addRecord('ourbank_installmentdetails',$instl);
                    }
                    }
                }

                if($intType == 1){
                    if($this->view->disbursedetails){
                        $findmax=$this->view->loanModel->maxid($accNum);
                        if($findmax){
                        $maxid=$findmax[0]['maxid'];
                        }
                        else { $maxid=1; }
                        $paiddetails=$this->view->loanModel->declainedpaid($accNum,$maxid);
                        if($paiddetails){
                            $reducedprincipal=$paiddetails[0]['reduced_prinicipal_balance'];
                            $remaindays=$this->view->dateconvector->dateDiff($disbursedate,$paiddetails[0]['installment_date']);
                            $oldinterest=($reducedprincipal*$remaindays*$interest)/36500;
                            $totaloldamount=$reducedprincipal+$oldinterest;
                            $newbalance=$totaloldamount+$disburseamount;
                            $updatedata=array('reduced_prinicipal_balance'=>$newbalance,
                                              'installment_amount'=>$newbalance+$paiddetails[0]['paid_amount'],
                                              'installment_interest_amount'=>$oldinterest,
                                              'installment_principal_amount'=>$newbalance-$oldinterest
                                             );
                            $this->view->loanModel->updateinstallment($paiddetails[0]['account_id'],$maxid,$updatedata);
                        }
                    }

                }
                $sglData = $this->view->loanModel->getSavingGl($sAccId);
                foreach($sglData as $sglData) 
                {
                    $sgl = $sglData->glsubcode_id;
                    $balance = $sglData->balance;

                }
            $bankData = $this->view->loanModel->glBank($officeid);
            foreach ($bankData as $bankData) {
                $bankGl = $bankData->id;
            }
            // Bank Asset Dt entry
            $bankEntry = array('office_id'=>$officeid,
                        'glsubcode_id_to'=>$bankGl,
                        'transaction_id'=>$tranID,
                        'debit' => $this->_request->getPost('Amount'),
                        'record_status'=>'3');
            $this->view->adm->addRecord('ourbank_Assets',$bankEntry);
            $glbankEntry = array('office_id'=>$officeid,
                        'glsubcode_id_to'=>$gl,
                        'transaction_id'=>$tranID,
                        'debit' => $this->_request->getPost('Amount'),
                        'record_status'=>'3');
            $this->view->adm->addRecord('ourbank_Assets',$glbankEntry);
            // An entry into transaction (saving transfer)
            $input = array('account_id' => $sAccId,
                                'glsubcode_id_to' => $sgl,
                                'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                                'amount_to_bank' => $this->_request->getPost('Amount'),
                                'paymenttype_id' => 1,
                                'transactiontype_id' => 1,
                                'recordstatus_id' => 3,
                                'transaction_description'=> "Transfer from loan disbursemnet",
                                'balance' => $balance + $this->_request->getPost('amount'),
                                'confirmation_flag' => 0,
                                'created_by' => 1);
            $stranID = $this->view->adm->addRecord('ourbank_transaction',$input);
            // Insertion into saving transaction 
            $saving = array('transaction_id' => $stranID,
                                'account_id' => $sAccId,
                                'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                                'transactiontype_id' => 1,
                                'glsubcode_id_to' => $sgl,
                                'amount_to_bank' => $this->_request->getPost('Amount'),
                                'paymenttype_id' => 1,
                                'transaction_description'=> "Transfer from loan disbursemnet",
                                'transaction_by' => 1);
            $this->view->adm->addRecord('ourbank_savings_transaction',$saving);
            // An entry into transaction (fee deduction)
            $input = array('account_id' => $sAccId,
                                'glsubcode_id_to' => $sgl,
                                'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                                'amount_from_bank' => $feeamount,
                                'paymenttype_id' => 1,
                                'transactiontype_id' => 2,
                                'recordstatus_id' => 3,
                                'transaction_description'=> "Fee deduction for loan",
                                'balance' => $balance + $feeamount,
                                'confirmation_flag' => 0,
                                'created_by' => 1);
            $stranID = $this->view->adm->addRecord('ourbank_transaction',$input);
            // Insertion into saving transaction 
            $saving = array('transaction_id' => $stranID,
                                'account_id' => $sAccId,
                                'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                                'transactiontype_id' => 2,
                                'glsubcode_id_to' => $sgl,
                                'amount_from_bank' => $feeamount,
                                'paymenttype_id' => 1,
                                'transaction_description'=> "Fee deduction for loan",
                                'transaction_by' => 1);
            $this->view->adm->addRecord('ourbank_savings_transaction',$saving);
            $bankData = $this->view->loanModel->glBank($officeid);
            foreach ($bankData as $bankData) {
                $bankGl = $bankData->id;
            }
            // Bank Liabality Cr entry
            $crEntry = array('office_id'=>$officeid,
                        'glsubcode_id_to'=>$bankGl,
                        'transaction_id'=>$stranID,
                        'credit' => $this->_request->getPost('Amount'),
                        'record_status'=>'3');
            $this->view->adm->addRecord('ourbank_Assets',$crEntry);
            // Saving product gl entry
            $glcrEntry = array('office_id'=>$officeid,
                        'glsubcode_id_to'=>$sgl,
                        'transaction_id'=>$stranID,
                        'credit' => $this->_request->getPost('Amount'),
                        'record_status'=>'3');
            $this->view->adm->addRecord('ourbank_Liabilities',$glcrEntry);
            // Insertion into Assets ourbank_Assets fee Cr entry
            // Bank Liabality Cr entry
            $fee = array('office_id'=>$officeid,
                        //'glsubcode_id_to'=>$feeGl,
                        'transaction_id'=>$stranID,
                        'credit' => $feeamount,
                        'record_status'=>'3');
            $this->view->adm->addRecord('ourbank_Assets',$fee);
            $this->_redirect("/loandisbursmentg/index/message/amt/".base64_encode($this->_request->getPost('Amount'))."/accNum/".base64_encode($number));
            }
        }
    }

    public function messageAction() 
    {
        $this->view->amt = base64_decode($this->_request->getParam('amt'));
        $this->view->accNum = base64_decode($this->_request->getParam('accNum'));
    }

    function dateAction($givendate,$day=0,$mth=0,$yr=0) 
    {
        $cd = strtotime($givendate);
        $newdate = date('Y-m-d', mktime(date('h',$cd),
        date('i',$cd), date('s',$cd), date('m',$cd)+$mth,
        date('d',$cd)+$day, date('Y',$cd)+$yr));
        return $newdate;
    }
}
