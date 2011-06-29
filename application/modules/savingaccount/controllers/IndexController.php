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
class Savingaccount_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle = 'Savings';
        $this->view->title = 'Accounting';
        $this->view->accounts = new Savingaccount_Model_Accounts();
        $this->view->cl = new App_Model_dateConvertor ();
        $this->view->adm = new App_Model_Adm ();

        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
                $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }


        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id 

        $login=new App_Model_Users();
        $loginname=$login->username($userid);
        foreach($loginname as $loginname) {
            $this->view->username=$loginname['username']; // get the user name
        }
    }
    public function indexAction() 
    {
        $accountsForm = $this->view->form = new Savingaccount_Form_Accounts();
        if ($this->_request->getPost('Submit')) {
            $formData = $this->_request->getPost();
//             $this->view->errormsg="Record not found.. Try agin...";
            if ($accountsForm->isValid($formData)) {
                $this->view->result = $result = $this->view->accounts->search($this->_request->getParam('membercode'));
                    if(!$result){
                        $this->view->errormsg="Record not found.";
                    }
            }
        }
    }
    public function detailsAction() 
    {
        $code= base64_decode($this->_request->getParam('code'));
        $this->view->result = $this->view->accounts->getDetails($code);
        $this->view->code = $code;
        $this->view->savingsProducts = $this->view->accounts->fetchSavingsProducts($code);
        $this->view->account = $this->view->accounts->accountsSearch($code);
    }
    public function createaccountAction()
    {
    	$productId = base64_decode($this->_request->getParam('Id'));
    	$code = base64_decode($this->_request->getParam('code'));
        $this->view->account = $this->view->accounts->details($productId,$code);
        $this->view->interestRates = $this->view->accounts->getInterestRates($productId,$code);
        foreach ($this->view->account as $account) 
        {
            $minDeposite = $account->minbalance; // Validate for min balance
	    $officeid = $account->officeid;
        }
        $savingForm = new Savingaccount_Form_Savings($minDeposite,$this->_request->getParam('Id'),$this->_request->getParam('code'));
        if (substr($code,4,1) == 2 || substr($code,4,1) == 3) {
             $this->view->group = $this->view->accounts->getMember($code);
        }	
        $this->view->savingsForm = $savingForm;
        if ($this->_request->getPost('Submit')) {
            $formData = $this->_request->getPost();
            if ($savingForm->isValid($formData)) {
                foreach ($this->view->account as $account) {
                        $begindate = $account->begindate;
                        $officeid = $account->officeid;
                        $typeID = $account->typeID;
                        $glsubID = $account->glsubID;
                        $memberId = $account->id;
                }
                if ($this->view->cl->phpmysqlformat($this->_request->getPost('date')) < date('Y-m-d')) {
                    $this->view->maxdate= "Date of account should be current date ";
                    } else {
                    // Insertion into ourbank_account 
                    $data = array('account_number' => 1,
                                    'member_id' => $memberId,
                                    'product_id' => $productId,
                                    'begin_date' => $begindate,
                                    'membertype_id' => $typeID,
                                    'accountcreated_date'=> $this->view->cl->phpmysqlformat($this->_request->getPost('date')),
                                    'created_by' => 1,
                                    'status_id'=>1);
                    $accId = $this->view->adm->addRecord('ourbank_accounts',$data);
                    // Account number formation 
                    // <-----------14 digit number ---------->
                    // <--3-->/<--2-->/<--2-->/<--1-->/<--6-->
                    // 00office_id/0membertype_id/0product_id/typeofacc [L/S/F/R]/00000account_id
                    $b=str_pad($officeid,3,"0",STR_PAD_LEFT); 
                    $t=str_pad($typeID,2,"0",STR_PAD_LEFT);
                    $p=str_pad($productId,2,"0",STR_PAD_LEFT);
                    $i= "S";
                    $a=str_pad($accId,6,"0",STR_PAD_LEFT);
                    $account = array('account_number' =>$b.$t.$p.$i.$a);
                    $this->view->accounts->accUpdate($accId,$account);
                    // Insertion into transaction 
                    $input = array('account_id' => $accId,
                                    'glsubcode_id_to' => $glsubID,
                                    'transaction_date' => $this->view->cl->phpmysqlformat($this->_request->getPost('date')),
                                    'amount_to_bank' => $this->_request->getPost('amount'),
                                    'paymenttype_id' => 1,
                                    'transactiontype_id' => 1,
                                    'recordstatus_id' => 3,
                                    'transaction_description'=> "Opening amount",
                                    'balance' => $this->_request->getPost('amount'),
                                    'confirmation_flag' => 0,
                                    'created_by' => 1);
                    $tranID = $this->view->adm->addRecord('ourbank_transaction',$input);
                    // Insertion into saving transaction 
                    $saving = array('transaction_id' => $tranID,
                                    'account_id' => $accId,
                                    'transaction_date' => $this->view->cl->phpmysqlformat($this->_request->getPost('date')),
                                    'transactiontype_id' => 1,
                                    'glsubcode_id_to' => $glsubID,
                                    'amount_to_bank' => $this->_request->getPost('amount'),
                                    'paymenttype_id' => 1,
                                    'transaction_description'=> "Opening amount",
                                    'transaction_by' => 1);
                    $this->view->adm->addRecord('ourbank_savings_transaction',$saving);
                    // Insertion into Liabilities
                    $liabilities = array('office_id' => $officeid,
                                         'glsubcode_id_from' => '',
                                         'glsubcode_id_to' => $glsubID,
                                         'transaction_id' => $tranID,
                                         'credit' => $this->_request->getPost('amount'),
                                         'record_status'=> 3);
                    $this->view->adm->addRecord('ourbank_Liabilities',$liabilities);
                    $glresult = $this->view->accounts->getGlcode($officeid);
                    if($glresult){
                        foreach ($glresult as $glresult) {
                                $cashglsubocde = $glresult->id;
                        }
                    }else {
                                $cashglsubocde = 0 ;
                    }
                    // Insertion into Assets ourbank_Assets
                    $assets =  array('office_id' => $officeid,
                                         'glsubcode_id_from' => '',
                                         'glsubcode_id_to' => $cashglsubocde,
                                         'transaction_id' => $tranID,
                                         'credit' => $this->_request->getPost('amount'),
                                         'record_status' => 3);
                    $this->view->adm->addRecord('ourbank_Assets',$assets);
                    // Group Acc + Transaction entry
                    if ($this->view->group) {
                        $this->view->accounts->goupAcc($code,
                                                    $productId,
                                                    $accId,
                                                    $this->_request->getPost('amount'),
                                                    $tranID,
                                                    $this->view->cl->phpmysqlformat($this->_request->getPost('date')),
                                                    count($this->view->group));

                    }
                $this->_redirect("/savingaccount/index/message/acNum/".base64_encode($b.$t.$p.$i.$a));
            }
        }
        }
    }
    public function messageAction() 
    {
        $this->view->pageTitle = 'Accounting';
	$this->view->acNum = base64_decode($this->_request->getParam('acNum'));
    }
}

                  foreach ($glresult as $glresult) {
                                $cashglsubocde = $glresult->id;
                        }
                    }else {
                                $cashglsubocde = 0 ;
                    }
                    // Insertion into Assets ourbank_Assets
                    $assets =  array('office_id' => $officeid,
                                         'glsubcode_id_from' => '',
                                         'glsubcode_id_to' => $cashglsubocde,
                                         'transaction_id' => $tranID,
                                         'credit' => $this->_request->getPost('amount'),
                                         'record_status' => 3);
                    $this->view->adm->addRecord('ourbank_Assets',$assets);
                    // Group Acc + Transaction entry
                    if ($this->view->group) {
                        $this->view->accounts->goupAcc($code,
                                                    $productId,
                                                    $accId,
                                                    $this->_request->getPost('amount'),
                                                    $tranID,
                                                    $this->view->cl->phpmysqlformat($this->_request->getPost('date')),
                                                    count($this->view->group));

                    }
                $this->_redirect("/savingaccount/index/message/acNum/".base64_encode($b.$t.$p.$i.$a));
            }
        }
        }
    }
    public function messageAction() 
    {
        $this->view->pageTitle = 'Accounting';
	$this->view->acNum = base64_decode($this->_request->getParam('acNum'));
    }
}

