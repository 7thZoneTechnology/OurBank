<?php
class Par_IndexController extends Zend_Controller_Action 
{
        function init() 
	    {
        $this->view->pageTitle='Portfolio at risk';
        $sessionName = new Zend_Session_Namespace('ourbank');
	$userid=$this->view->createdby = $sessionName->primaryuserid;
	$login=new App_Model_Users();
        $this->view->type = "operationalReport";
         $this->view->dateconvert=new App_Model_dateConvertor();
	$loginname=$login->username($userid);
	foreach($loginname as $loginname) {
	$this->view->username=$loginname['username'];
        }
        $this->view->adm = new App_Model_Adm();
    }
	
	function indexAction() {
		$this->view->pageTitle="Portfolio at risk";
		$path=$this->view->baseUrl();
		$searchForm = new Par_Form_Search($path);
		$this->view->form = $searchForm;
		$par = new Par_Model_Par();

                $hierarchy = $par->getofficehierarchy();
                foreach($hierarchy as $hiearchyids){
                $hiearchyid = $hiearchyids['hierarchyid'];
                }
                $subBranch1 = $par->office($hiearchyid);
		
		foreach($subBranch1 as $subBranch) {
			$searchForm->branch->addMultiOption($subBranch['id'],$subBranch['name']);
		}

// 		$officername=$par->getUser1();
// 		foreach($officername as $officername1){
// 		$searchForm->loanofficer->addMultiOption($officername1['id'],$officername1['name']);
// 		}


		if ($this->_request->isPost() && $this->_request->getPost('Search')) {
			$branch='';
                        $loanofficer='';
			$fromdate = $this->_request->getParam('fromdate');
			$this->view->branch=$branch = $this->_request->getParam('branch');
		        $loanofficer = $this->view->officer = $this->_request->getParam('loanofficer');
			if($fromdate) {
				$disp= "As of <font color=#039>".$fromdate."</font>";
				if($branch){ 
					foreach($par->fetchbranch($branch) as $branchname){ }
					$disp.="<br> Branch : <font color=#039>".$branchname['name']."</font>";
				}

                                if($loanofficer){ 
					foreach($par->getUser1($branch) as $officername){ }
					$disp.="<br> Loan officer : <font color=#039>".$officername['officername']."</font>";
				}

				$this->view->resultshow=$disp;
				$this->view->fromdate=$fromdate=$this->view->dateconvert->phpmysqlformat($fromdate);
				$this->view->parrisk = $par->parrisk($fromdate,$branch,$loanofficer);
			}
		} else {
			$this->view->fromdate=$fromdate = $this->_request->getParam('fromdate');
			$this->view->branch=$branch = $this->_request->getParam('branch');
			$this->view->officer=$officer = $this->_request->getParam('loanofficer');
			if($fromdate) {
				$disp= "As of <font color=#039>".$this->view->dateconvert->phpnormalformat($fromdate)."</font>";

				if($branch){ $disp.="<br> Branch : "; }
				$this->view->resultshow=$disp;
				
				$this->view->parrisk = $par->parrisk($fromdate,$branch,$loanofficer);
			}
 		}
	}

	public function reportdisplayAction() {
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname='';
		for($i=0; $i<count($word); $i++) {
			if($i>0 && $i<(count($word)-1)) { $projname.='/'.$word[$i]; }
		}
		$this->_helper->layout->disableLayout();
		$file1 = $this->_request->getParam('file'); 
		$this->view->filename = $projname."/reports/".$file1;
	}


	public function pdftransactionAction() {
		$pdf = new Zend_Pdf();
		$page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4_LANDSCAPE);
		$pdf->pages[] = $page;
		//Path
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname='';
			for($i=0; $i<count($word); $i++) {
				if($i>0 && $i<(count($word)-1)) { $projname.='/'.$word[$i]; }
			}
		// Image
		$image_name = "/var/www".$app."/images/logo.jpg";
		$image = Zend_Pdf_Image::imageWithPath($image_name);
		$page->drawImage($image, 30, 520, 150, 570);
			$page->setLineWidth(1)->drawLine(25, 25, 810, 25); //bottom horizontal
			$page->setLineWidth(1)->drawLine(25, 25, 25, 570); //left vertical
			$page->setLineWidth(1)->drawLine(810, 25, 810 ,570); //right vertical
			$page->setLineWidth(1)->drawLine(25, 570, 810, 570); //top horizontal
	
		$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 14);
		$text = array("Month",
			"Loan A/C",
			"On Time",
			"1-30 Days",
			"31-60 Days",
			"61-90 Days",
			"91-180 Days",
			"181-360 Days",
			"361 Days above",
			"O/S Loan",
			"Total");
		$this->view->savings = 10;
		$this->view->fromdate=$fromdate = $this->_request->getParam('fromdate');
		$this->view->branch=$branch = $this->_request->getParam('branch');
		$this->view->officer=$officer = $this->_request->getParam('officer');

                $viewdate=$this->view->dateconvert->phpnormalformat($fromdate);
		$par = new Par_Model_Par();

                $disp= "As of <font color=#039>".$this->view->dateconvert->phpnormalformat($fromdate)."</font>";
                if($branch){ 
                        foreach($par->fetchbranch($branch) as $branchname){ }
                        $disp.="<br> Branch : <font color=#039>".$branchname['name']."</font>";
                }

                if($officer){ 
                        foreach($par->getUser1($branch) as $officername){ }
                        $disp.="<br> Loan officer : <font color=#039>".$officername['officername']."</font>";
                }

                $this->view->resultshow=$disp;

		$parrisk1=$this->view->parrisk = $par->parrisk($fromdate,$branch,$officer);

		$page->drawText("Portfolio at risk as of $viewdate",380, 520); //date('Y-m-d')

		//right alignment
		function position($amt,$posValue) {
			$len=strlen($amt);
			$pos=($posValue-10)-($len*5);
			return $pos;
		}

                $pos=position("Amount in Rs",780);
                $page->drawText("Amount in Rs",$pos, 460);

                $pos=position("Loan officer: ".$officername['officername'],780);
                $page->drawText("Loan officer: ".$officername['officername'],$pos+5, 480);

                $pos=position("Branch: ".$branchname['name'],780);
                $page->drawText("Branch: ".$branchname['name'],$pos, 500);

		$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);


//         $page->drawText("Date : ".date('d-m-Y'),600, 510); //date('Y-m-d')
		$x=array(40,100,200,250,320,400,470,540,640,730);
		$xl = array(35,95,195,245,315,395,465,535,615,725,800); 
	
		$y=450;$startpoint=$y;
		$xh1=95; $xh2=800;
		$page->drawLine($xh1,$y,$xh2,$y);$y-=15; //Top line1
			for($i=1; $i<(count($text)-1); $i++) {
				$page->drawText($text[$i],$x[$i], $y);
			} $y-=10;
		$page->drawLine($xh1,$y,$xh2,$y);$y-=15; //Top line2
	
			$total30 = "0.00";
			$total60 = "0.00";
			$total90 = "0.00";
			$total180 = "0.00";
			$total360 = "0.00";
			$total360days = "0.00";
			$total = "0.00";
	
			$today = $this->view->fromdate;
			$date30 = date('Y-m-d',strtotime(date("Y-m-d", strtotime($today)) . " -30 days"));
			$date60 = date('Y-m-d',strtotime(date("Y-m-d", strtotime($today)) . " -60 days"));
			$date90 = date('Y-m-d',strtotime(date("Y-m-d", strtotime($today)) . " -90 days"));
			$date180 = date('Y-m-d',strtotime(date("Y-m-d", strtotime($today)) . " -180 days"));
			$date360 = date('Y-m-d',strtotime(date("Y-m-d", strtotime($today)) . " -360 days"));
			
			$day30="0.00";$day60="0.00";$day90="0.00";$day180="0.00";$day360="0.00";$day360above="0.00";$r="0.00";
	
	
		$total30 = "0.00";    $total60 = "0.00";      $total90 = "0.00";
		$total180 = "0.00";       $total360 = "0.00";       $total360days = "0.00";        $total = "0.00";
	
		$a=array();
			foreach($parrisk1 as $parrisk3) { $a[]=$parrisk3->account_number; }
			$a=array_unique($a);	$a=array_values($a);
	
		for($i=0; $i<count($a); $i++) { $jj=0;$jj1=0;$jj2=0;
			foreach($parrisk1 as $parrisk2) { $duedate=$parrisk2->installment_date;
				if($a[$i]==$parrisk2->account_number) {
					if($duedate>=$date30 AND $duedate<=$today) { $day30 = $parrisk2->installment_amount;  } 
					else if($duedate>$date60 AND $duedate<=$date30) { $day60 = $parrisk2->installment_amount;  }
					else if($duedate>$date90 AND $duedate<=$date60) { $day90 = $parrisk2->installment_amount;  }

			else if($duedate>$date180 AND $duedate<=$date90) { 

				$amt1=$par->getAmount($date180,$date90,$parrisk2->account_number);
				if($jj==0) {
				foreach($amt1 as $amt2) { $day180+= $amt2['sumofdue']; }
				}
				$jj++;
// 			$day180 = $parrisk2->accountinstallment_amount; 
			}

			else if($duedate>$date360 AND $duedate<=$date180)  { 

				$amt3=$par->getAmount($date360,$date180,$parrisk2->account_number);
				if($jj1==0) {
				foreach($amt3 as $amt4) { $day360+= $amt4['sumofdue'];}
				}
				$jj1++;
// 				$day360 = $parrisk2->accountinstallment_amount;  
			}

			else  {

				$amt5=$par->getAmount1($date360,$parrisk2->account_number);
				if($jj2==0) {
				foreach($amt5 as $amt6) { $day360above+= $amt6['sumofdue'];}
				}
				$jj2++;
// 				$day360above = $parrisk2->accountinstallment_amount;  
			}

				}
			}
	
			$total30+=$day30; $total60+=$day60; $total90+=$day90; $total180+=$day180; $total360+=$day360; $total360days+=$day360above;

                        $page->drawText($a[$i],$x[1], $y);
                        $page->drawText('',$x[2], $y);
                        $pos=position(sprintf("%4.2f",$day30),$xl[4]);
                        $page->drawText(sprintf("%4.2f",$day30),$pos,$y);$r+=$day30;
// 			$page->drawText($day30,$x[3], $y);$r+=$day30;

                        $pos=position(sprintf("%4.2f",$day60),$xl[5]);
                        $page->drawText(sprintf("%4.2f",$day60),$pos,$y);$r+=$day60;
// 			$page->drawText($day60,$x[4], $y);$r+=$day60;

                        $pos=position(sprintf("%4.2f",$day90),$xl[6]);
                        $page->drawText(sprintf("%4.2f",$day90),$pos,$y);$r+=$day90;
// 			$page->drawText($day90,$x[5], $y);$r+=$day90;

                        $pos=position(sprintf("%4.2f",$day180),$xl[7]);
                        $page->drawText(sprintf("%4.2f",$day180),$pos,$y);$r+=$day180;
// 			$page->drawText($day180,$x[6], $y);$r+=$day180;

                        $pos=position(sprintf("%4.2f",$day360),$xl[8]);
                        $page->drawText(sprintf("%4.2f",$day360),$pos,$y);$r+=$day360;
// 			$page->drawText($day360,$x[7], $y);$r+=$day360;

                        $pos=position(sprintf("%4.2f",$day360above),$xl[9]);
                        $page->drawText(sprintf("%4.2f",$day360above),$pos,$y);$r+=$day360above;
// 			$page->drawText($day360above,$x[8], $y);$r+=$day360above;

                        $pos=position(sprintf("%4.2f",$r),$xl[10]);
                        $page->drawText(sprintf("%4.2f",$r),$pos,$y);
// 			$page->drawText($r,$x[9], $y);$r+=$day360;
			$y-=15;
			$day30="0.00";$day60="0.00";$day90="0.00";$day180="0.00";$day360="0.00";$day360above="0.00";$r="0.00";
		}
	
		$page->setLineWidth(1)->drawLine($xh1, $y, $xh2, $y); //Bottom line above Total
		$y-=15;
	
		$page->drawText($text[10],$x[1], $y);
		$pos=position(sprintf("%4.2f",$total30),$xl[4]);
                $page->drawText(sprintf("%4.2f",$total30),$pos,$y);
// 		$page->drawText($total30,$x[3], $y); 

                $pos=position(sprintf("%4.2f",$total60),$xl[5]);
                $page->drawText(sprintf("%4.2f",$total60),$pos,$y);
// 		$page->drawText($total60,$x[4], $y); 

                $pos=position(sprintf("%4.2f",$total90),$xl[6]);
                $page->drawText(sprintf("%4.2f",$total90),$pos,$y);
// 		$page->drawText($total90,$x[5], $y);

                $pos=position(sprintf("%4.2f",$total180),$xl[7]);
                $page->drawText(sprintf("%4.2f",$total180),$pos,$y);
// 		$page->drawText($total180,$x[6], $y);

                $pos=position(sprintf("%4.2f",$total360),$xl[8]);
                $page->drawText(sprintf("%4.2f",$total360),$pos,$y);
// 		$page->drawText($total360,$x[7], $y);

                $pos=position(sprintf("%4.2f",$total360days),$xl[9]);
                $page->drawText(sprintf("%4.2f",$total360days),$pos,$y);
// 		$page->drawText($total360days,$x[8], $y);

                $pos=position(sprintf("%4.2f",($total30+$total60+$total90+$total180+$total360+$total360days)),$xl[10]);
                $page->drawText(sprintf("%4.2f",($total30+$total60+$total90+$total180+$total360+$total360days)),$pos,$y);
// 	        $page->drawText(($total30+$total60+$total90+$total180+$total360+$total360days),$x[9], $y);
		$y-=10;
		$page->setLineWidth(1)->drawLine($xh1, $y, $xh2, $y); //Bottom line below Total
		
		for($i=1; $i<count($xl); $i++) {
			$page->setLineWidth(1)->drawLine($xl[$i], $y, $xl[$i], $startpoint); //All Vertical line
		}
		
		
		$pdfData = $pdf->render();
		$pdf->save('/var/www'.$projname.'/reports/par-'.date('Y-m-d').'.pdf');
		$path = '/var/www'.$projname.'/reports/par-'.date('Y-m-d').'.pdf';
		chmod($path,0777);
		
//		$this->_redirect("/reports/par/index/fromdate/$fromdate/branch/$branch/officer/$officer");
	}

        public function exceltransactionAction()
        {	$this->_helper->layout->disableLayout();
		$this->view->fromdate=$fromdate = $this->_request->getParam('fromdate');
		$this->view->branch=$branch = $this->_request->getParam('branch');
		$this->view->officer=$officer = $this->_request->getParam('officer');

                $viewdate=$this->view->dateconvert->phpnormalformat($fromdate);
		$par = new Par_Model_Par();
	    	$this->view->parrisk = $par->parrisk($fromdate,$branch,$officer); 

        }

	public function getofficerAction() { 
	$this->_helper->layout->disableLayout();
	$branch_id = $this->_request->getParam('branch_id');
        $app = $this->view->baseUrl();
	$searchForm = new Par_Form_Search($app);
        $this->view->form = $searchForm;
	$branchname= new Par_Model_Par();
	$this->view->branchname=$branchname->getUser1($branch_id);
	foreach($this->view->branchname as $office) {
	$searchForm->loanofficer->addMultiOption($office['user_id'],$office['officername']);
	}
	}
    }

