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
/**
* this class facilates the month-end process
* for savigs and loans
*/
class Monthend_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle='Month end';
        $this->view->adm = new App_Model_Adm ();
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
        $storage = new Zend_Auth_Storage_Session();
        $this->view->dateconvector = new App_Model_dateConvertor();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }

    }
    public function indexAction() 
    {

        $this->view->monthstart=$startdate=date('Y-m-d', mktime(0, 0, 0, date("m"), 1, date("Y")));
        $nextstartdate=date('Y-m-d', mktime(0, 0, 0, date("m")+1, 1, date("Y")));
        $this->view->monthend=$enddate=date('Y-m-t', mktime(0, 0, 0, date("m"), 1, date("Y")));
        
        if ($this->_request->isPost() && $this->_request->getPost('continue')) {
        if(date('Y-m-d')==$enddate) {
        $monthmodle=new Monthend_Model_Transaction();
        $monthloandetails=$this->view->monthloandetails=$monthmodle->getloandetails($startdate,$enddate);
        if($monthloandetails) {
//        echo "<pre>"; print_r($monthloandetails); 
        foreach($monthloandetails as $monthloandetails1) {
        $accountid[]=$monthloandetails1['account_id'];
        }
        
        $accountidunique = array_values(array_unique($accountid)); 
        $totalinterest=0;
        //Zend_Debug::dump($accountidunique);
// Zend_Debug::dump($accountid);
        for($j=0;$j< count($accountidunique);$j++)
        {
          foreach($monthloandetails as $interestdetails)
          {
            if($interestdetails['account_id']==$accountidunique[$j])
            {	$interest=$interestdetails['loan_interest'];
		$repaymentbalance=$monthmodle->findcurrentbalance($interestdetails['paymentid']);
                $paiddate[] =$repaymentbalance[0]['paid_date'];
                $amount[] = $repaymentbalance[0]['balanceamount'];
                $installmentid[]=$repaymentbalance[0]['installment_id'];
// Zend_Debug::dump($accid);

            }
// $amount = array();
          }
// Zend_Debug::dump($paiddate);
// Zend_Debug::dump($amount);
          $monthinterest=$monthmodle->interestcalculation($startdate,$enddate,$paiddate,$amount,$interest,$installmentid);
          
//  Zend_Debug::dump($monthinterest);
          $totalinterest+=$monthinterest[0];
          $nextinstallmentid=end($installmentid)+1;
          $input=array('monthend_tag'=>1);
          $monthmodle->accUpdate('ourbank_loan_repayment',$accountidunique[$j],$input,'account_id');
          $repaymentarray=array('account_id'=>$accountidunique[$j],'installment_id'=>$nextinstallmentid,'paid_date'=>$nextstartdate,'paid_interest'=>$monthinterest[0],'balanceamount'=>$monthinterest[1],'monthend_tag'=>2);
          $this->view->adm->addRecord('ourbank_loan_repayment',$repaymentarray);

            // Zend_Debug::dump($paiddate);
            // Zend_Debug::dump($amount);
            $paiddate = array();
            $amount = array();
            $installmentid= array();
        }

        $transactionarray=array('transaction_date'=>$nextstartdate,'amount_to_bank'=>$totalinterest,'transactiontype_id'=>1,'transaction_description'=>' Month end interest on '.$nextstartdate,'created_by'=>$this->view->createdby,'created_date'=>$nextinstallmentid,'paymenttype_id'=>5);
        $trasid=$this->view->adm->addRecord('ourbank_transaction',$transactionarray);
        $input=array('transaction_id'=>$trasid,'monthend_tag'=>1);
        $monthmodle->accUpdate('ourbank_loan_repayment',2,$input,'monthend_tag');
        }
        }
        else {
                echo "<font color=red>The month end process will be on ".$this->view->dateconvector->phpnormalformat($enddate)." </font>";
        }
        }

    }
    public function messageAction() 
    {

    }
}

