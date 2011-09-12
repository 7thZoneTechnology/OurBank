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
        $this->view->monthmodle = new Monthend_Model_Transaction();


    }
    public function indexAction() 
    {

// //         $this->view->monthstart=$startdate=date('Y-m-d', mktime(0, 0, 0, date("m"), 1, date("Y")));
// //         $nextstartdate=date('Y-m-d', mktime(0, 0, 0, date("m")+1, 1, date("Y")));
// //         $this->view->monthend=$enddate=date('Y-m-t', mktime(0, 0, 0, date("m"), 1, date("Y")));
//         // Month end process based on Selected Month
        $app = $this->view->baseUrl();
	$this->view->form = new Monthend_Form_Form($app);
	$this->view->pendingmend = $pendingmonthend = $this->view->monthmodle->getmonthend(date("m"),date("Y"));

	$i = 0;
	foreach($pendingmonthend as $pendingmonthendv)
	{
		if($i == 0) {
			$startend = $pendingmonthendv['startdate'] . '/' . $pendingmonthendv['enddate'];
			$Monthid  = $pendingmonthendv['Monthid'];
			$this->view->form->month->addMultiOption($startend,$pendingmonthendv['Month']);
		}
		if($i == 1)
		{
			$nextmonthfirstdate = $pendingmonthendv['startdate'];
		}
		$i++;
	}
        if ($this->_request->isPost() && $this->_request->getPost('continue')) {
	$formdata = $this->_request->getPost();

if($this->view->form->isValid($formdata))
	{
        $month = $this->_request->getPost('month');
	list($startdate,$enddate) = explode('/',$month);
	list($y,$m,$d) = explode('-',$startdate);
        $monthloandetails=$this->view->monthloandetails=$this->view->monthmodle->getloandetails($startdate,$enddate);
        if($monthloandetails) {
                if($m == date('m')) {
			if(date('Y-m-d')==$enddate)
				{

        foreach($monthloandetails as $monthloandetails1) {
        $accountid[]=$monthloandetails1['account_id'];
        }
        
        $accountidunique = array_values(array_unique($accountid)); 
        $totalinterest=0;
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

            }
          }
          $monthinterest=$this->view->monthmodle->interestcalculation($startdate,$enddate,$paiddate,$amount,$interest,$installmentid);
          $totalinterest+=$monthinterest[0];
          $nextinstallmentid=end($installmentid)+1;
          $input=array('monthend_tag'=>1);
          $this->view->monthmodle->accUpdate('ourbank_loan_repayment',$accountidunique[$j],$input,'account_id');
          $repaymentarray=array('account_id'=>$accountidunique[$j],'installment_id'=>$nextinstallmentid,'paid_date'=>$nextstartdate,'paid_interest'=>$monthinterest[0],'balanceamount'=>$monthinterest[1],'monthend_tag'=>2);
          $this->view->adm->addRecord('ourbank_loan_repayment',$repaymentarray);

            $paiddate = array();
            $amount = array();
            $installmentid= array();
        }

        $transactionarray=array('transaction_date'=>$nextstartdate,'amount_to_bank'=>$totalinterest,'transactiontype_id'=>1,'transaction_description'=>' Month end interest on '.$nextstartdate,'created_by'=>$this->view->createdby,'created_date'=>$nextinstallmentid,'paymenttype_id'=>5);
        $trasid=$this->view->adm->addRecord('ourbank_transaction',$transactionarray);
        $input=array('transaction_id'=>$trasid,'monthend_tag'=>1);
        $monthmodle->accUpdate('ourbank_loan_repayment',2,$input,'monthend_tag');
        // Update the Month end process table
        $inputv = array('processed'=>2);
        $this->view->monthmodle->monthendupdate('ourbank_monthend',$Monthid,$inputv);
        echo "<font color='green'> Month end process successfully finished </font>";
        }// // // close for current day
        else { 
		echo "<font color='red'> Month end process should happen on last day of this month only </font>";
	}
        }  // // //close for current month

        } // Close monthloandetails
        else { 
            foreach($monthloandetails as $monthloandetails1) {
                    $accountid[]=$monthloandetails1['account_id'];
                }
        
        $accountidunique = array_values(array_unique($accountid)); 
        $totalinterest=0;
        for($j=0;$j< count($accountidunique);$j++)
        {
          foreach($monthloandetails as $interestdetails)
          {
            if($interestdetails['account_id']==$accountidunique[$j])
            {	$interest=$interestdetails['loan_interest'];
		$repaymentbalance=$this->view->monthmodle->findcurrentbalance($interestdetails['paymentid']);
                $paiddate[] =$repaymentbalance[0]['paid_date'];
                $amount[] = $repaymentbalance[0]['balanceamount'];
                $installmentid[]=$repaymentbalance[0]['installment_id'];

            }
          }
          $monthinterest=$this->view->monthmodle->interestcalculation($startdate,$enddate,$paiddate,$amount,$interest,$installmentid);
          $totalinterest+=$monthinterest[0];
          $nextinstallmentid=end($installmentid)+1;
          $input=array('monthend_tag'=>1);
          $this->view->monthmodle->accUpdate('ourbank_loan_repayment',$accountidunique[$j],$input,'account_id');
          $repaymentarray=array('account_id'=>$accountidunique[$j],'installment_id'=>$nextinstallmentid,'paid_date'=>$nextstartdate,'paid_interest'=>$monthinterest[0],'balanceamount'=>$monthinterest[1],'monthend_tag'=>2);
          $this->view->adm->addRecord('ourbank_loan_repayment',$repaymentarray);

            $paiddate = array();
            $amount = array();
            $installmentid= array();
        }

        $transactionarray=array('transaction_date'=>$nextstartdate,'amount_to_bank'=>$totalinterest,'transactiontype_id'=>1,'transaction_description'=>' Month end interest on '.$nextstartdate,'created_by'=>$this->view->createdby,'created_date'=>$nextinstallmentid,'paymenttype_id'=>5);
        $trasid=$this->view->adm->addRecord('ourbank_transaction',$transactionarray);
        $input=array('transaction_id'=>$trasid,'monthend_tag'=>1);
        $this->view->monthmodle->accUpdate('ourbank_loan_repayment',2,$input,'monthend_tag');
        // Update the Month end process table
        $inputv = array('processed'=>2);
        $this->view->monthmodle->monthendupdate('ourbank_monthend',$Monthid,$inputv);
        echo "<font color='green'> Month end process successfully finished </font>";

            }

        } // close for valid
        } // close for submit
    }
    public function messageAction() 
    {

    }
}

