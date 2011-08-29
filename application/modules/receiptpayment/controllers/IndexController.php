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
        $path = $this->view->baseUrl();



        $searchForm = new Receiptpayment_Form_Search($path);
        $this->view->form = $searchForm;
  $officename = $this->view->adm->viewRecord("ourbank_officehierarchy","id","ASC");
			foreach($officename as $officename){
				$searchForm->hierarchy->addMultiOption($officename['id'],$officename['type']);
			}



	$this->view->title = "Receipts and payments";
	 if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();

	$dateconvertor = new App_Model_dateConvertor();
	$fromDate =$Date= $dateconvertor->mysqlformat($this->_request->getParam('field1'));
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

                //to display the cash ledger details
                $this->view->cashcredit= $transaction->cashdetailscredit($fromDate);
                $this->view->cashdebit= $transaction->cashdetailsdebit($toDate);

                $this->view->field1 = $this->_request->getParam('field1');
                $this->view->field2 = $this->_request->getParam('field2');

            }
         }

 
	
	}


    function pdftransactionAction() 
    {
	$dateconvertor = new App_Model_dateConvertor();
	$fromDate = $dateconvertor->mysqlformat($this->_request->getParam('field1'));
	$toDate = $dateconvertor->mysqlformat($this->_request->getParam('field2'));
        $this->view->field1 = $this->_request->getParam('field1');
        $this->view->field2 = $this->_request->getParam('field2');

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




//         $fromdate = $this->_request->getParam('fdate');
//         $dateconvertor = new App_Model_dateConvertor();
//         $Date = $dateconvertor->mysqlformat($fromdate);	
//         $this->view->fdate = $Date;
//         $asofDate = $dateconvertor->normalformat($fromdate);
//         $this->view->asofdate = $asofDate;
//         $incomeexpenditure = new Incomeexpenditure_Model_Incomeexpenditure();
//         $this->view->income=$income=$incomeexpenditure->incomedetails($Date); 
//         $this->view->incomeheader=$income1=$incomeexpenditure->incomedetails1($Date);
//         $this->view->expenditure=$expenditure=$incomeexpenditure->expendituredetails($Date);
//         $this->view->expenditureheader=$expenditure1=$incomeexpenditure->expendituredetails1($Date);

        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname='';
        for($i=0; $i<count($word); $i++){
                if($i>0 && $i<(count($word)-1)) { $projname.='/'.$word[$i]; }
        }
        $pdf = new Zend_Pdf();
        $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
        $pdf->pages[] = $page;
        // Image
        $image_name = "/var/www/".$projname."/public/images/logo.jpg";
        $image = Zend_Pdf_Image::imageWithPath($image_name);
        //$page->drawImage($image, 25, 770, 570, 820);
        $page->drawImage($image, 20, 780, 120, 830);
        $page->setLineWidth(1)->drawLine(20, 20, 580, 20); //bottom horizontal
        $page->setLineWidth(1)->drawLine(20, 20, 20, 830); //left vertical
        $page->setLineWidth(1)->drawLine(580, 25, 580, 830); //right vertical
        $page->setLineWidth(1)->drawLine(20, 830, 580, 830); //top horizontal
        $x1 = 45; 
        $x2 = 250; 
        $x3 = 330;
        $x4 = 500;

        $my = 735;
        $y1 = 710;
        $y2 = 710;
        $totalincome=0;$totalexpe=0;
        //set the font
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
        $text = array($this->view->translate('Receipt and Payment'),
                    $this->view->translate('Particulars'), 
                    $this->view->translate('Amount'),
                    $this->view->translate('Payment'), 
                    $this->view->translate('Amount'), 
                    $this->view->translate('Opening Balance'),
                    $this->view->translate('Closing Balance'),
                    $this->view->translate('Total'),
                    $this->view->translate('Total'));
       // $criteria = $this->view->translate('As of')." ".$asofDate;
       // $currency = "* ".$this->view->translate('Amount in Rs');

 // // // file:///var/www/IDF/application/modules/incomeexpenditure/controllers/IndexController.php

                /*$page->drawText("Date : ".date('d/m/Y'),500, 800); //date('Y-m-d')
                $page->drawText("Date : ".date('d/m/Y'),500, 800);*/ 
                $page->drawText($text[0],185, 780);
                $page->drawText($text[0],185, 780);

                $page->drawText($criteria,500, 780); //Search criteria
                $page->drawText($criteria,500, 780);

                $page->drawText($currency,500, 770); //Currency
                $page->drawText($currency,500, 770); 

                $page->drawText($text[1],$x1, $my);
                $page->drawText($text[2],$x2, $my);
                $page->drawText($text[3],$x3, $my);
                $page->drawText($text[4],$x4, $my);

                $page->drawLine(30, 750, 570, 750);
                $page->drawLine(30, 730, 570, 730);

                foreach($income1 as $income1) {
                    $page->drawText($income1['header'],$x1, $y1);
                foreach($income as $income) {
                    $page->drawText( $income['credit'],$x2, $y1);
                    $totalincome +=$income['credit'];

                    $y1 = $y1 - 15;
                } }

                foreach($expenditure1 as $expe1) {
                foreach($expenditure as $expe) {
                        $page->drawText($expe1['header'],$x3, $y2);
                        $page->drawText( $expe['credit'],$x4, $y2);
                        $totalexpe +=$expe['credit'];

                    $y2 = $y2 - 15;
                } }


                $page->drawLine(30, $y1, 570, $y1);
                $page->drawLine(30, $y1 -20, 570, $y1 -20);

                $page->drawText($text[5], $x1, $y1 -15);
                $page->drawText(sprintf("%4.2f",$totalincome),$x2, $y1 -15);

                $page->drawText($text[5], $x3, $y1 -15);
                $page->drawText(sprintf("%4.2f",$totalexpe),$x4, $y1 -15);

                // Virtual table
                $page->setLineWidth(1)->drawLine(30, $y1 - 20, 30, 750); //Table left vertical
                $page->setLineWidth(1)->drawLine(300, $y1 - 20, 300, 750); //Table center vertical
                $page->setLineWidth(1)->drawLine(570, $y1 - 20, 570, 750); //table rigth vertical
                $pdfData = $pdf->render();
                $account_number = $Date;
// 		$pdf->save('/var/www/ourbank/reports/incomeexpenditure.pdf');
                //$path = '/var/www/ourbank/reports/incomeexpenditure.pdf';
                $pdf->save('/var/www/'.$projname.'/reports/'.$account_number.'ReceiptsPayments.pdf');
                $path = '/var/www/'.$projname.'/reports/'.$account_number.'ReceiptsPayments.pdf';
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
