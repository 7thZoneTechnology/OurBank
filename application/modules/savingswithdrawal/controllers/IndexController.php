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
class Savingswithdrawal_IndexController extends Zend_Controller_Action
{
	public function init() 
	{

    	$this->view->title = "Savings";
		$this->view->pageTitle = "Savings withdrawal";
		$this->view->type='savings';
        $this->view->savingsModel = new Savingswithdrawal_Model_Withdrawal ();
        $this->view->cl = new App_Model_Users ();
        $this->view->adm = new App_Model_Adm ();
        $this->view->dc = new App_Model_dateConvertor();
        $this->view->ms = new Msdetails_Model_msdetails();
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
	}
public function indexAction() 
	{
		$this->view->form = $searchform = new Savingswithdrawal_Form_Search();
                $fixedSavings = new Fixedtransaction_Model_fixedSavings();
                $dbobj = new Savingsdeposit_Model_Savingsdeposit();

                if ($this->_request->isPost() && $this->_request->getPost('Search')) {
                            $formdata = $this->_request->getPost();
                            $acc = $this->_request->getPost('accNum');
                            if($searchform->isValid($formdata)){
                                $validaccno = $dbobj->savingsAccountsSearch($acc);
                                $tagAcc = $this->view->adm->getsingleRecord('ourbank_accounts','tag_account','account_number',$acc);
                                $mtype = $this->view->adm->getsingleRecord('ourbank_accounts','membertype_id','account_number',$acc);
                                if($tagAcc!=0 && $mtype == 1){
                                            $this->view->error = "Withdrawal not allowed use group account to withdrawal";
                                }else {
                                        if ($validaccno) {
                                            $Balance = $this->view->ms->getbalance($acc);
                                            foreach($Balance as $balances){
                                                $balance = $balances['Balance'];
                                            }
                                                if($balance > 0){

                                                $this->_redirect("/savingswithdrawal/index/withdrawal/accNum/".base64_encode($acc));
                                                 } else {
                                                    $this->view->error = "Zero balance withdrawal not allowed.";
                                                }
                                        } else {
                                                $this->view->error = "Account number does not exist";
                                        }
                                }
                            }
                }
        }

// public function indexAction() 
// 	{
// 		$this->view->form = $searchform = new Savingswithdrawal_Form_Search();
//                 $fixedSavings = new Fixedtransaction_Model_fixedSavings();
// 
//                 if ($this->_request->isPost() && $this->_request->getPost('Search')) {
//                             $formdata = $this->_request->getPost();
//                             $acc = $this->_request->getPost('accNum');
//                             if($searchform->isValid($formdata)){
//                                 $validaccno = $fixedSavings->savingsAccountsSearch($acc);
//                                 $tagAcc = $this->view->adm->getsingleRecord('ourbank_accounts','tag_account','account_number',$acc);
//                                 if($tagAcc!=0){
//                                             $this->view->error = "Enter valid Account number";
//                                 }else {
//                                         if ($validaccno) {
//                                                 $this->_redirect("/savingswithdrawal/index/withdrawal/accNum/".base64_encode($acc));
//                                         }else{
//                                                 $this->view->error = "Account number does not exist";
//                                         }
//                                 }
//                             }
//                 }
//         }
	public function withdrawalAction()
	{
		$accNum = $this->view->accNum = base64_decode($this->_request->getParam('accNum'));
                $fixedSavings = new Fixedtransaction_Model_fixedSavings();
                $validaccno = $fixedSavings->savingsAccountsSearch($accNum);
		$MinBalance = $this->view->savingsModel->getminimumbal($accNum);

		$Balance = $this->view->savingsModel->getbalance($accNum);
                foreach($Balance as $balances){
                    $this->view->balance =  $balance = $balances['Balance'];
                }
                foreach($MinBalance as $MinBalan){
                    $minimumbalance = $MinBalan['minmumdeposit'];
                }

                $this->view->limitamount = $balance - $minimumbalance;

		$this->view->details = $this->view->savingsModel->search($accNum);
		$this->view->tran = $this->view->savingsModel->transaction($accNum);
		$form = new Savingswithdrawal_Form_Withdrawal($this->view->accNum,$balance,$minimumbalance);
		$this->view->form = $form;
		$mode = $this->view->adm->viewRecord("ourbank_master_paymenttypes","id","DESC");
		foreach($mode as $mode) {
			$form->transactionMode->addMultiOption($mode['id'],$mode['name']);
			$form->transactionMode1->addMultiOption($mode['id'],$mode['name']);
		}
		//if group members
		if (substr($accNum,4,1) == 2 || substr($accNum,4,1) == 3) {
			$this->view->group = $this->view->savingsModel->getMember($accNum);
		}
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {

            if ($this->_request->getParam('date1')) {
                $form->transactionMode->setRequired(false);
//                 $form->amount->setRequired(false);
                $form->description->setRequired(false);
                $form->date->setRequired(false);
                $givendate = $this->_request->getParam('date1');
                $transactionMode = $this->_request->getParam('transactionMode1');
                if($transactionMode ==1){
                        $this->view->form->othertext->setRequired(false);
                        $this->view->form->othertext1->setRequired(false);
                }   
                if($transactionMode !=1){
                        $this->view->form->othertext->setRequired(false);
                        $chequeno =  $this->_request->getParam('othertext1'); 
                    $paymenttype_details = $chequeno;

                } else {
                    $paymenttype_details = 0;
                }

            } else {
                $form->transactionMode1->setRequired(false);
                $form->description1->setRequired(false);
                $form->date1->setRequired(false);
                $givendate = $this->_request->getParam('date');
                $transactionMode = $this->_request->getParam('transactionMode');
                if($transactionMode ==1){
                        $this->view->form->othertext->setRequired(false);
                        $this->view->form->othertext1->setRequired(false);
                }
        if($transactionMode !=1){
                        $this->view->form->othertext1->setRequired(false);
                         $chequeno =  $this->_request->getParam('othertext'); 
                    $paymenttype_details = $chequeno;

                } else{
                    $paymenttype_details = 0;
                }

            }
            $flag = false;
            $formData = $this->_request->getPost();
                 if($givendate){

                $gdate = $this->view->dc->phpmysqlformat($givendate);
              /*  if ( $gdate != date('Y-m-d') ) {
                                    $this->view->maxdate= "Date should be current date" ;
                } 
                else { */                  //date validation
               if($form->isValid($formData)){
                $fixedSavings = new Fixedtransaction_Model_fixedSavings();
                    if($transactionMode=='5') {
                                $savingsAccountsSearch = $fixedSavings->savingsAccountsSearch($chequeno);
                                $validaccno = $fixedSavings->savingsAccountsSearchwithid($chequeno);
                            if (!$validaccno) {
                                    $this->view->noaccount = "Enter valid saving account number";
                                    $flag = true;

                            }

                            if (!$savingsAccountsSearch) {
                                    $form->othertext->setValue('');
                                    $form->othertext1->setValue('');
                                    $flag = true;
                                    $this->view->noaccount = "This account number does not exist";
                            }
                        }
                     if($flag == false)
                      {
                        $description = $this->_request->getParam('description');
                    if ($this->_request->getParam('date1')) {
                        $cl = new App_Model_dateConvertor ();
                        $type = 1;
                        $amount = $this->_request->getParam('amount1');
                        $date = $this->_request->getParam('date1');
                        $accNum = base64_decode($this->_request->getParam('accNum'));
                

                    $tranId = $this->view->savingsModel->deposit($this->view->accNum,$amount,$date,$type,$transactionMode,$description,$paymenttype_details,$this->view->createdby);
                    $group = $this->view->savingsModel->getMember($accNum);
                    foreach ($this->view->details as $details) {
                        $accID = $details->accId;
                    }
                    foreach ($group as $Group)  {

                       $Accid = $this->view->savingsModel->getAccountid($Group->id);

                        if ($this->_request->getParam($Group->id) != 0) {
                            $trandata = array('transaction_id' => $tranId,
                                            'account_id' => $Accid,
                                            'transaction_date' => $cl->phpmysqlformat($date),
                                            'transaction_type' => 2,
                                            'transaction_amount' => $this->_request->getParam($Group->id),
                                            'member_id' => $Group->id,
                                            'transacted_by' => 1);
                            $this->view->savingsModel->groupWithdrawal($trandata);
                        }
                    }
                    } else {
                    $type = 2;
                    $amount = $this->_request->getParam('amount');
                    $date = $this->_request->getParam('date');
                    $accNum = base64_decode($this->_request->getParam('accNum'));

                    $tranId = $this->view->savingsModel->deposit($this->view->accNum,$amount,$date,$type,$transactionMode,$description,$paymenttype_details,$this->view->createdby);
                    }
                $this->_redirect("/savingswithdrawal/index/message/amt/".base64_encode($amount)."/accNum/".base64_encode($this->view->accNum));
                }
            }
   // }                       //date validation
    }
        }
    }
    public function messageAction() 
    {
        $this->view->amt = base64_decode($this->_request->getParam('amt'));
        $this->view->accNum = base64_decode($this->_request->getParam('accNum'));
    }
}


	

