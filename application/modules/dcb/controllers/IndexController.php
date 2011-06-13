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
class Dcb_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->pageTitle='Demand collections & balance';
        $this->view->type = "operationalReport";
        $this->view->dateconvert=new App_Model_dateConvertor();
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
        $login=new App_Model_Users();
        $loginname=$login->username($userid);
        foreach($loginname as $loginname) 
        {
            $this->view->username=$loginname['username']; // get the user name
        }
    }
        //view action
	public function indexAction()
	{       $app=$this->view->baseUrl();
		$this->view->pageTitle = "Demand collections & balance";
		$this->view->tilte = "Reports";
		$searchForm = new Dcb_Form_Search($app);
		$this->view->form = $searchForm;
                $option=array('1'=>'Account number','2'=>'Group','3'=>'Village');
	        $searchForm->option->addMultiOptions($option);
                $Loandemand = new Dcb_Model_Dcb();

		if ($this->_request->isPost() && $this->_request->getPost('Search'))
                {
                    $this->view->hidedate=$fromDate = $this->_request->getParam('datefrom');
                    $this->view->accountno=$account1 = $this->_request->getParam('account');
                    if($account1)
                    { $this->view->hideacc=$account=$account1;
                      $Type = substr($account,4,1);
                    } else { $this->view->hideacc=$account=''; $Type=0; }
                    $this->view->village=$village1 = $this->_request->getParam('village'); 
                    if($village1){ $this->view->hidevillage=$village=$village1; } else { $this->view->hidevillage=$village=''; } 
                    $this->view->group=$group1 = $this->_request->getParam('group'); 
                    if($group1){ $this->view->hidegroup=$group=$group1; } else { $this->view->hidegroup=$group=''; }
                    $hierarchy = $Loandemand->getofficehierarchy();
                    foreach($hierarchy as $hiearchyids){
                    $hiearchyid = $hiearchyids['hierarchyid'];
                    }
                    $this->view->office = $Loandemand->office($village,$hiearchyid);

                if ($fromDate && $account){
                            $this->view->savings = "10"; 
                            $this->view->resultshow = "As of<font color=#039>".$fromDate."</font>";	
                            $dayArray=array();
                            $fromDate=$this->view->dateconvert->phpmysqlformat($fromDate);
                            $this->view->accounts = $Loandemand->fetchloanDetails($fromDate,$account,$Type);
                            $dayArray= $this->findFirstAndLastDay($fromDate);
                            $this->view->fromdate = $dayArray[0];
                         //   $this->view->todate = $dayArray[1];
		 }
                 if ($fromDate && $group){
                            $this->view->savings = "10"; 
                            $this->view->resultshow = "As of <font color=#039>".$fromDate."</font>";	
                            $dayArray=array();
                            $fromDate=$this->view->dateconvert->phpmysqlformat($fromDate);
                            $this->view->accounts = $Loandemand->fetchgrouploan($fromDate,$group);
                            $dayArray= $this->findFirstAndLastDay($fromDate);
                            $this->view->fromdate = $dayArray[0];
                         //   $this->view->todate = $dayArray[1];
		 }

                 if ($fromDate && $village){
                            $this->view->savings = "10"; 
                            $this->view->resultshow = "As of <font color=#039>".$fromDate."</font>";	
                            $dayArray=array();
                            $fromDate=$this->view->dateconvert->phpmysqlformat($fromDate);
                            $this->view->accounts = $Loandemand->fetchvillageloan($fromDate,$village);
                            $dayArray= $this->findFirstAndLastDay($fromDate);
                            $this->view->fromdate = $dayArray[0];
                         //   $this->view->todate = $dayArray[1];
		 }

                if ($fromDate && !$village && !$account && !$group){
                            $this->view->savings = "10"; 
                            $this->view->resultshow = "As of <font color=#039>".$fromDate."</font>";	
                            $dayArray=array();
                            $fromDate=$this->view->dateconvert->phpmysqlformat($fromDate);
                            $this->view->accounts = $Loandemand->fetchvillageloan($fromDate,$village);
                            $dayArray= $this->findFirstAndLastDay($fromDate);
                            $this->view->fromdate = $dayArray[0];
                         //   $this->view->todate = $dayArray[1];
		 }

                }
	}


    public function getoptionAction() { 
	$this->_helper->layout->disableLayout();
        $app = $this->view->baseUrl();
	$searchForm = new Dcb_Form_Search($app);
        $this->view->form = $searchForm;
	$this->view->optionid=$id = $this->_request->getParam('optionid');

	$dcbmodel=new Dcb_Model_Dcb();
        if($this->view->optionid==3){
        $hierarchy = $dcbmodel->getofficehierarchy();
            foreach($hierarchy as $hiearchyids){
            $hiearchyid = $hiearchyids['hierarchyid'];
            }
	$office=$this->view->adm->getRecord('ourbank_office','officetype_id',$hiearchyid);
	foreach($office as $office1) {
			$searchForm->village->addMultiOption($office1['id'],$office1['name']);
        }
        }

        if($this->view->optionid==2){
        $group = $this->view->adm->viewRecord("ourbank_group","id","DESC");
	foreach($group as $group1) {
			$searchForm->group->addMultiOption($group1['id'],$group1['name']);
        }
    }
}
	
	function findFirstAndLastDay($anyDate)
	{
	
		list($yr,$mn,$dt) =    split('-',$anyDate);    // separate year, month and date
		$timeStamp        =    mktime(0,0,0,$mn,1,$yr);    //Create time stamp of the first day from the give date.
		$firstDay         =    date('Y-m-d',$timeStamp);    //get first day of the given month
	file:///var/www/IDF/application/modules/dcb/controllers/IndexController.php	list($y,$m,$t)    =    split('-',date('Y-m-t',$timeStamp)); //Find the last date of the month and separating it
		//$lastDayTimeStamp =    mktime(0,0,0,$m,$t,$y);//create time stamp of the last date of the give month
		//$lastDay          =    date('Y-m-d',$lastDayTimeStamp);// Find last day of the month
		$arrDay           =    array("$firstDay"); // return the result in an array format.
		return $arrDay;
	}
        //report display
	public function reportdisplayAction() 
	{
	
		$this->_helper->layout->disableLayout();
		$file1 = $this->_request->getParam('file'); 
	
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname = $word[1];
	
		$this->view->filename = "/".$projname."/reports/".$file1;    
	}
        //pdf display
	public function pdfdisplayAction() 
	{ 
		$pdf = new Zend_Pdf();
		$page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4_LANDSCAPE);
		$pdf->pages[] = $page;
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname = $word[1];
		// Image path
		$image_name = "/var/www/".$projname."/public/images/logo.jpg";
		$Loandemand = new Dcb_Model_Dcb();
                $this->view->hidedate=$fromDate = $this->_request->getParam('hidedate');
                    $this->view->accountno=$account1 = $this->_request->getParam('hideacc');
                    if($account1)
                    { $this->view->hideacc=$account=$account1;
                      $Type = substr($account,4,1);
                    } else { $this->view->hideacc=$account=''; $Type=0; }
                    $village1 = $this->_request->getParam('hidevillage'); 
                    if($village1){ $this->view->hidevillage=$village=$village1; } else { $this->view->hidevillage=$village=''; } 
                    $group1 = $this->_request->getParam('hidegroup'); 
                    if($group1){ $this->view->hidegroup=$group=$group1; } else { $this->view->hidegroup=$group=''; }
                    $hierarchy = $Loandemand->getofficehierarchy();
                    foreach($hierarchy as $hiearchyids){
                    $hiearchyid = $hiearchyids['hierarchyid'];
                    }
                    $this->view->office = $Loandemand->office($village,$hiearchyid);

                if ($fromDate && $account){
                            $this->view->savings = "10"; 
                            $this->view->resultshow = "As of<font color=#039>".$fromDate."</font>";	
                            $dayArray=array();
                            $fromDate=$this->view->dateconvert->phpmysqlformat($fromDate);
                            $this->view->accounts =$demand= $Loandemand->fetchloanDetails($fromDate,$account,$Type);
                            $dayArray= $this->findFirstAndLastDay($fromDate);
                            $this->view->fromdate = $dayArray[0];
                         //   $this->view->todate = $dayArray[1];
		 }
                 if ($fromDate && $group){
                            $this->view->savings = "10"; 
                            $this->view->resultshow = "As of <font color=#039>".$fromDate."</font>";	
                            $dayArray=array();
                            $fromDate=$this->view->dateconvert->phpmysqlformat($fromDate);
                            $this->view->accounts=$demand = $Loandemand->fetchgrouploan($fromDate,$group);
                            $dayArray= $this->findFirstAndLastDay($fromDate);
                            $this->view->fromdate = $dayArray[0];
                         //   $this->view->todate = $dayArray[1];
		 }

                 if ($fromDate && $village){
                            $this->view->savings = "10"; 
                            $this->view->resultshow = "As of <font color=#039>".$fromDate."</font>";	
                            $dayArray=array();
                            $fromDate=$this->view->dateconvert->phpmysqlformat($fromDate);
                            $this->view->accounts=$demand = $Loandemand->fetchvillageloan($fromDate,$village);
                            $dayArray= $this->findFirstAndLastDay($fromDate);
                            $this->view->fromdate = $dayArray[0];
                         //   $this->view->todate = $dayArray[1];
		 }

                if ($fromDate && !$village && !$account && !$group){
                            $this->view->savings = "10"; 
                            $this->view->resultshow = "As of <font color=#039>".$fromDate."</font>";	
                            $dayArray=array();
                            $fromDate=$this->view->dateconvert->phpmysqlformat($fromDate);
                            $this->view->accounts=$demand = $Loandemand->fetchvillageloan($fromDate,$village);
                            $dayArray= $this->findFirstAndLastDay($fromDate);
                            $this->view->fromdate = $dayArray[0];
                         //   $this->view->todate = $dayArray[1];
		 }

		// Image
		$image = Zend_Pdf_Image::imageWithPath($image_name);
                $page->drawImage($image, 25, 520, 125, 570);

//                 $page->drawText("Date : ".date('d-m-Y'),550, 800); //date('Y-m-d')
//                 $page->drawText("Date : ".date('d-m-Y'),550, 800); 
		$page->setLineWidth(1)->drawLine(25, 25, 810, 25); //bottom horizontal
		$page->setLineWidth(1)->drawLine(25, 25, 25, 570); //left vertical
		$page->setLineWidth(1)->drawLine(810, 25, 810 ,570); //right vertical
		$page->setLineWidth(1)->drawLine(25, 570, 810, 570); //top horizontal
		//set the font
		$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);
	
		$text = array("Acc no.","pri 1","Int 2","Pri 3","Int 4","T.pri 5","T.int 6","pri 7","Int 8","Pri 9","pri 10","Int 11","pri 12","Int 13","Int 14");
		$pdfData = $pdf->render();
		$x0 = 25; 
		$x1 = 120;
		$x2 = 170;
		$x3 = 210;
		$x4 = 270;
		$x5 = 310;
		$x6 = 365;
		$x7 = 405;
		$x8 = 457;
		$x9 = 495;
		$x10 = 550;
		$x11 = 590;
		$x12 = 645;
		$x13 = 685;
		$x14 = 740;
	
		$this->view->title = "Reports";
	        $my = 500;
                $my1 = 515;

		$page->drawLine(25, $my1, 810, $my1);

		$page->drawLine(25, 495, 810, 495);

		$page->drawText($text[0], $x0, $my);
		$page->drawText($text[1], $x1, $my);
		$page->drawText($text[2], $x2, $my);
		$page->drawText($text[3], $x3, $my);
		$page->drawText($text[4], $x4, $my);
		$page->drawText($text[5], $x5, $my);
		$page->drawText($text[6], $x6, $my);
		$page->drawText($text[7], $x7, $my);
		$page->drawText($text[8], $x8, $my);
		$page->drawText($text[9], $x9, $my);
		$page->drawText($text[10], $x10, $my);
		$page->drawText($text[11], $x11, $my);
		$page->drawText($text[12], $x12, $my);
		$page->drawText($text[13], $x13, $my);
		$page->drawText($text[14], $x14, $my);
	
	
		$y1 = 480;
	$overprinciple = "0";
	$overinterest = "0";
	
	$nextprinciple = "0";
	$nextinterest = "0";
	
	$paidPriciple = "0";
	$paidInterest = "0";
	
	$collectionprinciple = "0";
	$collectioninterest = "0";
	
	$total1 = "0";
	$total2 = "0";
	$total3 = "0";
	$total3 = "0";
	$total4 = "0";
	$total5 = "0";
	$total6 = "0";
	$total7 = "0";
	$total8 = "0";
	$total9 = "0";
	$total10 = "0";
	$total11 = "0";
	$total12 = "0";
	$total13 = "0";
	$total14 = "0";
		

         foreach($this->view->office as $office) { 

                //echo $office->villagename; 
 		$page->drawText($office->villagename,$x0, $y1);

               foreach($this->view->accounts as $accounts) 
               {  
                    if ($accounts->officeid == $office->village_id) 
                    { 
                        if ($accounts->installment_date <= $this->view->fromdate) 
                        {
                        $overprinciple = $overprinciple + $accounts->installment_principal_amount;
                        $overinterest = $overinterest + $accounts->installment_interest_amount;
                        } 
                        if ($accounts->installment_date >= $this->view->fromdate) 
                        {
                        $nextprinciple = $nextprinciple + $accounts->installment_principal_amount;
                        $nextinterest = $nextinterest + $accounts->installment_interest_amount;
                        } 
                        if ($accounts->installment_status == 2 && $accounts->installment_date < $this->view->fromdate) 
                        {
                        $paidPriciple = $paidPriciple + $accounts->installment_principal_amount;
                        $paidInterest = $paidInterest + $accounts->installment_interest_amount;
                        } 
                        if ($accounts->installment_status == 2 && $accounts->installment_date >= $this->view->fromdate) 
                        {
                        $collectionprinciple = $collectionprinciple + $accounts->installment_principal_amount;
                        $collectioninterest = $collectioninterest + $accounts->installment_interest_amount;
                        } 
                        } 
                    else 
                    { $overprinciple=0; $overinterest=0; $nextprinciple=0; $nextinterest=0; $collectionprinciple=0; $collectioninterest=0; $paidPriciple=0;
                            $paidInterest=0;    
                    } 
                } 


              $page->drawText($overprinciple,$x1, $y1);
                    $total1 = $total1 + $overprinciple;;

              $page->drawText($overinterest,$x2, $y1);

                    $total2 = $total2 + $overinterest;;

              $page->drawText($nextprinciple,$x3, $y1);
                    $total3 = $total3 + $nextprinciple; 


            $page->drawText($nextinterest,$x4, $y1);
                    $total4 = $total4 + $nextinterest;


            $page->drawText($overprinciple + $nextprinciple,$x5, $y1);
                     $total5 = $total5 + ($overprinciple + $nextprinciple);

	    $page->drawText($overinterest + $nextinterest,$x6, $y1);
                    $total6 = $total6 + ($overinterest + $nextinterest);


             $page->drawText($collectionprinciple,$x7, $y1);
                    $total7 = $total7 + $collectionprinciple;


 		$page->drawText($collectioninterest,$x8, $y1);
                    $total8 = $total8 + $collectioninterest;


             $page->drawText($paidPriciple,$x9, $y1);
                    $total9 = $total9 + $paidPriciple;


             $page->drawText($paidInterest,$x10, $y1);
                    $total10 = $total10 + $paidInterest;


             $page->drawText($collectiontotal=$collectionprinciple + $paidPriciple,$x11, $y1);
                        $total11 = $total11 + ($collectionprinciple + $paidPriciple);


             $page->drawText($interesttotal=$collectioninterest + $paidInterest,$x12, $y1);
                        $total12 = $total12 + ($collectioninterest + $paidInterest);


             $page->drawText($prinbalance=($overprinciple + $nextprinciple) - $collectiontotal,$x13, $y1);
                        $total13 = $total13 + $prinbalance;

 		$page->drawText($interestbalance=($overinterest + $nextinterest) -$interesttotal,$x14, $y1);
                        $total14 = $total14 + $interestbalance;

		$y1 = $y1 - 25;
          } 



		$page->drawText("TOTAL",$x0,$y1);

		$page->drawText($total1,$x1,$y1);
                $page->drawLine($x1-5, $y1-15, $x1-5, $my1);

		$page->drawText($total2,$x2,$y1);
                $page->drawLine($x2-5, $y1-15, $x2-5, $my1);

		$page->drawText($total3,$x3,$y1);
                $page->drawLine($x3-5, $y1-15, $x3-5, $my1);

		$page->drawText($total4,$x4,$y1);
                $page->drawLine($x4-5, $y1-15, $x4-5, $my1);

		$page->drawText($total5,$x5,$y1);
                $page->drawLine($x5-5, $y1-15, $x5-5, $my1);

		$page->drawText($total6,$x6,$y1);
                $page->drawLine($x6-5, $y1-15, $x6-5, $my1);

		$page->drawText($total7,$x7,$y1);
                $page->drawLine($x7-5, $y1-15, $x7-5, $my1);

		$page->drawText($total8,$x8,$y1);
                $page->drawLine($x8-5, $y1-15, $x8-5, $my1);

		$page->drawText($total9,$x9,$y1);
                $page->drawLine($x9-5, $y1-15, $x9-5, $my1);

		$page->drawText($total10,$x10,$y1);
                $page->drawLine($x10-5, $y1-15, $x10-5, $my1);

		$page->drawText($total11,$x11,$y1);
                $page->drawLine($x11-5, $y1-15, $x11-5, $my1);

		$page->drawText($total12,$x12,$y1);
                $page->drawLine($x12-5, $y1-15, $x12-5, $my1);


		$page->drawText($total13,$x13,$y1);
                $page->drawLine($x13-5, $y1-15, $x13-5, $my1);

		$page->drawText($total14,$x14,$y1);
		$page->drawLine(25, $y1-15, 810, $y1-15);// after table horizontal line


                $page->drawLine($x14-5, $y1-15, $x14-5, $my1);

		$pdf->save('/var/www/'.$projname.'/reports/DCB.pdf');
		$path = '/var/www/'.$projname.'/reports/DCB.pdf';
	        chmod($path,0777);
               // $this->_redirect('dcb/index');
	}
}
