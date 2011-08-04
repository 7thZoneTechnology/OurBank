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
class Familyform_IndexController extends Zend_Controller_Action
{
	public function init() 
	{
        $this->view->pageTitle='Family form';
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
		$familyForm = new Familyform_Form_Familyform();
		$this->view->form = $familyForm;
		if ($this->_request->isPost() && $this->_request->getPost('Search')) {
		$id = $this->_getParam('membercode');
		$this->view->id = $id;
 	$familydetails = new Familyform_Model_Familyform();
 		$result = $familydetails->getFamilydetails($id);
		$this->view->familydetails = $result;
        $this->view->family =$familydetails->getfamily($id);
        $this->view->livingassets=$familydetails->getlivingassetsdetails($id);
        $this->view->nonlivingassets=$familydetails->getnonliving();
		$this->view->agriculture=$familydetails ->getagriculturedetails($id);
		$this->view->agritotal =$familydetails-> getagritotal($id);
		$this->view->loanrequest =$familydetails-> Searchloanprocess($id);
		$this->view->loan =$familydetails-> searchaccounts($id);
		$this->view->membercode = $id;

	}
// 		} else {
//             $this->_redirect('index/error');
// 		}
	}	
	function viewtransactionAction() {
	}

	function pdfgenerationAction() {
		//$fetchMeetings=new Meetingreport_Model_Meetingreport();

		$pdf = new Zend_Pdf();
		$page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
// 		 $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4_LANDSCAPE);
		$pdf->pages[] = $page;
		// Image
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname='';
		for($i=0; $i<count($word); $i++) {
			if($i>0 && $i<(count($word)-1)) { $projname.='/'.$word[$i]; }
		}
		$image_name = "/var/www".$app."/images/logo.jpg";
		$image = Zend_Pdf_Image::imageWithPath($image_name);
		//$page->drawImage($image, 25, 770, 570, 820);
	
				$page->drawImage($image, 30, 770, 130, 820);
	$page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
	$page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
	$page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
	$page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal
	$page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
	
	$text = array("Family id",
		"Name of the familyowner",
		"Husbands/fathers name",
		"Date of birth",
		"Gender","Address","Mobile number","Caste","Education","Family type","Detail of the family member","Name of Member","Relation to HOF","Gender","Age","Entitlements","Education level","Occupation","Branch","Bank acc","Mobile num","Other assets","Details of Tenant","Village","Survey No","Acre","Value","Livestock","Name","Numbers","Total value","Total Assets","Assets type","Total");
		
	$x0 = 60; 
	$x10 = 250;
	$x11 = 285;
		$id = $this->_getParam('membercode');
//print_r($id);		
		
		$familydetails = new Familyform_Model_Familyform();
  		
  		$result = $familydetails->getFamilydetails($id); 
// // Zend_Debug::dump($result);		
//  		
 		$family = $familydetails->getfamily($id);
		$this->view->familydetails = $result;
        $this->view->livingassets=$familydetails->getlivingassetsdetails($id);
        $this->view->nonlivingassets=$familydetails->getnonliving();
		$this->view->agriculture=$familydetails ->getagriculturedetails($id);
		$this->view->agritotal =$familydetails-> getagritotal($id);
		$this->view->loanrequest =$familydetails-> Searchloanprocess($id);
		$this->view->loan =$familydetails-> searchaccounts($id);

	$page->drawText($text[0], $x0, 725);
	$page->drawText($text[1], $x0, 710);
	$page->drawText($text[2], $x0, 695);
	$page->drawText($text[3], $x0, 680);
	$page->drawText($text[4], $x0, 665);
	$page->drawText($text[5], $x0, 650);
	$page->drawText($text[6], $x0, 635);
	$page->drawText($text[7], $x0, 620);
	$page->drawText($text[8], $x0, 605);
	$page->drawText($text[9], $x0, 590);
	$page->drawText($text[10], $x0, 575);
	$page->drawText($text[11], $x0, 560);
	$page->drawText($text[12], 135, 560);
	$page->drawText($text[13], 200, 560);
	$page->drawText($text[14], 235, 560);
	$page->drawText($text[15], 255, 560);
	$page->drawText($text[16], 310, 560);
	$page->drawText($text[17], 380, 560);
	$page->drawText($text[18], 430, 560);
	$page->drawText($text[19], 470, 560);
	$page->drawText($text[20], 510, 560);
	$page->drawText($text[21], 60, 500);
	$page->drawText($text[22], 60, 470);
	$page->drawText($text[23], 160, 470);
	$page->drawText($text[24], 240, 470);
	$page->drawText($text[25], 360, 470);
	$page->drawText($text[26], 460, 470);
	$page->drawLine(60, 460, 550, 460);
	$page->drawLine(60, 480, 550, 480);
	$page->drawText($text[27], 60, 400);
	$page->drawText($text[28], 60, 385);
	$page->drawText($text[29], 240, 385);
	$page->drawText($text[30], 460, 385);
	$page->drawLine(60, 380, 550, 380);
	$page->drawLine(60, 395, 550, 395);
	$page->drawText($text[31], 60, 360);
	$page->drawText($text[32], 60, 345);
	$page->drawText($text[33], 460, 345);
	$page->drawLine(60, 335, 550, 335);
	$page->drawLine(60, 355, 550, 355);



	foreach ($result as $familydetails){
		$page->drawText($familydetails['family_id'], $x10, 725);
		$page->drawText($familydetails['name'], $x10, 710);
		//$page->drawText($familydetails['name'], $x10, 695);
		//$page->drawText($familydetails['name'], $x10, 680);
		$page->drawText($familydetails['sex'], $x10, 665);
		$page->drawText($familydetails['street'], $x10, 650);
		$page->drawText($familydetails['villagename'], $x11, 650);
		$page->drawText($familydetails['mobile'], $x10, 635);
		$page->drawText($familydetails['castetype'], $x10, 620);
		$page->drawText($familydetails['educationname'], $x10, 605);
		$page->drawText($familydetails['familytype'], $x10, 590);
		$page->drawLine(60, 570, 550, 570);
		$page->drawLine(60, 550, 550, 550);
	}

	$y1 = 700;
	$totalAmount="0"; 
	$totaldebit="0"; 

		$pdfData = $pdf->render();
		
		$pdf->save('/var/www'.$projname.'/reports/familyform'.date('Y-m-d').'.pdf');
		$path = '/var/www'.$projname.'/reports/familyform'.date('Y-m-d').'.pdf';
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