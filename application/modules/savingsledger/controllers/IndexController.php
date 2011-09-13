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
class Savingsledger_IndexController extends Zend_Controller_Action
{
	function init() { 
		$this->view->pageTitle = "Individual / Group Savings ledger";
		$this->view->tilte = "Reports";
        $this->view->type = "generalFields";
		$this->view->dateconvert=new App_Model_dateConvertor();
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

	function indexAction() {
		$this->view->form = $searchForm = new Savingsledger_Form_Search();

		$dateFrom =$this->view->fromdate=$this->_request->getParam('datefrom');
		$dateTo =$this->view->todate= $this->_request->getParam('dateto');
		$accountNo =$this->view->accno= $this->_request->getParam('acc');

		if(($this->_request->getParam('datefrom') || $this->_request->getParam('dateto')) || $this->_request->getParam('acc')) {
			if($this->_request->getParam('acc')){
                                if($this->_request->getParam('datefrom')) {
                                $dfrom = $this->view->dateconvert->mysqlformat($this->_request->getParam('datefrom'));
                                }
                                if($this->_request->getParam('dateto')) {
                                $dto = $this->view->dateconvert->mysqlformat($this->_request->getParam('dateto'));
                                }
			$this->_redirect('/savingsledger/index/viewtransaction/acc/'.$accountNo.'/datefrom/'.$dfrom.'/dateto/'.$dto);
			} else { echo "Enter account number"; }
		} 
	}

	function viewtransactionAction() {
		$this->view->pageTitle = "Savings ledger";
		$searchForm = new Reports_Form_Search();
		$this->view->form = $searchForm;

		$dateFrom =$this->view->fromdate=$this->_request->getParam('datefrom');
		$dateTo =$this->view->todate= $this->_request->getParam('dateto');
		$accountNo =$this->view->accno= $this->_request->getParam('acc');
		if($accountNo && !$dateFrom && !$dateTo)
			$this->view->resultshow = "Showing results for <font color=red>$accountNo</font>";
		if(!$accountNo && $dateFrom && $dateTo)
			$this->view->resultshow = "Showing results from <font color=red>".$dateFrom."</font> to <font color=red>".$dateTo."</font>";
		if(!$accountNo && $dateFrom && !$dateTo)
			$this->view->resultshow = "Showing results from <font color=red>".$dateFrom."</font>";
		if(!$accountNo && !$dateFrom && $dateTo)
			$this->view->resultshow = "Showing results before <font color=red>".$dateTo."</font>";
		if($accountNo && $dateFrom && !$dateTo)
			$this->view->resultshow = "Showing results from <font color=red>".$dateFrom."</font> for <font color=red>$accountNo</font>";
		if($accountNo && !$dateFrom && $dateTo)
			$this->view->resultshow = "Showing results before <font color=red>".$dateTo."</font> for <font color=red>$accountNo</font>";
		if($accountNo && $dateFrom && $dateTo)
			$this->view->resultshow = "Showing results from <font color=red>".$dateFrom."</font> to <font color=red>".$dateTo."</font> for <font color=red>$accountNo</font>";

		$titleofdaybook=$this->view->resultshow;
		 $this->view->pagetitlevalue= strip_tags($titleofdaybook);

		$transaction = new Savingsledger_Model_Savingsledger();
		if($accountNo) {
			$accountDetails = $transaction->getAccountDetails($accountNo);
	
			if ($accountDetails) {
				$this->view->accountDetails = $accountDetails;
				$this->view->sample = 10;
			}
		}
		$creditTotal=0;$debitTotal=0;$transaction1='';
		$transaction1 = $transaction->fetchTransactionDetails($this->_request->getParam('acc'),
															  $this->_request->getParam('datefrom'),
															  $this->_request->getParam('dateto'));
			foreach($transaction1 as $calc){ 
				if ($calc['transactiontype_id']==1) {
					$creditTotal+=$calc['amount_to_bank'];
				} else {
					$debitTotal+=$calc['amount_from_bank'];
				}
			}
		$this->view->creditTotal=$creditTotal;
		$this->view->debitTotal=$debitTotal;

		if ($transaction1=='') {
			echo 'No Transactions yet Records';
		} else {
			$this->view->transaction = $transaction1;
				$page = $this->_getParam('page',1);
				$paginator = Zend_Paginator::factory($transaction1);
				$paginator->setItemCountPerPage(20);
				$paginator->setCurrentPageNumber($page);
				$this->view->paginator = $paginator;
		}
	}

	function reportdisplayAction() {
		$this->_helper->layout->disableLayout();
		$file1 = $this->_request->getParam('file');
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname = $word[1];
		$this->view->filename = "/".$projname."/reports/".$file1;
	}

	function pdftransactionAction() { 
		$pdf = new Zend_Pdf();
	//create a new page
		$page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
		$pdf->pages[] = $page;

		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname='';
		for($i=0; $i<count($word); $i++) {
			if($i>0 && $i<(count($word)-1)) { $projname.='/'.$word[$i]; }
		}
	// Image
		$image_name = "/var/www".$app."/images/logo.jpg";
		$image = Zend_Pdf_Image::imageWithPath($image_name);
	
		$page->drawImage($image, 30, 770, 130, 820);
		$page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
		$page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
		$page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
		$page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal
		//set the font
		$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 12);

		echo $title=$this->_request->getParam('pagetitle');
			$len=strlen($title);	
			$pos=550-($len*7);	
		$page->drawText($title,$pos, 760);
		$z1=50;
		$z2=550;
		
		$y1=740;
		$y2=740;
		$x =array(60,92,180,240,340,400,460); 
		$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);
		//Amount Formatting
		function position($spaceFlag,$amt) {
			if($spaceFlag==0){	$len=strlen($amt);	$pos=300-($len*5);	return $pos;	}
			if($spaceFlag==1){	$len=strlen($amt);	$pos=230-($len*5);	return $pos;	}
		}
		function position1($spaceFlag1,$amt) {
			if($spaceFlag1==0){	$len=strlen($amt);	$pos=370-($len*5);	return $pos;	}
			if($spaceFlag1==1){	$len=strlen($amt);	$pos=300-($len*5);	return $pos;	}
		}
		function balPosi($spaceFlag,$amt) {
			if($spaceFlag==0){	$len=strlen($amt);	$pos=450-($len*5);	return $pos;	}
			if($spaceFlag==1){	$len=strlen($amt);	$pos=370-($len*5);	return $pos;	}
		}

		echo $accountnumber=$this->view->accno= $this->_request->getParam('accno'); 
		echo $fromdate=$this->view->fromdate= $this->_request->getParam('fromdate'); 
		echo $todate=$this->view->todate=$this->_request->getParam('todate'); 

		$transaction = new Savingsledger_Model_Savingsledger();
		if($accountnumber!=''){
			$accountDetails = $transaction->getAccountDetails($accountnumber);

			$balance = $transaction->balance($accountnumber);
			
			foreach($accountDetails as $arraytran2) 
			{
			$page->drawText("Name  ",50, $y1);$page->drawText(": ".$arraytran2['membername'],120, $y1);$y1-=15;
			$page->drawText("ID  ",50, $y1);$page->drawText(": ".$arraytran2['membercode'],120, $y1);$y1-=15;
			$page->drawText("Office name ",50, $y1);$page->drawText(": ".$arraytran2['office_name'],120, $y1);$y1-=15;
			$page->drawText("Product name ",300, $y2);$page->drawText(": ".$arraytran2['offername'],390, $y2);$y2-=15;
			$page->drawText("Account no.  ",300, $y2);$page->drawText(": ".$arraytran2['account_number'],390, $y2);$y2-=15;
			//$account_number = $arraytran2->account_number;
			foreach($balance as $balanc){
			$page->drawText("Balance  ",300, $y2);$page->drawText(": ".$balanc['bal'],390, $y2);$y2-=15;
}
			}
		}

		$startlinepoint=$y1;
		$page->drawLine($z1, $y1, $z2, $y1);  
		$text = array("V No.","A/c number", "Tran date",
				"Credit(Rs)", "Debit(Rs)", "Balance(Rs)",
				"Description","Total(Rs)");

		$y1-=15;
		$i=0;$j=0;
		$page->drawText($text[$i], $x[$j], $y1);$j+=1;$i+=1;
		$acFlag=0;
		if($accountnumber=='') {
			$page->drawText($text[$i], $x[$j], $y1);$j+=1;$i+=1;  $acFlag=1;
		} else {
			$i+=1;
		}

		$page->drawText($text[$i], $x[$j], $y1);$j+=1;$i+=1;
		$page->drawText($text[$i], $x[$j]+10, $y1);$j+=1;$i+=1;
		if($acFlag==1){
		$page->drawText($text[$i], $x[$j], $y1);$j+=1;$i+=1;}

		if($acFlag==0){
		$page->drawText($text[$i], $x[$j]+20, $y1);$j+=1;$i+=1;}

		$page->drawText($text[$i], $x[$j], $y1);$j+=1;$i+=1;
		$page->drawText($text[$i], $x[$j], $y1);
		$y1-=10;
		$page->drawLine($z1, $y1, $z2, $y1);  $y1-=15;

		$transactionDetails = $transaction->fetchTransactionDetails($accountnumber,$fromdate,$todate);

		foreach($transactionDetails as $transactionDetails1){
			if($y1>30){

			$i=0;$j=0;
			$page->drawText($transactionDetails1->Transactionid,$x[$j], $y1);$j+=1;$i+=1;
			if($accountnumber==''){ 
				$page->drawText($transactionDetails1->account_number,$x[$j], $y1);$j+=1;  $spaceFlag=0;$spaceFlag1=0;} else { $spaceFlag=1; $spaceFlag1=1;}
				$page->drawText($transactionDetails1->transaction_date,$x[$j], $y1);$j+=1;$i+=1;

			//Position for Amount Formatting.......
			if($transactionDetails1->transactiontype_id==1) {
				$pos=position($spaceFlag,sprintf("%4.2f",$transactionDetails1->amount_to_bank));
				$page->drawText($transactionDetails1->amount_to_bank,$pos, $y1);$j+=1;$i+=1;
				if($spaceFlag==0)
				$page->drawText("------",$x[$j], $y1);
				else
				$page->drawText("------",$x[$j]+30, $y1);
			$j+=1;$i+=1; 
			}
			if($transactionDetails1->transactiontype_id==2) {
				$page->drawText("------",$x[$j]+30, $y1);$j+=1;$i+=1;
				$pos1=position1($spaceFlag1,sprintf("%4.2f",$transactionDetails1->amount_from_bank));
				$page->drawText($transactionDetails1->amount_from_bank,$pos1, $y1);$j+=1;$i+=1;  
			}

			$pos=balPosi($spaceFlag,sprintf("%4.2f",$transactionDetails1->balance));
			$page->drawText(sprintf("%4.2f",$transactionDetails1->balance),$pos, $y1);$j+=1;$i+=1;
// 			$page->drawText($transactionDetails1->balance,$x[$j], $y1);$j+=1;$i+=1;
			$page->drawText($transactionDetails1->description,$x[$j], $y1);
			$y1-=15;
			} else{
			
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
			//set the font
			$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);
			$z1=50;
		$z2=550;
		$y1=740;
		$y2=740;

		$x =array(60,92,180,240,340,400,460); 
			
			$i=0;$j=0;
			$page->drawText($transactionDetails1->Transactionid,$x[$j], $y1);$j+=1;$i+=1;
			if($accountnumber==''){ 
				$page->drawText($transactionDetails1->account_number,$x[$j], $y1);$j+=1;  $spaceFlag=0;$spaceFlag1=0;} else { $spaceFlag=1;$spaceFlag1=1; }
				$page->drawText($transactionDetails1->transaction_date,$x[$j], $y1);$j+=1;$i+=1;

			//Position for Amount Formatting.......
			if($transactionDetails1->transactiontype_id==1) {
					$pos=position($spaceFlag,sprintf("%4.2f",$transactionDetails1->amount_to_bank));
					$page->drawText($transactionDetails1->amount_to_bank,$pos, $y1);$j+=1;$i+=1;
					if($spaceFlag==0)
					$page->drawText("------",$x[$j], $y1);
					else
					$page->drawText("------",$x[$j]+30, $y1);
					$j+=1;$i+=1; 
			}
			if($transactionDetails1->transactiontype_id==2) {
					$page->drawText("------",$x[$j]+30, $y1);
					$j+=1;$i+=1;
					$pos1=position1($spaceFlag1,sprintf("%4.2f",$transactionDetails1->amount_from_bank));
					$page->drawText($transactionDetails1->amount_from_bank,$pos1, $y1);$j+=1;$i+=1;  
			}

			$pos=balPosi($spaceFlag,sprintf("%4.2f",$transactionDetails1->balance));
			$page->drawText(sprintf("%4.2f",$transactionDetails1->balance),$pos, $y1);$j+=1;$i+=1;
// 			$page->drawText($transactionDetails1->balance,$x[$j], $y1);$j+=1;$i+=1;
			$page->drawText($transactionDetails1->description,$x[$j], $y1);
			$y1-=15;

			}
		}
		$creditTotal=0;$debitTotal=0;
		foreach($transactionDetails as $calc){ 
			if ($calc['transactiontype_id']==1) {
				$creditTotal+=$calc['amount_to_bank'];
			} else {
				$debitTotal+=$calc['amount_from_bank'];
			}
		}

		if($spaceFlag==0)
		$page->drawText($text[7],$x[2], $y1);
		if($spaceFlag==1)
		$page->drawText($text[7],$x[1], $y1);

		$pos=position($spaceFlag,sprintf("%4.2f",$creditTotal));
		$page->drawText(sprintf("%4.2f",$creditTotal),$pos, $y1);
// 			$page->drawText($creditTotal,$x[3], $y1);

		$pos1=position1($spaceFlag1,sprintf("%4.2f",$debitTotal));
		$page->drawText(sprintf("%4.2f",$debitTotal),$pos1, $y1);$y1-=15;
// 			$page->drawText($debitTotal,$x[4], $y1);$y1-=15;

		$page->drawLine($z1, $y1, $z2, $y1);
		$page->drawLine($z1, $y1, $z1, $startlinepoint);
		$page->drawLine($z2, $y1, $z2, $startlinepoint);
	
		$pdfData = $pdf->render();
	
		$pdf->save('/var/www/'.$projname.'/reports/savingsledger.pdf');
		$path = '/var/www/'.$projname.'/reports/savingsledger.pdf';
		chmod($path,0777);
                $this->_redirect('/savingsledger/index/viewtransaction/acc/'.$accountnumber.'/datefrom/'.$fromdate.'/dateto/'.$todate);
		
}
}
