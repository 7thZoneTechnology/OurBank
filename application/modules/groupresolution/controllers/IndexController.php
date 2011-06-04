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
class Groupresolution_IndexController extends Zend_Controller_Action
{
	public function init() 
	{
        $this->view->pageTitle='Membership';

    
		$this->view->adm = new App_Model_Adm();   


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

	public function indexAction() 
	{
        $familyForm = new Familyform_Form_Familyform();
        $this->view->form = $familyForm;
        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();
        if ($familyForm->isValid($formData)) {

            $id = $this->_getParam('membercode');
            $this->view->groupid=$id;
//             // create instance for groupcommon model page
            $groupcommon=new Groupresolution_Model_Groupresolution();
            $group_name=$groupcommon->getgroup($id); // get group details

// // //            Zend_Debug::dump($group_name);
            if($group_name) {
 $getgroupaccount=$groupcommon->getgroupaccount($id); // get group details
            $group_location=$groupcommon->getlocation($id); // get group Location details - Latitude and longitude
                foreach($group_location as $location){
                        $this->view->latitude = $location['latitude'];
                        $this->view->longitude = $location['longitude'];
                }

            $this->view->groupname=$group_name;
            $this->view->getgroupaccount=$getgroupaccount;
    
            $group_members=$groupcommon->getgroupmembers($id); // get group members
            $this->view->groupmembers=$group_members;
            $dbobj= new Groupmdefault_Model_Groupdefault();
            $groupheaddetails = $dbobj->Getgrouphead($id); //Get group head
                foreach($groupheaddetails as $grouphead){
                        $this->view->grouphead = $grouphead['head'];
                }
            $this->view->address = $this->view->adm->getmodule("ourbank_address",$id,"Group");// get address for particular group
            $module=$groupcommon->getmodule('Group');
            foreach($module as $module_id){ }
            $this->view->mod_id=$module_id['parent'];
            $this->view->sub_id=$module_id['module_id'];
	} else {

$this->view->error = "Enter valid code";
}
     }
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
	
	$text = array("Group name:","Group head:","Date:","group code:","purpose:","Bank:","S.no","Member name","Survey no","Loan request amount","Signature","Address:");
		
	

		

	$page->drawText($text[0], 60, 725);
	$page->drawText($text[1], 60, 675);
	$page->drawText($text[2], 450, 725);
	$page->drawText($text[3], 450, 710);
	$page->drawText($text[4], 60, 660);
	$page->drawText($text[5], 60, 645);
	$page->drawText($text[6], 60, 625);
	$page->drawText($text[7], 140, 625);
	$page->drawText($text[8], 230, 625);
	$page->drawText($text[9], 330, 625);
	$page->drawText($text[10], 450, 625);
	$page->drawText($text[11], 60, 710);

	$page->setLineWidth(1)->drawLine(30, 640, 500, 640); //bottom horizontal
	$page->setLineWidth(1)->drawLine(30, 620, 500, 620); //bottom horizontal

	$y1 = 700;

		$id = $this->_getParam('membercode');


	  $groupcommon=new Groupresolution_Model_Groupresolution();
        $group_name=$groupcommon->getgroup($id); // get group details
        $getgroupaccount=$groupcommon->getgroupaccount($id); // get group details


        $group_location=$groupcommon->getlocation($id); // get group Location details - Latitude and longitude
        foreach($group_location as $location){
                $this->view->latitude = $location['latitude'];
                $this->view->longitude = $location['longitude'];
        }
        $this->view->getgroupaccount=$getgroupaccount;

        $group_members=$groupcommon->getgroupmembers($id); // get group members
        $this->view->groupmembers=$group_members;
	 $i=1; foreach($group_name as $memberdetail) : 

	$page->drawText($memberdetail['groupname'],120, 725);
	$page->drawText($memberdetail['address1'],120, 710);
	$page->drawText($memberdetail['address2'],120, 700);
	$page->drawText($memberdetail['address3'],120, 690);

endforeach ;
	foreach($group_members as $membergroup) : 
	$page->drawText($membergroup['purposename'],120, 660);
	$page->drawText($membergroup['bank'],120, 645);
	$page->drawText(date('d-m-Y'),510, 725);
	$page->drawText($membergroup['groupcode'],510, 710);
	$page->drawText($membergroup['membername'],140, 610);
	$page->drawText($membergroup['survey_no'],230, 610);
	$page->drawText($membergroup['request_amount'],330, 610);
	$page->setLineWidth(1)->drawLine(30, 640, 30, 500);
	$page->setLineWidth(1)->drawLine(30, 500, 500, 500); //bottom horizontal
	$page->setLineWidth(1)->drawLine(500, 640, 500, 500); //bottom horizontal
	$page->setLineWidth(1)->drawLine(100, 640, 100, 500);
	$page->setLineWidth(1)->drawLine(210, 640, 210, 500);
	$page->setLineWidth(1)->drawLine(300, 640, 300, 500);
	$page->setLineWidth(1)->drawLine(450, 640, 450, 500);


endforeach ;

		$pdfData = $pdf->render();
		
		$pdf->save('/var/www'.$projname.'/reports/groupresolution'.date('Y-m-d').'.pdf');
		$path = '/var/www'.$projname.'/reports/groupresolution'.date('Y-m-d').'.pdf';
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
