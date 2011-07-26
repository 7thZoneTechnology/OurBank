<?php
class Loanprocess_IndexController extends Zend_Controller_Action 
{
    public function init()
    {
        $this->view->pageTitle = 'Loan request';
        $this->view->title = 'Accounting';
        $this->view->accounts = new Loanprocess_Model_Loanprocess();
        $this->view->cl = new App_Model_Users ();
        $this->view->adm = new App_Model_Adm ();
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
                $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }


        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id 

        $loginname=$this->view->cl->username($userid);
        foreach($loginname as $loginname) {
            $this->view->username=$loginname['username']; // get the user name
        }
        $finduser = $this->view->accounts->finduser($this->view->createdby);
        if ($finduser) {
            $levelid=$finduser[0]['officetype_id'];
            $designation=$finduser[0]['designation'];
            $hierarchy = $this->view->accounts->findhierarchy($levelid);
            $this->view->levelname=$levelname=$hierarchy[0]['type'];
            $this->view->levelid=$levelname=$hierarchy[0]['id'];
        }
    }
    public function indexAction()
    {
       $accountsForm = $this->view->form = new Loanprocess_Form_Search();
       if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
	    $formData = $this->_request->getPost();
		if ($accountsForm->isValid($formData)) {
                    $membercode = $this->_request->getParam('membercode');
                    $members = $this->view->accounts->Searchloanprocess($membercode);
                    $this->view->result = $members;
                }
            }
    }
    public function addAction()
    {
        $membercode = $this->_request->getParam('membercode');
        echo $count = count($this->view->accounts->getMember($membercode));
        //insert the family request
        //if ($this->_request->isPost()) 
        {
            for($i=1;$i<=$count;$i++)
            {	
                if ($this->_request->getParam('purpose_id'.$i) != 0 && $this->_request->getParam('amount'.$i) != 0) {
                    $this->view->adm->addRecord("ourbank_loanprocess",array(
					        'member_id'=>$this->_request->getParam('member_id'.$i),
					        'membertype' => substr($membercode,4,1),
						'purpose'=>$this->_request->getParam('purpose_id'.$i),
						'request_amount'=>$this->_request->getParam('amount'.$i),
						'expecting_inperiod' => $this->_request->getParam('need'.$i),
                				'status' => 5,
						'created_by'=>$this->view->createdby)); 
		}
            }
            $this->_redirect('/loanprocess/index');
        }
    }
        public function newprocessAction() 
        {
        if ($this->_helper->flashMessenger->getMessages()){
            $messages = $this->_helper->flashMessenger->getMessages();
            foreach($messages as $error){
                echo "<font color='green'>".$error."</font>";
            }
        }
        $accountsForm = $this->view->form = new Loanprocess_Form_Search();
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
		$formData = $this->_request->getPost();
		if ($accountsForm->isValid($formData)) {
                    $membercode = $this->_request->getParam('membercode');
                    $available = 0;
                    $this->view->typeid=$Type = substr($membercode,4,1);
                    if (($Type==1) or ($Type==2) or ($Type==3)) {
                        $available = $this->view->accounts->Availbility($membercode,$Type);
                    }
                    if($available) {
                        foreach($available as $availablelist) {
                            $id = $availablelist['id'];
                    }
                    $this->view->id = $id;
                    $flag = false;
                    $grouptypeid = $this->view->adm->getsingleRecord('ourbank_master_membertypes','id','type','Group');
                    $this->view->grouptypeid = $Type;
                    $Activemembers = $this->view->accounts->searchActive($id,$Type);

                    if($Activemembers){
                     echo "<font color='red'>You have already requested loan </font>";
                    }
                    else{

                      if (substr($membercode,4,1) == 2 || substr($membercode,4,1) == 3) {
                            $this->view->group = $this->view->accounts->getMember($membercode);
                            $this->view->groupDeatils = $this->view->accounts->groupDeatils($membercode);
                            $addForm = new Loanprocess_Form_Loanprocess(count($this->view->group));
                            $this->view->form=$addForm;
                            $this->view->membercode = $membercode;
                            $purpose = $this->view->adm->viewRecord("ourbank_master_loanpurpose","id","DESC");
                            for($i=1;$i<=count($this->view->group);$i++)
                            {  
                                $id = "purpose_id".$i;
                                foreach($purpose as $purpose1) { 
                                    $addForm->$id->addMultiOption($purpose1['id'],$purpose1['name']);
                                }
                            }

	                }
                    else {
                    $this->view->result = $this->view->accounts->searchmemberdetails($id,$Type);
                    $this->view->appform = new Loanprocess_Form_Application();
                    $purpose = $this->view->adm->viewRecord('ourbank_master_loanpurpose','id','asc');
                        foreach($purpose as $purposes){
                            $this->view->appform->purpose->addMultiOption($purposes['id'],$purposes['name']);
                        }
                    }
                    }
                    }
                    else{
                    echo "<font color='red'>This member doesn't belongs to any group </font>";
                    }
		}
        }
    }
    public function applicationAction()
    {
        $id = base64_decode($this->_request->getParam('id'));
        $membertype = $this->_request->getParam('type');
        $formData = $this->_request->getPost();
            // // Insertion into ourbank_loanprocess 
        $data = array('member_id' => $id,
                        'membertype' => $membertype,
                        'purpose' => intval($this->_request->getParam('purpose')),
                        'request_amount' => doubleval($this->_request->getParam('amount')),
                        'loan_duration' => intval($this->_request->getParam('duration')),
                        'expecting_inperiod' => intval($this->_request->getParam('period')),
                        'created_date'=>date('Y-m-d'),
                        'created_by'=>$this->view->createdby,
                        'status'=>5);
        $this->view->adm->addRecord('ourbank_loanprocess',$data);
        $this->_helper->flashMessenger->addMessage('Your loan request accepted');
        $this->_helper->redirector('index');
    }

    public function viewactionAction()
    {
      $memcode=$this->_request->getParam('id');
      $this->view->memtype=$Type = substr($memcode,4,1);
      $this->view->viewdetails=$viewdetails=$this->view->accounts->viewrequest($memcode,$Type);
      $memgroupid=$viewdetails[0]['memid'];
      $memstatudid=$viewdetails[0]['statusid'];
      $this->view->getgroupmember=$this->view->accounts->getgroup($memcode,$Type);
      $this->view->processnotes=$this->view->accounts->processnotes($memgroupid,$Type,$memstatudid);
    }

    public function loanstatusAction()
    {
        $this->view->pageTitle = $this->view->levelname.' approval process';
        $searchForm = $this->view->form = new Loanprocess_Form_Search();
        $this->view->loanstatus = $this->view->adm->viewRecord('ourbank_master_loanstatus','id','ASC');
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
            $formData = $this->_request->getPost();
            if ($searchForm->isValid($formData)) {
                $membercode = $this->view->id = $this->_request->getPost('membercode');
                $this->view->memtype=$Type = substr($membercode,4,1);
                if($Type==1 or $Type==2 or $Type==3){
                $checkrequest=$this->view->accounts->checkrequest($membercode,$Type);
                if($Type==2 or $Type==3){ 
                    $this->view->getgroupmember=$this->view->accounts->getgroup($membercode,$Type); 
                    $this->view->memcount=count($this->view->getgroupmember);
                }
                if($checkrequest){
                if ($this->view->levelid==4) {
                    $this->view->result = $this->view->accounts->searchStatus($membercode,$Type,1);
                    foreach($this->view->result as $result){
                        $this->view->memberid = $result['memid'];
                    }
                    $this->view->enablearray=array(2,6);
                }
                if ($this->view->levelid==3) {
                    $this->view->result = $this->view->accounts->searchStatus($membercode,$Type,2);
                    foreach($this->view->result as $result){
                        $this->view->memberid = $result['memid'];
                    }
                    $this->view->enablearray=array(3,6);
                }
                if ($this->view->levelid==2) {
                    $this->view->result = $this->view->accounts->searchStatus($membercode,$Type,3);
                    foreach($this->view->result as $result){
                        $this->view->memberid = $result['memid'];
                    } 
                    $this->view->enablearray=array(4,6);
                }
                if($this->view->levelid==1){
                    $this->view->result = $this->view->accounts->searchStatus($membercode,$Type,4);
                    foreach($this->view->result as $result){
                    $this->view->memberid = $result['memid'];
                    }$this->view->enablearray=array(5,6);
                }
                if(!$this->view->result)
                {
                echo "<font color='red'>Already done by ".$this->view->levelname."</font>";
                }
            }
            else
               {
                    echo "<font color='red'>No request for this member code or group code</font>";
               }
            }
            else
            {
                echo "<font color='red'>Enter valid member code or group code</font>";
            }
            }
        }
    }

    public function loanupdateAction()
    {
        $id = base64_decode($this->_request->getParam('id'));
        $type= $this->_request->getParam('membertype');
        $status = $this->_request->getParam('status');
        $notes= $this->_request->getParam('description');
        $memgroupid=$this->_request->getParam('memgroupid');
        if($type==1)
        {

        $memberid = $this->_request->getParam('memberid');
        $this->view->accounts->Updatestatus($status,$memberid);
        $this->view->adm->addRecord("ourbank_loanprocess_details",array(
                                        'id' => '',
                                        'mem_group_id'=>$memgroupid,
                                        'type'=>$type,
                                        'status'=>$status,
                                        'process_notes'=>$notes,
                                        'created_date' =>date("y/m/d H:i:s"),
                                        'created_by'=>$this->view->createdby));
        }
        if($type==2 or $type==3)
        {
        $count=$this->_request->getParam('membercount');
        for($i=1;$i<=$count;$i++)
        {
           $requestid=$this->_request->getParam('rquestid'.$i);
           $this->view->accounts->Updatestatus($status,$requestid);
        }
        $this->view->adm->addRecord("ourbank_loanprocess_details",array(
                                'id' => '',
                                'mem_group_id'=>$memgroupid,
                                'type'=>$type,
                                'status'=>$status,
                                'process_notes'=>$notes,
                                'created_date' =>date("y/m/d H:i:s"),
                                'created_by'=>$this->view->createdby));
        }
        $this->_helper->redirector('index');
    }


    public function jlgadvancesAction()
    {
        $jlgForm = $this->view->form = new Loanprocess_Form_Jlgadvances();
        $this->view->title = "Jlgadvances";
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) 
        {
            $formData = $this->_request->getPost();
            if ($this->_request->isPost()) 
            {
                if ($jlgForm->isValid($formData)) {  
                    $this->view->accounts->insertJlgvalues($jlgForm->getValues(),$this->view->createdby);
    	        }
            }
        }
    }
    public function shgindexAction()
    {
        $searchform = $this->view->form = new Loanprocess_Form_Search();
        $this->view->title = "Shgadvances";
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
                $membercode = $this->_request->getPost('membercode');
                $groupdetails = $this->view->accounts->searchgroupdetails($membercode);
                $this->view->groupdetails = $groupdetails;
        }
    }
     public function shgadvancesAction()
    {

        $this->view->title = "Grading form";
        $shgForm = $this->view->form = new Loanprocess_Form_shgadvances();

        $groupid = base64_decode($this->_request->getParam('id'));
        $this->view->groupid = $groupid;
        $groupdetails = $this->view->accounts->getgroupName($groupid); //Fetch group and village name
        foreach($groupdetails as $group){
            $this->view->groupname = $group['groupname'];
            $this->view->villagename = $group['villagename'];
            $groupcode = $group['groupcode'];
        }
        $grouptype  = substr($groupcode,4,1);
        $Attendancedetails = $this->view->accounts->getAttendance($groupid); //Fetch Absentees list
        foreach($Attendancedetails as $attendance){
            $absentees = $attendance['Absentees'];
        }
        $Countmeetings = $this->view->accounts->Countmeetings($groupid); //Fetch number of meetings
        foreach($Countmeetings as $meetings){
            $numberofmeetings = $meetings['Numberofmeetings'];
        } 
        $Countgroupmembers = $this->view->accounts->Countgroupmembers($groupid); //Fetch number of members in that group
        foreach($Countgroupmembers as $groupcount){
            $totalmembers = $groupcount['Totalmembers'];
        }
        // Attendance percentage calculation
        $Origmeetingstr = $numberofmeetings * $totalmembers;
        $present = $Origmeetingstr - $absentees;
        if($present > 0){
            $AttendPercent = ($present*100)/$Origmeetingstr;
            $shgForm->gattendance->setValue(round($AttendPercent,2));
        }
        if($present < 0){
            $shgForm->gattendance->setValue(0);
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

        $shgForm = $this->view->form = new Loanprocess_Form_shgadvances();

//         if ($this->_request->isPost() && $this->_request->getPost('PDF')) {
// echo 
        $gattendance = $this->_request->getParam('gattendance');
        $gsaving = $this->_request->getParam('gsaving');
        $gmeetdiscipline = $this->_request->getParam('gmeetdiscipline');
        $gparticipation = $this->_request->getParam('gparticipation');
        $gweeklymeet = $this->_request->getParam('gweeklymeet');
        $gchangememb = $this->_request->getParam('gchangememb');
        $gpreparation = $this->_request->getParam('gpreparation');
        $gsigningmemb = $this->_request->getParam('gsigningmemb');
        $ggroupcooperation = $this->_request->getParam('ggroupcooperation');
        $ggroupsustaiable = $this->_request->getParam('ggroupsustaiable'); 

        $bsavingattend = $this->_request->getParam('bsavingattend');
        $bloandisburse = $this->_request->getParam('bloandisburse');
        $bdiscussion = $this->_request->getParam('bdiscussion');
        $bincomeandexpend = $this->_request->getParam('bincomeandexpend');
        $bindividualsave = $this->_request->getParam('bindividualsave');
        $bindividualloan = $this->_request->getParam('bindividualloan');
        $bgeneralacc = $this->_request->getParam('bgeneralacc'); 

        $ploanholder = $this->_request->getParam('ploanholder');
        $pusageofsaving = $this->_request->getParam('pusageofsaving');
        $ploanrepayment = $this->_request->getParam('ploanrepayment');
        $pminimumrepay = $this->_request->getParam('pminimumrepay'); 

        $fparticipation = $this->_request->getParam('fparticipation');
        $ffarmerschool = $this->_request->getParam('ffarmerschool');
        $fweeklyplan = $this->_request->getParam('fweeklyplan');
        $fschoollearning = $this->_request->getParam('fschoollearning');
// }
//         $totalmarks = $this->_request->getParam('totalmarks');

//         $marks = $this->_request->getParam('marks');
//         $percentage = $this->_request->getParam('percentage');
//         $grade = $this->_request->getParam('grade');
//         $observe = $this->_request->getParam('observe');

        $groupid = $this->_request->getParam('groupid');
        $this->view->groupid = $groupid;
        $groupdetails = $this->view->accounts->getgroupName($groupid); // Fetch group and village name
        foreach($groupdetails as $group){
            $this->view->groupname = $groupname = $group['groupname'];
            $this->view->villagename = $villagename = $group['villagename'];
            $groupcode = $group['groupcode'];
        }
        $grouptype  = substr($groupcode,4,1);
        $Attendancedetails = $this->view->accounts->getAttendance($groupid); //Fetch Absentees list
        foreach($Attendancedetails as $attendance){
            $absentees = $attendance['Absentees'];
        }
        $Countmeetings = $this->view->accounts->Countmeetings($groupid); //Fetch number of meetings
        foreach($Countmeetings as $meetings){
            $numberofmeetings = $meetings['Numberofmeetings'];
        } 
        $Countgroupmembers = $this->view->accounts->Countgroupmembers($groupid); //Fetch number of members in that group
        foreach($Countgroupmembers as $groupcount){
            $totalmembers = $groupcount['Totalmembers'];
        }
        // Attendance percentage calculation
        $Origmeetingstr = $numberofmeetings * $totalmembers;
        $present = $Origmeetingstr - $absentees;
        if($present > 0){
            $AttendPercent = ($present*100)/$Origmeetingstr;
            $shgForm->gattendance->setValue(round($AttendPercent,2));
        }
        if($present < 0){
            $shgForm->gattendance->setValue(0);
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
//         $page->drawImage($image, 25, 770, 570, 820);
        $page->drawImage($image, 30, 770, 130, 820);
        $page->drawText("Date : ".date('d-m-Y'),500, 800); //date('Y-m-d')
        $page->setLineWidth(1)->drawLine(25, 25, 570, 25); //bottom horizontal
        $page->setLineWidth(1)->drawLine(25, 25, 25, 820); //left vertical
        $page->setLineWidth(1)->drawLine(570, 25, 570, 820); //right vertical
        $page->setLineWidth(1)->drawLine(570, 820, 25, 820); //top horizontal

        $serial = range(1,10);

        $header = array("SUJEEVANA PROGRAMME",
                        "SHG/JLG QUALITY EVALUATION",
                        "SHG/JLG Group :",
                        "Village :",
                        "Farmer's group :",
                        "Village facilitator",
                        "Area officer",
                        "Date :",
                        "S.No",
                        "Quality indicators",
                        "Maximum marks",
                        "Scored marks");

       $first =   array("Group meeting & other information",
                        "Attendance(<50%=0)",
                        "Savings(<50%=0)",
                        "Meeting discipline ?",
                        "Participation of members in discussion ?",
                        "Weekly meeting limit(<80%=0)",
                        "Change of membership(<50%=0)",
                        "Preparation of workplan for the meeting",
                        "Number of signing members",
                        "Group members co operation",
                        "Group sustainability training"); 

     $second =   array("Book Keeping",
                        "Savings-attendance sheet",
                        "Loan disbursement",
                        "Discussion and decisions",
                        "Weekly Income - Expenditure details",
                        "Individual saving account",
                        "Individual loan account",
                        "General account");

     $third =   array("Previous loan information",
                        "Loan holders percentage(<50%=0)",
                        "Usage of savings/loans for income generating activities",
                        "Loan repayment percentage(<50%=0)",
                        "Minimum repayment");

    $four =   array("Farmers school & information",
                        "Participation(<70%=0)",
                        "Farmer school",
                        "Weekly plan",
                        "School learnings followup percentage(<50%=0)",
                        "Total marks");

    $marks = array("20","30","50","100","150","250","350","1000");

    $hash = "#";
    $percentage =   array("Currently applicable total marks",
                        "Scored marks",
                        "Total marks",
                        "Percentage of marks (%)",
                        "Grade",
                        "Observed - good points",
                        "Observed - need changes in",
                        "Evaluator name & signature");   

     $gradepercent =   array("> 80%",
                             "70 - 80%",
                             "60 - 70%",
                             "< 60%");

    $grade =   array("A",
                    "B",
                    "C",
                    "D");

        $x0 = 190; 
        $x1 = 55; 
        $x2 = 90;
        $x3 = 310; 
        $x4 = 465;
        $y1 = 680;

        // Page heading
        $page->drawText($header[0], $x0, 760);
        $page->drawText($header[1], $x0, 750);

        // Left side titles
        $page->drawText($header[2], 30, 730);
        $page->drawText($groupname, 110, 730); // Print group name
        $page->drawText($groupname, 110, 730); // Print group name
        $page->drawText($header[3], 30, 720);
        $page->drawText($villagename, 110, 720); // Print village name
        $page->drawText($villagename, 110, 720); // Print village name

        $page->drawText($header[4], 30, 710);

        // Right side titles
        $page->drawText($header[5], 500, 730);
        $page->drawText($header[6], 500, 720);
        $page->drawText($header[7], 500, 710);
        $page->drawText(date('d/m/Y'), 525, 710);// Print the date
        $page->drawText(date('d/m/Y'), 525, 710);// Print the date

        // Draw table border
        $page->drawLine(50, 700, 550, 700);
        $page->drawLine(50, 680, 550, 680);
        // Table header's
        $page->drawText($header[8], $x1, 690);
        $page->drawText($header[9], $x2, 690);
        $page->drawText($header[10], $x3, 690);
        $page->drawText($header[11], $x4, 690);

        // Display the First part of table
        $y1 = $y1-10;
        $page->drawText($hash, $x1, $y1);
        $page->drawText($hash, $x1, $y1);
        $page->drawText($first[0], $x2, $y1);
        $page->drawText($first[0], $x2, $y1);
        $page->drawText($marks[6], $x3, $y1);
        $page->drawText($marks[6], $x3, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[0], $x1, $y1);
        $page->drawText($first[1], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
        $page->drawText($gattendance, $x4, $y1);


        $y1 = $y1-10;
        $page->drawText($serial[1], $x1, $y1);
        $page->drawText($first[2], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
        $page->drawText($gsaving, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[2], $x1, $y1);
        $page->drawText($first[3], $x2, $y1);
        $page->drawText($marks[0], $x3, $y1);
        $page->drawText($gmeetdiscipline, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[3], $x1, $y1);
        $page->drawText($first[4], $x2, $y1);
        $page->drawText($marks[0], $x3, $y1); 
        $page->drawText($gparticipation, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[4], $x1, $y1);
        $page->drawText($first[5], $x2, $y1);
        $page->drawText($marks[0], $x3, $y1);
        $page->drawText($gweeklymeet, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[5], $x1, $y1);
        $page->drawText($first[6], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);   
        $page->drawText($gchangememb, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[6], $x1, $y1);
        $page->drawText($first[7], $x2, $y1);
        $page->drawText($marks[0], $x3, $y1);
        $page->drawText($gpreparation, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[7], $x1, $y1);
        $page->drawText($first[8], $x2, $y1);
        $page->drawText($marks[0], $x3, $y1);
         $page->drawText($gsigningmemb, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[8], $x1, $y1);
        $page->drawText($first[9], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
        $page->drawText($gsigningmemb, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[9], $x1, $y1);
        $page->drawText($first[10], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
        $page->drawText($ggroupcooperation, $x4, $y1);


        // Display the Second part of table
        $y1 = $y1-10;
        $page->drawText($hash, $x1, $y1);
        $page->drawText($hash, $x1, $y1);
        $page->drawText($second[0], $x2, $y1);
        $page->drawText($second[0], $x2, $y1);
        $page->drawText($marks[5], $x3, $y1);
        $page->drawText($marks[5], $x3, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[0], $x1, $y1);
        $page->drawText($second[1], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
//         $page->drawText($bsavingattend, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[1], $x1, $y1);
        $page->drawText($second[2], $x2, $y1);
        $page->drawText($marks[0], $x3, $y1);
//         $page->drawText($bloandisburse, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[2], $x1, $y1);
        $page->drawText($second[3], $x2, $y1);
        $page->drawText($marks[1], $x3, $y1);
//         $page->drawText($bdiscussion, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[3], $x1, $y1);
        $page->drawText($second[4], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1); 
//         $page->drawText($bincomeandexpend, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[4], $x1, $y1);
        $page->drawText($second[5], $x2, $y1);
        $page->drawText($marks[1], $x3, $y1);
//         $page->drawText($bindividualsave, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[5], $x1, $y1);
        $page->drawText($second[6], $x2, $y1);
        $page->drawText($marks[0], $x3, $y1);   
//         $page->drawText($bindividualloan, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[6], $x1, $y1);
        $page->drawText($second[7], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
//         $page->drawText($bgeneralacc, $x4, $y1);

        // Display the Third part of table
        $y1 = $y1-10;
        $page->drawText($hash, $x1, $y1);
        $page->drawText($hash, $x1, $y1);
        $page->drawText($third[0], $x2, $y1);
        $page->drawText($third[0], $x2, $y1);
        $page->drawText($marks[5], $x3, $y1);
        $page->drawText($marks[5], $x3, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[0], $x1, $y1);
        $page->drawText($third[1], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
//         $page->drawText($ploanholder, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[1], $x1, $y1);
        $page->drawText($third[2], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
//         $page->drawText($pusageofsaving, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[2], $x1, $y1);
        $page->drawText($third[3], $x2, $y1);
        $page->drawText($marks[3], $x3, $y1);
//         $page->drawText($ploanrepayment, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[3], $x1, $y1);
        $page->drawText($third[4], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1); 
//         $page->drawText($pminimumrepay, $x4, $y1);

        // Display the Fourth part of table
        $y1 = $y1-10;
        $page->drawText($hash, $x1, $y1);
        $page->drawText($hash, $x1, $y1);
        $page->drawText($four[0], $x2, $y1);
        $page->drawText($four[0], $x2, $y1);
        $page->drawText($marks[4], $x3, $y1);
        $page->drawText($marks[4], $x3, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[0], $x1, $y1);
        $page->drawText($four[1], $x2, $y1);
        $page->drawText($marks[1], $x3, $y1);
//         $page->drawText($fparticipation, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[1], $x1, $y1);
        $page->drawText($four[2], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);
//          $page->drawText($ffarmerschool, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[2], $x1, $y1);
        $page->drawText($four[3], $x2, $y1);
        $page->drawText($marks[0], $x3, $y1);
//          $page->drawText($fweeklyplan, $x4, $y1);

        $y1 = $y1-10;
        $page->drawText($serial[3], $x1, $y1);
        $page->drawText($four[4], $x2, $y1);
        $page->drawText($marks[2], $x3, $y1);  
//         $page->drawText($fschoollearning, $x4, $y1);

// Total 
        $y1 = $y1-10;
        $page->drawText($hash, $x1, $y1);
        $page->drawText($hash, $x1, $y1);
        $page->drawText($four[5], $x2, $y1);
        $page->drawText($four[5], $x2, $y1);
        $page->drawText($marks[7], $x3, $y1);
        $page->drawText($marks[7], $x3, $y1);
//         $page->drawText($totalmarks, $x4, $y1);

   

        $page->drawLine(50, $y1-5, 50, 700);
        $page->drawLine(80, $y1-5, 80, 700);
        $page->drawLine($x3-10, $y1-5, $x3-10, 700);
        $page->drawLine($x4-30, $y1-5, $x4-30, 700);
        $page->drawLine(550, $y1-5, 550, 700);
        $page->drawLine(50, $y1-5, 550, $y1-5);

        // Display percentage calculation

        // Total 
        $y1 = $y1-15;
        $page->drawText($percentage[0], $x1, $y1);
//         $page->drawText($marks, $x2+100, $y1);
        $page->drawText($gradepercent[0], $x3, $y1);
        $page->drawText($grade[0], $x3+100, $y1);       

        $y1 = $y1-10;
        $page->drawText($percentage[1], $x1, $y1);
//         $page->drawText($totalmarks, $x2+100, $y1);
        $page->drawText($gradepercent[1], $x3, $y1);
        $page->drawText($grade[1],  $x3+100, $y1);    

        $y1 = $y1-10;
        $page->drawText($percentage[3], $x1, $y1);
//         $page->drawText($percentage, $x2+100, $y1);
        $page->drawText($gradepercent[2], $x3, $y1);
        $page->drawText($grade[2],  $x3+100, $y1);       

        $y1 = $y1-10;
        $page->drawText($percentage[4], $x1, $y1);
//         $page->drawText($grade, $x2+100, $y1);
        $page->drawText($gradepercent[3], $x3, $y1);
        $page->drawText($grade[3],  $x3+100, $y1);


        $y1 = $y1-40;
        $page->drawText($percentage[5], $x1, $y1);  
//         $page->drawText($observe, $x2+100, $y1);

        $y1 = $y1-80;
        $page->drawText($percentage[6], $x1-10, $y1); 
        $page->drawText($percentage[7], $x4-20, $y1);
// 
//         $y1 = $y1-15;
//         $page->drawLine(50, $y1, 550, $y1);
//         $page->drawLine(50, $y1-20, 550, $y1-20);
// 
//         $page->drawText($secondtable[0], $x1, $y1-10);
//         $page->drawText($secondtable[1], $x5, $y1-10);
//         $page->drawText($secondtable[2], $x3, $y1-10);
//         $y1 = $y1-30;
//         $j=1;
//         foreach($groupmembers as $groupmem){
//             $page->drawText($j, $x1, $y1);
//             $page->drawText($groupmem['membername'], $x5, $y1);
//             $page->drawLine(50, $y1-5, 550, $y1-5);
//         }
//         $y1 = $y1-20;
//         $Totalvalue = $secondtable[3].$j;
//         $page->drawText($Totalvalue, $x5, $y1);
//         $page->drawLine(50, $y1-5, 550, $y1-5);
// 
//         $y3 = $y1 + 45 + ($j*5);
//   // Virtual table
//         $page->setLineWidth(1)->drawLine(50,$y1-5,50,$y3); //Table left vertical
//         $page->setLineWidth(1)->drawLine($x1+25,$y1-5,$x1+25,$y3); //Table second left vertical
// //         $page->setLineWidth(1)->drawLine($x5-5,$y1-5,$x5-5,$y3); //Table center vertical
//         $page->setLineWidth(1)->drawLine($x3-35,$y1-5,$x3-35,$y3); //Table second center vertical
//         $page->setLineWidth(1)->drawLine(550,$y1-5 ,550,$y3); //table rigth vertical
// 
//         $y1 = $y1-35;
//         $page->drawText($secondtable[4], $x1+25, $y1);
//         $page->drawText($secondtable[5], $x2-25, $y1);
//         $page->drawText($secondtable[6], $x3-25, $y1);

        $pdf->save('/var/www/'.$projname.'/reports/shgadvances.pdf');
        $path = '/var/www/'.$projname.'/reports/shgadvances.pdf';
        chmod($path,0777);
    } 
}

