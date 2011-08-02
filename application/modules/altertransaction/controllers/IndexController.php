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
class Altertransaction_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
    	$this->view->title = "Alter transaction";
        $this->view->tranModel = new Altertransaction_Model_Altertransaction ();
        //$this->view->cl = new App_Model_Users ();
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
	$this->view->form = new Altertransaction_Form_Search();
        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
		   $form = $this->_request->getPost();
                if ($this->view->form->isValid($form)) {
            $vNum = $this->_request->getParam('vNum');
            $this->view->result = $this->view->tranModel->details($vNum);
            $form = new Altertransaction_Form_Altertransaction();
            $this->view->form = $form; 
            foreach($this->view->tranModel->transaction_type() as $tran) {
            $form->transactionType->addMultiOption($tran['id'],$tran['name']);
            }
           foreach($this->view->tranModel->transactionModeEdit() as $tran) {
                $form->transactionMode->addMultiOption($tran['id'],$tran['name']);
            }
            foreach($this->view->result as $tran) {
                $this->view->transaction_id = $tran['vNum'];
                $this->view->form->account_id->setValue($tran['accNum']);
				$this->view->accountnumber=$tran['accNum'];
                $this->view->form->transaction_date->setValue($tran['date']);
                $this->view->form->transaction_amount->setValue($tran['cR']);
                $this->view->form->transactionMode->setValue($tran['payName']);
                $this->view->form->transactionType->setValue($tran['tranType']);
            }
		
	  
					$recordStatus = $this->view->tranModel->recordStatus($vNum);
                    $this->view->member3 = $recordStatus;
                    foreach($this->view->member3 as $recordStatus1) {
                            $this->view->result1 =$recordStatus1['recordstatus_id'];
						}}
		if(!$this->view->result)
			{ echo "<font color=red>Record Not found..Try Again...</font>";}
    }

}
    public function alterAction()
    {
        if ($this->_request->isPost()) { 
            $vNo = $this->_request->getParam('vochure_number') ;
            //update the previous transaction rcord to 2 and insertion of the 
            $this->view->tranModel->updateRecord("ourbank_transaction",$vNo,array('recordstatus_id' => 2));
            $tarnEntry = array('account_id' => $this->_request->getParam('accID'),
                                'reffering_vouchernumber' => $vNo,
                                'transaction_date' => $this->_request->getParam('transaction_date'),
                                'created_by' => 1,
                                'transaction_description' => $this->_request->getParam('desc'),
		               			'glsubcode_id_to' => $this->_request->getParam('gl'),
                                'amount_to_bank' => $this->_request->getParam('transaction_amount'),
                                'transactiontype_id' => $this->_request->getParam('transactionType'),
                                'paymenttype_id' => $this->_request->getParam('transactionMode'),
                                'transaction_remarks' => $this->_request->getParam('transaction_remarks'),
                                'created_date' => date('Y-m-d'),
                                'recordstatus_id'=>3);
            $tranID = $this->view->adm->addRecord("ourbank_transaction",$tarnEntry); 
            /* update in savings transaction + ledger entries 
            (if only amount and date those kond of entries
            if it is group savings transaction table too) */
            /*else Cr-> Dt or Dt-> Cr ledger entries needs to be changed */

						$amount=base64_encode($this->_request->getParam('transaction_amount'));
						$accNum=base64_encode($this->_request->getParam('accNum'));
						$voucherno=base64_encode($tranID);
                        $this->_redirect("/altertransaction/index/message/amt/".$amount."/accNum/".$accNum."/vouchernumber/".$voucherno);

         }  else {
            echo "<B style='color:red'>$account_number Is An Invalid Account</b>";

         }
    }
    public function messageAction() 
    {
        $this->view->amt = base64_decode($this->_request->getParam('amt')); 
        $this->view->accID = base64_decode($this->_request->getParam('accNum'));
		$this->view->vouchernumber = base64_decode($this->_request->getParam('vouchernumber'));
		
    }


	function deletetransactionAction() {
    $transaction_id=$this->_request->getParam('vochure_number');
		$storage = new Zend_Auth_Storage_Session();
		$data = $storage->read();
		if(!$data){
			$this->_redirect('index/login');
		}

    $transaction_remarks= $this->_request->getParam('transaction_remarks');
    $alterTransaction = new Transaction_Model_AlterTransaction();

        $deleteData = array('recordstatus_id' => 1);
        $alterTransaction->transactionUpdate($transaction_id,$deleteData);
        $this->_redirect('/altertransaction/index');
    }


}

 
