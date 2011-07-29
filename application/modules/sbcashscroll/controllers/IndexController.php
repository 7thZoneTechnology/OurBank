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

class Sbcashscroll_IndexController extends Zend_Controller_Action
{
 function init() 
    { 
        $this->view->pageTitle = "SB Supplementary";
        $this->view->type = "financialReports";
        $this->view->dateconvertor = new App_Model_dateConvertor();
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

    function indexAction() 
    {
        $searchForm = new Sbcashscroll_Form_Search();
        $this->view->form = $searchForm;
        
        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();
            $date = $this->_request->getParam('field1'); 
$mysqldate = $this->view->dateconvertor->mysqlformat($date);
            $formData = $this->_request->getPost();
//             if ($searchForm->isValid($formData)) {
                $this->view->savings = 10;
                $this->view->pageTitle = "SB Supplementary - As of ".$date;

                $transaction = new Sbcashscroll_Model_Sbcashscroll();

                //Saving Account Credit and Debit
                $this->view->savingsCredit = $transaction->totalSavingsCredit($mysqldate);
                $this->view->savingsDebit = $transaction->totalSavingsDebit($mysqldate);
// Zend_Debug::dump($this->view->savingsCredit);
                $this->view->field1 = $date;

//             }
         }
    }

    function reportdisplayAction() 
    {
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];

        $this->_helper->layout->disableLayout();
        $file1 = $this->_request->getParam('file'); 
        $this->view->filename = "/".$projname."/reports/".$file1;
    }


    function pdftransactionAction() 
    { 

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
        //$page->drawImage($image, 25, 770, 570, 820);
    
        $page->drawImage($image, 30, 770, 130, 820);
        $page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
        $page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
        $page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
        $page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal
        //set the font
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
    
        $text = array("SB Scroll",
                    "LF No.",
                    "Credit",
                    "Cash",
                    "Total",
                    "Debit",
                    "Transfer",
                    "A/C No.");

        $this->view->savings = 10;
        $page->drawText("Date : ".date('d-m-Y'),500, 800); //date('Y-m-d')
        $page->drawText("Date : ".date('d-m-Y'),500, 800); 
        $page->drawText($text[0],240, 780);$page->drawText($text[0],240, 780);

        $x1 = 60; 
        $x2 = 100; 
        $x3 = 200;
        $x4 = 240;
        $x5 = 310;
        $x6 = 340;
        $x7 = 440;
        $x8 = 500;
    
        $page->drawLine(50, 740, 550, 740);
        $page->drawLine(50, 720, 550, 720);

        $page->drawText($text[1], $x1, 725);
        $page->drawText($text[2], $x2, 725);
        $page->drawText($text[3], $x3, 725);
        $page->drawText($text[6], $x4, 725);
        $page->drawText($text[1], $x5, 725);
        $page->drawText($text[5], $x6, 725);
        $page->drawText($text[3], $x7, 725);
        $page->drawText($text[6], $x8, 725);
    

    
        $y1 = 710;
        $y2 = 710;

        $this->view->savings = 10;
        $transaction = new Sbcashscroll_Model_Sbcashscroll();

        $date = $this->_request->getParam('field1'); 
        $this->view->field1 = $date;

        $mysqldate = $this->view->dateconvertor->mysqlformat($date);

        $this->view->savingsCredit = $savingsCredit = $transaction->totalSavingsCredit($mysqldate);
        $this->view->savingsDebit = $savingsDebit = $transaction->totalSavingsDebit($mysqldate);


        $totalCredit = "0";
        $totalTransferCredit = "0";
        $totalDebit = "0";
        $totalTransferDebit = "0";

        foreach($savingsCredit as $savingsCredit) {
            $page->drawText($savingsCredit->glsubcode_id_to,$x1, $y1);
            $page->drawText($savingsCredit->account_number,$x2, $y1);
            if($savingsCredit->paymenttype_id == 1) {
                $page->drawText($savingsCredit->amount_to_bank,$x3, $y1);
                $totalCredit = $totalCredit + $savingsCredit->amount_to_bank;
            } elseif($savingsCredit->paymenttype_id == 5) {
                $page->drawText($savingsCredit->amount_to_bank,$x4, $y1);
                $totalTransferCredit = $totalTransferCredit + $savingsCredit->amount_to_bank; 
            }
            $y1 = $y1 - 15;
        }
        foreach($savingsDebit as $savingsDebit) {
            $page->drawText($savingsDebit->glsubcode_id_to,$x5, $y2);
            $page->drawText($savingsDebit->account_number,$x6, $y2);
            if($savingsDebit->paymenttype_id == 1) {
                $page->drawText($savingsDebit->amount_from_bank,$x7, $y2);
                $totalDebit = $totalCredit + $savingsDebit->amount_from_bank;
            } elseif($savingsDebit->paymenttype_id == 5) {
                $page->drawText($savingsDebit->amount_from_bank,$x8, $y2);
                $totalTransferDebit = $totalTransferDebit + $savingsDebit->amount_from_bank; 
            }
            $y2 = $y2 - 15;
        }
    
        $page->drawLine(50, $y1, 550, $y1);
        $page->drawLine(50, $y1 -20, 550, $y1 -20);
    
        $page->drawText($text[4], $x1, $y1 -15);$page->drawText($text[4], $x1, $y1 -15);
        $page->drawText(sprintf("%4.2f", $totalCredit), $x3, $y1 -15);
        $page->drawText(sprintf("%4.2f", $totalCredit), $x3, $y1 -15);
        $page->drawText(sprintf("%4.2f", $totalTransferCredit), $x4, $y1 -15);
        $page->drawText(sprintf("%4.2f", $totalTransferCredit), $x4, $y1 -15);
        $page->drawText($text[4], $x5, $y1 -15); $page->drawText($text[4], $x5, $y1 -15);
        $page->drawText(sprintf("%4.2f", $totalDebit), $x7, $y1 -15);
        $page->drawText(sprintf("%4.2f", $totalDebit), $x7, $y1 -15);
        $page->drawText(sprintf("%4.2f", $totalTransferDebit), $x8, $y1 -15);
        $page->drawText(sprintf("%4.2f", $totalTransferDebit), $x8, $y1 -15);
    


        // Virtual table
        $page->setLineWidth(1)->drawLine(50, $y1 - 20, 50, 740); //Table left vertical
        $page->setLineWidth(1)->drawLine(300, $y1 - 20, 300, 740); //Table center vertical
        $page->setLineWidth(1)->drawLine(550, $y1 - 20, 550, 740); //table rigth vertical
    
        $pdfData = $pdf->render();
        
        $pdf->save('/var/www/'.$projname.'/reports/sbcashscroll.pdf');
	$path = '/var/www/'.$projname.'/reports/sbcashscroll.pdf';

        chmod($path,0777);

    }
    
}
