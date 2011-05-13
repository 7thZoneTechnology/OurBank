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
?>

<?php
class Savingsdeposit_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
    	$this->view->title = "Savings";
	$this->view->pageTitle = "Savings deposit";
	$this->view->type='savings';
        $this->view->savingsModel = new Savingsdeposit_Model_Savingsdeposit ();
        $this->view->cl = new App_Model_Users ();
        $this->view->adm = new App_Model_Adm ();
        $this->view->dc = new App_Model_dateConvertor();
        $this->view->savingswithdraw = new Savingswithdrawal_Model_Withdrawal ();
 $globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];

    }
    public function indexAction() 
    {
	$this->view->form = $searchform = new Savingsdeposit_Form_Search();
        $fixedSavings = new Fixedtransaction_Model_fixedSavings();
        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formdata = $this->_request->getPost();
            $acc = $this->_request->getPost('accNum');
                if($searchform->isValid($formdata)){
                    $validaccno = $fixedSavings->savingsAccountsSearch($acc);
                         if ($validaccno){
                             $this->_redirect("/savingsdeposit/index/deposit/accNum/".base64_encode($acc));
                        }else
                            {
                                $this->view->error = "Account number does not exist";
                            }
                }
        }
    }
    public function depositAction()
    {
	$accNum = $this->view->accNum = base64_decode($this->_request->getParam('accNum'));
	$this->view->details = $this->view->savingsModel->search($accNum);
	$this->view->tran = $this->view->savingsModel->transaction($accNum);
        $Balance = $this->view->savingswithdraw->getbalance($accNum);
        foreach($Balance as $balances){
            $this->view->balance =  $balance = $balances['Balance'];
        }
	$form = new Savingsdeposit_Form_Deposit($this->view->accNum);
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
           $flag = false;
                 if ($this->_request->getParam('date1')) {
                    $clear = 1;
                    $form->transactionMode->setRequired(false);
                    $form->amount->setRequired(false);
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
                    }
                } 
                else {
                $clear = 0;
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
        
                        }
            }
  if($chequeno){
                    $paymenttype_details = $chequeno;
                }else{
                    $paymenttype_details = 0;
                }
            $flag = false;
            $formData = $this->_request->getPost();
            $description = $this->_request->getParam('description');
  if($givendate){

                if ($this->view->dc->phpmysqlformat($givendate) < date('Y-m-d')) {
                     $this->view->maxdate= "Date of account should be current date" ;
                } 
                else {
            if ($form->isValid($formData)) {
                $fixedSavings = new Fixedtransaction_Model_fixedSavings();

                     if($flag == false)
                      {
                if ($this->_request->getParam('date1')) {
                    $cl = new App_Model_dateConvertor ();
                    $type = 1;  
                    $amount = $this->_request->getParam('amount1');
                    $date = $this->_request->getParam('date1');
                    $accNum = base64_decode($this->_request->getParam('accNum'));

       		    $group = $this->view->savingsModel->getMember($accNum);
       		    $tranId = $this->view->savingsModel->deposit($this->view->accNum,$amount,$date,$type,$transactionMode,$description,$paymenttype_details,$this->view->createdby);
       		    foreach ($this->view->details as $details) {
       		      $accID = $details->accId;
       		    }
                    foreach ($group as $Group)  {
                       $Accid = $this->view->savingsModel->getAccountid($Group->id);
                        if ($this->_request->getParam($Group->id) != 0) {
                        $trandata = array('transaction_id' => $tranId,
                                        'account_id' => $Accid,
                                        'transaction_date' => $cl->phpmysqlformat($date),
                                        'transaction_type' => 1,
                                        'transaction_amount' => $this->_request->getParam($Group->id),
                                        'member_id' => $Group->id,
                                        'transacted_by' => $this->view->createdby);
                        $this->view->savingsModel->groupDeposit($trandata);
                        }
                    }
                } else {
                    $type = 2;
                    $amount = $this->_request->getParam('amount');
                    $date = $this->_request->getParam('date');
                    $accNum = $this->_request->getParam('accNum');
                    $tranId = $this->view->savingsModel->deposit($this->view->accNum,$amount,$date,$type,$transactionMode,$description,$paymenttype_details,$this->view->createdby);
                }
		$this->_redirect("/savingsdeposit/index/message/amt/".base64_encode($amount)."/accNum/".base64_encode($this->view->accNum));
	       } 
 else {
                    if($clear == 0){
                        $form->date->setValue('');
                        $form->amount->setValue('');
                        $form->transactionMode->setValue('');
                        $form->description->setValue('');
                    } 
                    if($clear == 1){
                        $form->date1->setValue('');
                        $form->transactionMode1->setValue('');
                        $form->description1->setValue('');
                    }
            }
}
    }
}
}
}
    public function messageAction() 
    {
        $this->view->amt = base64_decode($this->_request->getParam('amt'));
        $this->view->accNum = base64_decode($this->_request->getParam('accNum'));
    }
}
