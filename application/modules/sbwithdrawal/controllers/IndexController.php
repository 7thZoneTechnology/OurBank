<?php
class Sbwithdrawal_IndexController extends Zend_Controller_Action 
{
    public function init()
    {
        $this->view->pageTitle = 'SB withdrawal';
        $this->view->title = 'Loan Process';
        $this->view->withdrawal = new Sbwithdrawal_Model_Sbwithdrawal();
        $this->view->adm = new App_Model_Adm ();
        $this->view->dateconvertor = new App_Model_dateConvertor();

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
        $loginname= $this->view->cl->username($userid);
        foreach($loginname as $loginname) 
        {
            $this->view->username=$loginname['username']; // get the user name
        }

    }
    public function indexAction()
    {
                $this->view->title = "SB withdrawal"; 
                $storage = new Zend_Auth_Storage_Session();
                $data = $storage->read();
                if (!$data) {
                        $this->_redirect('index/login');
                }



       $searchForm = $this->view->form = new Sbwithdrawal_Form_Search();
 		if ($this->_request->isPost() && $this->_request->getPost('Submit')){
                $formData = $this->_request->getPost();

                    if ($searchForm->isValid($formData)) {
                       		$this->view->withdrawalamount = $this->_request->getParam('amount');
                            $result = $this->view->withdrawal->getMember($this->_request->getParam('membercode'));

                            $page = $this->_getParam('page',1);
                            $paginator = Zend_Paginator::factory($result); // assign searched values for pagination
        					$paginator->setItemCountPerPage(5);

                            $paginator->setCurrentPageNumber($page);
                            $this->view->paginator = $paginator;
                            $this->view->search = true;
                    } 
            }
    }
    public function withdrawalAction(){
        $id =  base64_decode($this->_request->getParam('id'));
        $amount = base64_decode($this->_request->getParam('amt'));
        $membertype = base64_decode($this->_request->getParam('type'));
        $this->view->amount = $amount;
        $this->view->id = $id;
        $this->view->membertype = $membertype;
        $address = $this->view->adm->getmodule("ourbank_address",$id,"Group");// get address for particular group
        $groupWholedetails = $this->view->withdrawal->getgroupwholedetails($id,$membertype); // get group details
        $this->view->groupmemberslist  = $this->view->withdrawal->getgroupmembers($id); // get groupmembers details
        $this->view->repmemberslist  = $this->view->withdrawal->getrepmembers($id); // get groupmembers details
        foreach($groupWholedetails as $groupdetails){
            $this->view->groupname = $groupdetails['groupname'];
            $this->view->createdate = $groupdetails['group_created_date'];
            $this->view->groupcode = $groupdetails['groupcode'];
            $this->view->accno = $groupdetails['savingsaccountnumber'];

        }
        if(!is_array($address)){
            $addressline1 ="";
            $addressline2 ="";
            $city ="";
            $state ="";
        }
        foreach($address as $groupaddress){
            if($groupaddress['address1'] == ""){ $add1 = "";} else { $add1 = $groupaddress['address1']; }
            if($groupaddress['address2'] == ""){ $add2 = "";} else { $add2 = $groupaddress['address2']; }
            if($groupaddress['address3'] == ""){ $add3 = "";} else { $add3 = $groupaddress['address3']; }
            if($groupaddress['village'] == ""){ $villge = "";} else { $villge = $groupaddress['village']; }
            if($groupaddress['city'] == ""){ $city = "";} else { $city = $groupaddress['city']; }
            if($groupaddress['district'] == ""){ $district = "";} else { $district = $groupaddress['district']; }
            if($groupaddress['state'] == ""){ $state = "";} else { $state = $groupaddress['state']; }
            if($groupaddress['zipcode'] == ""){ $zipcode = "";} else { $zipcode = $groupaddress['zipcode']; }
            if($add1 == "" && $add2 =="") {
                $this->view->addressline1 = "";
            } if($add1 == "" && $add2!="") {
                $this->view->addressline1 = $add2;
            } if($add1 !="" && $add2 =="") {
                $this->view->addressline1 = $add1;
            } if($add1 !="" && $add2 !="") {
                $this->view->addressline1 = $add1.",".$add2;
            } 

            if($add3 == "" && $villge =="") {
                $this->view->addressline2 = "";
            } if($add3 == "" && $villge!="") {
                $this->view->addressline2 = $villge;
            } if($add3 !="" && $villge =="") {
                $this->view->addressline2 = $add3;
            } if($add3 !="" && $villge !="") {
                $this->view->addressline2 = $add3.",".$villge;
            } 

            if($city == "" && $district =="") {
                $this->view->city = "";
            } if($city == "" && $district!="") {
                $this->view->city = $district;
            } if($district ="" && $city =="") {
                $this->view->district = "";
            } if($district ="" && $city !="") {
                $this->view->district = $district.",".$city;
            }
    
            if($state == "" && $zipcode =="") {
                $this->view->state = "";
            } if($state == "" && $zipcode!="") {
                $this->view->state = $zipcode;
            } if($state !="" && $zipcode =="") {
                $this->view->state = $state;
            } if($state !="" && $zipcode !="") {
                $this->view->state = $state.",".$zipcode;
            }

        }
    }

    public function reportdisplayAction() 
    {
        $this->_helper->layout->disableLayout();
        $file1 = $this->_request->getParam('file'); 
        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
        $this->view->filename = "/".$projname."/reports/".$file1;    
    }

    public function pdfdisplayAction() 
        { 
        $id =  $this->_request->getParam('id');
        $amount = $this->_request->getParam('amount');
        $membertype = $this->_request->getParam('membertype');
        $this->view->amount = $amount;
        $this->view->id = $id;
        $this->view->membertype = $membertype;

        $address = $this->view->adm->getmodule("ourbank_address",$id,"Group");// get address for particular group

// Zend_Debug::dump($address);
        $groupWholedetails = $this->view->withdrawal->getgroupwholedetails($id,$membertype); // get group details
        $this->view->groupmemberslist  = $groupmembers = $this->view->withdrawal->getgroupmembers($id); // get groupmembers details
        $this->view->repmemberslist  = $repmembers = $this->view->withdrawal->getrepmembers($id); // get groupmembers details

        foreach($groupWholedetails as $groupdetails){
            $this->view->groupname = $groupname = $groupdetails['groupname'];
            $this->view->createdate = $createddate =  $groupdetails['group_created_date'];
            $this->view->groupcode = $groupcode = $groupdetails['groupcode'];
            $this->view->accno = $accno = $groupdetails['savingsaccountnumber'];
        }
        if(!is_array($address)){
            $addressline1 ="";
            $addressline2 ="";
            $city ="";
            $state ="";
        }
        foreach($address as $groupaddress){
            if($groupaddress['address1'] == ""){ $add1 = "";} else { $add1 = $groupaddress['address1']; }
            if($groupaddress['address2'] == ""){ $add2 = "";} else { $add2 = $groupaddress['address2']; }
            if($groupaddress['address3'] == ""){ $add3 = "";} else { $add3 = $groupaddress['address3']; }
            if($groupaddress['village'] == ""){ $villge = "";} else { $villge = $groupaddress['village']; }
            if($groupaddress['city'] == ""){ $city = "";} else { $city = $groupaddress['city']; }
            if($groupaddress['district'] == ""){ $district = "";} else { $district = $groupaddress['district']; }
            if($groupaddress['state'] == ""){ $state = "";} else { $state = $groupaddress['state']; }
            if($groupaddress['zipcode'] == ""){ $zipcode = "";} else { $zipcode = $groupaddress['zipcode']; }
            if($add1 == "" && $add2 =="") {
                $this->view->addressline1 = "";
            } if($add1 == "" && $add2!="") {
                $this->view->addressline1 = $add2;
            } if($add1 !="" && $add2 =="") {
                $this->view->addressline1 = $add1;
            } if($add1 !="" && $add2 !="") {
                $this->view->addressline1 = $add1.",".$add2;
            } 

            if($add3 == "" && $villge =="") {
                $this->view->addressline2 = "";
            } if($add3 == "" && $villge!="") {
                $this->view->addressline2 = $villge;
            } if($add3 !="" && $villge =="") {
                $this->view->addressline2 = $add3;
            } if($add3 !="" && $villge !="") {
                $this->view->addressline2 = $add3.",".$villge;
            } 

            if($city == "" && $district =="") {
                $this->view->city = "";
            } if($city == "" && $district!="") {
                $this->view->city = $district;
            } if($district ="" && $city =="") {
                $this->view->district = "";
            } if($district ="" && $city !="") {
                $this->view->district = $district.",".$city;
            }
    
            if($state == "" && $zipcode =="") {
                $this->view->state = "";
            } if($state == "" && $zipcode!="") {
                $this->view->state = $zipcode;
            } if($state !="" && $zipcode =="") {
                $this->view->state = $state;
            } if($state !="" && $zipcode !="") {
                $this->view->state = $state.",".$zipcode;
            }

        }

        $pdf = new Zend_Pdf();
        $page = $pdf->newPage(Zend_Pdf_Page::SIZE_A4);
        $pdf->pages[] = $page;

        $app = $this->view->baseUrl();
        $word=explode('/',$app);
        $projname = $word[1];
        $page->setFont(Zend_Pdf_Font::fontWithName(Zend_Pdf_Font::FONT_HELVETICA), 8);

//         //Image
        $image_name = "/var/www/".$projname."/public/images/logo.jpg";
        $image = Zend_Pdf_Image::imageWithPath($image_name);
        $page->drawImage($image, 30, 770, 130, 820);
        $page->drawText("Date : ".date('d/m/Y'),500, 800); //date('Y-m-d')
        $page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
        $page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
        $page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
        $page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal

        $text = array("Declaration to withdraw savings amount",
                     "Group name",
                     "date",
                     "group saving acc no","groupcode","Address");

        $secondtable = array("Sl.no",
                     "Group Members",
                     "Signature",
                     "Total =",
                     "Village facilitator",
                     "Field officer",
                     "Block office, Signature");

        $content = "We are authorising and decided the below identified group representative to withdraw the amount RS ".$amount." from our Saving Bank account. ";

        $notice = "Notice:All members";

        $x0 = 190; 
        $x1 = 55; 
        $x5 = 185;
        $x2 = 305; 
        $x3 = 465;
        $y1 = 725;
        $page->drawText($text[0], $x0, 760);

//        // $page->drawLine(50, 740, 550, 740);
//        // $page->drawLine(50, 720, 550, 720);

       $page->drawText($text[1], $x1, $y1);
       $page->drawText($groupname, $x1+50, $y1);
       $page->drawText($groupname, $x1+50, $y1);

        $page->drawText($text[2], $x2, $y1);
        $page->drawText($this->view->dateconvertor->phpnormalformat($createddate), $x2 + 85, $y1);
        $page->drawText($this->view->dateconvertor->phpnormalformat($createddate), $x2 + 85, $y1);
         $page->drawLine(50, $y1-5, 550, $y1-5);


       $page->drawText($text[5], $x1, $y1-15);
       $page->drawText($text[4], $x2, $y1-15);
       $page->drawText($groupcode,$x2 + 85, $y1-15);
       $page->drawText($groupcode,$x2 + 85, $y1-15);
         $page->drawLine(50, $y1-5, 550, $y1-5);

        if(!$addressline1){
        $page->drawText($this->view->addressline1, $x1, $y1-30);
        }
        if(!$addressline2){
        $page->drawText($this->view->addressline2, $x1, $y1-40);
        }
        if(!$city){
        $page->drawText($this->view->city, $x1, $y1-50);
        }
        if(!$state){
        $page->drawText($this->view->state, $x1, $y1-60);
        }
        $page->drawText($text[3], $x2, $y1-30);
        $page->drawText($accno, $x2 + 85, $y1-30);
        $page->drawText($accno, $x2 + 85, $y1-30);
//         $page->drawLine(50, $y1-65, 550, $y1-65);


        // declaration message
//         $page->drawText($content, $x1, $y1-75);

        // List representatives
        $i=1;
        $y1 = $y1-85;

        foreach($repmembers as $representatives){
//         $repname = $i++.") ".$representatives['membername'];
       // echo $repname;
//         $page->drawText($repname, $x1, $y1);
        $y1 = $y1-10;
        }
        $y1 = $y1-25;
        $page->drawText($notice, $x1, $y1);

        $y1 = $y1-15;
        $page->drawLine(50, $y1, 550, $y1);
        $page->drawLine(50, $y1-20, 550, $y1-20);

        $tablestart = $y1-10;
        $page->drawText($secondtable[0], $x1, $tablestart);
        $page->drawText($secondtable[1], $x5, $tablestart);
        $page->drawText($secondtable[2], $x3, $tablestart);
        $y1 = $y1-30;
        $j=1;
        foreach($groupmembers as $groupmem){
            $page->drawText($j++, $x1, $y1);
            //$page->drawText($groupmem['membername'], $x5, $y1);
            $page->drawLine(50, $y1-5, 550, $y1-5);
            $y1 = $y1 - 15;
        }
        $y1 = $y1-20;
        $j -=1;
        $Totalvalue = $secondtable[3].$j;
        $page->drawText($Totalvalue, $x5, $y1);
        $page->drawLine(50, $y1-5, 550, $y1-5);

        $y3 = $y1 + 45 + ($j*5);
  // Virtual table
        $page->setLineWidth(1)->drawLine(50,$y1-5,50,$tablestart+10); //Table left vertical
        $page->setLineWidth(1)->drawLine($x1+25,$y1-5,$x1+25,$tablestart+10); //Table second left vertical
//         $page->setLineWidth(1)->drawLine($x5-5,$y1-5,$x5-5,$y3); //Table center vertical
        $page->setLineWidth(1)->drawLine($x3-35,$y1-5,$x3-35,$tablestart+10); //Table second center vertical
        $page->setLineWidth(1)->drawLine(550,$y1-5 ,550,$tablestart+10); //table rigth vertical
/*
  // Virtual table
        $page->setLineWidth(1)->drawLine(50, $y1 - 20, 50, 740); //Table left vertical
        $page->setLineWidth(1)->drawLine($x2-5, $y1 - 20, $x2-5, 740); //Table center vertical
        $page->setLineWidth(1)->drawLine($x3-5, $y1 - 20, $x3-5, 740); //Table center vertical
        $page->setLineWidth(1)->drawLine(550, $y1 - 20, 550, 740); //table rigth vertical*/

        $y1 = $y1-35;
        $page->drawText($secondtable[4], $x1+25, $y1);
        $page->drawText($secondtable[5], $x2-25, $y1);
        $page->drawText($secondtable[6], $x3-25, $y1);

        $pdf->save('/var/www/'.$projname.'/reports/sbwithdrawal.pdf');
        $path = '/var/www/'.$projname.'/reports/sbwithdrawal.pdf';
        //chmod($path,0777);
    }
}

