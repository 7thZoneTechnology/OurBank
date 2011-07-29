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
class Meetingbookreport_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->pageTitle = $this->view->translate("Meeting Book");
        $this->view->title =  $this->view->translate('Reports');
        $this->view->type = $this->view->translate("financialReports");

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
        $this->view->dateconvert = new App_Model_dateConvertor();

        $test = new DH_ClassInfo(APPLICATION_PATH . '/modules/meetingbookindex/controllers/');
        $module = $test->getControllerClassNames();
        $modulename = explode("_", $module[0]);
        $this->view->modulename = strtolower($modulename[0]);
	//date format instance
	$this->view->dateconvertor = new App_Model_dateConvertor();
    }

public function indexAction() 
    {
        $path = $this->view->baseUrl();
       $attendanceform = new Meetingbookreport_Form_Search($path);
        $this->view->attendanceform=$attendanceform;

        //dropdown meeting list
        $meeting = $this->view->adm->viewRecord("ourbank_group","id","ASC"); 
        foreach($meeting as $meeting1){ 
            $attendanceform->meeting_name->addMultiOption($meeting1['id'],$meeting1['name']);
        }

       if ($this->_request->isPost() && $this->_request->getPost('Search')) {

            $title1 = $this->view->translate("Meeting Book");
            $this->view->pageTitle = $title1;

        $formData = $this->_request->getPost(); 
        if ($attendanceform->isValid($formData)) {
            $meeting_id = $this->_request->getParam('meeting_name');
            $meetingno = $this->_request->getParam('meetingno');
        $this->view->field1 = $meetingno;
        $this->view->branchid = $meeting_id;

        //for meeting details
        $meetingbook = new Meetingbookreport_Model_Meetingbook();
// 	$this->view->fetchgroupid=$groupid1=$meetingbook->fetchgroupid($meeting_id);
// 	$groupid= $groupid1[0]['group_id']; 
        $this->view->meeting=$ff=$meetingbook->fetchmeeting($meeting_id); 
        //fetch member details
        $this->view->members=$aa=$meetingbook->fetchMembers($meeting_id);  

        //fetch attendance details
        $this->view->attendance=$meetingbook->fetchattendance($meeting_id,$meetingno);  

//         //fetch loan officer 
//         $loanofficer=$meetingbook->fetchloanofficer($groupid);
//         if($loanofficer){  $this->view->loanofficer=$loanofficer[0]['loanofficer']; }

            $formData = $this->_request->getPost();
                $this->view->savings = 10;
            }
         }
    }

    public function fetchmeetingAction() 
    {
        $this->_helper->layout->disableLayout();
        $path = $this->view->baseUrl();
        $attendanceform = $this->view->meetform = new Meetingbookreport_Form_Search($path);
        $meeting_ID=$this->_request->getParam('meeting_ID');
        $fetchmeeting=new Meetingbookreport_Model_Meetingbook();
        $meetingno=$fetchmeeting->fetchmeetingno($meeting_ID);
        $this->view->meeting = $meetingno;
        foreach($meetingno as $meet){
     $attendanceform->meetingno->addMultiOption($meet['week_no'],$meet['week_no'].' --- '.$meet['meeting_date']);
        }
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

    public function pdfmeetingAction() 
    { 
            //rupees right alignment
            function position($amt,$posValue) {
                      $len=strlen($amt);
                      $pos=($posValue-35)-($len*4);
                      return $pos;
               }

        //view details on pdf page
            $meeting_id = $this->_request->getParam('meeting_name');
            $meetingno = $this->_request->getParam('meetingno');
            $this->view->field1 = $meetingno;
            $this->view->branchid = $meeting_id;

        //for meeting details
        $meetingbook = new Meetingbookreport_Model_Meetingbook();
// 	$this->view->fetchgroupid=$groupid1=$meetingbook->fetchgroupid($meeting_id);
// 	$groupid= $groupid1[0]['group_id']; 
        $this->view->meeting=$ff=$meetingbook->fetchmeeting($meeting_id); //echo '<pre>';print_r($ff); 
        //fetch member details
        $this->view->members=$aa=$meetingbook->fetchMembers($meeting_id);  //echo '<pre>';print_r($aa);

        //fetch attendance details
        $this->view->attendance=$meetingbook->fetchattendance($meeting_id,$meetingno);  

        //fetch loan officer 
        $loanofficer=$meetingbook->fetchloanofficer($meeting_id);
        if($loanofficer){  $this->view->loanofficer=$loanofficer[0]['loanofficer']; }


        //$cfromDate = $dateconvertor->mysqlformat($fromDate);
        $pdf = new Zend_Pdf();
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
        //set the font
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);
    
        $text = array();
        $this->view->savings = 10;
        $page->drawText("Date : ".date('d/m/Y'),500, 800); //date('Y-m-d')
        $page->drawText("Meeting Book",270, 770);
        $page->drawText("Meeting Book",270, 770);

        $x1 = 50; 
        $x2 = 320; 
        $y1 = 725;
        $y2 = 710;

        $page->drawText("Meeting Information", $x1, $y1);
        $page->drawText("Meeting Information", $x1, $y1);

        //fetching meeting details
        if($this->view->meeting) { 
            $count = count($this->view->meeting);
        foreach($this->view->meeting as $meeting) { }

        $page->drawText("Group name: ".$meeting['groupname'], $x1, $y1=$y1-20);
        $page->drawText("Week Day: ".$meeting['weekday'], $x2, $y1);
        $page->drawText("Group head: ".$meeting['grouphead_name'], $x1, $y1=$y1-15);
        $page->drawText("Time: ".$meeting['time'], $x2, $y1);
        $page->drawText("Number of members: ".$count, $x1, $y1=$y1-15);
        $page->drawText("Place: ".$meeting['place'], $x2, $y1);
        $page->drawText("Loan Officer: ".$this->view->loanofficer, $x1, $y1=$y1-15);
        }
//         $this->view->savings = 10;

        $y1=$y1-30;
        $page->drawText("Attendance Information", $x1, $y1);
        $page->drawText("Attendance Information", $x1, $y1);

        //fetching attendance details
        foreach($this->view->attendance as $attendance) { }

        $page->drawText("Meeting name: ".$attendance['meetingname'], $x1, $y1=$y1-20);
        $page->drawText("Held on: ".$this->view->dateconvertor->phpnormalformat($attendance['meeting_date']), $x2, $y1);
        $page->drawText("Meeting Number: ".$attendance['week_no'], $x1, $y1=$y1-15);
        $page->drawText("Time: ".$attendance['time'], $x2, $y1);

        $y1=$y1-30;
        $page->drawText("Member Details", $x1, $y1);
        $page->drawText("Member Details", $x1, $y1);

        $y1=$y1-15;
        $page->drawLine(50, $y1, 550, $y1); //table top line
        $y3=$y1; // assign for left and right lines
        $y1=$y1-15;
        $page->drawText("Sl", 55, $y1);
        $page->drawText("Members", 70, $y1);
        $page->drawText("UID", 180, $y1);
        $page->drawText("Attn.", 240, $y1);
        $page->drawText("Late", 265, $y1);
        $page->drawText("Absent", 290, $y1);
        $page->drawText("Balance", 340, $y1);
        $page->drawText("Pay", 395, $y1);
        $page->drawText("Outstanding", 420, $y1);
        $page->drawText("Due", 480, $y1);
        $page->drawText("Total", 525, $y1);
       // $page->drawLine(50, $y1 = $y1 - 20, 550, $y1); //dynamic bottom line - member details table
        $page->drawLine(50, $y1 -10, 550, $y1=$y1-10);

$no=1;  $Topay=0; $currentbalance1=0; $currentbalance2=0; $currentbalance3=0; $loandue1=0; $loandue2=0; $currentpay=0; $totallatefee=0; $totalabsentfee=0; $total1=0; $total=0;
$currentbalance=new Meetingbookreport_Model_Meetingbook();

        $x3=315;
        $x4=345;
        $x5=400;
        $x6=445;
        $x7=495;
        $x8=530;
        $x9=575;

foreach($this->view->members as $members) { $memberid=$members['memberid']; $total=0;

        $y1=$y1-15;
        $page->drawText($no, 55, $y1);
        $page->drawText($members['membername'], 70, $y1);
        $page->drawText($members['uid'], 180, $y1);  //$members['uid']

               $memberabsent=$currentbalance->memberabsent($memberid,$attendance['id']);
               $memberlate=$currentbalance->memberlate($memberid,$attendance['id']);
               if($memberabsent) { $absente='A';} 
                else if($memberlate) { $absente='L';} else { $absente='P'; }

        $page->drawText($absente, 245, $y1);

        if($memberlate) { 
                $totallatefee+=$latefee=$members['penalty_latecoming']; 
               $pos=position(sprintf("%4.2f",$latefee),$x3);
               $page->drawText(sprintf("%4.2f",$latefee),$pos+2,$y1);
        } else {
                $latefee=0;
               $pos=position(sprintf("%4.2f",''),$x3);
               $page->drawText(sprintf("%4.2f",''),$pos+2,$y1);
        }

        if($memberabsent) { 
        $totalabsentfee+=$absentfee=$members['penalty_notcoming']; 
        $pos=position(sprintf("%4.2f",$absentfee),$x4);
        $page->drawText(sprintf("%4.2f",$absentfee),$pos+2,$y1);
        } else {
        $absentfee=0;
        $pos=position(sprintf("%4.2f",''),$x4);
        $page->drawText(sprintf("%4.2f",''),$pos+2,$y1);
        }

                    $creditbalance=$currentbalance->creditbalance($memberid);
                    $debitbalance=$currentbalance->debitbalance($memberid); 

              if($creditbalance) { 
                if($debitbalance) { $debitbalance1=$debitbalance; } else { $debitbalance1=0; }
                $currentbalance1=$creditbalance[0]['currentbalance']-$debitbalance1[0]['currentbalance'];
                $pos=position(sprintf("%4.2f",$currentbalance1),$x5);
                $page->drawText(sprintf("%4.2f",$currentbalance1),$pos+2,$y1);
                } else {
                $pos=position(sprintf("%4.2f",''),$x5);
                $page->drawText(sprintf("%4.2f",''),$pos+2,$y1);
                }   
                $currentbalance2+=$currentbalance1;
                $perweek=$members['saving_perweek'];
               $pos=position(sprintf("%4.2f",$members['saving_perweek']),$x6);
               $page->drawText(sprintf("%4.2f",$members['saving_perweek']),$pos+2,$y1);

                $loanoutstanding=$currentbalance->loanoutstanding($memberid);
                  if($loanoutstanding) { 
                        $loanoutstanding1=$loanoutstanding[0]['outstanding'];
                        $pos=position(sprintf("%4.2f",$loanoutstanding[0]['outstanding']),$x7);
                        $page->drawText(sprintf("%4.2f",$loanoutstanding[0]['outstanding']),$pos+2,$y1);
                   } 
                       $currentbalance3+=$loanoutstanding1;

                $loandue=$currentbalance->loandue($memberid); 
                if($loandue) { 
                $pos=position(sprintf("%4.2f",$loandue[0]['outstanding']),$x8);
                $page->drawText(sprintf("%4.2f",$loandue[0]['outstanding']),$pos+2,$y1);
                $loandue1=$loandue[0]['outstanding'];
                } 
                $loandue2+=$loandue1;

                $total=$latefee+$absentfee+$currentbalance1+$loandue1;
                $pos=position(sprintf("%4.2f",$total),$x9);
                $page->drawText(sprintf("%4.2f",$total),$pos+2,$y1);

        $page->drawLine(50, $y1 -10, 550, $y1=$y1-10);
    $no++;
$Topay+=$members['saving_perweek'];
                $total1+=$total;
 }

$y1=$y1-15;
                $page->drawText("Total", 180, $y1);
                $pos=position(sprintf("%4.2f",$totallatefee),$x3);
                $page->drawText(sprintf("%4.2f",$totallatefee),$pos+2,$y1);
                $pos=position(sprintf("%4.2f",$totalabsentfee),$x4);
                $page->drawText(sprintf("%4.2f",$totalabsentfee),$pos+2,$y1);

                $pos=position(sprintf("%4.2f",$currentbalance2),$x5);
                $page->drawText(sprintf("%4.2f",$currentbalance2),$pos+2,$y1);

                $pos=position(sprintf("%4.2f",$Topay),$x6);
                $page->drawText(sprintf("%4.2f",$Topay),$pos+2,$y1);

                $pos=position(sprintf("%4.2f",$currentbalance3),$x7);
                $page->drawText(sprintf("%4.2f",$currentbalance3),$pos+2,$y1);

                $pos=position(sprintf("%4.2f",$loandue2),$x8);
                $page->drawText(sprintf("%4.2f",$loandue2),$pos+2,$y1);

                $pos=position(sprintf("%4.2f",$total1),$x9);
                $page->drawText(sprintf("%4.2f",$total1),$pos+2,$y1);


                $page->drawLine(50, $y1 -10, 550, $y1=$y1-10);

        // Virtual table
        $page->setLineWidth(1)->drawLine(50, $y1, 50, $y3); //Table left vertical
        $page->setLineWidth(1)->drawLine(550, $y1, 550, $y3); //table rigth vertical

        $pdfData = $pdf->render();
        $pdf->save('/var/www/'.$projname.'/reports/meetingbook.pdf');
	$path = '/var/www/'.$projname.'/reports/meetingbook.pdf';
        chmod($path,0777);
    }
}
