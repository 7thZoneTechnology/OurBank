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


class Summarymfi_IndexController extends Zend_Controller_Action
{
	function init() { 
		$this->view->pageTitle = "Summary of MFI";
		$this->view->type = "generalFields";
	$globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];
	
	$storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }
	$this->view->adm = new App_Model_Adm();

	}

	function indexAction() {
		$summary= new Summarymfi_Model_Summary();
		$members = $summary->inactiveMemberDetails();
		$allmembers = $summary->allMembers();
        $activemember = $summary->activeMembers();
        $this->view->activemember=count($activemember);
        $inactivemembers = $summary->inactiveMembers();
        $this->view->inactivemember=count($inactivemembers);

        $groupmembers = $summary->groupmembers();
        $this->view->group=count($groupmembers);
        $this->view->groupmembers=0;

        foreach($groupmembers as $groupmembers1){
            $this->view->groupmembers+=$groupmembers1['groupmembers'];
        }

        $fixedaccounts = $summary->fixedAccounts();
        $this->view->fixedaccounts=count($fixedaccounts);

        $this->view->fixedbalance=0;

        foreach($fixedaccounts as $fixedaccounts1){
            $this->view->fixedbalance+=$fixedaccounts1['fixed_amount'];
        }

        $recurringaccounts = $summary->recurringAccounts();
        $this->view->recurringaccounts=$recurringaccounts[0]['recurringaccounts'];

        $recurringbalance= $summary->recurringbalance();
        $this->view->recurringbalance=$recurringbalance[0]['recurringbalance'];

        $savingaccounts = $summary->savingAccounts();
        $this->view->savingaccounts=$savingaccounts[0]['savingaccounts'];

        $savingbalance = $summary->savingbalance();
        $this->view->savingbalance=$savingbalance[0]['credit']-$savingbalance[0]['debit'];

        $loanaccounts = $summary->loanAccounts();
        $this->view->loanaccounts=count($loanaccounts);

        $this->view->loanamount=0;
        foreach($loanaccounts as $loanaccounts1){
            $this->view->loanamount+=$loanaccounts1['loan_amount'];
        }

        $activeloanaccounts = $summary->activeloanAccounts();
        $this->view->activeloanaccounts=count($activeloanaccounts);

        $this->view->activeloanamount=0;
        foreach($activeloanaccounts as $activeloanaccounts1){
            $this->view->activeloanamount+=$activeloanaccounts1['loan_amount'];
        }

        $loandisburse = $summary->loanDisburse();
        $this->view->disbursed=$loandisburse[0]['SUM(amount_disbursed)'];

        $activeloandisburse = $summary->activeloanDisburse();
        $this->view->activedisbursed=$activeloandisburse[0]['SUM(amount_disbursed)'];

        $loanrepay = $summary->loanRepay();
        $this->view->paidamount=$loanrepay[0]['SUM(paid_amount)'];
        $this->view->interestamount=$loanrepay[0]['SUM(paid_interest)'];

        $activeloanrepay = $summary->activeloanRepay();
        $this->view->activepaidamount=$activeloanrepay[0]['SUM(paid_amount)'];
        $this->view->activeinterestamount=$activeloanrepay[0]['SUM(paid_interest)'];

        $this->view->rateofrepay = $summary->rateLoan($this->view->activedisbursed,$this->view->activepaidamount);

        $Funders = $summary->funders();
        $Fundings = $summary->fundings();
        $totalfundings = $summary->totalFundings();
        $this->view->sql=$summary->query1();
        $this->view->sql1=$summary->query2();
        $this->view->sql2=$summary->query3();
        $this->view->savings = $members;
        $this->view->savings1 = $allmembers;
        $this->view->activeMembers = $activemember;
        $this->view->inactiveMembers = $inactivemembers;
        $this->view->savingAccounts = $savingaccounts;
        $this->view->loanAccounts = $loanaccounts;
        $this->view->loanDisburse = $loandisburse;
		$this->view->funders = $Funders;
        $this->view->fundings = $Fundings;
		$this->view->totalFundings = $totalfundings;
		$this->view->loanRepay = $loanrepay;

}
function viewtransactionAction() {
	}

	function pdfgenerationAction() {
		//$fetchMeetings=new Meetingreport_Model_Meetingreport();

		$pdf = new Zend_Pdf();
		$page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
// 		 $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4_LANDSCAPE);
		$pdf->pages[] = $page;
		// Image
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname='';
		for($i=0; $i<count($word); $i++) {
			if($i>0 && $i<(count($word)-1)) { $projname.='/'.$word[$i]; }
		}
		$image_name = "/var/www".$app."/images/logo.jpg";
		$image = Zend_Pdf_Image::imageWithPath($image_name);
		//$page->drawImage($image, 25, 770, 570, 820);
	
				$page->drawImage($image, 30, 770, 130, 820);
	$page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
	$page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
	$page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
	$page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal
	$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);

	

	
	$text = array("Number of Branch Offices",
		"Number of Members",
		"Number of Active Members",
		"Number of Inactive Members",
		"Number of Loan Accounts","Total Figure of Loans Amount","Total Amount of Loans Disbursed","Total Amount of Loans Repaid","The Rate of Loan Repayment","The Amount of Loan Outstanding Details (LoanDisbursed - LoanRepaid)","The Rate of Loan Outstanding Details","Total Number of Funders","Total Number of Fundings by Funders","Amount of Fundings funded for  are");
		
	$x0 = 60; 
	$x1 = 60; 
	$x2 = 60; 
	$x3 = 60;
	$x4 = 60;
	$x5 = 60;
	$x6 = 60;
	$x7 = 60;
	$x8 = 60;
	$x9 = 60;
	$x10 = 60;
	$x11 = 60;
	$x12 = 60;
	$x13 = 60;
	$x14 = 60;
	$x15 = 400;
	$x16 = 400;
	$x17 = 400;
	$x18 = 400;
	$x19 = 400;
	$x20 = 400;
	$x21 = 400;
	$x22 = 400;
	$x23 = 400;
	$x24 = 400;
	$x25 = 400;
	$x26 = 400;
	$x27 = 400;
	$x28 = 400;


	$page->drawText($text[0], $x0, 725);
	$page->drawText($text[1], $x1, 700);
	$page->drawText($text[2], $x2, 675);
	$page->drawText($text[3], $x3, 650);
	$page->drawText($text[4], $x4, 625);
	$page->drawText($text[5], $x5, 600);
	$page->drawText($text[6], $x6, 575);
	$page->drawText($text[7], $x7, 550);
	$page->drawText($text[8], $x8, 525);
	$page->drawText($text[9], $x9, 500);
	$page->drawText($text[10], $x10, 475);
	$page->drawText($text[11], $x11, 450);
	$page->drawText($text[12], $x12, 425);
	$page->drawText($text[13], $x13, 400);

		$summary= new Summarymfi_Model_Summary();
		$members = $summary->inactiveMemberDetails();
		$allmembers = $summary->allMembers();
        $activemember = $summary->activeMembers();
        $inactivemembers = $summary->inactiveMembers();
        $savingaccounts = $summary->savingAccounts();
        $loanaccounts = $summary->loanAccounts();
        $totalloans = $summary->totalLoans();
        $loandisburse = $summary->loanDisburse();
        $loanrepay = $summary->loanRepay();
        $rateloan = $summary->rateLoan();
        $Funders = $summary->funders();
        $Fundings = $summary->fundings();
        $totalfundings = $summary->totalFundings();
        $sql=$summary->query1();
        $sql1=$summary->query2();
        $sql2=$summary->query3();
        $this->view->savings = $members;
        $this->view->savings1 = $allmembers;
        $this->view->activeMembers = $activemember;
        $this->view->inactiveMembers = $inactivemembers;
        $this->view->savingAccounts = $savingaccounts;
        $this->view->loanAccounts = $loanaccounts;
        $this->view->totalLoans = $totalloans;
        $this->view->loanDisburse = $loandisburse;
		$this->view->rateLoan = $rateloan;
		$funders=$summary -> funders();
        $fundings = $summary->fundings();
        $totalFundings = $summary->totalFundings();

		$this->view->totalFundings = $totalfundings;
		$this->view->loanRepay = $loanrepay;
		$datedet = $summary->inactiveMemberDetails();

		$y1 = 725;
		foreach($datedet as $savings1){
			$page->drawText($savings1['COUNT(name)'],$x15, $y1);
                $y1 = $y1 - 25;
		}
		foreach($allmembers as $allmembers){
			$page->drawText($allmembers['COUNT(id)'],$x16, $y1);
			$y1 = $y1 - 25;
		}
 		foreach($activemember as $activemember){
			$page->drawText($activemember['COUNT(id)'],$x17, $y1);
		$y1 = $y1 - 25;

		} 
		foreach($inactivemembers as $inactivemembers){
			$page->drawText($inactivemembers['COUNT(id)'],$x18, $y1);
		$y1 = $y1 - 25;

		} 
		foreach($loanaccounts as $loanaccounts){
			$page->drawText($loanaccounts['COUNT(name)'],$x19, $y1);
		$y1 = $y1 - 25;

		}
		foreach($totalloans as $totalloans){
			$page->drawText($totalloans['SUM(loan_amount)'],$x20, $y1);
		$y1 = $y1 - 25;

		}
		
		foreach($loandisburse as $loandisburse){
			$page->drawText($loandisburse['SUM(amount_disbursed)'],$x21, $y1);
		$y1 = $y1 - 25;

		}
		foreach($loanrepay as $loanrepay){
			$page->drawText($loanrepay['SUM(paid_amount)'],$x22, $y1);
		$y1 = $y1 - 25;

		}
		foreach($sql1 as $rateofRepay) {
			$page->drawText($rateofRepay->rate,$x23, $y1);
		$y1 = $y1 - 25;
		}
		foreach($sql as $loanDetails1){ 
			$page->drawText($loanDetails1->test,$x24, $y1);

		$y1 = $y1 - 25;

}

		 foreach($sql2 as $rateofRepay){
			$page->drawText($rateofRepay->paid,$x25, $y1);
		$y1 = $y1 - 25;

		}
		foreach($funders as $Funders){
			$page->drawText($Funders['COUNT(DISTINCT(name))'],$x26, $y1);
		$y1 = $y1 - 25;

		}
		foreach($fundings as $Fundings){
			$page->drawText($Fundings['COUNT(id)'],$x27, $y1);
		$y1 = $y1 - 25;

		}
 		foreach($totalFundings as $totalfundings){
			$page->drawText($totalfundings['SUM(amount)'],$x28, $y1);
			$y1 = $y1 - 25;
		}
//	$page->drawLine(60, 570, 550, 570);
//	$page->drawLine(60, 550, 550, 550);


	$totalAmount="0"; 
	$totaldebit="0"; 

		$pdfData = $pdf->render();
		
		$pdf->save('/var/www'.$projname.'/reports/summarymfi'.date('Y-m-d').'.pdf');
		$path = '/var/www'.$projname.'/reports/summarymfi'.date('Y-m-d').'.pdf';
		chmod($path,0777);
	}
	
	function reportdisplayAction() {
		$this->_helper->layout->disableLayout();
		$file1 = $this->_request->getParam('file');
		
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname='';
		for($i=0; $i<count($word); $i++) {
			if($i>0 && $i<(count($word)-1)) { $projname.='/'.$word[$i]; }
		}

                $this->view->filename = $projname."/reports/".$file1;
	}

}
