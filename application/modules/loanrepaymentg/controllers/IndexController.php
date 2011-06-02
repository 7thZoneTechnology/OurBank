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
        $errormsg=$this->_request->getParam('msg');
        if($errormsg==1)
        {
            echo "<font color='red'>Invalid account number</font>"; 
        }
    }

    public function loandetailsAction() 
    {
        $accNum = $this->_request->getParam('accNum');
        $this->view->details = $this->view->loanModel->searchaccounts($accNum);
        if($this->view->details!=""){
            foreach ($this->view->details as $acc) {
            $accId = $acc->accId;
            $loanAmt = $acc->amount;
            $interest = $acc->interest;
        }
        $this->view->paid = $this->view->loanModel->paid($accNum);
        if($this->view->paid){
            foreach($this->view->paid as $paidamount){
                $this->view->paidCount=$paidamount->paidCount;
                $this->view->paidamount=$paidamount=$paidamount->principal_amount;
            }
        }
        else {
                $paidamount=$this->view->paidamount=0;
        }
        $this->view->unpaid = $this->view->loanModel->unpaid($accNum);

        $instalments = $this->view->loanModel->loanInstalments($accNum);
        $disbursed = $this->view->loanModel->getdisbursementdetails($accNum);
        if($disbursed){
        $disburseddate=$disbursed[0]['loandisbursement_date'];
        }
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
                CASE 1:
                        $findmax=$this->view->loanModel->maxid($accNum);
                        if($findmax){
                        $maxid=$findmax[0]['maxid'];
                        }
                        else { $maxid=1; }
                        $paiddetails=$this->view->loanModel->declainedpaid($accNum,$maxid);
                        if($paiddetails)
                        {
                            $interestdate=$paiddetails[0]['installment_date'];
                            $this->view->p=$p=$paiddetails[0]['reduced_prinicipal_balance'];
                        }
                        else
                        {
                            $disburseddetails=$this->view->loanModel->declaineddisbursed($accNum);
                            $interestdate=$disburseddetails[0]['loandisbursement_date'];
                            $this->view->p=$p=$disburseddetails[0]['amount'];
                        }

                        $dateDiff = $this->view->loanModel->dateDiff($interestdate,date("Y-m-d"));
                        $this->view->int= $int = round(($p*$dateDiff*$interest)/(100*365),2);
                        $this->view->totalamount=$totalAmt = round($int+$p,2);
                        $loan = new Loanrepaymentg_Form_loanrepayment($accNum); 
                        $this->view->loan = $loan;
                        $loan->amount->setValue($totalAmt);
                        BREAK;
                CASE 2:
                        foreach ($instalments as $instalments) 
                        {
                            $this->view->p=$p = $instalments->principal;
                            $this->view->int=$int = $instalments->intrest;
                            $this->view->totalamount=$totalAmt = $instalments->totalAmt;
                        }
                        $loan = new Loanrepaymentg_Form_loanrepayment($accNum); 
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
                                $int = $this->view->loanModel->declain($data,$totalAmt,$int,$p);
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
        else {
                $this->_redirect("/loanrepaymentg/index/index/msg/1");
        }
    } 
    }
    public function messageAction() 
    {
        $this->view->amt = base64_decode($this->_request->getParam('amt'));
        $this->view->accNum = base64_decode($this->_request->getParam('accNum'));
    }
}
