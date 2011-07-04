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
class Receiptpayment_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle='Receipts and payments';
		$login=new App_Model_Users();
        $this->view->type = "operationalReport";
        $this->view->adm = new App_Model_Adm();

        /* Initialize action controller here */
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data)
        {
            $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }
        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id
        $globalsession=new App_Model_Users();
        $loginname=$globalsession->username($userid);
        foreach($loginname as $loginname) 
        {
            $this->view->username=$loginname['username']; // get the user name
        }
    }

    public function indexAction() 
    {
        $searchForm = new Receiptpayment_Form_Search();
        $this->view->form = $searchForm;
	$this->view->title = "Receipts and payments";
	 if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();

	$dateconvertor = new App_Model_dateConvertor();
	$fromDate = $dateconvertor->mysqlformat($this->_request->getParam('field1'));
	$toDate = $dateconvertor->mysqlformat($this->_request->getParam('field2'));
        $this->view->field1 = $this->_request->getParam('field1');
        $this->view->field2 = $this->_request->getParam('field2');
        $this->view->pageTitle = "Receipt and Payment";
        $formData = $this->_request->getPost();
        if ($searchForm->isValid($formData)) {
                $this->view->savings = 10;
                $transaction = new Receiptpayment_Model_Receiptpayment();

                //Saving Account Credit and Debit
                $this->view->savingsCredit = $transaction->totalSavingsCredit($fromDate,$toDate);
                $this->view->savingsDebit = $transaction->totalSavingsDebit($fromDate,$toDate);



                //Opening and Closing Balace Calculation
                //Opening Balance Saving Account Credit and Debit
                $this->view->openingsavingsCredit = $transaction->openingBalance($fromDate,$toDate);
                $this->view->openingsavingsDebit = $transaction->closingBalance($fromDate,$toDate);


                $this->view->field1 = $this->_request->getParam('field1');
                $this->view->field2 = $this->_request->getParam('field2');

            }
         }

 
	
	}

}
