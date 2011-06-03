<?php
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
class Groupmdefault_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle = "Group";
        $test = new DH_ClassInfo(APPLICATION_PATH .'/modules/groupm/controllers/');// create instance to get controller name 
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
	$storage = new Zend_Auth_Storage_Session();
        		$data = $storage->read();
        		if(!$data){
           		 $this->_redirect('index/login');
        			}
        $this->view->adm = new App_Model_Adm(); // create instance for common adm model page
        $module = $test->getControllerClassNames();
        $modulename = explode("_", $module[0]);
        $this->view->modulename = strtolower($modulename[0]);
        
        $this->view->dbobj = new Groupmdefault_Model_Groupdefault();
    }

    public function addgroupAction() 
    {
        $app = $this->view->baseUrl();
        $this->view->pageTitle = "Group";
        $this->view->title = "Group";
        $addForm = new Groupmdefault_Form_groupdefault($app);
        $this->view->form=$addForm;
          $convertdate = new App_Model_dateConvertor();
   $sessionName = new Zend_Session_Namespace('groupsession');
        if(isset($sessionName)){
                $this->view->gtype = $sessionName->__get('grouptype');
                $addForm->office->setValue($sessionName->__get('office'));
                $addForm->groupname->setValue($sessionName->__get('groupname'));
                $addForm->bank->setValue($sessionName->__get('bank'));
                $addForm->savingamt->setValue($sessionName->__get('savingamt'));
                $addForm->penaltylate->setValue($sessionName->__get('penaltylate'));
//                 $addForm->penaltyabsence->setValue($sessionName->__get('penaltyabsence'));
                $addForm->interest->setValue($sessionName->__get('interest'));
                $addForm->place->setValue($sessionName->__get('place'));
                $addForm->times->setValue($sessionName->__get('times'));
                $addForm->day->setValue($sessionName->__get('day'));
                $cdate = $sessionName->__get('Created_Date');
if($cdate) {
    $addForm->Created_Date->setValue($cdate);
}
unset($sessionName->office);
unset($sessionName->groupname);
unset($sessionName->bank);
unset($sessionName->savingamt);
unset($sessionName->penaltylate);
unset($sessionName->penaltyabsence);
unset($sessionName->interest);
unset($sessionName->place);
unset($sessionName->times);
unset($sessionName->day);
unset($sessionName->Created_Date);
}
        if($this->_request->getParam('error')) { // display error message for wrong head selection
			$error = $this->_request->getParam('error');
			if($error == 1 ) {
				$this->view->error = "Improper Group head selection ! ";
			}
                        if($error == 2 ) {
				$this->view->error = "Choose single member in a family ! ";
			}
                        if($error == 3 ) {
				$this->view->error = "Improper Group representative selection ! ";
			}
                        if($error == 4 ) {
                                $this->view->error = "Maximum 3 members can be a representatives in a single group!  ";
                        }
                        if($error == 5 ) {
                                $this->view->error = "Choose Bank branch name";
                        }
        }
       
//         $dbobj = new Groupmdefault_Model_Groupdefault();
        $days = $this->view->adm->viewRecord("ourbank_master_weekdays","id","ASC");
        foreach($days as $day) {
            $addForm->day->addMultiOption($day['id'],$day['name']);
        }

        $bank = $this->view->adm->viewRecord("ourbank_master_bank","id","ASC");
        foreach($bank as $banks) {
            $addForm->bank->addMultiOption($banks['id'],$banks['name']);
        }
           $hierarchy = $this->view->dbobj->getofficehierarchy();
               foreach($hierarchy as $hiearchyids){
             $hiearchyid = $hiearchyids['hierarchyid'];
            }

        $officedetails = $this->view->adm->getRecord('ourbank_office','officetype_id',$hiearchyid);
        foreach($officedetails as $officeiddetails) { 
        $addForm->office->addMultiOption($officeiddetails['id'],$officeiddetails['name']);
        }
    }
    public function getmembersaddAction()
    {
         // get branch id and display branch members
        $branch_id = $this->_request->getParam('branch_id');
        $grouptype = $this->_request->getParam('type');
        $this->view->familyid = $branch_id;
        $this->_helper->layout->disableLayout();
        $dbobj= new Groupmdefault_Model_Groupdefault();
        $this->view->members = $dbobj->GetBranchMembers($branch_id,$grouptype);
        $existmem = $dbobj->GetExistMembers($branch_id,$grouptype);
        $existmembers = array();
        foreach($existmem as $existmemb){
        $existmembers[] = $existmemb['family_id'];
        }
        $this->view->existmembers = $existmembers;
    }
    public function getmembersAction()
    {
        $branch_id = $this->_request->getParam('branch_id');
        $group_id = $this->_request->getParam('group_id');
        $grouptype = $this->_request->getParam('grouptype');

        $this->_helper->layout->disableLayout();
        $dbobj= new Groupmdefault_Model_Groupdefault();

        $Allvillagemembers  = $dbobj->GetAllvillagemembers($branch_id); // get All village members
        $fetchMembers=$dbobj->assignMembers($group_id); //get assigned members
        $RepMembers=$dbobj->representatives($group_id); //get Representative members
        $repmembers = array();
        $fetchAllGroupmembers = $dbobj->fetchAllgroupmembers(); 
            foreach($RepMembers as $RepMember){
            $repmembers[] = $RepMember['representative_id'];
            }
            $this->view->representative = $repmembers;
// // Zend_Debug::dump($RepMembers);
// // Zend_Debug::dump($fetchMembers);
        $villagemem = array();
        $Allmem = array();
        $assign = array();
        $assignFamids = array();
        $aa = array();
        foreach($Allvillagemembers as $Allvillagemem){
            $villagemem[] = $Allvillagemem['id'];
        }
        foreach($fetchAllGroupmembers as $fetchAllGroup){
            $Allmem[] = $fetchAllGroup['member_id'];
        } 
         foreach($fetchMembers as $fetchMem){
            $assign[] = $fetchMem['member_id'];
            $assignFamids[] = $fetchMem['family_id'];
        }
// // // Zend_Debug::dump($Allmem);
// // // Zend_Debug::dump($assign);
        $aa  = array_diff($Allmem, $assign);
// // // Zend_Debug::dump($aa);

        $villagemem  = array_diff($villagemem, $aa);
        $this->view->Allmembers = $Allvillagemembers;
        $this->view->Allmem = $villagemem;
        $this->view->Exist = $assign;
        $this->view->Existfamily = $assignFamids;
// Zend_Debug::dump($this->view->Allmembers);
// Zend_Debug::dump($this->view->Allmem);

        $this->view->groupheaddetails = $dbobj->Getgrouphead($group_id); //get group head
        foreach($this->view->groupheaddetails as $grouphead){
                $this->view->grouphead = $grouphead['head'];
        }
     }
    public function groupaccountAction() 
    {  
        $dbobj= new Groupmdefault_Model_Groupdefault();

        $result = "";

        $member_id = $_POST['member_id'];
        $group_head = $_POST['memberhead'];
        $representative_id = $_POST['representatives'];
        $latitude = $this->_request->getParam('latitude');
        $longitude = $this->_request->getParam('longitude');
        $grouptypeid = $this->_request->getParam('grouptype');
        $membertypeid = $grouptypeid;
        $office_id = $this->_request->getParam('office');
        $groupname = $this->_request->getParam('groupname');
        $createddate= $this->_request->getParam('Created_Date');
        $savingamt = $this->_request->getParam('savingamt');
        $bank = $this->_request->getParam('bank');
        $branch = $this->_request->getParam('branch');
        $penaltyabsence = $this->_request->getParam('penaltyabsence');
        $penaltylate = $this->_request->getParam('penaltylate');
        $interest = $this->_request->getParam('interest');
        $place = $this->_request->getParam('place');
        $times = $this->_request->getParam('times');
        $day = $this->_request->getParam('day');




                    $sessionName = new Zend_Session_Namespace('groupsession');
if($grouptypeid){
                    $sessionName->__set('grouptype',$grouptypeid);
}
if($office_id){
                    $sessionName->__set('office',$office_id);
}
if($groupname){
                    $sessionName->__set('groupname',$groupname);
}
if($bank){
                    $sessionName->__set('bank',$bank);
}
if($createddate){
                    $sessionName->__set('Created_Date',$createddate);
}
if($latitude){
                    $sessionName->__set('latitude',$latitude);
}
if($longitude){
                    $sessionName->__set('longitude',$longitude);
}
if($savingamt){
                    $sessionName->__set('savingamt',$savingamt);
}
if($penaltyabsence){
                    $sessionName->__set('penaltyabsence',$penaltyabsence);
}
if($penaltylate){
                    $sessionName->__set('penaltylate',$penaltylate);
}
if($interest){
                    $sessionName->__set('interest',$interest);
}
if($place){
                    $sessionName->__set('place',$place);
}
if($times){
                    $sessionName->__set('times',$times);
}
if($day){
                    $sessionName->__set('day',$day);
}

        $headers = array('Absense','Late');
        $description = array('Penalty for absense','Penalty for late');

        $countreps = count($representative_id);
        $memberids = array();
        $famid = array();
        $memid = array();
        $countvalues = array();
        foreach($member_id as $memberid){
        $memberids[] = explode('_',$memberid);
        }
        foreach($memberids as $Memberids){
        $famid[] = $Memberids[0];
        $memid[] = $Memberids[1];
        }
        $results = array_diff($representative_id,$memid);

        $error = 0;
        if(in_array($group_head,$memid)){
            $result="ok";
            if($results){
                $error = "3";
                $result="not ok";
            }
            if($countreps>3){
                $error = "4";
                $result="not ok";

            } 
        if(!$branch){
                $error = "5";
                $result="not ok";

            }

             else {
                $countvalues[] = array_count_values($famid);
                    foreach ($countvalues[0] as $key => $value) {
                if ($value > 1) {
                    $result="not ok";
                    $error = "2";
                } 
            }
            }
            }
        else {
              $error = "1";
        }

        if($result == "ok" && $error == 0)
        { 
        $date=date("y/m/d H:i:s");

//         // if ok get all input values
        $penalglcode = $dbobj->getpenaltyglcode(4,'recurring deposit');
            if($penalglcode->glcode == null){
            $this->view->adm->addRecord('ourbank_glcode',array('id' => '',
                                    'glcode' => 'L01000', 'ledgertype_id' => 4,
                                    'header' => 'recurring deposit', 'description' => 'recurring deposit',
                                    'created_date' =>$date, 'created_by'=> $this->view->createdby));
            }


        $penalglcode = $dbobj->getpenaltyglcode(4,'recurring deposit');

       $bglcode = $penalglcode->glcode;
       $glcodeid = $penalglcode->glcodeid;


           $ini=substr($bglcode,0,1);
           $mid = substr($bglcode,1,2);

           $midportion = $ini.$mid;

           $last=substr($bglcode,3,3);
           $last+=1;
           $last1 = str_pad($last,3,0,STR_PAD_LEFT);
           $glsubcode[0]=$midportion.$last1;

        $last +=1;
        $last = str_pad($last,3,0,STR_PAD_LEFT);
        $glsubcode[1]=$midportion.$last;

        for($l=0;$l<2;$l++){
        $penalglcodes = $dbobj->checkavailid( $headers[$l]);
            if(!$penalglcodes){
                        $dbobj->insertGlsubcode(array('id' => '',
                                    'office_id' => $office_id,
                                    'glsubcode' => $glsubcode[$l],
                                    'glcode_id' => $glcodeid,
                                    'subledger_id' => 4,
                                    'header' => $headers[$l],
                                    'description' => $description[$l],
                                    'created_date' =>date('Y-m-d'),
                                    'created_by'=>$this->view->createdby));
                    }
                }
        $glidforabsense =  $this->view->adm->getsingleRecord('ourbank_glsubcode','id','header','Absense');
        $glidforlate =  $this->view->adm->getsingleRecord('ourbank_glsubcode','id','header','Late');


          $convertdate = new App_Model_dateConvertor();
          $createddate=$convertdate->phpmysqlformat($createddate);
            $date=date("y/m/d H:i:s");
//             // validate the group name if name exists or not
            $validator = new Zend_Validate_Db_RecordExists('ourbank_group','name');
            if ($validator->isValid($groupname)) {
                $messages = $validator->getMessages();	
                    $this->view->errorgroupname=$groupname.'Already Existed';// if name exists display error message
            } else {
                $groupid = $this->view->adm->addRecord("ourbank_group",
                                                        array('name' => $groupname,
                                                              'bank_id' => $bank,
                                                              'branch_id' => $branch,
                                                              'saving_perweek' => $savingamt,
                                                              'penalty_notcoming' => $penaltyabsence,
                                                              'penalty_latecoming' => $penaltylate,
                                                              'late_subglcode' => $glidforabsense,
                                                              'absent_subglcode' => $glidforlate,
	                                                      'rateinterest' => $interest,
                                                              'place' => $place,
                                                              'time' => $times,
                                                              'days' => $day,
                                                              'latitude' => $latitude,
                                                              'longitude' => $longitude)); // Insert group name and get pk id

//             // generate group code
            $groupcode=str_pad($office_id,3,"0",STR_PAD_LEFT)."0".$grouptypeid.str_pad($groupid,6,"0",STR_PAD_LEFT);
//             // update rest of group values
            $this->view->adm->updateRecord("ourbank_group",$groupid,array('village_id' =>$office_id,'head'=>$group_head,'groupcode' =>$groupcode,'group_created_date'=>$date,'created_by' =>$this->view->createdby,'created_date' =>$createddate ));/* Group created date -> Including timestamp , Created date should contain date only*/

                foreach($memid as $Memid)
                 {
                  $this->view->adm->addRecord("ourbank_groupmembers",array('id' =>'',
                                                                    'group_id' =>$groupid,
                                                                    'member_id' =>$Memid,
                                                                    'groupmember_status' =>3));////add groupmembers with its group id ->($groupid)
                 } 
             foreach($representative_id as $representatives)
                 {
                  $this->view->adm->addRecord("ourbank_group_representatives",array('id' =>'',
                                                                    'group_id' =>$groupid,
                                                                    'representative_id' =>$representatives));////add representatives with its group id ->($groupid)
                 }
// //             $membertypeid = $this->view->adm->getsingleRecord('ourbank_master_membertypes','id','type','Group');

                  $account_id = $this->view->adm->addRecord("ourbank_accounts",array('id' =>'',
                                                                    'membertype_id' =>$membertypeid,
                                                                    'begin_date' =>$date,
                                                                    'accountcreated_date' =>$date,
                                                                    'created_date' =>$createddate,
                                                                    'created_by' =>$this->view->createdby,
                                                                    'status_id' => 1)); // insert some value to accounts table for group*/

                $productid = $dbobj->getProductid();
                $productcode = $productid.'S';
// //                 // create account number <!--(3)office id--(2)individualtype--(3)productoffer with saving code(6)accountid!>
		$accountNumber=str_pad($office_id,3,"0",STR_PAD_LEFT).str_pad($membertypeid,2,"0",STR_PAD_LEFT).str_pad($productcode,3,"0",STR_PAD_LEFT).str_pad($account_id,6,"0",STR_PAD_LEFT);
                $this->view->adm->updateRecord("ourbank_accounts",$account_id,array('account_number' =>$accountNumber,'member_id'=>$groupid,'product_id' =>$productid,'tag_account' => $account_id));
//  // Group created date -> Including timestamp , Created date should contain date only

$individualtypeid = $this->view->adm->getsingleRecord('ourbank_master_membertypes','id','type','Individual'); // get individual type id

// // insert accounts value for group members
foreach($memid as $Memid)
 {
$account_ids = $this->view->adm->addRecord("ourbank_accounts",array('id' =>'',
                                                                    'membertype_id' =>$individualtypeid,
                                                                    'begin_date' =>$date,
                                                                    'tag_account' =>$account_id,
                                                                    'accountcreated_date' =>$date,
                                                                    'created_date' =>$createddate,
                                                                    'created_by' =>$this->view->createdby,
                                                                    'status_id' => 1)); // insert some value to accounts table
//                 // create account number <!--(3)office id--(2)individualtype--(3)productoffer with saving code(6)accountid!>
		$accountNumber=str_pad($office_id,3,"0",STR_PAD_LEFT).str_pad($individualtypeid,2,"0",STR_PAD_LEFT).str_pad($productcode,3,"0",STR_PAD_LEFT).str_pad($account_ids,6,"0",STR_PAD_LEFT);

                $this->view->adm->updateRecord("ourbank_accounts",$account_ids,array('account_number' =>$accountNumber,'member_id'=>$Memid,'product_id' =>$productid));

}
// // if all the input's are satisfying all our requirements we can unset the session values 
unset($sessionName->office);
unset($sessionName->groupname);
unset($sessionName->bank);
unset($sessionName->savingamt);
unset($sessionName->penaltylate);
unset($sessionName->penaltyabsence);
unset($sessionName->interest);
unset($sessionName->place);
unset($sessionName->times);
unset($sessionName->day);
unset($sessionName->Created_Date);
               $this->_redirect('groupcommonview/index/commonview/id/'.$groupid);
                }
        } else{  // // //if not ok display errormessage 
            $this->_redirect('/groupmdefault/index/addgroup/error/'.$error);
            }
    }
    public function editgroupAction()
    {

        // check group head , and members are correct 
        if($this->_request->getParam('error')) { // display error message for wrong head selection
            $error = $this->_request->getParam('error');
            if($error == 1 ) {
                    $this->view->error = "Improper Group head selection ! ";
            }
            if($error == 2 ) {
                    $this->view->error = "Chose single member in a family ! ";
            }
             if($error == 3 ) {
                    $this->view->error = "Improper Group representatives selection ! ";
            }
            if($error == 4 ) {
                    $this->view->error = "Maximum 3 members can be a representative in a single group !  ";
            }
            if($error == 5 ) {
                    $this->view->error = "Chose Bank branch name";
            }
        }
        $app = $this->view->baseUrl();
        $group_id=$this->_getParam('id');
        $this->view->groupid = $group_id;
        $this->view->title = "Edit Group Details"; 
        // create instance for form page with baseurl
        $addForm = new Groupmdefault_Form_groupdefault($app);
        $days = $this->view->adm->viewRecord("ourbank_master_weekdays","id","ASC");
        foreach($days as $day) {
            $addForm->day->addMultiOption($day['id'],$day['name']);
        }
        $bank = $this->view->adm->viewRecord("ourbank_master_bank","id","ASC");
        foreach($bank as $banks) {
            $addForm->bank->addMultiOption($banks['id'],$banks['name']);
        }
        $branch = $this->view->adm->viewRecord("ourbank_master_branch","id","ASC");
        foreach($branch as $branch) {
            $addForm->branch->addMultiOption($branch['id'],$branch['name']);
        }
        $addForm->Submit->setLabel('Update');
        $this->view->form=$addForm;
 
        $dbobject = new Groupmdefault_Model_Groupdefault();
         $hierarchy = $dbobject->getofficehierarchy();
               foreach($hierarchy as $hiearchyids){
             $hiearchyid = $hiearchyids['hierarchyid'];
            }
         // load office id
        $officedetails = $this->view->adm->getRecord('ourbank_office','officetype_id',$hiearchyid);
        foreach($officedetails as $officeiddetails) { 
        $addForm->office->addMultiOption($officeiddetails['id'],$officeiddetails['name']);
        }

        $dbobj = new Groupcommonview_Model_groupcommon();
        $result = $dbobj->getgroup($group_id);

        $convertdate = new App_Model_dateConvertor();
        // assign values with respective form fields
        foreach($result as $group){
        $this->view->grouptype = $grouptype =  substr($group['groupcode'],4,1);;
        $this->view->officeid = $group['officeid'];
        $addForm->offedit->setValue($group['officename']);
        $addForm->offeditv->setValue($group['officeid']);
        $addForm->groupname->setValue($group['groupname']);
        $addForm->bank->setValue($group['bank_id']);
        $addForm->branch->setValue($group['branch_id']);
        $addForm->savingamt->setValue($group['saving_perweek']);
        $addForm->penaltylate->setValue($group['penalty_latecoming']);
        $addForm->penaltyabsence->setValue($group['penalty_notcoming']);
        $addForm->interest->setValue($group['rateinterest']);
        $addForm->place->setValue($group['place']);
        $addForm->times->setValue($group['time']);
        $addForm->day->setValue($group['days']);

        $addForm->Created_Date->setValue($convertdate->phpnormalformat($group['group_created_date']));
        }
        // enable javascript function to load groupmembers 
        echo "<script>getMember('".$group['officeid']."','".$app."','".$group['groupid']."','".$grouptype."');</script>";
            $gacc = array(); 
            $gmembersacc = array(); 

            if ($this->_request->isPost() && $this->_request->getPost('Submit')) 
            {
                $mem = $this->_request->getPost('member_id'); // get selected members

                $groupmembersid = $this->view->adm->getRecord('ourbank_groupmembers','group_id',$this->view->groupid); // Fetch group members
                foreach($groupmembersid as $groupmembers)
                {
                    $macc = $dbobject->Getaccdetails($groupmembers['member_id']); // Get account id from accounts table

                    foreach($macc as $memberaccount){
                        $acc = $memberaccount['id']; // get account id
                        $gacc[] = $acc;
                        $savingdetails = $dbobject->getsavings($acc); // get savings details
                            foreach($savingdetails as $saving){
                                    if($saving['Amount'] > 0){
                                        $gmembersacc[] = $groupmembers['member_id'];
                                    }
                            }
                    }
                }

            if($gmembersacc){
                    foreach($gmembersacc as $gmacc){
                         $meminfor = $this->view->adm->getRecord('ourbank_familymember','id',$gmacc);
                                foreach($meminfor as $membersinfo){
                                            echo "<font color = 'green' ><b>".$membersinfo['name']."</b> <br> </font>";
                                }
                    }

                    echo "<font color ='red'> <b>These group members are having valid accounts. you cannot edit the group members.. </b></font>";

            }else {
                $group_head = $_POST['memberhead'];// get group head 
                $representative_id = $_POST['representatives'];
                $countreps = count($representative_id);
                $result = "";
  
                $memberids = array();
                $famid = array();
                $memid = array();
                $countvalues = array();
                foreach($mem as $memberid){
                $memberids[] = explode('_',$memberid);
                }
                foreach($memberids as $Memberids){
                $famid[] = $Memberids[0];
                $memid[] = $Memberids[1];
                }

                       $result = array_diff($representative_id,$memid);
        $error = 0;
        if(in_array($group_head,$memid)){
            $results="ok";
            if($result){
                $results="not ok";
                $error = "3";
            } 

            if($countreps>3){
                $results="not ok";
                $error = "4";
            }
            if(!$branch){
                            $error = "5";
                            $results="not ok";
                        }
            else {
                $countvalues[] = array_count_values($famid);
                    foreach ($countvalues[0] as $key => $value) {
                if ($value > 1) {
                    $results="not ok";
                    $error = "2";
                } 
            }
            }
            }
        else {
              $error = "1";
        }

                if($results == "ok" && $error == 0){  // if ok then get all input values

                    $office_id = $this->_request->getParam('offeditv');
                    $groupname = $this->_request->getParam('groupname');
                    $bank = $this->_request->getParam('bank');
                    $branch = $this->_request->getParam('branch');
                    $createddate= $this->_request->getParam('Created_Date');
                    $latitude = $this->_request->getParam('latitude');
                    $longitude = $this->_request->getParam('longitude');
                    $savingamt = $this->_request->getParam('savingamt');
                    $penaltyabsence = $this->_request->getParam('penaltyabsence');
                    $penaltylate = $this->_request->getParam('penaltylate');
                    $interest = $this->_request->getParam('interest');
                    $place = $this->_request->getParam('place');
                    $times = $this->_request->getParam('times');
                    $day = $this->_request->getParam('day');

                    $convertdate = new App_Model_dateConvertor();
                    $createddate=$convertdate->phpmysqlformat($createddate);
                    $date=date("y/m/d H:i:s");


                    // updation and insertion in Accounts table
                        foreach($gacc as $gaccountid){ } //get the account id
                        $tagacc = $this->view->adm->getsingleRecord('ourbank_accounts','tag_account','id',$gaccountid);
                        $data = array('tag_account' => 0,
                                      'status_id' => 0);
                        foreach($gacc as $gaccountid){  //get the account id
                                $where = array('id = '.$gaccountid,
                                               'membertype_id = 1');
                                $dbobject->updateaccount('ourbank_accounts',$data,$where); // make tag account and status id as zero
                        }

                    $individualtypeid = $this->view->adm->getsingleRecord('ourbank_master_membertypes','id','type','Individual'); // get individual type id
                    $productid = $dbobject->getProductid();
                    $productcode = $productid.'S';
                    // // insert accounts value for group members
                    foreach($memid as $Memid)
                    {
                    $account_ids = $this->view->adm->addRecord("ourbank_accounts",array('id' =>'',
                                                                                        'membertype_id' =>$individualtypeid,
                                                                                        'begin_date' =>$date,
                                                                                        'tag_account' =>$tagacc,
                                                                                        'accountcreated_date' =>$date,
                                                                                        'created_date' =>$createddate,
                                                                                        'created_by' =>$this->view->createdby,
                                                                                        'status_id' => 1)); // insert some value to accounts table
                    //                 // create account number <!--(3)office id--(2)individualtype--(3)productoffer with saving code(6)accountid!>
                                    $accountNumber=str_pad($office_id,3,"0",STR_PAD_LEFT).str_pad($individualtypeid,2,"0",STR_PAD_LEFT).str_pad($productcode,3,"0",STR_PAD_LEFT).str_pad($account_ids,6,"0",STR_PAD_LEFT);
                                    $this->view->adm->updateRecord("ourbank_accounts",$account_ids,array('account_number' =>$accountNumber,'member_id'=>$Memid,'product_id' =>$productid));

                    }

                  $groupdetails = $dbobject->getgroupdetails($group_id); // get group details for particular id
                    $this->view->adm->addRecord("ourbank_group_log",$groupdetails[0]);  // add group details to log table
        $glidforabsense =  $this->view->adm->getsingleRecord('ourbank_glsubcode','id','header','Absense');
        $glidforlate =  $this->view->adm->getsingleRecord('ourbank_glsubcode','id','header','Late');


                    $this->view->adm->updateRecord("ourbank_group",$group_id,array('village_id' =>$office_id,'bank_id' => $bank,'branch_id' => $branch,
                                                                        'name' =>$groupname,
                                                                        'saving_perweek' => $savingamt,
                                                                        'penalty_notcoming' => $penaltyabsence,
                                                                        'latitude' => $latitude,
                                                                        'longitude' => $longitude, 
                                                                        'penalty_latecoming' => $penaltylate,
                                                                        'late_subglcode' => $glidforlate,
                                                                        'absent_subglcode' =>$glidforabsense ,                                'rateinterest' => $interest,
                                                                        'place' => $place,
                                                                        'time' => $times,
                                                                        'days' => $day,
                                                                        'head'=>$group_head,
                                                                        'group_created_date'=>$date,
                                                                        'created_by' =>$this->view->createdby,
                                                                        'created_date' =>$createddate)); // update group details

                $groupmemberdetails = $this->view->adm->getRecord('ourbank_groupmembers','group_id',$group_id); // get groupmembers details for particular id
                foreach($groupmemberdetails as $groupmemberDetails){
                $this->view->adm->addRecord("ourbank_groupmembers_log",
                                            array('record_id' =>'',
                                                  'id' =>$groupmemberDetails['id'],
                                                  'group_id' => $groupmemberDetails['group_id'],
                                                  'member_id' => $groupmemberDetails['member_id'],
                                                  'groupmember_status' => $groupmemberDetails['groupmember_status']));
                                                    
                 } // add group members details to log table
                    $dbobject->UpdateGroupdetails($group_id);
                // insert group members 
                    foreach($memid as $memberid){
                    $this->view->adm->addRecord("ourbank_groupmembers",array('id' =>'',
                                                'group_id' =>$group_id,
                                                'member_id' =>$memberid,
                                                'groupmember_status' =>3));
                    }
             $grouprepdetails = $this->view->adm->getRecord('ourbank_group_representatives','group_id',$group_id); // get groupmembers details for particular id
                foreach($grouprepdetails as $grouprepmemDetails){
                $this->view->adm->addRecord("ourbank_group_representatives_log",
                                            array('record_id' =>'',
                                                  'id' =>$grouprepmemDetails['id'],
                                                  'group_id' => $grouprepmemDetails['group_id'],
                                                  'representative_id' => $grouprepmemDetails['representative_id']));
                                                    
                 } // add group Representative members details to log table

                    $dbobject->UpdateGroupreps($group_id);
 foreach($representative_id as $representatives)
                 {
                  $this->view->adm->addRecord("ourbank_group_representatives",array('id' =>'',
                                                                    'group_id' =>$group_id,
                                                                    'representative_id' =>$representatives));////add representatives with its group id ->($groupid)
                 }
                    $this->_redirect('groupcommonview/index/commonview/id/'.$group_id);
                        }
                else{ // display error message for wrong group head selection
                    $this->_redirect('groupmdefault/index/editgroup/id/'.$group_id.'/error/'.$error);

                }
                }
            }
        }
 public function deletegroupAction()
    {
//        $checkaccess = $access->accessRights('Group',$this->view->globalvalue[0]['name'],'activitydeleteAction');
//        if (($checkaccess != NULL)) {
        $this->view->groupid=$this->_request->getParam('id');
        $deleteForm = new Groupmdefault_Form_Delete();
        $this->view->form=$deleteForm; 
        // create instance for Groupmdefault model page
        $dbobj= new Groupmdefault_Model_Groupdefault();
        // create instance for groupcommonview model page
        $groupcommon=new Groupcommonview_Model_groupcommon();
        $module=$groupcommon->getmodule('group');
        // get module id for group dynamically
        foreach($module as $module_id){ }
        $moduleid=$module_id['module_id'];
        if ($this->_request->isPost() && $this->_request->getPost('Submit')){
         $formdata = $this->_request->getPost();
            if($deleteForm->isValid($formdata)) {
                $grouptypeid = $dbobj->getGrouptypeid('Group');
                // get the current status of group
                $status = $dbobj->getAccountstatus($this->view->groupid,$grouptypeid);
                if(!$status){
                    $flag = true;
                    }
                    if($status){
                        foreach($status as $statusid){
                            if($statusid['accountstatus_id'] == 5) {
                                $flag = true;
                                }
                            else{
                                $flag = false;
                            }
                        }
                }
                if($flag == true){ // if there is no account for that group we can delete
                    $redirect = $this->view->adm->deleteAction("ourbank_group",$this->view->modulename,$this->view->groupid);

                    $groupmemberdetails = $this->view->adm->getRecord('ourbank_groupmembers','group_id',$this->view->groupid); // get groupmembers details for particular id
                foreach($groupmemberdetails as $groupmemberDetails){
                $this->view->adm->addRecord("ourbank_groupmembers_log",
                                            array('record_id' =>'',
                                                  'id' =>$groupmemberDetails['id'],
                                                  'group_id' => $groupmemberDetails['group_id'],
                                                  'member_id' => $groupmemberDetails['member_id'],
                                                  'groupmember_status' => $groupmemberDetails['groupmember_status']));
                                                    
                 } // add group members details to log table
                    $this->view->adm->deleteSubmodule("address",$this->view->groupid,$moduleid);

                    $dbobj->UpdateGroupdetails($this->view->groupid);
                    $this->_redirect("/".$redirect);
                }
                if($flag==false){ // if account exists then display error message
                    echo "<font color='red'>You cannot delete this group, because this group have some active account.</font>";
                }
                }
	}
	}

        public function branchAction()
        {

        $app = $this->view->baseUrl();
        $this->_helper->layout->disableLayout();

        $bankid = $this->_request->getParam('bankid');

        $groupForm = new Groupmdefault_Form_groupdefault($app);
        $this->view->form = $groupForm;

$dbobj = new Groupmdefault_Model_Groupdefault();
//             $branches = $this->view->adm->getRecord('ourbank_master_branch','bank_id',$bankid);
$branches = $dbobj->Getbranch($bankid);
// Zend_Debug::dump($branches);
//                 // load applicable to values
		foreach($branches as $bankbranch) {
			$groupForm->branch->addMultiOption($bankbranch['id'],$bankbranch['name']);
		}
        }
}
