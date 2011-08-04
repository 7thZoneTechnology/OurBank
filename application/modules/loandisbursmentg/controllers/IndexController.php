<?php
/*
############################################################################
#  This file is part of OurBank.
############################################################################
#  OurBank is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as
#  published by the Free Software Foundation, either version 3 of the
#  License, or (at your option) any later version.
############################################################################
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
############################################################################
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
############################################################################
*/
class Loandisbursmentg_IndexController extends Zend_Controller_Action {
    public function init() 
    {
    	$this->view->title = "Loans";
        $this->view->pageTitle = "Loans disbursement";
	$this->view->type='loans';
        $this->view->cl = new App_Model_Users ();

	 $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
                $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }


        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id 

        $loginname=$this->view->cl->username($userid);
        foreach($loginname as $loginname) {
            $this->view->username=$loginname['username']; // get the user name
        }
        $this->view->loanModel = new Loandisbursmentg_Model_loan();
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
        $path = $this->view->baseUrl();
        $this->view->accNum = $accNum = base64_decode($this->_request->getParam('accNum'));
        $this->view->details = $details= $this->view->loanModel->searchaccounts($accNum);
        $this->view->disbursedetails = $this->view->loanModel->getdisbursementdetails($accNum);
        foreach($this->view->details as $details) {
        	$this->view->loanamount=$loanamount=$details->amount;
		$memberid=$details->memberid;
		$membertypeid=$details->membertypeid;
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
	$loanForm->memberid->setValue($memberid);
	$loanForm->membertypeid->setValue($membertypeid);
	$loanForm->pathhidden->setValue($path);
	$mode = $this->view->adm->viewRecord("ourbank_master_paymenttypes","id","DESC");
	foreach($mode as $mode) {
            $loanForm->transactionMode->addMultiOption($mode['id'],$mode['name']);
//             $form->transactionMode1->addMultiOption($mode['id'],$mode['name']);
	}
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
            $formData = $this->_request->getPost(); 

              $testing[]=$formData['etransfer'];
//                print_r($testing);

            if ($loanForm->isValid($formData)) { 
//               print_r($testing);
                $accNum = base64_decode($this->_request->getParam('accNum'));
                $disbursedate=$this->view->dateconvector->phpmysqlformat($this->_request->getPost('date'));
                $disburseamount=$this->_request->getPost('Amount');
                $transactiontype=$this->_request->getPost('transactionMode');
                $eaccount=$this->_request->getPost('etransfer');
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

                if($transactiontype != 5 or $transactiontype != 1){
                $paymentdetails=$this->_request->getPost('othertext');
                }
                else 
                {
                $paymentdetails="";
                }
                //Passing a transfer entry to transaction
                $data = array('account_id' => $accId,
                            'glsubcode_id_to' => $gl,
                            'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                            'amount_from_bank' => $this->_request->getPost('Amount'),
                            'paymenttype_id'=> $transactiontype,
                            'paymenttype_details'=>$paymentdetails,
                            'transactiontype_id' => 2,
                            'recordstatus_id'=> 3,
                            'transaction_description'=> "(Disbursement) ".$this->_request->getPost('description') ,
                            'confirmation_flag'=>0,
                            'created_by'=>1);
                $tranID = $this->view->adm->addRecord('ourbank_transaction',$data);

                // calculation of fee
                $feeamount = 0;
                foreach ($this->view->fee as $fee) {
                    $feeValue = $fee->value;
                    $feeType = $fee->amountype_id;
                    $feeGl = $fee->feeGl;
                    //1 is flat 2 is Percentage
                    if ($feeType == 2) {
                        $feeValue=(($disburseamount * $feeValue)/100);
                        $feeamount = $feeamount + $feeValue;
                    } else if ($feeType == 1) {
                        $feeamount = $feeamount + $feeValue;
                    }

                    $fee = array('office_id'=>$officeid,
                                'glsubcode_id_to'=>$fee->glsubcode_id,
                                'transaction_id'=>$tranID,
                                'credit' => $feeValue,
                                'recordstatus_id'=>'3');
                    $this->view->adm->addRecord('ourbank_Income',$fee);
                }

//                $transactionamount = array('amount_from_bank' =>$disburseamount-$feeamount);
//                $this->view->loanModel->loanupdate($tranID,$transactionamount);

                $feeData = $this->view->loanModel->glBank($officeid,'fee'.$officeid);
                $fee = array('office_id'=>$officeid,
                            'glsubcode_id_to'=>$feeData[0]['id'],
                            'transaction_id'=>$tranID,
                            'credit' => $feeamount,
                            'recordstatus_id'=>'3');
                $this->view->adm->addRecord('ourbank_Income',$fee);


                //Passing an entry to loan disbursement table
                $input = array('transaction_id' => $tranID,
                            'account_id' => $accId,
                            'loandisbursement_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                            'accountdisbursement_id' => 1,
                            'disbursed_by'=>1,
                            'amount_disbursed' => $this->_request->getPost('Amount'),
                            'transaction_description'=> $this->_request->getPost('description'),
                            'recordstatus_id'=>3);
                $this->view->adm->addRecord('ourbank_loan_disbursement',$input);

                if($intType == 3) {
                $currentbalance=$this->view->loanModel->findbalance($accId);
                if($currentbalance){
                    $repaybalance=$currentbalance[0]['balanceamount'];
                    if($currentbalance[0]['paid_date']==date('Y-m-d')){
                        $incrementvalue=$currentbalance[0]['installment_id'];
                    }
                    else
                    {
                        $incrementvalue=$currentbalance[0]['installment_id']+1;
                    }
                }
                else {
                    $repaybalance=0;
                    $incrementvalue=1;
                }
                $repaydetails=array(
                    'transaction_id'=>$tranID,
                    'account_id'=>$accId,
                    'installment_id'=>$incrementvalue,
                    'paid_interest'=>$this->_request->getPost('Amount'),
                    'paid_date'=>$this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                    'balanceamount'=>$this->_request->getPost('Amount')+$repaybalance );
                $tranID = $this->view->adm->addRecord('ourbank_loan_repayment',$repaydetails);
                }

                if ($intType == 2 or $intType == 3) {
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
					'balance'=>$emi,
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
            $bankData = $this->view->loanModel->glBank($officeid,'bank'.$officeid);
            // Bank Asset Dt entry
            $bankEntry = array('office_id'=>$officeid,
                        'glsubcode_id_to'=>$bankData[0]['id'],
                        'transaction_id'=>$tranID,
                        'debit' => $this->_request->getPost('Amount'),
                        'record_status'=>'3');
            $this->view->adm->addRecord('ourbank_Assets',$bankEntry);
            $loanData = $this->view->loanModel->glBank($officeid,'loans'.$officeid);
            $glbankEntry = array('office_id'=>$officeid,
                        'glsubcode_id_to'=>$loanData[0]['id'],
                        'transaction_id'=>$tranID,
                        'debit' => $this->_request->getPost('Amount')-$feeamount,
                        'record_status'=>'3');
            $this->view->adm->addRecord('ourbank_Assets',$glbankEntry);

            if($transactiontype=='5') {
                $eaccount=$this->_request->getPost('etransfer');
            // An entry into transaction (saving transfer)
            $input = array('account_id' => $eaccount,
                                'glsubcode_id_to' => $sgl,
                                'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                                'amount_to_bank' => $this->_request->getPost('Amount'),
                                'paymenttype_id' => $transactiontype,
                                'transactiontype_id' => 1,
                                'recordstatus_id' => 3,
                                'transaction_description'=> "Transfer from loan disbursemnet",
                                'balance' => $balance + $this->_request->getPost('amount'),
                                'confirmation_flag' => 0,
                                'created_by' => 1);
            $stranID = $this->view->adm->addRecord('ourbank_transaction',$input);
            // Insertion into saving transaction 
            $saving = array('transaction_id' => $stranID,
                                'account_id' => $eaccount,
                                'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                                'transactiontype_id' => 1,
                                'glsubcode_id_to' => $sgl,
                                'amount_to_bank' => $this->_request->getPost('Amount'),
                                'paymenttype_id' => 1,
                                'transaction_description'=> "Transfer from loan disbursemnet",
                                'transaction_by' => 1);
            $this->view->adm->addRecord('ourbank_savings_transaction',$saving);
            // An entry into transaction (fee deduction)
            $input = array('account_id' => $eaccount,
                                'glsubcode_id_to' => $sgl,
                                'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                                'amount_from_bank' => $feeamount,
                                'paymenttype_id' => $transactiontype,
                                'transactiontype_id' => 2,
                                'recordstatus_id' => 3,
                                'transaction_description'=> "Fee deduction for loan",
                                'balance' => $balance + $feeamount,
                                'confirmation_flag' => 0,
                                'created_by' => 1);
            $stranID = $this->view->adm->addRecord('ourbank_transaction',$input);
            // Insertion into saving transaction 
            $saving = array('transaction_id' => $stranID,
                                'account_id' => $eaccount,
                                'transaction_date' => $this->view->dateconvector->phpmysqlformat($this->_request->getPost('date')),
                                'transactiontype_id' => 2,
                                'glsubcode_id_to' => $sgl,
                                'amount_from_bank' => $feeamount,
                                'paymenttype_id' => 1,
                                'transaction_description'=> "Fee deduction for loan",
                                'transaction_by' => 1);
            $this->view->adm->addRecord('ourbank_savings_transaction',$saving);

            $bankData = $this->view->loanModel->glBank($officeid,'savings'.$officeid);
            // Bank Liabality Cr entry
            $crEntry = array('office_id'=>$officeid,
                        'glsubcode_id_to'=>$bankData[0]['id'],
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
            }
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

    public function getaccountAction() 
    {
       	$this->_helper->layout->disableLayout();
        $loanForm = $this->view->loan = new Loandisbursmentg_Form_loandisbursement(0);
 	$memberid = $this->_request->getParam('memberid');
 	$membertype = $this->_request->getParam('membertype');
	$savingaccount=$this->view->loanModel->getsavingaccount($memberid,$membertype);
	if($savingaccount){
	    foreach($savingaccount as $savingaccount) {
            $loanForm->etransfer->addMultiOption($savingaccount['id'],$savingaccount['account_number']);
	    }	
	}
	else
	{
            // Insertion into ourbank_account 
            $data = array('account_number' => 1,
                            'member_id' => $memberid,
                            'product_id' => 1,
                            'begin_date' => date('Y-m-d'),
                            'membertype_id' => $membertype,
                            'accountcreated_date'=> date('Y-m-d'),
                            'created_by' => $this->view->createdby,
                            'status_id'=>1);
            $accId = $this->view->adm->addRecord('ourbank_accounts',$data);

            $getmembersdetails=$this->view->loanModel->getmemberdetails($memberid,$membertype);
            $officeid=$getmembersdetails[0]['village_id'];
            // Account number formation 
            // <-----------14 digit number ---------->
            // <--3-->/<--2-->/<--2-->/<--1-->/<--6-->
            // 00office_id/0membertype_id/0product_id/typeofacc [L/S/F/R]/00000account_id
            $b=str_pad($officeid,3,"0",STR_PAD_LEFT); 
            $t=str_pad($membertype,2,"0",STR_PAD_LEFT);
            $p=str_pad(1,2,"0",STR_PAD_LEFT);
            $i= "S";
            $a=str_pad($accId,6,"0",STR_PAD_LEFT);
            $account = array('account_number' =>$b.$t.$p.$i.$a);
            $this->view->loanModel->accUpdate($accId,$account);
            $savingaccount=$this->view->loanModel->getsavingaccount($memberid,$membertype);
            foreach($savingaccount as $savingaccount) {
            $loanForm->etransfer->addMultiOption($savingaccount['id'],$savingaccount['account_number']);
	    	    }
	}
    }
}
