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
/* create an Transferscroll controller for search filtered values and pdf  ss*/
class Transferscroll_IndexController extends Zend_Controller_Action
{
    function init() 
    { 
        $this->view->pageTitle = $this->view->translate("Transfer scroll");
	$this->view->type = "financialReports";
	$this->view->title =  $this->view->translate('Reports');
	$this->view->adm = new App_Model_Adm();
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
	//view action
    function indexAction() 
    {
        $searchForm = new Transferscroll_Form_Search();
        $this->view->form = $searchForm;

        $villageoffice = new Transferscroll_Model_Transferscroll();
        $officename = $this->view->adm->viewRecord("ourbank_officehierarchy","id","DESC");
			foreach($officename as $officename){
				$searchForm->branch->addMultiOption($officename['id'],$officename['type']);
			}

        //get poster and validate
        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();
	$dateconvertor = new App_Model_dateConvertor();

	$fromDate = $dateconvertor->mysqlformat($this->_request->getParam('datefrom'));
	$Date = $dateconvertor->mysqlformat($fromDate);
        $branchid = $this->_request->getParam('branch');
        $this->view->field1 = $fromDate;
        $this->view->branchid = $branchid;

	
            $formData = $this->_request->getPost();
                $this->view->savings = 10;
                $this->view->pageTitle = "Transfer scroll";

                $dbobj = new Transferscroll_Model_Transferscroll();
                //Saving Account Credit and Debit
                $this->view->savingsCredit = $dbobj->totalSavingsCredit($fromDate,$branchid);
                $officename=$dbobj-> officename($branchid);
                $this->view->officename=$officename[0]['officename'];
                $this->view->savingsDebit = $dbobj->totalSavingsDebit($fromDate,$branchid);
 
              $this->view->field1 = $this->_request->getParam('datefrom');
         }
    }

	//pdf view action
    function reportdisplayAction() 
    {
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];

        $this->_helper->layout->disableLayout();
        $file1 = $this->_request->getParam('file'); 
        $this->view->filename = "/".$projname."/reports/".$file1;
    }

	//pdf action
    function pdftransactionAction() 
    { 
            //rupees right alignment
            function position($amt,$posValue) {
                      $len=strlen($amt);
                      $pos=($posValue-35)-($len*4);
                      return $pos;
               }

	$dateconvertor = new App_Model_dateConvertor();
        $pdf = new Zend_Pdf();
        $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
        $pdf->pages[] = $page;
        //Path
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
        // Image
        $image_name = "/var/www/".$projname."/public/images/logo.jpg";
        $image = Zend_Pdf_Image::imageWithPath($image_name);
    
        $page->drawImage($image, 30, 770, 130, 820);
        $page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
        $page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
        $page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
        $page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal

        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 9);

        $page->drawText("Transfer Scroll",270, 780);
        $page->drawText("Transfer Scroll",270, 780);

        //set the font
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
        $y1=745;
        $page->drawText("Credit",50,$y1);
        $page->drawText("Debit",310,$y1); 

	$fromDate = $dateconvertor->mysqlformat($this->_request->getParam('date'));
	$date = $dateconvertor->mysqlformat($fromDate);
        $branchid = $this->_request->getParam('office');
        $this->view->field1 = $this->_request->getParam('date');
        $this->view->branchid = $branchid;

        $y1=745;	$y2=740;
        $page->drawText("As of From ".$fromDate,465,$y1);//For Top Header

        $text = array("",
                    "Sl No.",
                    "Credit",
                    "Amount",
                    "Total",
                    "Debit");
// As of From ".$this->_request->getParam('date')
        $this->view->savings = 10;
        $page->drawText("Date : ".date('d-m-Y'),500, 800); //date('Y-m-d')
//         $page->drawText("Date : ".date('d-m-Y'),500, 800); 
        $page->drawText($text[0],240, 780);$page->drawText($text[0],240, 780);


        $x1 = 60; 
        $x2 = 120; 
        $x3 = 275;
        $x4 = 340;
        $x5 = 400;
        $x6 = 575;

        $page->drawLine(50, 740, 550, 740);
        $page->drawLine(50, 720, 550, 720);

        $page->drawText($text[1], $x1, 725);
        $page->drawText($text[2], $x2, 725);
        $page->drawText($text[3], 220, 725);
        $page->drawText($text[1], $x4, 725);
        $page->drawText($text[5], $x5, 725);
        $page->drawText($text[3], 500, 725);
    
        $y1 = 710;
        $y2 = 710;


       $transaction = new Transferscroll_Model_Transferscroll();

        $this->view->savingsCredit = $transaction->totalSavingsCredit($date,$branchid);
                $officename=$transaction-> officename($branchid);
                $this->view->officename=$officename[0]['officename'];
        $this->view->savingsDebit = $transaction->totalSavingsDebit($date,$branchid);

        //Saving Account Credit and Debit
        $savingsCredit = $transaction->totalSavingsCredit($date,$branchid);
        $savingsDebit = $transaction->totalSavingsDebit($date,$branchid);

         $amountCredit = "0";
         $amountDebit = "0";
         $i = 0;
         $j = 0;


        foreach($savingsCredit as $savingsCredit) {
            $i++;
            $page->drawText($i,$x1, $y1);
            $page->drawText($savingsCredit->account_number,$x2, $y1);
               $pos=position(sprintf("%4.2f",$savingsCredit->amount_to_bank),$x3);
               $page->drawText(sprintf("%4.2f",$savingsCredit->amount_to_bank),$pos+2,$y1);
//             $page->drawText($savingsCredit->amount_to_bank,$x3, $y1);
            $amountCredit = $amountCredit + $savingsCredit->amount_to_bank;
            $y1 = $y1 - 15;
        }
        foreach($savingsDebit as $savingsDebit) {
            $j++;
            $page->drawText($j,$x4, $y2);
            $page->drawText($savingsDebit->account_number,$x5, $y2);
//             $page->drawText($savingsDebit->amount_from_bank,$x6, $y2);
               $pos=position(sprintf("%4.2f",$savingsDebit->amount_from_bank),$x6);
               $page->drawText(sprintf("%4.2f",$savingsDebit->amount_from_bank),$pos+2,$y2);
            $amountDebit = $amountDebit + $savingsDebit->amount_from_bank;
            $y2 = $y2 - 15; 
        }
       

//         $page->drawLine(50, $y1 -20, 550, $y1 -20);
//         $page->drawLine(50, $y1, 550, $y1);

        $page->drawLine(50, $y1 = $y1 - 20, 550, $y1);
        $page->drawLine(50, $y1 -20, 550, $y1-20);

    
        $page->drawText($text[4], $x1, $y1 -15);$page->drawText($text[4], $x1, $y1 -15);
        $page->drawText(sprintf("%4.2f", $amountCredit), $x3, $y1 -15);
        $page->drawText(sprintf("%4.2f", $amountCredit), $x3, $y1 -15);
        $page->drawText($text[4], $x4, $y1 -15); $page->drawText($text[4], $x4, $y1 -15);
               $pos=position(sprintf("%4.2f",$amountDebit),$x6);
               $page->drawText(sprintf("%4.2f",$amountDebit),$pos+2,$y1 -15);
//         $page->drawText(sprintf("%4.2f", $amountDebit), $x6, $y1 -15);
//         $page->drawText(sprintf("%4.2f", $amountDebit), $x6, $y1 -15);
    
        // Virtual table
        $page->setLineWidth(1)->drawLine(50, $y1 - 20, 50, 740); //Table left vertical
        $page->setLineWidth(1)->drawLine(300, $y1 - 20, 300, 740); //Table center vertical
        $page->setLineWidth(1)->drawLine(550, $y1 - 20, 550, 740); //table rigth vertical
    
        $pdfData = $pdf->render();
	//folder path
        $pdf->save('/var/www/'.$projname.'/reports/transferscroll.pdf');
	$path = '/var/www/'.$projname.'/reports/transferscroll.pdf';
    
        chmod($path,0777);

    }
}
