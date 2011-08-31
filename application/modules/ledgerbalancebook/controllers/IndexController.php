<?php
class Ledgerbalancebook_IndexController extends Zend_Controller_Action
{
    function init()
    {
	$this->view->pageTitle = "Ledger balancebook";
 	$this->view->title = "Reports";
    $this->view->type = "generalFields";
    $this->view->adm = new App_Model_Adm();
	$this->view->dateconvertor = new App_Model_dateConvertor();
	}

    function indexAction()
    {
	$path = $this->view->baseUrl();
	$this->view->form = $searchForm = new Ledgerbalancebook_Form_Search($path);
						$dateconvertor = new App_Model_dateConvertor();
            			$GeneralList = new Ledgerbalancebook_Model_Ledgerbookbalance();

      $officename = $GeneralList->getHier();
			foreach($officename as $officename){
				$searchForm->hierarchy->addMultiOption($officename['id'],$officename['type']);
			}
	if ($this->_request->isPost() && $this->_request->getPost('Search')) {
		$formData = $this->_request->getPost();

	if ($searchForm->isValid($formData)) { 
		$this->view->date1 = $this->_request->getParam('date1');
        $fromDate = $dateconvertor->mysqlformat($this->view->date1);
		$hierarchy=$this->_request->getParam('hierarchy');
		$branch = $this->_request->getParam('branch');
		$group = $this->_request->getParam('group');

        $this->view->ledegerList = $GeneralList->generalLedger($fromDate,$hierarchy,$branch);
        $this->view->ledegerListAssets = $GeneralList->generalLedgerAssets($fromDate,$hierarchy,$branch);
	}
	}
    }

    public function reportdisplayAction()
    {
	$this->_helper->layout->disableLayout();
	$file1 = $this->_request->getParam('file'); 
	$app = $this->view->baseUrl();
	$word=explode('/',$app);
	$projname = $word[1];
	$this->view->filename = "/".$projname."/reports/".$file1;    
    }
    
    public function pdfdisplayAction() 
    { 
	$GeneralList = new Ledgerbalancebook_Model_Ledgerbookbalance();
	$dateconvertor = new App_Model_dateConvertor();

	$fromDate = $dateconvertor->mysqlformat($this->_request->getParam('date1'));
            $this->view->ledegerList = $GeneralList->generalLedger($fromDate);
            $this->view->ledegerListAssets = $GeneralList->generalLedgerAssets($fromDate);
            $this->view->date1 = $this->_request->getParam('date1');

			$datedet = $GeneralList->generalLedger($fromDate);
			$this->view->ledgedatlist = $datedet;

			$datedet1 = $GeneralList->generalLedgerAssets($fromDate);
			$this->view->ledegerListAssets = $datedet1;

		$pdf = new Zend_Pdf();
		$page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
		$pdf->pages[] = $page;
	
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
	$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
	
	$text = array("GL.LF no",
		"Liabilities",
		"Amount",
		"GL.LF no",
		"Assets","Amount");
		
	$x0 = 60; 
	$x1 = 150; 
	$x2 = 220; 
	$x3 = 300;
	$x4 = 380;
	$x5 = 460;
	
	$page->drawLine(50, 740, 550, 740);
	$page->drawLine(50, 720, 550, 720);
	$page->drawText($text[0], $x0, 725);
	$page->drawText($text[1], $x1, 725);
	$page->drawText($text[2], $x2, 725);
	$page->drawText($text[3], $x3, 725);
	$page->drawText($text[4], $x4, 725);
	$page->drawText($text[5], $x5, 725);
	$y1 = 700;
// 	$totalAmount="0"; 
// 	$totaldebit="0"; 
// 	$GeneralList = new Reports_Model_Ledgerbookbalance();
// 	$datedet = $GeneralList->generalLedger($fromDate);
	/*print_r($datedet);*/
	foreach($datedet as $savingsCredit) {
		$page->drawText('As of  '.date('d-m-Y'),480, 760);

		$page->drawText(''.$savingsCredit['glsubcode'],$x0, $y1);
		$page->drawText(''.$savingsCredit['subheader'],$x1, $y1);
		$page->drawText(''.$savingsCredit['liabilitiesBalance'],$x2, $y1);

//                 $totalAmount=$totalAmount+$savingsCredit->amount_to_bank;
//                 $totaldebit=$totaldebit+$savingsCredit->amount_from_bank;

                $y1 = $y1 - 25;
	}
	$page->drawText("TOTAL  ".$savingsCredit['liabilitiesBalance'],$x1,$y1);
// 	$page->drawText("$totalAmount",$x2,$y1);

	$y1 = $y1 + 25;
	foreach($datedet1 as $savingsDebit) {
		$page->drawText(''.$savingsDebit['glsubcode'],$x3, $y1);
		$page->drawText(''.$savingsDebit['subheader'],$x4, $y1);

//                 $totalAmount=$totalAmount+$savingsCredit->amount_to_bank;
//                 $totaldebit=$totaldebit+$savingsCredit->amount_from_bank;

                $y1 = $y1 - 25;
	}
	$page->drawText("TOTAL  ".$savingsDebit['assetsBalance'],$x4,$y1);
// 	$page->drawText("$totalAmount",$x2,$y1);
	
	$pdf->render();
	$pdf->save('/var/www/'.$projname.'/reports/ledgerbalancebook.pdf');
	$path = '/var/www/'.$projname.'/reports/ledgerbalancebook.pdf';
	chmod($path,0777);
    }
}