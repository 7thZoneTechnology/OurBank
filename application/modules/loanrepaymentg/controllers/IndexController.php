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
class Loanrepaymentg_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->title = "Loans";
        $this->view->pageTitle = "Loans repayment";
        $this->view->type='loans';
        $this->view->loanModel = new Loanrepaymentg_Model_Repayment();
        $this->view->cl = new App_Model_dateConvertor ();
        $this->view->adm = new App_Model_Adm ();
    }

    public function indexAction() 
    {
        $loansearch = new Loandetailsg_Form_Search();
        $this->view->form = $loansearch;
    }

    public function loandetailsAction() 
    {
        $accNum = $this->_request->getParam('accNum');
        $this->view->details = $this->view->loanModel->searchaccounts($accNum);
        $this->view->paid = $this->view->loanModel->paid($accNum);
        $this->view->unpaid = $this->view->loanModel->unpaid($accNum);
        $instalments = $this->view->loanModel->loanInstalments($accNum);
        $disbursed = $this->view->loanModel->getdisbursementdetails($accNum);
        $disburseddate=$disbursed[0]['loandisbursement_date'];
        //$this->view->active = $this->view->loanModel->activeDisburs($accNum);
        if (count($this->view->details)) 
        {
            foreach ($this->view->details as $details) 
            {
                $intType = $details->interesttype; // Intereset type
            }
            if (substr($accNum,4,1) == 2) 
            {
                $this->view->group = $this->view->loanModel->getMember($accNum);
            }
            switch ($intType) 
            {
                CASE 1: foreach ($instalments as $instalments) {
                            $accId = $instalments->accId;
                        }
                        $instalments = $this->view->loanModel->declainDetalis($this->_request->getParam('accNum'),$accId,$disburseddate);
                        $p = $instalments["principal"];
                        $int = $instalments["intrest"];
                        $totalAmt = $instalments["totalAmt"];

                        $loan = new Loanrepaymentg_Form_loanrepayment($p,$int,$totalAmt,$accNum); 
                        $this->view->loan = $loan;
                        $loan->amount->setValue($totalAmt);
                        BREAK;
                CASE 2:
                        foreach ($instalments as $instalments) 
                        {
                            $p = $instalments->principal;
                            $int = $instalments->intrest;
                            $totalAmt = $instalments->totalAmt;
                        }
                        $loan = new Loanrepaymentg_Form_loanrepayment($p,$int,$totalAmt,$accNum); 
                        $this->view->loan = $loan;
                        $loan->amount->setValue($totalAmt);
                        BREAK;
                CASE 3:$loan = new Loanrepaymentg_Form_loanrepayment();
                        $this->view->loan = $loan;
                        BREAK;
            }

            $mode = $this->view->adm->viewRecord("ourbank_master_paymenttypes","id","DESC");
            foreach($mode as $mode) 
            {
                $loan->transactionMode->addMultiOption($mode['id'],$mode['name']);
            }
	    if ($this->_request->getPost('Submit')) 
            {
                $formData = $this->_request->getPost(); 
                if ($loan->isValid($formData)) {
                    $data = array('date' => $this->_request->getParam('date'),
                    'paymenttype_details'=> $this->_request->getParam('othertext'),
                    'amount' => $this->_request->getParam('amount'),
                    'paymentMode' => $this->_request->getParam('transactionMode'),
                    'description' => $this->_request->getParam('description'),
                    'sms' => $this->_request->getParam('sms'),
                    'accNum' => $this->_request->getParam('accNum'));
                    switch ($intType) 
                    {
                        CASE 1:
                                $int = $this->view->loanModel->declain($data);
                                BREAK;
                        CASE 2:
                                $int = $this->view->loanModel->emi($data);
                                BREAK;
                        CASE 3:
                                BREAK;
                    }
                    $array = $this->view->loanModel->insertTran($data,$int);
                    //if group
                    if (substr($accNum,4,1) == 2)
                    {
                        foreach ($this->view->group as $group) 
                        {
                            $amount = $this->_request->getParam($group->id);
                            if ($amount) 
                            {
                                $data = array ( 'transaction_id' => $array["transaction_id"],
                                                    'account_id' => $array["account_id"],
                                                    'member_id' => $group->id,
                                                    'installment_number' => $array["installment_id"],
                                                    'installmentpaid_date' => $this->view->cl->phpmysqlformat($this->_request->getParam('date')),
                                                    'installmentpaid_mode' => $array["paymentMode"],
                                                    'installmentpaid_amount' => $amount);
                                    $this->view->loanModel->grpRepayment($data);
                            }
                        }
                    }
                    $this->_redirect("/loanrepaymentg/index/message/amt/".base64_encode($this->_request->getPost('amount'))."/accNum/".base64_encode($this->_request->getPost('accNum')));
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
