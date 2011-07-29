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
class Psdetails_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->title = "Savings";
        $this->view->pageTitle = "Member saving details";
        $this->view->type='savings';
        $this->view->savingsModel = new Savingsdeposit_Model_Savingsdeposit ();
        $this->view->cl = new App_Model_dateConvertor ();
        $this->view->adm = new App_Model_Adm ();
        $this->view->psdetails = new Psdetails_Model_Savingsdeposit();


        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
                $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }

        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id 
        $log = new App_Model_Users ();
        $loginname=$log->username($userid);
        foreach($loginname as $loginname) {
            $this->view->username=$loginname['username']; // get the user name
        }
    }
    public function indexAction() 
    {
        $this->view->form = new Savingsdeposit_Form_Search();
        if ($this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();
            if ($this->view->form->isValid($formData)) {
                $this->view->details = $this->view->savingsModel->search($this->_request->getParam('accNum'));
                $accNum = $this->_request->getParam('accNum');
                $this->view->acc = $accNum;

              

              // check its default savings or not
              $tagAcc = $this->view->adm->getsingleRecord('ourbank_accounts','tag_account','account_number',$accNum);
if($tagAcc != 0){
 $this->view->transactions = $this->view->psdetails->transaction($this->_request->getParam('accNum'));
 $credit = $this->view->psdetails->getCreditbalance($this->_request->getParam('accNum'));
foreach($credit as $creditbal){
$Cbalance = $creditbal['Credit'];
}
 $debit = $this->view->psdetails->getDebitbalance($this->_request->getParam('accNum'));
foreach($debit as $debitbal){
$Dbalance = $debitbal['Debit'];
}
$balance = $Cbalance - $Dbalance;
$this->view->balanceamount = $balance;
$this->view->group = $this->view->savingsModel->getMember($accNum);
}else
{

  $Balance = $this->view->psdetails->getbalance($accNum);
                foreach($Balance as $balances){
                    $this->view->balance =  $balance = $balances['Balance'];
                }

    $this->view->tran = $this->view->savingsModel->transaction($this->_request->getParam('accNum'));
}
                //if group members
                if (substr($accNum,4,1) == 2 or substr($accNum,4,1) == 3) {
                    $this->view->group = $this->view->savingsModel->getMember($accNum);
                }
            }
       }
    }
}


	

