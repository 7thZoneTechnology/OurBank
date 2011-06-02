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
class Grouplaw_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->pageTitle = $this->view->translate('Group law');
        $this->view->title = 'Accounting';
        $this->view->adm = new App_Model_Adm ();
        $this->view->datechange= new App_Model_dateConvertor();
        $this->view->loan = new Grouplaw_Model_grouplaw ();
         $globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];
    }

    public function indexAction() 
    {

        $declarationform = new Grouplaw_Form_grouplaw();
        $this->view->form = $declarationform;

        $dec = $this->view->adm->viewRecord("ourbank_declaration","id","DESC");
        foreach($dec as $dec)
        {
            $declarationform->age->addMultiOption($dec['id'],$dec['name']);
        }
        //submit action
        if ($this->_request->isPost() && $this->_request->getPost('Submit'))
        {
            $this->view->code = $groupcode = $this->_request->getParam('membercode');
            $formData = $this->_request->getPost();
            if ($declarationform->isValid($formData))
            {
                $this->view->loan = new Grouplaw_Model_grouplaw ();
                $group_name = $this->view->loan->groupDeatils($groupcode);
                $this->view->groupmembers= $this->view->loan->getgroupmembers($groupcode);
                if($group_name)
                {
                    $this->view->result = $group_name;
                }
                else
                {
                    $this->view->error = "Record Not Found ... ";
                }
            }
        }
    }
	
    public function reportdisplayAction() 
    {
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
        $this->_helper->layout->disableLayout();
        $file1 = $this->_request->getParam('file'); 
        $this->view->filename = "/".$projname."/reports/".$file1;
    }

    function pdfdisplayAction()
    {	
		$app = $this->view->baseUrl();
		$word=explode('/',$app);
		$projname = $word[1];
		
		  $pdf = new Zend_Pdf();
		$page = new Zend_Pdf_Page(Zend_Pdf_Page::SIZE_A4);
		$pdf->pages[] = $page;
		// Image
		$image_name = "/var/www/".$projname."/public/images/logo.jpg";
		$image = Zend_Pdf_Image::imageWithPath($image_name);
		//$page->drawImage($image, 25, 770, 570, 820);
	           $page->drawImage($image, 30, 770, 130, 820);
		$page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
		$page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
		$page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
		$page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizonta

                // define font resource
                $font = Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA);
                // Image
                $image_name = "/var/www/".$projname."/public/images/logo.jpg";
                $image = Zend_Pdf_Image::imageWithPath($image_name);
				$x1=72;         $x2=410;
                $y1=690;    

            $Declaration = new Declaration_Model_Dec();
            $code=$this->_request->getParam('groupcode');
            $this->view->result = $this->view->loan->groupDeatils($code);
            $this->view->groupmembers= $this->view->loan->getgroupmembers($code);

            $dateconvert= new App_Model_dateConvertor();
            foreach($this->view->result as $result) { 
			

                // write text to page
                $page->setFont($font, 12)
                    ->drawText('Group bye law', 240, 720);
				

			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stimulate local development by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stimulate local development by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stimulate local development by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stimulate   '.$result['dayname'].'  The vision of Ourbank is to stimulate ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to    '.$result['place'].'    stimulate local development by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stimulate  '.$result['saving_perweek'].'  pment by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stimu  '.$result['rateinterest'].'  velopment by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stim  '.$result['penalty_latecoming'].'  evelopment by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stim   '.$result['penalty_notcoming'].'  velopment by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to st   '.$result['group_created_date'].'   elopment by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
			$page->setFont($font, 9)
                    ->drawText('The vision of Ourbank is to stimu    '.$result['name'].'    elopment by offering small and medium ',$x1,$y1);

			$y1=$y1-15;
                $page->setLineWidth(1)->drawLine(50, $y1, 550, $y1);

				$y1=$y1-15;
                $page->setFont($font, 9)
                    ->drawText('Member name',80,$y1);
				
				$page->setFont($font, 9)
                    ->drawText('UID',160,$y1);

				$page->setFont($font, 9)
                    ->drawText('Father name',200,$y1);

				$page->setFont($font, 9)
                    ->drawText('Nominee',280,$y1);

				$page->setFont($font, 9)
                    ->drawText('Nominee relationship',350,$y1);

				$page->setFont($font, 9)
                    ->drawText('Signature',460,$y1);
				$y1=$y1-10;
                $page->setLineWidth(1)->drawLine(50, $y1, 550, $y1);
foreach($this->groupmembers as $member) {
				$y1=$y1-15;
				$page->setFont($font, 9)
                    ->drawText(''.$member['membername'].'',80,$y1);

				$y1=$y1-15;
				$page->setFont($font, 9)
                    ->drawText(''.$member['uid'].'',160,$y1);

				$y1=$y1-15;
				$page->setFont($font, 9)
                    ->drawText(''.$member['family_id'].'',280,$y1);

				$y1=$y1-15;
				$page->setFont($font, 9)
                    ->drawText(''.$member['fathername'].'',200,$y1);

				$y1=$y1-15;
                $page->setLineWidth(1)->drawLine(50, $y1, 550, $y1);

	}
}
                $pdf->pages[] = $page;

                $pdfData = $pdf->render();
		$pdfData = $pdf->render();
		$pdf->save('/var/www/'.$projname.'/reports/grouplaw.pdf');
		$path = '/var/www/'.$projname.'/reports/grouplaw.pdf';
		chmod($path,0777);
//                 $this->_redirect('/declaration/index');
	}
}
