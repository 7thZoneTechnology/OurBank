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
class Loanledger_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
    	$this->view->title = "Reports";
	$this->view->pageTitle = "Loans ledger";
        $this->view->type = "generalFields";
        $this->view->loanModel = new Loanledger_Model_loandetails();
        $this->view->cl = new App_Model_Users ();
        $this->view->adm = new App_Model_Adm ();
		$globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];
	
	$storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }
    }

    public function indexAction() 
    {
	$loansearch = new Loandetailsg_Form_Search();
	$this->view->form = $loansearch;
// 	$loantransactions = new Loandisbursmentg_Model_loan();
    }

    public function loandetailsAction() 
    {
	$this->view->accNum=$this->_request->getParam('accNum');
	$this->view->details = $this->view->loanModel->searchaccounts($this->_request->getParam('accNum'));
	$this->view->tran = $this->view->loanModel->loanInstalments($this->_request->getParam('accNum'));
	$this->view->paid = $this->view->loanModel->paid($this->_request->getParam('accNum'));
	$this->view->unpaid = $this->view->loanModel->unpaid($this->_request->getParam('accNum'));
    }

	public function reportdisplayAction() 
    {
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
        $this->_helper->layout->disableLayout();
        $file1 = $this->_request->getParam('file'); 
        $this->view->filename = "/".$projname."/reports/".$file1;
    }

	 function pdfdisplayAction()
    {	
	$convertdate = new App_Model_dateConvertor();
//  echo '<pre>'; print_r($this->_request->getParam('accNum'));
	$this->view->details = $this->view->loanModel->searchaccounts($this->_request->getParam('accNum')); //echo '<pre>'; print_r($this->view->details);
	$this->view->tran = $this->view->loanModel->loanInstalments($this->_request->getParam('accNum'));
	$this->view->paid = $this->view->loanModel->paid($this->_request->getParam('accNum'));
	$this->view->unpaid = $this->view->loanModel->unpaid($this->_request->getParam('accNum'));

// 		$loansearch = new Loandetailsg_Form_Search();
// 		$loantransactions = new Loandisbursmentg_Model_loan();

		 $app = $this->view->baseUrl();
         $word=explode('/',$app);
         $projname = $word[1];

         $pdf = new Zend_Pdf();
         $page = new Zend_Pdf_Page(Zend_Pdf_Page::SIZE_A4);
         $pdf->pages[] = $page;
            // Image
         $image_name = "/var/www/".$projname."/public/images/logo.jpg";
         $image = Zend_Pdf_Image::imageWithPath($image_name);

		 $page->drawImage($image, 30, 770, 130, 820);
		 $page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
		 $page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
		 $page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
		 $page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal
		 $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
		 $font = Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA);
		
        $page->drawText('( LOAN LEDGER )', 237, 780);
		$text = array("Member details");

	$x0 = 50;         $x3 = 310;
	$x1 = 150;
	$x2 = 220;
		
	$page->drawLine(50, 740, 290, 740);
	$page->drawLine(50, 720, 290, 720);
	$page->drawText($text[0], 90, 727);

	$y1 = 700;

	foreach($this->view->details as $details) {
		$page->drawText('Name  : '.$details->name,$x0, $y1);
		$y1 = $y1-20;
		$page->drawText('Branch  : '.$details->officename,$x0, $y1);
		 $y1 = $y1-20;
		$page->drawText('Code  : '.$details->code,$x0, $y1);
		 $y1 = $y1-20;
		$page->drawText('Account code  : '.$details->number,$x0, $y1);
		
	$text1 = array("Loan details");
	$y1 = $y1 - 25;
	$page->drawLine(50, $y1, 290, $y1);
	$y1 = $y1 - 20;
	$page->drawLine(50, $y1, 290, $y1); $y1 = $y1 + 7;
	$page->drawText($text1[0], 90, $y1);

	$y1 = $y1-25;
		$page->drawText('Loan name  : '.$details->loanname,$x0, $y1);
	$y1 = $y1-20;
		$page->drawText('Loan amount R$  : '.$details->amount,$x0, $y1);
	$y1 = $y1-20;
		$page->drawText('Interest rate %  : '.$details->interest,$x0, $y1);
	$y1 = $y1-20;
		$page->drawText('Installments  : '.$details->installments,$x0, $y1);
	$y1 = $y1-20;
		$page->drawText('Sanctioned date  : '.$details->sanctioned,$x0, $y1);
	$y1 = $y1-20;
	
	}
	
	$y1=740;
	$text2 = array("Installment status        No          Amount");
	$page->drawLine(310, $y1, 550, $y1);
	$y1 = $y1 - 20;
	$page->drawLine(310, $y1, 550, $y1); $y1 = $y1 + 7;
	$page->drawText($text2[0], $x3, $y1);

	foreach($this->view->paid as $paid) {
	$y1 = $y1-25;
		$page->drawText('Paid',320, $y1);
		$page->drawText($paid->paidCount,390, $y1);
		$page->drawText($paid->paidAmt,420, $y1);
		
	} foreach ($this->view->unpaid as $unpaid){
	$y1 = $y1-20;
		$page->drawText('Due',320, $y1);
		$page->drawText($unpaid->unpaidCount,390, $y1);
		$page->drawText($unpaid->unpaidAmt,430, $y1);
		
	}
	$y1 = 480;
	$text3 = array("GL.LF no            Transaction date           Creidt               Debit                      Payment mode              Transacted by ");
		$page->drawLine(50, $y1, 550, $y1);
		$y1 = $y1 - 20;
		$page->drawLine(50, $y1, 550, $y1);$y1 = $y1 + 7;
		$page->drawText($text3[0], $x0, $y1);
		foreach($this->view->tran as $transaction){
		$y1 = $y1-20;
		$page->drawText($transaction->id,60, $y1);
		$page->drawText($transaction->date,120, $y1);	
		$page->drawText($transaction->cr,160, $y1);
		$page->drawText($transaction->dt,250, $y1);	
		$page->drawText($transaction->mode,330, $y1);
		$page->drawText($transaction->name,420, $y1);
		$y1 = $y1 - 5;
		$page->drawLine(50, $y1, 550, $y1);
		}
			$pdf->pages[] = $page;
            $pdfData = $pdf->render();
            $pdf->save('/var/www/'.$projname.'/reports/loanledger.pdf');
            $path = '/var/www/'.$projname.'/reports/loanledger.pdf';
            chmod($path,0777);

	}
 }
