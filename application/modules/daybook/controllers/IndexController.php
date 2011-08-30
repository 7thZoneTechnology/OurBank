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
/*
 *  create an cashscroll controller for view and pdf
 */
class Daybook_IndexController extends Zend_Controller_Action
{
    public function init() 
    { 
        $this->view->pageTitle = $this->view->translate("Daybook");
        $this->view->title =  $this->view->translate('Reports');
        $this->view->type = $this->view->translate("financialReports");
$this->view->adm = new App_Model_Adm();
    }
	//view action
    public function indexAction() 
    {

        $path = $this->view->baseUrl();

        $searchForm = new Cashscroll_Form_Search($path);
        $this->view->form = $searchForm;
//         $sample = new Reports_Form_Sample();
//         $this->view->sample = $sample;

                $transaction = new Daybook_Model_Daybook();

    $officename = $transaction->getHier();
			foreach($officename as $officename){
				$searchForm->hierarchy->addMultiOption($officename['id'],$officename['type']);
			}
       		if ($this->_request->isPost() && $this->_request->getPost('Search')) {
//         if ($searchForm->isValid($formData)) {
$dateconvert= new App_Model_dateConvertor();


     
       $fromDate = $dateconvert->mysqlformat($this->_request->getParam('datefrom'));
$this->view-> date1 =$fromDate;

       $toDate = $dateconvert->mysqlformat($this->_request->getParam('dateto'));
$this->view-> date2 =$toDate;

 		$branch=$this->_request->getParam('branch');
 		$group=$this->_request->getParam('group');
			$officename=$transaction->getOffice($branch);
foreach ($officename as $officename) {
$this->view-> name =$officename['name'];
}
 	$group=$this->_request->getParam('group');
/*
        $this->view->field1 = $fromDate;
        $this->view->branchid = $branchid;
	$fromDate = $dateconvertor->mysqlformat($fromDate);

            $title1 = $this->view->translate("Cash Scroll");
            $this->view->pageTitle = $title1;
            $formData = $this->_request->getPost();
                $this->view->savings = 10;*/
if ($group=="") {
                //Saving Account Credit and Debit
                $this->view->savingsCredit = $transaction->totalSavingsCredit($fromDate,$toDate,$branch);
           //     $officename=$transaction-> officename($branchid);
                $this->view->savingsDebit = $transaction->totalSavingsDebit($fromDate,$toDate,$branch);
}else {
  $this->view->savingsCredit = $transaction->totalSavingsCreditg($fromDate,$toDate,$group);
          //      $officename=$transaction-> officename($branchid);
                $this->view->savingsDebit = $transaction->totalSavingsDebitg($fromDate,$toDate,$group);

                // Opening Balance
                $osc = $transaction->openingBalanceg($fromDate,$toDate,$group);
                foreach($osc as $osc1) {
                $this->view->openingBalance = $osc1["openingBalance"];
                }
                if((!$this->view->savingsCredit) && (!$this->view->savingsDebit)){
                                echo "<font color='red'><b> Record not found</b> </font>";
                }
            
         }
    } }
	//report display
    public function sublevelAction() 
    {
        $path = $this->view->baseUrl();

        $this->_helper->layout()->disableLayout();
$searchForm = new Cashscroll_Form_Search($path);
        $this->view->form = $searchForm;

             $hierarchy=$this->view->hierarchy = $this->_request->getParam('hierarchy');
        		$cashscroll = new Cashscroll_Model_Cashscroll();
            $officelevel = $cashscroll->subofficeFromUrl($hierarchy);
  foreach($officelevel as $officetype) { 
        $searchForm->branch->addMultiOption($officetype->id,$officetype->name);
        }
    }
  public function groupAction() 
    {
        $path = $this->view->baseUrl();

        $this->_helper->layout()->disableLayout();
$searchForm = new Cashscroll_Form_Search($path);
        $this->view->form = $searchForm;

             $branch=$this->view->hierarchy = $this->_request->getParam('branch');
        		$cashscroll = new Cashscroll_Model_Cashscroll();
            $officelevel = $cashscroll->subgroupFromUrl($branch);
  foreach($officelevel as $officetype) { 
        $searchForm->group->addMultiOption($officetype->id,$officetype->name);
        }
    }

	//report display
    public function reportdisplayAction() 
    {
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
	//disable layout
        $this->_helper->layout->disableLayout();
        $file1 = $this->_request->getParam('file'); 
        $this->view->filename = "/".$projname."/reports/".$file1;
    }

     //pdf transaction
    public function pdftransactionAction() 
    { 
            //rupees right alignment
            function position($amt,$posValue) {
                      $len=strlen($amt);
                      $pos=($posValue-35)-($len*4);
                      return $pos;
               }

        $fromDate = $this->_request->getParam('date');
        $branchid = $this->_request->getParam('office');
        $this->view->field1 = $fromDate;
        $this->view->branchid = $branchid;

//         $fromDate = $this->_request->getParam('field1'); 
//         $this->view->field1 = $fromDate;
	//date format instance
	$dateconvertor = new App_Model_dateConvertor();
	$cfromDate = $dateconvertor->mysqlformat($fromDate);
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

        $page->drawText("Cash Scroll",270, 780);
        $page->drawText("Cash Scroll",270, 780);

        //set the font
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
        $y1=745;
        $page->drawText("Credit",50,$y1);
        $page->drawText("Debit",310,$y1);

        $y1=745;	$y2=740;
        $page->drawText("As of From ".$fromDate,465,$y1);//For Top Header
        $text = array("",
                    "SL No.",
                    "Particulars",
                    "Amount",
                    "Total",
                    "Particulars",
                    "Opening Cash",
                    "Closing Cash");
        $this->view->savings = 10;
        $page->drawText("Date : ".date('d-m-Y'),500, 800); //date('Y-m-d')
//         $page->drawText("Date : ".date('d-m-Y'),500, 800); 
        $page->drawText($text[0],240, 780);$page->drawText($text[0],240, 780);

        $x1 = 60; 
        $x2 = 120; 
        $x3 = 310;
        $x4 = 315;
        $x5 = 390;
        $x6 = 570;
    
        $page->drawLine(50, 740, 550, 740);
        $page->drawLine(50, 720, 550, 720);

        $page->drawText($text[1], $x1, 725);
        $page->drawText($text[2], $x2, 725);
        $page->drawText($text[3], 250, 725);
        $page->drawText($text[1], $x4, 725);
        $page->drawText($text[5], $x5, 725);
        $page->drawText($text[3], 510, 725);
    
        $y1 = 710;
        $y2 = 710;



        $transaction = new Cashscroll_Model_Cashscroll();

        $this->view->savings = 10;

        $this->view->savingsCredit = $transaction->totalSavingsCredit($cfromDate,$branchid);
        $this->view->savingsDebit = $transaction->totalSavingsDebit($cfromDate,$branchid);

        //Credit and Debit
        $savingsCredit = $transaction->totalSavingsCredit($cfromDate,$branchid);
        $savingsDebit = $transaction->totalSavingsDebit($cfromDate,$branchid);
       // Opening Cash 
        $openingBalance = 0; 
        $osc = $transaction->openingBalance($cfromDate,$branchid);
        foreach($osc as $osc1) {
            $openingBalance = $osc1->openingBalance;
        }



        $this->view->openingBalance = $openingBalance;

        $amountCredit = "0";
        $amountDebit = "0";
        $i = 0; $j=0;

        foreach($savingsCredit as $savingsCredit) {
            $i++;
            $page->drawText($i,$x1, $y1);
            $page->drawText($savingsCredit->account_number,$x2, $y1);
//             $page->drawText($savingsCredit->amount_to_bank,$x3, $y1);
               $pos=position(sprintf("%4.2f",$savingsCredit->amount_to_bank),$x3);
               $page->drawText(sprintf("%4.2f",$savingsCredit->amount_to_bank),$pos+2,$y1);
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
       
        $page->drawLine(50, $y1, 550, $y1);
        //opening balnce
        $page->drawText($text[6], $x1, $y1 - 10);
//         $page->drawText(sprintf("%4.2f", $openingBalance), $x3, $y1 -10);
               $pos=position(sprintf("%4.2f",$openingBalance),$x3);
               $page->drawText(sprintf("%4.2f",$openingBalance),$pos+2,$y1 -10);

        //closing Balance
        $page->drawText($text[7], $x4, $y1 -10); 
//         $page->drawText(sprintf("%4.2f", ( $sum = ($amountCredit + $openingBalance) - $amountDebit)), $x6, $y1 -10);
               $pos=position(sprintf("%4.2f",( $sum = ($amountCredit + $openingBalance) - $amountDebit)),$x6);
               $page->drawText(sprintf("%4.2f",( $sum = ($amountCredit + $openingBalance) - $amountDebit)),$pos+2,$y1 -10);

        $page->drawLine(50, $y1 = $y1 - 20, 550, $y1);
        $page->drawLine(50, $y1 -20, 550, $y1-20);
    

        $page->drawText($text[4], $x1, $y1 -15);$page->drawText($text[4], $x1, $y1 -15);
               $pos=position(sprintf("%4.2f",($amountCredit + $openingBalance)),$x3);
               $page->drawText(sprintf("%4.2f",($amountCredit + $openingBalance)),$pos+2,$y1 -15);
//         $page->drawText(sprintf("%4.2f", ($amountCredit + $openingBalance)), $x3, $y1 -15);
//         $page->drawText(sprintf("%4.2f", ($amountCredit + $openingBalance)), $x3, $y1 -15);
        $page->drawText($text[4], $x4, $y1 -15); $page->drawText($text[4], $x4, $y1 -15);
//         $page->drawText(sprintf("%4.2f", $amountDebit + $sum), $x6, $y1 -15);
//         $page->drawText(sprintf("%4.2f", $amountDebit + $sum), $x6, $y1 -15);  
               $pos=position(sprintf("%4.2f",$amountDebit + $sum),$x6);
               $page->drawText(sprintf("%4.2f",$amountDebit + $sum),$pos+2,$y1 -15);
    
        // Virtual table
        $page->setLineWidth(1)->drawLine(50, $y1 - 20, 50, 740); //Table left vertical
        $page->setLineWidth(1)->drawLine(300, $y1 - 20, 300, 740); //Table center vertical
        $page->setLineWidth(1)->drawLine(550, $y1 - 20, 550, 740); //table rigth vertical
        //$page->drawText("ಭಾವನಾ. ಕೆ. ಎಸ್ ",$x6 + 30, $y1 -15, 'UTF-8'); 

        $pdfData = $pdf->render();
    
        $pdf->save('/var/www/'.$projname.'/reports/cashscroll.pdf');
	$path = '/var/www/'.$projname.'/reports/cashscroll.pdf';
    
        chmod($path,0777);

    }
}
