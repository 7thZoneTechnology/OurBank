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
class Familymembers_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->pageTitle=$this->view->translate('Family information');
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
        //getting module name and change the side bar dynamically 
         $this->view->id=$subId=$this->_getParam('id');
         $addressmodel= $this->view->familycommon = new Familycommonview_Model_familycommonview();
        $this->view->pageTitle='Family Member Details';
        $this->view->adm = new App_Model_Adm();
        $this->view->dateconvertor = new App_Model_dateConvertor();
        $this->view->baseurl=$this->view->baseUrl();
        $this->view->modelfamily = new Familymembers_Model_Familymembers();
    }

    public function indexAction() 
    {

    }

    public function getbranchAction() { 
	$this->_helper->layout->disableLayout();
        $bank_id = $this->_request->getParam('bank_id');
        $familymodel=new Familymembers_Model_Familymembers();
        $this->view->branchnames=$familymodel->getbranch($bank_id);
    }

    public function getcboAction() { 
	$this->_helper->layout->disableLayout();
        $cbo_id = $this->_request->getParam('cbo_id');
        $familymodel=new Familymembers_Model_Familymembers();
        $this->view->cbonames=$familymodel->getcbo($cbo_id);
    }

    public function getbankAction() { 
	$this->_helper->layout->disableLayout();
        $type_id = $this->_request->getParam('type_id');
        $this->view->selectid = $this->_request->getParam('divid');
        $familymodel=new Familymembers_Model_Familymembers();
        $this->view->banknames=$familymodel->getbank($type_id);
    }

    public function checkuidAction() { 
	$this->_helper->layout->disableLayout();
        $uid = $this->_request->getParam('uid'); 
        $this->view->hiddenid = $this->_request->getParam('hiddenid');
	$uiddetails=$this->view->modelfamily->checkuidmodel($uid);
	if($uiddetails){ 
        echo "<span style='color: #FF0000'>UID already exist</span>";
	}
    }

   public function addfamilyAction() 
    {
        $this->view->title=$this->view->translate('Add family members');
        //load contact details form with two arguments ...
        $this->view->form = new Familymembers_Form_Familymembers();
        $this->view->memberid=$family_id=$this->_getParam('id');
        $this->view->membername = $this->view->familycommon->getfamily($this->_getParam('id'));
        $this->view->insurance=$this->view->familycommon->getinsurance($this->_getParam('id'));
        $subid = $this->view->subId = $this->_getParam('subId');

        $this->view->relation = $this->view->adm->viewRecord("ourbank_master_realtionshiptype","id","DESC");
        $this->view->qualify = $this->view->adm->viewRecord("ourbank_master_educationtype","id","DESC");
        $this->view->gender = $this->view->adm->viewRecord("ourbank_master_gender","id","ASC");
        $this->view->bank = $this->view->adm->viewRecord("ourbank_master_bank","id","DESC");
        $this->view->marital = $this->view->adm->viewRecord("ourbank_master_maritalstatus","id","DESC");
        $this->view->proffession = $this->view->adm->viewRecord("ourbank_master_profession","id","ASC");
        $this->view->branch = $this->view->adm->viewRecord("ourbank_master_branch","id","DESC");
        $this->view->cbopromoter = $this->view->adm->viewRecord("ourbank_master_cbopromoter","id","DESC");
        $this->view->accounttype = $this->view->adm->viewRecord("ourbank_master_accountype","id","DESC");
        $this->view->blood = $this->view->adm->viewRecord("ourbank_master_bloodtype","id","ASC");
        $this->view->entitlements = $this->view->adm->viewRecord("ourbank_master_entitlements","id","ASC");
        $this->view->countvalue=count($this->view->entitlements);
        $this->view->employment = $this->view->adm->viewRecord("ourbank_master_employmenttype","id","ASC");

        $this->view->currentdate= date("d/m/Y");

         if ($this->_request->getPost('submit')) {
                    $family_id=$this->_getParam('id');
                    $mem_name=$this->_getParam('mem_name');
                    $mem_relname=$this->_getParam('mem_relname');
                    $alias_name=$this->_getParam('alias_name');
                    $alias_relname=$this->_getParam('alias_relname');
                    $breadwinner=$this->_getParam('breadwinner');
                    $headID=$this->_getParam('head');
                    $uid= $this->_getParam('uid');
                    $age=$this->_getParam('age');
                    $dob= $this->_getParam('dob');
                    $relation=$this->_getParam('relation');
                    $gender=$this->_getParam('gender');
                    $marital = $this->_getParam('marital');
                    $education=$this->_getParam('education');
                    $promoterid=$this->_getParam('cbopromoter');
                    $cboid=$this->_getParam('cbo');
                    $acctypeid=$this->_getParam('accounttype');
                    $bank=$this->_getParam('bank');
                    $branch=$this->_getParam('branch');
                    $blood=$this->_getParam('blood');
                    $banckAccount = $this->_getParam('bankAccount');
                    $mobile=$this->_getParam('mobile');
                    $employment=$this->_getParam('employ_status');
                    $countname = count($mem_name);

                    $editfamily = $this->view->adm->editRecord("ourbank_family",$family_id);
                    $villageid=$editfamily[0]['rev_village_id'];

            $j=0; $k=0; $l=0;
            for($i = 0; $i< $countname; $i++) 
            {

                if ($breadwinner[$j] == $i+1) {
                    $bread = 1;
                    $j++;
                } else {
                    $bread = 0;
                }
                if ($headID[$k] == $i+1) {
                    $head = 1;
                    $k++;
                } else {
                    $head = 0;
                }
                $o=str_pad($villageid,3,"0",STR_PAD_LEFT);
                $u=str_pad($family_id,4,"0",STR_PAD_LEFT);
                $code=$o.$u;
                $familymembers = array('family_id' => $family_id,
                                    'breadwinner_id' => $bread,
                                    'head_id' => $head,
                                    'village_id'=>$villageid,
//                                  'familycode'=>$code.str_pad($i,2,"0",STR_PAD_LEFT),
                                    'name' => $mem_name[$i],
                                    'name_inregional' => $mem_relname[$i],
                                    'alias' => $alias_name[$i],
                                    'alias_inregional' => $alias_relname[$i],
                                    'uid'=>$uid[$i],
                                    'dob'=>$this->view->dateconvertor->mysqlformat($dob[$i]),
                                    'age' => $age[$i],
                                    'relationship_id' => $relation[$i],
                                    'gender_id' => $gender[$i],
                                    'maritalstatus_id' => $marital[$i],
                                    'eductaion_id' => $education[$i],
                                    'employment_status'=>$employment[$i],
                                    'promoter_id' => $promoterid[$i],
                                    'cbo_id' => $cboid[$i],
                                    'accouttype_id' => $acctypeid[$i],
                                    'bank' => $bank[$i],
                                    'branch_po' => $branch[$i],
                                    'bank_ac' => $banckAccount[$i],
                                    'blood_id'=>$blood[$i],
                                    'mobile_number' => $mobile[$i],
                                    'created_by'=>$this->view->createdby, 
                                    'created_date'=>date("y/m/d H:i:s")
                                   );
                $lastid=$this->view->adm->addRecord("ourbank_familymember",$familymembers);
                $inc = $i;
                $inc++;
                $entitlement=$this->_getParam('entitle-'.$inc.'-'); //print_r($entitlement);
                $ecount=count($entitlement);
                for($n=0; $n<$ecount; $n++){
                $entitledetails=array('member_id'=>$lastid,'entitlement_id'=>$entitlement[$n]);
                $this->view->adm->addRecord("ourbank_memberentitlememnt",$entitledetails);
                }
                $profession=array();
                $profession=$this->_getParam('profid-'.$inc.'-'); //print_r($profession);
                $pcount=count($profession);
                for($n=0; $n<$pcount; $n++){
                $profdetails=array('member_id'=>$lastid,'profession_id'=>$profession[$n]);
                $this->view->adm->addRecord("ourbank_memberprofession",$profdetails);
                }
                //create a member code
                $o=str_pad($villageid,3,"0",STR_PAD_LEFT);
                $p = "01";
                $u=str_pad($lastid,6,"0",STR_PAD_LEFT);
                $membercode=$o.$p.$u;
               $this->view->adm->updateRecord("ourbank_familymember",$lastid,array('familycode'=>$membercode));
            }
          $this->_redirect('/familycommonview/index/commonview/id/'.$family_id);
        }
    }


    //editing contact details
    public function editfamilyAction()
    {
        $this->view->title=$this->view->translate('Edit Family');

        $form = new Familymembers_Form_Familymembers();
        $this->view->form=$form;
        //load contact details form with two arguments ...
        $form = new Crop_Form_Crop($this->_getParam('id'),$this->_getParam('subId'));
        $this->view->form = $form;
        $this->view->id = $this->_getParam('id');
        $this->view->membername = $this->view->familycommon->getfamily($this->_getParam('id'));
        $this->view->insurance=$this->view->familycommon->getinsurance($this->_getParam('id'));
        $subid = $this->view->subId = $this->_getParam('subId');
        $this->view->submitform = new Familymembers_Form_Submit();

        $familyobj = new Familymembers_Model_Familymembers();

//         echo "<pre>";print_r($family);
        $this->view->relation = $this->view->adm->viewRecord("ourbank_master_realtionshiptype","id","DESC");
        $this->view->qualify = $this->view->adm->viewRecord("ourbank_master_educationtype","id","DESC");
        $this->view->gender = $this->view->adm->viewRecord("ourbank_master_gender","id","ASC");
        $this->view->skill = $this->view->adm->viewRecord("ourbank_master_profession","id","DESC");
        $this->view->marital = $this->view->adm->viewRecord("ourbank_master_maritalstatus","id","DESC");
        $this->view->proffession = $this->view->adm->viewRecord("ourbank_master_profession","id","ASC");
        $this->view->bank = $this->view->adm->viewRecord("ourbank_master_bank","id","DESC");
        $this->view->promoter = $this->view->adm->viewRecord("ourbank_master_cbopromoter","id","DESC");
        $this->view->accounttype = $this->view->adm->viewRecord("ourbank_master_accountype","id","DESC");
        $this->view->blood = $this->view->adm->viewRecord("ourbank_master_bloodtype","id","ASC");
        $this->view->entitlements = $this->view->adm->viewRecord("ourbank_master_entitlements","id","ASC");
        $this->view->employment = $this->view->adm->viewRecord("ourbank_master_employmenttype","id","ASC");

        $family = $this->view->familydetails = $familyobj->getfamilydetails($this->view->id);
        foreach($family as $familyarray){
        $recordarray[]=$familyarray['id'];
        }
        $editfamily = $this->view->adm->editRecord("ourbank_family",$this->view->id);
        $villageid=$editfamily[0]['rev_village_id'];

        $this->view->currentdate= date("d/m/Y");

        //update contact details
        if ($this->_request->getPost('Update')) 
        {
            $id=$this->_getParam('id');
            $family = $this->view->familydetails = $familyobj->getfamilydetails1($id); 
            $count = count($family);
            $ExistMemberscount = $count;
            for ($j = 0 ; $j< $count; $j++) {
                $this->view->adm->addRecord("ourbank_familymember_log",$family[$j]);
            }

            //$familyobj->deleteFamily($id);

            $family_id=$this->_getParam('id');
            $mem_name=$this->_getParam('mem_name');
            $mem_relname=$this->_getParam('mem_relname');
            $alias_name=$this->_getParam('alias_name');
            $alias_relname=$this->_getParam('alias_relname');
            $breadwinner=$this->_getParam('breadwinner');
            $headID=$this->_getParam('head');
            $gender = $this->_getParam('gender');
            $age=$this->_getParam('age');
            $relation=$this->_getParam('relation');
            $marital = $this->_getParam('marital');
            $education=$this->_getParam('education');
            $proffession = $this->_getParam('proffesion');
            $entitlement=$this->_getParam('entitle');
            $promoterid=$this->_getParam('cbopromoter');
            $cboid=$this->_getParam('cbo');
            $acctypeid=$this->_getParam('accounttype');
            $bank=$this->_getParam('bank');
            $branch=$this->_getParam('branch');
            $banckAccount = $this->_getParam('bankAccount');
            $mobile=$this->_getParam('mobile');
            $recordid=$this->_getParam('recordid');
            $blood=$this->_getParam('blood');
            $dob= $this->_getParam('dob');
            $uid= $this->_getParam('uid');
            $employment=$this->_getParam('employ_status');


            $countname = count($mem_name);
            $j=0; $k=0; $l=0; $flag=0;
            for($i = 0; $i< $countname; $i++)
            {
                for($m=0; $m<$countname;$m++)
                {
                    if($i != $m)
                    {
                    if($uid[$i] == $uid[$m])
                    {
                        $flag+=1; echo "roshni1";
                    }
                    }
                }
                if($flag > 0)
                {
                    //$this->view->uiderror = "same values";
                   // $this->_redirect('/familymembers/index/editfamily/id/'.$id.'/subId/'.$subid);
                    echo "roshni2";
                }
                else
                {
                    echo $flag; echo "roshni6";
                   $uiddetails=$this->view->modelfamily->checkuidmodel1($uid[$i],$mem_name[$i]);
                   if (empty($uiddetails))
                    {

                                    if ($breadwinner[$j] == $i+1)
                                    {
                                        $bread = 1;
                                        $j++;
                                    } else {
                                        $bread = 0;
                                    }
                                    if ($headID[$k] == $i+1) {
                                        $head = 1;
                                        $k++;
                                    } else {
                                        $head = 0;
                                    }

                    // Check whether the record is available or not 

                                    $familymembers = array('family_id' => $family_id,
                                                        'breadwinner_id' => $bread,
                                                        'head_id' => $head,
                                                        'village_id'=>$villageid,
                    //                                  'familycode'=>$code.str_pad($i,2,"0",STR_PAD_LEFT),
                                                        'name' => $mem_name[$i],
                                                        'name_inregional' => $mem_relname[$i],
                                                        'alias' => $alias_name[$i],
                                                        'alias_inregional' => $alias_relname[$i],
                                                        'uid'=>$uid[$i],
                                                        'dob'=>$this->view->dateconvertor->mysqlformat($dob[$i]),
                                                        'age' => $age[$i],
                                                        'relationship_id' => $relation[$i],
                                                        'gender_id' => $gender[$i],
                                                        'maritalstatus_id' => $marital[$i],
                                                        'eductaion_id' => $education[$i],
                                                        'employment_status'=>$employment[$i],
                                                        'promoter_id' => $promoterid[$i],
                                                        'cbo_id' => $cboid[$i],
                                                        'accouttype_id' => $acctypeid[$i],
                                                        'bank' => $bank[$i],
                                                        'branch_po' => $branch[$i],
                                                        'bank_ac' => $banckAccount[$i],
                                                        'blood_id'=>$blood[$i],
                                                        'mobile_number' => $mobile[$i],
                                                        'created_by'=>$this->view->createdby, 
                                                        'created_date'=>date("y/m/d H:i:s")
                                                    );
                            if($recordid[$i]!="")
                              {
                                    $familyobj->update($recordid[$i],$familymembers);
                                    $familyobj->deleterecord('ourbank_memberentitlememnt',$recordid[$i]);
                                    $familyobj->deleterecord('ourbank_memberprofession',$recordid[$i]);
    
                                        $inc = $i;
                                        $inc++;
                                        $entitlement=$this->_getParam('entitle-'.$inc.'-'); //print_r($entitlement);
                                        $ecount=count($entitlement);
                                        for($n=0; $n<$ecount; $n++){
                                        $entitledetails=array('member_id'=>$recordid[$i],'entitlement_id'=>$entitlement[$n]);
                                        $this->view->adm->addRecord("ourbank_memberentitlememnt",$entitledetails);
                                        }
                                        $profession=array();
                                        $profession=$this->_getParam('profid-'.$inc.'-'); //print_r($profession);
                                        $pcount=count($profession);
                                        for($n=0; $n<$pcount; $n++){
                                        $profdetails=array('member_id'=>$recordid[$i],'profession_id'=>$profession[$n]);
                                        $this->view->adm->addRecord("ourbank_memberprofession",$profdetails);
                                        }

                                }
                                    // check the i value with Exist members value to add new members 
                                else
                                {
                                        $lastid=$this->view->adm->addRecord("ourbank_familymember",$familymembers);
                                        $inc = $i;
                                        $inc++;
                                        $entitlement=$this->_getParam('entitle-'.$inc.'-'); //print_r($entitlement);
                                        $ecount=count($entitlement);
                                        for($n=0; $n<$ecount; $n++){
                                        $entitledetails=array('member_id'=>$lastid,'entitlement_id'=>$entitlement[$n]);
                                        $this->view->adm->addRecord("ourbank_memberentitlememnt",$entitledetails);
                                        }
                                        $profession=array();
                                        $profession=$this->_getParam('profid-'.$inc.'-'); //print_r($profession);
                                        $pcount=count($profession);
                                        for($n=0; $n<$pcount; $n++){
                                        $profdetails=array('member_id'=>$lastid,'profession_id'=>$profession[$n]);
                                        $this->view->adm->addRecord("ourbank_memberprofession",$profdetails);
                                        }

                                         // create a member code
                                        $o=str_pad($villageid,3,"0",STR_PAD_LEFT);
                                        $p = "01";
                                        $u=str_pad($lastid,6,"0",STR_PAD_LEFT);
                                        $membercode=$o.$p.$u;
                                        $this->view->adm->updateRecord("ourbank_familymember",$lastid,array('familycode'=>$membercode));
                                }
                 }
                else
                {
                   //$this->_redirect('/familymembers/index/editfamily/id/'.$id.'/subId/'.$subid);
                    echo "roshni3";
                }

            }//end of if else loop for $flag

           }

            $deletearray=array_diff($recordarray,$recordid);
            foreach($deletearray as $deltearr){
            $familyobj->deleteFamily($deltearr);
            }
          //$this->_redirect('/familycommonview/index/commonview/id/'.$id);
                echo "roshni5";
        }
    }

}
