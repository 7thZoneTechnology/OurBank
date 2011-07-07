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
class Affidavit_IndexController extends Zend_Controller_Action 
{
    public function init()
    {
//         $this->view->pageTitle = 'Affidavit';
        $this->view->title = 'Loan Process';
        $this->view->Dbobj = new Affidavit_Model_Affidavit();
        $this->view->adm = new App_Model_Adm ();

        /* Initialize action controller here */
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data)
        {
            $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }
        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id
        $this->view->cl=new App_Model_Users();
        $loginname=$this->view->cl->username($userid);
        foreach($loginname as $loginname) 
        {
            $this->view->username=$loginname['username']; // get the user name
        }

    }
    public function indexAction()
    {
        $this->view->title = 'Loan Process';
                $storage = new Zend_Auth_Storage_Session();
                $data = $storage->read();
                if (!$data) {
                        $this->_redirect('index/login');
                }
                $searchForm = $this->view->form = new Affidavit_Form_Search();
 		if ($this->_request->isPost() && $this->_request->getPost('Submit')){
                $formData = $this->_request->getPost();
                    if ($searchForm->isValid($formData)) {
                            $this->view->withdrawalamount = $this->_request->getParam('amount');
                            $this->view->membercode=$this->_request->getParam('s1');
                            $result = $this->view->Dbobj->getMember($this->_request->getParam('s1'));
                            $page = $this->_getParam('page',1);
                            $paginator = Zend_Paginator::factory($result); // assign searched values for pagination
                            $paginator->setItemCountPerPage($this->view->adm->paginator());
                            $paginator->setCurrentPageNumber($page);
                            $this->view->paginator = $paginator;
                            $paginator->setItemCountPerPage($this->view->adm->paginator());
	                    $paginator->setCurrentPageNumber($page);
                            $this->view->search = true;
                    } 
            }
    }
    public function declarationAction()
    {
            $this->view->groupid = $groupid = base64_decode($this->_request->getParam('id'));
            $this->view->groupcode=$groupcode=base64_decode($this->_request->getParam('membercode'));
            $this->view->memberdetails=$memberdetails=$this->view->Dbobj->fetchmembers($groupid);
            $this->view->representative=$this->view->Dbobj->fetchrepresentative($groupid);
            $this->view->groupdetails = $this->view->Dbobj->getMember($groupcode);
            $bankdetails = $this->view->Dbobj->getbankdetails($this->view->groupdetails[0]['branch_id']);
            $this->view->bankdetails = $bankdetails;
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

    public function pdfAction()
    {
            $this->view->groupid=$groupid = base64_decode($this->_request->getParam('id'));
            $this->view->groupcode=$groupcode=base64_decode($this->_request->getParam('membercode'));
            $this->view->memberdetails=$memberdetails=$this->view->Dbobj->fetchmembers($groupid);
            $this->view->representative=$this->view->Dbobj->fetchrepresentative($groupid);
            $this->view->groupdetails = $this->view->Dbobj->getMember($groupcode);
            $bankdetails= $this->view->Dbobj->getbankdetails($this->view->groupdetails[0]['branch_id']);
            $this->view->bankdetails = $bankdetails;

$shgdeclaration=" SHG I hereby declare and confirm further that I have not committed any default in paying the lease amount to the lesser and have not committed any breach of the terms and conditions of the lease.Moreover,I declare further that there are no arrears of any lease amount.

I have also not resorted to outside borrowing against security of the present crop which is the subject matter of the bank finance.The crop to be raised is free from the charge/encumbrances.";

$jlgdeclaration=" JLG I hereby declare and confirm further that I have not committed any default in paying the lease amount to the lesser and have not committed any breach of the terms and conditions of the lease.Moreover,I declare further that there are no arrears of any lease amount.

I have also not resorted to outside borrowing against security of the present crop which is the subject matter of the bank finance.The crop to be raised is free from the charge/encumbrances.";

        $pdf = new Zend_Pdf();
foreach($this->view->memberdetails as $memberdetails) {
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
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 10);
        $title="";
        if(substr($this->view->groupcode,4,1) == 2) {
            $title="Self Helf Group member";  
             }
            else if(substr($this->view->groupcode,4,1) == 3) {
           $title="Joint Liability Group member"; 
             }
        $page->drawText($title,230, 740);
        $page->drawText($title,230, 740);

        //set the font
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
        $page->drawText("Date : ".date('d-m-Y'),500, 800); 
        $y1=710;	
        $y2=740;
        $x1 = 60; 
        $x2 = 350; 
        $x3 = 230;
        $x4 = 400;


if($y1>45){ 
        $page->drawText("To,",$x1, $y1);
        $page->drawText("The Branch manager,",$x1, $y1=$y1-15);
        $page->drawText($this->view->bankdetails[0]['bankname'].',',$x1, $y1=$y1-15);
        $page->drawText($this->view->bankdetails[0]['branch'].'.',$x1, $y1=$y1-15);

        $page->drawText('Respected sir,',$x1, $y1=$y1-35);
        if($memberdetails['alias']) { $alias="@ ".$memberdetails['alias']; } else { $alias=''; }

//echo $memberdetails['village_id'];
        $village=$this->view->Dbobj->fetchvillagedetails($memberdetails['village_id']);

        $subject=$memberdetails['membername']." ".$alias." ".$memberdetails['age']." Age ".$this->view->groupdetails[0]['group_name']." Group ".$village[0]['villagename']." Village ".$village[0]['talukname']." Taluk ".$village[0]['distname']." District.";
        $page->drawText($subject,$x1, $y1=$y1-25);

            $y1=$y1-25;
            $addressline=0;

            if(substr($this->view->groupcode,4,1) == 2) {  
            $newtext = wordwrap($shgdeclaration, 30, "<br />");
            $pieces = explode("<br />", $newtext);
                    $page->drawText($pieces[0],$x1, $y1);
            }
            else if(substr($this->view->groupcode,4,1) == 3) { 
            $newtext = wordwrap($jlgdeclaration, 130, "<br />");
            $pieces = explode("<br />", $newtext);
                    foreach($pieces as $pieces1) 	{ 
                    $page->drawText(substr($pieces1,0,300),$x1,$y1); $y1-=15; $addressline++; 
                    } 
                    $y1-=($addressline)*15;
            //         $page->drawText($pieces,$x1, $y1);
            }

            $y1=$y1-35;
                    $page->drawText("Date :".$this->view->groupdetails[0]['group_created_date'],$x1, $y1);
                    $page->drawText("yours obediently,",$x2, $y1);
                    $page->drawText("Place :".$this->view->groupdetails[0]['place'],$x1, $y1=$y1-15);
            $y1=$y1-35;
                    $page->drawText($memberdetails['membername'],$x2, $y1);
                    $page->drawText("Signature",$x2, $y1=$y1-15);
            $y1=$y1-45;
                    $page->drawText("Representative Seal & signature",$x1, $y1);
            $y1=$y1-25;
                    $page->drawText("Representative 1",$x1, $y1);
                    $page->drawText("Representative 2",$x3, $y1);
                    $page->drawText("Representative 3",$x4, $y1);
            $y1=$y1-15;
            foreach($this->view->representative as $representative) 
            {
                    $page->drawText($representative['membername'],$x1, $y1);
                    $x1=$x1+170;
            }
    }
}

        $pdfData = $pdf->render();
        $pdf->save('/var/www/'.$projname.'/reports/membersdeclaration.pdf');
        $path = '/var/www/'.$projname.'/reports/membersdeclaration.pdf';
        chmod($path,0777);
    }
}

