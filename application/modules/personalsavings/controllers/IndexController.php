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

class Personalsavings_IndexController extends Zend_Controller_Action
{

     function init()
     { 
      	$this->view->pageTitle = "Personal Savings";
        $this->view->title = "Reports";
        $this->view->type = "generalFields";
     }

     function indexAction()
     {

        $personalsavings = new Personalsavings_Model_personalsavings();
	$savingsSelect = $personalsavings->accountDetails();
        $this->view->savingslist = $savingsSelect;
        
         $globalsession = new App_Model_Users();
                $this->view->globalvalue = $globalsession->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];
 
                $storage = new Zend_Auth_Storage_Session();
                $data = $storage->read();
                if(!$data){
                 $this->_redirect('index/login');
                 }

// 	$paginator = Zend_Paginator::factory($savingsSelect);
//         $paginator->setCurrentPageNumber($this->_getParam("page")); 
//         $paginator->setItemCountPerPage(35);
//         $paginator->setPageRange(36);
//         $this->view->page=$this->_request->getParam('page');
//         $this->view->paginator = $paginator;
//         $this->view->depositeAmount = 0;
//         $this->view->withdrawlAmount = 0;
//         $this->view->totalAmount = 0;
    }

    function pdfgenerationAction() 
    {

        $personalsavings = new Personalsavings_Model_personalsavings();
	$savingsSelect = $personalsavings->accountDetails();
        $this->view->savingslist = $savingsSelect;

        $pdf = new Zend_Pdf();
        //create a new page

        $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
        $pdf->pages[] = $page;
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
        // Image
        $image_name = "/var/www/".$projname."/public/images/logo.jpg";
        $image = Zend_Pdf_Image::imageWithPath($image_name);
        //$page->drawImage($image, 30, 770, 130, 810);

        $page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
        $page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
        $page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
        $page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal

        $x1 = 60; 
        $x2 = 140; 
        $x3 = 200;
        $x4 = 290;
        $x5 = 370;
        $x6 = 450;
        $x7 = 510;

        $y1 = 730;
        $y2 = 750;
// 
        //set the font
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
        $page->drawLine(50, 760, 550, 760);

        $page->drawText("Date : ".date('d-m-Y'),500, 800); //date('Y-m-d')
        $page->drawImage($image, 30, 770, 130, 810);

        $text = array("Acc Number","Acc Name","Member Code","Member Name","Balance","Created Date","Created By");

        $page->drawText($text[0],$x1, $y2);
        $page->drawText($text[1],$x2, $y2);
        $page->drawText($text[2],$x3, $y2);
        $page->drawText($text[3],$x4, $y2);
        $page->drawText($text[4],$x5, $y2);
        $page->drawText($text[5],$x6, $y2);
        $page->drawText($text[6],$x7, $y2);
        $page->drawLine(50, 740, 550, 740);
    
        $pageNumber = 1;
        
        $page->drawText($pageNumber,550, 30);
        foreach($savingsSelect as $savings) {


            if($y1 > "30") { 
                $page->drawText($savings['account_number'],$x1, $y1);
                $page->drawText($savings['offername'],$x2, $y1);
                $page->drawText($savings['membercode'],$x3, $y1);
                $page->drawText($savings['membername'],$x4, $y1);
                $page->drawText($savings['balance'],$x5, $y1);
                $page->drawText($savings['created_date'],$x6, $y1);
                $page->drawText($savings['loginname'],$x7, $y1);
                } 
            else {
                $y1 = 740;
                $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
                $pdf->pages[] = $page;
                $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
                $page->drawText("Date : ".date('d-m-Y'),500, 800); //date('Y-m-d')
                $page->drawImage($image, 30, 770, 130, 810);
                $page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
                $page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
                $page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
                $page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal
 
                $page->drawText($text[0],$x1, $y2);
                $page->drawText($text[1],$x2, $y2);
                $page->drawText($text[2],$x3, $y2);
                $page->drawText($text[3],$x4, $y2);
                $page->drawText($text[4],$x5, $y2);
                $page->drawText($text[5],$x6, $y2);
                $page->drawText($text[6],$x7, $y2);

                $page->drawLine(50, 740, 550, 740);
                $pageNumber ++;
                $page->drawText($pageNumber,550, 30);
    
            }
        $y1 = $y1 - 20; 
        }
        $pdfData = $pdf->render();
        $account_number = "Loan";
        $pdf->save('/var/www/'.$projname.'/reports/savingsList.pdf');
	$path = '/var/www/'.$projname.'/reports/savingsList.pdf';

        chmod($path,0777);
        $file = 'savingsList.pdf';
        //header("Location: /Mahiti-OB/ourbank/reports/savingsList.pdf");
        $this->_redirect('/personalsavings/index/reportdisplay/file/'.$file);
    }
    
    function reportdisplayAction() 
    {
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];

        $this->_helper->layout->disableLayout();
        $file1 = $this->_request->getParam('file'); 
        $this->view->filename = "/".$projname."/reports/".$file1;
    }
}
