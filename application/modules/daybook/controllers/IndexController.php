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
 *  action for view and pdf
 */
class Daybook_IndexController extends Zend_Controller_Action
{
    function init() { 
            $this->view->title=$this->view->translate("Day book");
            $this->view->pageTitle=$this->view->translate("Day book report");
            $this->view->type = "financialReports";
            $this->view->dateconvert=new App_Model_dateConvertor();
            		$this->view->adm = new App_Model_Adm();

            
    }
    //view action
    function indexAction() {
        $this->view->pageTitle=$this->view->translate("Day book report");
	//form element instance
        $searchForm = new Daybook_Form_Search();
        $this->view->form = $searchForm;
	//model instance
        $transaction = new Daybook_Model_Daybook();
      $officename = $this->view->adm->viewRecord("ourbank_officehierarchy","id","DESC");
			foreach($officename as $officename){
				$searchForm->branch->addMultiOption($officename['id'],$officename['type']);
			}
        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();  
            if ($searchForm->isValid($formData)) { 

            $fromDate = $this->view->dateconvert->phpmysqlformat($this->_request->getParam('datefrom')); 
            $this->view->fromdate=$this->_request->getParam('datefrom');
            $this->view->branchid=$branchid = $this->_request->getParam('branch'); 
            $this->view->resultshow = $this->view->translate("As of  <font color= #039>".$this->view->dateconvert->phpnormalformat($fromDate)."</font>");
    
            if($fromDate){
                $this->view->savings = 10;
                // Credit side Cash Transactions
                $this->view->savingsCredit =$transaction->totalSavingsCredit(1,$fromDate,$branchid);
                // Debit side Cash Transactions
                $this->view->savingsDebit =$transaction->totalSavingsDebit(1,$fromDate,$branchid);
               // Credit side Tranfer Transactions
                $this->view->TransfersavingsCredit =$transaction->totalSavingsCredit(5,$fromDate,$branchid);
                //Debit side Tranfer Transactions
                $this->view->TransfersavingsDebit =$transaction->totalSavingsDebit(5,$fromDate,$branchid);
                $osc = $transaction->openingBalance($fromDate,$branchid); 
                foreach($osc as $osc1) {
                    $this->view->openingBalance = $osc1["openingBalance"];
                }
            }
          } 
        }
    }

    function viewtransactionAction() {
    }
	//for pdf view action
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

    function reportviewAction() {
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

            $fromDate = $this->view->dateconvert->phpmysqlformat($this->_request->getParam('fromdate')); 
            $this->view->fromdate=$this->_request->getParam('fromdate');
            $this->view->branchid=$branchid = $this->_request->getParam('branchid');

        $pdf = new Zend_Pdf();
        $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
        $pdf->pages[] = $page;
        //Path
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname='';
        for($i=0; $i<count($word); $i++) {
                if($i>0 && $i<(count($word)-1)) { $projname.='/'.$word[$i]; }
        }
        // Image
        $image_name = "/var/www".$projname."/public/images/logo.jpg";
        $image = Zend_Pdf_Image::imageWithPath($image_name);

        $page->drawImage($image, 30, 770, 130, 820);
        $page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
        $page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
        $page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
        $page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal
        //set the font
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 12);

//         $this->view->fromdate=$fromDate = $this->_request->getParam('field1');
//         $branchid=$this->view->branchid;
        $this->view->savings = 10;
        $page->drawText("Day Book",270, 770);
        $page->drawText("Day Book",270, 770);
        $title="As of ".$this->view->dateconvert->phpnormalformat($fromDate);
        $text = array($title,"Particulars","GLcode","Cash","Transfer","Particulars","GLcode","Cash","Transfer");

        $xx=35; $xy=270;
        $yx=310; $yy=560;
        $x1=array(40,115,255,300,320,400,545,590);
        $xl=array(35,110,175,225,270,310,395,465,515,560);

        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
        $y1=730;
        $page->drawText("Credit",35,$y1);
        $page->drawText("Debit",310,$y1);

        $y1=740;	$y2=740;
        $page->drawText($text[0],500,$y1);//For Top Header

        $y1-=15;
        $startPoint=$y1;
        $page->drawLine($xx, $y1, $xy, $y1); 
        $page->drawLine($yx, $y1, $yy, $y1); 

        $y1-=15;
        $page->drawText("Date : ".date('d/m/Y'),500, 800); //date('Y-m-d')

        $xt=array(40,115,180,230,320,400,470,520);
        $page->drawText($text[1],$xt[0],$y1);	
        $page->drawText($text[2],$xt[1],$y1);
        $page->drawText($text[3],$xt[2],$y1);	
        $page->drawText($text[4],$xt[3],$y1);
        $page->drawText($text[5],$xt[4],$y1);
        $page->drawText($text[6],$xt[5],$y1);
        $page->drawText($text[7],$xt[6],$y1);
        $page->drawText($text[8],$xt[7],$y1); $y1-=10;

        $page->drawLine($xx, $y1, $xy, $y1);
        $page->drawLine($yx, $y1, $yy, $y1); $y1-=15;

        $y2=$y1;

        $this->view->resultshow = $this->view->translate("As of <font color=#039>".$this->view->dateconvert->phpnormalformat($fromDate)."</font>");
        
        $transaction = new Daybook_Model_Daybook();
        $CreditSide=$this->view->savingsCredit =$transaction->totalSavingsCredit(1,$fromDate,$branchid);
//             echo '<pre>'; print_r($CreditSide);
        $DebitSide=$this->view->savingsDebit =$transaction->totalSavingsDebit(1,$fromDate,$branchid);
        $CreditTransferSide=$this->view->TransfersavingsCredit =$transaction->totalSavingsCredit(5,$fromDate,$branchid);
        $DebitTransferSide=$this->view->TransfersavingsDebit =$transaction->totalSavingsDebit(5,$fromDate,$branchid);

        $totalTrnsferCashcredit="0.00";
        $totalCashCredit="0.00";
        $creditTotal="0.00";
                
        $transferFlagCr = 0; $matchedProductsCr=array();$unmatchedProductsCr=array();
        
        if($CreditSide) {
            foreach($CreditSide as $savingsCredit) {
                $page->drawText($savingsCredit['name'],$x1[0],$y1); 
                $page->drawText($savingsCredit['glcode'],$x1[1],$y1); 

//                 $page->drawText($savingsCredit['amount_to_bank'],$x1[2],$y1); 
               $pos=position(sprintf("%4.2f",$savingsCredit['amount_to_bank']),$x1[2]);
               $page->drawText(sprintf("%4.2f",$savingsCredit['amount_to_bank']),$pos+2,$y1);
        
                    if($CreditTransferSide) { $transferFlagCr=1; $flag1=0;
                    foreach($CreditTransferSide as $tsc) {
                        if($savingsCredit['name']==$tsc['name']) {
//                             $page->drawText($tsc['amount_to_bank'],$x1[3],$y1);
               $pos=position(sprintf("%4.2f",$tsc['amount_to_bank']),$x1[3]);
               $page->drawText(sprintf("%4.2f",$tsc['amount_to_bank']),$pos+2,$y1); 
                            $flag1=1;
                            $totalTrnsferCashcredit+= $tsc['amount_to_bank'];
                            $matchedProductsCr[]=$tsc['name'];
                        }
                        else{
                                $unmatchedProductsCr[]=$tsc['name'];
                        }
                    }
    
                    $totalCashCredit+=$savingsCredit['amount_to_bank'];
                }
            $y1-=15;
            }
        }
        $unmatchedProductsCr=array_diff($unmatchedProductsCr,$matchedProductsCr);
        $unmatchedProductsCr=array_values($unmatchedProductsCr);
        $unmatchedProductsCr = array_unique($unmatchedProductsCr);

        if(count($CreditTransferSide))
        {
            for($k=0;$k<count($CreditTransferSide);$k++) {
                if($k>count($matchedProductsCr)-1) {
                    $matchedProductsCr[$k]='a';
                }
                if($k>count($unmatchedProductsCr)-1) {
                    $unmatchedProductsCr[$k]='a';
                }
            }
        }

        if($transferFlagCr==0){
            foreach($CreditTransferSide as $tsc) {
                $page->drawText($tsc['name'],$x1[0],$y1); 
                $page->drawText($tsc['glcode'],$x1[1],$y1); 
//                 $page->drawText($tsc['amount_to_bank'],$x1[3],$y1); 
               $pos=position(sprintf("%4.2f",$tsc['amount_to_bank']),$x1[3]);
               $page->drawText(sprintf("%4.2f",$tsc['amount_to_bank']),$pos+2,$y1);
            $totalTrnsferCashcredit+= $tsc['amount_to_bank'];
            $y1-=15;
            }
        }
        //The unmatched records(Transfer with Cash) will be checked and printed here
        else {
            foreach($CreditTransferSide as $tsc) {
                if($unmatchedProductsCr){
                    for($j=0;$j<count($CreditTransferSide);$j++) {
                        if($tsc['name']==$unmatchedProductsCr[$j] && $unmatchedProductsCr[$j]!=$matchedProductsCr[$j]) {
                            $page->drawText($tsc['name'],$x1[0],$y1); 
                            $page->drawText($tsc['glcode'],$x1[1],$y1); 
//                             $page->drawText($tsc['amount_to_bank'],$x1[3],$y1);
               $pos=position(sprintf("%4.2f",$tsc['amount_to_bank']),$x1[3]);
               $page->drawText(sprintf("%4.2f",$tsc['amount_to_bank']),$pos+2,$y1);
                        $totalTrnsferCashcredit+= $tsc['amount_to_bank'];	
                        }
                    $y1-=15;
                    }
                }
            }
        }

        $opening="0.00";
        $osc = $transaction->openingBalance($fromDate,$branchid); //echo '<pre>'; print_r($osc);
        foreach($osc as $osc1) {
            $this->view->openingBalance =$opening = $osc1["openingBalance"];
        }
        
        $totalTrnsferCashDebit="0.00";
        $totalCashDebit="0.00";
        $debitTotal="0.00";

        $transferFlagDr = 0; $matchedProductsDr=array(); $unmatchedProductsDr=array();
        if($DebitSide) {
            foreach($DebitSide as $savingsDebit) { 
                $page->drawText($savingsDebit['name'],$x1[4],$y2); 
                $page->drawText($savingsDebit['glcode'],$x1[5],$y2); 
//                 $page->drawText($savingsDebit['amount_from_bank'],$x1[6],$y2); 
               $pos=position(sprintf("%4.2f",$savingsDebit['amount_from_bank']),$x1[6]);
               $page->drawText(sprintf("%4.2f",$savingsDebit['amount_from_bank']),$pos+2,$y2);

                if($DebitTransferSide) { $transferFlagDr=1;$flag2=0;
                foreach($DebitTransferSide as $tsd) {
                    if($savingsDebit['name']==$tsd['name']) {
//                         $page->drawText($tsd['amount_from_bank'],$x1[7],$y2); 
               $pos=position(sprintf("%4.2f",$tsd['amount_from_bank']),$x1[7]);
               $page->drawText(sprintf("%4.2f",$tsd['amount_from_bank']),$pos+2,$y2);
                $flag2=1;

                        $totalTrnsferCashDebit+=$tsd['amount_from_bank'];
                        $matchedProductsDr[]=$tsd['name'];
                    } else{
                            $unmatchedProductsDr[]=$tsd['name'];
                        }
                }
                $totalCashDebit+=$savingsDebit['amount_from_bank'];
            } $y2-=15;  
        }
        }
        $unmatchedProductsDr=array_diff($unmatchedProductsDr,$matchedProductsDr);
        $unmatchedProductsDr=array_values($unmatchedProductsDr);
        $unmatchedProductsDr = array_unique($unmatchedProductsDr);
        
        if(count($DebitTransferSide)) {
            for($l=0;$l<count($DebitTransferSide);$l++) {
                if($l>(count($matchedProductsDr)-1)) {
                        $matchedProductsDr[$l]='a';
                }
                if($l>(count($unmatchedProductsDr)-1)) {
                        $unmatchedProductsDr[$l]='a';
                }
            }
        }

        if($transferFlagDr==0){
            foreach($DebitTransferSide as $tsd) {
                $page->drawText($tsd['name'],$x1[4],$y2); 
                $page->drawText($tsd['glcode'],$x1[5],$y2); 
//                 $page->drawText($tsd['amount_from_bank'],$x1[7],$y2); 
               $pos=position(sprintf("%4.2f",$tsd['amount_from_bank']),$x1[7]);
               $page->drawText(sprintf("%4.2f",$tsd['amount_from_bank']),$pos+2,$y2);
            $totalTrnsferCashDebit+=$tsd['amount_from_bank'];	
            $y2-=15;
            }
        }else { $i=0;
            foreach($DebitTransferSide as $tsd) {
                if($unmatchedProductsDr){
                    if($tsd['name']==$unmatchedProductsDr[$i] && $unmatchedProductsDr[$i]!=$matchedProductsDr[$i]) {
                        $page->drawText($tsd['name'],$x1[4],$y2);
                        $page->drawText($tsd['glcode'],$x1[5],$y2);
//                         $page->drawText($tsd['amount_from_bank'],$x1[7],$y2);
               $pos=position(sprintf("%4.2f",$tsd['amount_from_bank']),$x1[7]);
               $page->drawText(sprintf("%4.2f",$tsd['amount_from_bank']),$pos+2,$y2);
                    $totalTrnsferCashDebit+= $tsd['amount_from_bank'];
                    }
                }$i++;
            $y2-=15;
            }
        }

        $bottomY=min($y1,$y2);
        $page->drawLine($xx, $bottomY, $xy, $bottomY);	
        $page->drawLine($yx, $bottomY, $yy, $bottomY); 
        $bottomY-=10;
        $page->drawText("Total",$x1[1],$bottomY); 
//         $page->drawText($totalCashCredit,$x1[2],$bottomY);
               $pos=position(sprintf("%4.2f",$totalCashCredit),$x1[2]);
               $page->drawText(sprintf("%4.2f",$totalCashCredit),$pos+2,$bottomY);
//  	$page->drawText($totalTrnsferCashcredit,$x1[3],$bottomY); 
               $pos=position(sprintf("%4.2f",$totalTrnsferCashcredit),$x1[3]);
               $page->drawText(sprintf("%4.2f",$totalTrnsferCashcredit),$pos+2,$bottomY); 
        $page->drawText("Total",$x1[5],$bottomY); 
//         $page->drawText($totalCashDebit,$x1[6],$bottomY); 
               $pos=position(sprintf("%4.2f",$totalCashDebit),$x1[6]);
               $page->drawText(sprintf("%4.2f",$totalCashDebit),$pos+2,$bottomY);
// 	$page->drawText($totalTrnsferCashDebit,$x1[7],$bottomY);
               $pos=position(sprintf("%4.2f",$totalTrnsferCashDebit),$x1[7]);
               $page->drawText(sprintf("%4.2f",$totalTrnsferCashDebit),$pos+2,$bottomY);
        $bottomY-=10;
        $page->drawLine($xl[1], $bottomY, $xl[4], $bottomY);	$page->drawLine($xl[6], $bottomY, $xl[9], $bottomY);
        $bottomY-=10;


        $page->drawText("Opening balance",$x1[1],$bottomY); 
//         $page->drawText($opening,$x1[2],$bottomY);
               $pos=position(sprintf("%4.2f",$opening),$x1[2]);
               $page->drawText(sprintf("%4.2f",$opening),$pos+2,$bottomY);
        $total=$opening+$totalCashCredit;
        $page->drawText("Closing balance",$x1[5],$bottomY);  
        $closing=$total-$totalCashDebit;
//         $page->drawText($closing,$x1[6],$bottomY); 
               $pos=position(sprintf("%4.2f",$closing),$x1[6]);
               $page->drawText(sprintf("%4.2f",$closing),$pos+2,$bottomY);	
        $bottomY-=10;
        $page->drawLine($xl[1], $bottomY, $xl[4], $bottomY);	$page->drawLine($xl[6], $bottomY, $xl[9], $bottomY);
        $bottomY-=10;

        $creditTotal=$opening+$totalCashCredit;
        $page->drawText("Total",$x1[1],$bottomY); 
//         $page->drawText($creditTotal,$x1[2],$bottomY);	
               $pos=position(sprintf("%4.2f",$creditTotal),$x1[2]);
               $page->drawText(sprintf("%4.2f",$creditTotal),$pos+2,$bottomY);
//         $page->drawText($totalTrnsferCashcredit,$x1[3],$bottomY);
               $pos=position(sprintf("%4.2f",$totalTrnsferCashcredit),$x1[3]);
               $page->drawText(sprintf("%4.2f",$totalTrnsferCashcredit),$pos+2,$bottomY); 

        $page->drawText("Total",$x1[5],$bottomY); 
//         $page->drawText(($totalCashDebit+$closing),$x1[6],$bottomY);
               $pos=position(sprintf("%4.2f",$totalCashDebit+$closing),$x1[6]);
               $page->drawText(sprintf("%4.2f",$totalCashDebit+$closing),$pos+2,$bottomY);
//  	$page->drawText($totalTrnsferCashDebit,$x1[7],$bottomY);
               $pos=position(sprintf("%4.2f",$totalTrnsferCashDebit),$x1[7]);
               $page->drawText(sprintf("%4.2f",$totalTrnsferCashDebit),$pos+2,$bottomY);
        $bottomY-=10;
        $page->drawLine($xx, $bottomY, $xy, $bottomY); 	$page->drawLine($yx, $bottomY, $yy, $bottomY); 
        
        for($i=0; $i<count($xl); $i++) {
                $page->drawLine($xl[$i], $bottomY, $xl[$i], $startPoint);
        }//vertical lines

        $pdfData = $pdf->render();
	//folder path
        $pdf->save('/var/www'.$projname.'/reports/daybook-'.date('Y-m-d').'.pdf');
        $path = '/var/www'.$projname.'/reports/daybook-'.date('Y-m-d').'.pdf';
        chmod($path,0777);
    }
}
