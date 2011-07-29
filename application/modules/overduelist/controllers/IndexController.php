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
class Overduelist_IndexController extends Zend_Controller_Action
{
    function init() 
    { 
   $this->view->pageTitle=$this->view->translate('Overdue List');
	$sessionName = new Zend_Session_Namespace('ourbank');
    $this->view->type = "generalFields";
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
 
        $this->view->adm = new App_Model_Adm();
        $this->view->dateconvertor=new App_Model_dateConvertor();
    }

    function indexAction()
    {
        $app=$this->view->baseUrl();
     	$searchForm = new Overduelist_Form_Search($app);
       	$this->view->form = $searchForm;
	$overduemodel = new Overduelist_Model_Overduelist();

        $hierarchy = $overduemodel->getofficehierarchy();
        foreach($hierarchy as $hiearchyids){
        $hiearchyid = $hiearchyids['hierarchyid'];
        }
        $institution = $overduemodel->office($hiearchyid);

	foreach($institution as $institution) 
        {
	   $searchForm->bank_id->addMultiOption($institution['village_id'],$institution['villagename']);
	}
        $loanofficer = $this->view->adm->viewRecord("ourbank_user","id","DESC");
	foreach($loanofficer as $loanofficer)
        {
	   $searchForm->loanofficer ->addMultiOption($loanofficer['id'],$loanofficer['name']);
	}

     	if ($this->_request->isPost() && $this->_request->getPost('Search')) 
        {
            $formData = $this->_request->getPost(); //print_r($formData);
            if ($searchForm->isValid($formData)) 
            {
            $this->view->loanofficerid=$officer = $this->_request->getParam('loanofficer');
            if($officer){
            $officename=$overduemodel->getofficername($officer);
            $this->view->officername=$officename[0]['name'];
            }
            $this->view->bankid=$bank = $this->_request->getParam('bank_id');
            if($bank){
            $bankname=$overduemodel->getbanknames($bank);
            $this->view->bankname=$bankname[0]['name'];
            }
            $this->view->normaldate=$this->_request->getParam('datefrom');
            $this->view->asofdate=$date = $this->view->dateconvertor->phpmysqlformat($this->_request->getParam('datefrom'));
            $this->view->loanView=$arrayLoan=$overduemodel->search($date,$bank,$officer);
            }
        }
    }

    public function getloanofficerAction() 
    { 
	$this->_helper->layout->disableLayout();
        $bankid=$this->_request->getParam('bankid');
        $app=$this->view->baseUrl();
     	$this->view->form = new Overduelist_Form_Search($app);

       	$overduemodel=new Overduelist_Model_Overduelist();
        $loanofficer=$overduemodel->getloanofficer($bankid);
	foreach($loanofficer as $officer) 
        {
	   $this->view->form->loanofficer->addMultiOption($officer['id'],$officer['name']);
        }
    }

     public function reportdisplayAction() {
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
        $this->_helper->layout->disableLayout();
        $file1 = $this->_request->getParam('file'); 
        $this->view->filename = "/".$projname."/reports/".$file1;
    }

    public function pdftransactionAction()
    { 
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
        $Date = $this->_request->getParam('field1');
        $branch=$this->_request->getParam('field2');
	$officer=$this->_request->getParam('field3');
	$resulttitle=$this->_request->getParam('result');
        $branchname=new Overduelist_Model_Overduelist();
	$dateconvertor = new App_Model_dateConvertor();
 	$this->view->date1=$dateconvertor->normalformat($Date);
	$this->view->field1=$Date;
        $result=$branchname->getbanknames($branch);
        $this->view->val=10;
        $bankname=$branchname->getbanknames($branch);
		foreach($bankname as $bankname1)
        	{ 
       		 	$this->view->bankname=$bankname1['name'];
        	}
	$officename=$branchname->getofficername($officer);
		foreach($officename as $officename1)
        	{ 
       		 $this->view->officername=$officename1['name'];
        	}
        $pdf = new Zend_Pdf();
        $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
        $pdf->pages[] = $page;
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

        $text = array("Over due list",
                    "Account Number",
                    "Number of overdue","Age(in days)",
                    "OverDue Amount",
                    "Total",
                    "Outstanding Balance","From Date:","To Date:","There is not Outstanding Balance in between two dates");
 
        $x1 = 80; 
        $x2=250;
        $x3 = 220;
        $x4 = 320;
        $x6 = 450;
        $y1= 700;

        $page->drawLine(50, 740, 550, 740);
        $page->drawLine(50, 720, 550, 720);

        $page->drawText($text[0], $x2, 770);
        $page->drawText($text[1], $x1, 725);
        $page->drawText($text[2], $x3, 725);
        $page->drawText($text[3], $x4, 725);
        if($this->view->officername){$page->drawText("Loan officer: ".$this->view->officername, $x6, 745);}
	if($this->view->bankname){$page->drawText("Bank: ".$this->view->bankname, $x6, 755);}
	$page->drawText("As of ".$this->view->date1, $x6, 765);
	$page->drawText("Amount in Rs", $x1, 745);
        $page->drawText($text[4], $x6, 725);

        $arrayLoan=$branchname->search($Date,$branch,$officer);
        $this->view->loanView = $arrayLoan;
	$outstanding_amount="0";
        foreach($arrayLoan as $loanduelist)
        {   $outstanding_amount+=$loanduelist['overdue'];	
            $page->drawText($loanduelist['account_number'],$x1, $y1);

	    $pos=$dateconvertor->position($loanduelist['totalinstallments'],$x4-20);
            $page->drawText($loanduelist['totalinstallments'],$pos+2,$y1);

	    $pos=$dateconvertor->position($dateconvertor->dateDiff($loanduelist['installment_date'], $Date),$x6-70);
            $page->drawText($dateconvertor->dateDiff($loanduelist['installment_date'], $Date),$pos+2,$y1);

	    $pos=$dateconvertor->position(sprintf("%4.2f",$loanduelist['overdue']),540);
            $page->drawText(sprintf("%4.2f",$loanduelist['overdue']),$pos+2,$y1);
            //$page->drawText($loanduelist['overdue'],$x6, $y1);
            $y1 -= 15;
	}
        $page->drawLine(50, $y1, 550, $y1);
        $y2=$y1-10;
        $page->drawText($text[5], $x1, $y2);
	$pos=$dateconvertor->position(sprintf("%4.2f",$outstanding_amount),540);
        $page->drawText(sprintf("%4.2f",$outstanding_amount),$pos+2,$y1-10);
//        $page->drawText($outstanding_amount, $x6, $y2);
        $y3=$y2-5;
        $page->drawLine(50, $y3, 550, $y3);
        $pdfData = $pdf->render();
        $pdf->save('/var/www/'.$projname.'/reports/overduelist.pdf');
        $path = '/var/www/'.$projname.'/reports/overduelist.pdf';
        chmod($path,0777);
        //$this->_redirect('/reports/loandue');

    }
}

