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
class Sbi_IndexController extends Zend_Controller_Action
{
	public function init() 
	{
        $this->view->pageTitle='Loan application';

         $globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];


	$storage = new Zend_Auth_Storage_Session();
        		$data = $storage->read();
        		if(!$data){
           		 $this->_redirect('index/login');
                        }
		$this->view->adm = new App_Model_Adm();   	
	}

	public function indexAction() 
	{
		$familyForm = new Familyform_Form_Familyform();
		$this->view->form = $familyForm;
		if ($this->_request->isPost() && $this->_request->getPost('Search')) {
		$id = $this->_getParam('membercode');
        $this->view->groupid=$id;
        // create instance for groupcommon model page

        $groupcommon=new Familyform_Model_Group();
        $group_name=$groupcommon->getgroup($id); // get group details
        $group_location=$groupcommon->getlocation($id); // get group Location details - Latitude and longitude
        foreach($group_location as $location){
                $this->view->latitude = $location['latitude'];
                $this->view->longitude = $location['longitude'];
        }
        $this->view->groupname=$group_name;
        $group_members=$groupcommon->getgroupmembers($id); // get group members
        $this->view->groupmembers=$group_members;
        $dbobj= new Groupmdefault_Model_groupdefault();
        $groupheaddetails = $dbobj->Getgrouphead($id); //Get group head
            foreach($groupheaddetails as $grouphead){
                    $this->view->grouphead = $grouphead['head'];
            }
        $this->view->address = $this->view->adm->getmodule("ourbank_address",$id,"Group");// get address for particular group
        $module=$groupcommon->getmodule('Group');
        foreach($module as $module_id){ }
        $this->view->mod_id=$module_id['parent'];
        $this->view->sub_id=$module_id['module_id'];

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
	
	$text = array("Bank","Branch","Thumb Impression Declaration","I hereby declare that Smt/sri ______________________ has given the thumb impression in the presence of me and his mother tongue"," ___________________________","Date","Yours sincerely");
		
	$x0 = 60; 
	$x10 = 450;
	$x11 = 285;

		
	$page->drawText($text[0], $x0, 725);
	$page->drawText($text[1], $x0, 700);
	$page->drawText($text[2], $x0, 675);
	$page->drawText($text[3], $x0, 650);
	$page->drawText($text[4], $x0, 625);
	$page->drawText($text[5], $x0, 575);
	$page->drawText($text[6], $x10, 575);

	$page->setLineWidth(1)->drawLine(50, 750, 550, 750); 
	$page->setLineWidth(1)->drawLine(50, 750, 50, 465); 
	$page->setLineWidth(1)->drawLine(50, 750, 50, 465); 
	$page->setLineWidth(1)->drawLine(50, 465, 550, 465); 
	$page->setLineWidth(1)->drawLine(550, 465, 550, 750); 
	$page->setLineWidth(1)->drawLine(50, 690, 550, 690); 
	$page->setLineWidth(1)->drawLine(50, 670, 550, 670); 

		
	

	$y1 = 700;
	$totalAmount="0"; 
	$totaldebit="0"; 

		$pdfData = $pdf->render();
		
		$pdf->save('/var/www'.$projname.'/reports/thumbdeclaration'.date('Y-m-d').'.pdf');
		$path = '/var/www'.$projname.'/reports/thumbdeclaration'.date('Y-m-d').'.pdf';
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
