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
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();
	$this->view->createdby = $this->view->globalvalue[0]['id'];
        //$this->view->username = $this->view->globalvalue[0]['username'];
        //if (($this->view->globalvalue[0]['id'] == 0)) {
            //$this->_redirect('index/logout');
        //}
        //getting module name and change the side bar dynamically 
         $this->view->id=$subId=$this->_getParam('id');
//         $this->view->subId=$subId=$this->_getParam('subId');
//         $this->view->modId=$modId=$this->_getParam('modId');
         $addressmodel= $this->view->familycommon = new Familycommonview_Model_familycommonview();
//         $module_name=$addressmodel->getmodule($subId);
//         foreach($module_name as $module_view)
//         {
//             $address=$module_view['module_description'];
//         }
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

   public function addfamilyAction() 
    {
        $this->view->title=$this->view->translate('Add family members');
        //load contact details form with two arguments ...
        $form = new Familymembers_Form_Familymembers();
        $this->view->memberid=$family_id=$this->_getParam('id');
        $this->view->membername = $this->view->familycommon->getfamily($this->_getParam('id'));
        $this->view->insurance=$this->view->familycommon->getinsurance($this->_getParam('id'));
        $subid = $this->view->subId = $this->_getParam('subId');
        $this->view->form=$form;

        $this->view->relation = $this->view->adm->viewRecord("ourbank_master_realtionshiptype","id","DESC");
        $this->view->qualify = $this->view->adm->viewRecord("ourbank_master_educationtype","id","DESC");
        $this->view->gender = $this->view->adm->viewRecord("ourbank_master_gender","id","DESC");
        $this->view->bank = $this->view->adm->viewRecord("ourbank_master_bank","id","DESC");
        $this->view->marital = $this->view->adm->viewRecord("ourbank_master_maritalstatus","id","DESC");
        $this->view->proffession = $this->view->adm->viewRecord("ourbank_master_profession","id","DESC");
        $this->view->branch = $this->view->adm->viewRecord("ourbank_master_branch","id","DESC");
        $this->view->blood = $this->view->adm->viewRecord("ourbank_master_bloodtype","id","ASC");
        $this->view->entitlements = $this->view->adm->viewRecord("ourbank_master_entitlements","id","ASC");
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
                    $proffession = $this->_getParam('proffesion');
                    $entitlement=$this->_getParam('entitle');
                    $cboID=$this->_getParam('cbomember');
                    $bank=$this->_getParam('bank');
                    $branch=$this->_getParam('branch');
                    $blood=$this->_getParam('blood');
                    $banckAccount = $this->_getParam('banckAccount');
                    $mobile=$this->_getParam('mobile');
                    $employment=$this->_getParam('employ_status');
                    $countname = count($mem_name);

                    $editfamily = $this->view->adm->editRecord("ourbank_family",$family_id);
                    $villageid=$editfamily[0]['village_id'];

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
                if ($cboID[$l] == $i+1) {
                    $cbo = 1;
                    $l++;
                } else {
                    $cbo = 0;
                }
//                 $o=str_pad($villageid,3,"0",STR_PAD_LEFT);
//                 $u=str_pad($family_id,4,"0",STR_PAD_LEFT);
//                 $code=$o.$u;
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
                                    'profession_id' => $proffession[$i],
                                    'entitlements' => $entitlement[$i],
                                    'cbo_member' => $cbo,
                                    'bank' => $bank[$i],
                                    'branch_po' => $branch[$i],
                                    'bank_ac' => $banckAccount[$i],
                                    'blood_id'=>$blood[$i],
                                    'mobile_number' => $mobile[$i],
                                    'created_by'=>$this->view->createdby, 
                                    'created_date'=>date("y/m/d H:i:s")
                                   );
               $lastid=$this->view->adm->addRecord("ourbank_familymember",$familymembers);

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
        $this->view->submitform = new Bank_Form_Submit();

        $familyobj = new Familymembers_Model_Familymembers();

//         echo "<pre>";print_r($family);
        $this->view->relation = $this->view->adm->viewRecord("ourbank_master_realtionshiptype","id","DESC");
        $this->view->qualify = $this->view->adm->viewRecord("ourbank_master_educationtype","id","DESC");
        $this->view->gender = $this->view->adm->viewRecord("ourbank_master_gender","id","DESC");
        $this->view->skill = $this->view->adm->viewRecord("ourbank_master_profession","id","DESC");
        $this->view->marital = $this->view->adm->viewRecord("ourbank_master_maritalstatus","id","DESC");
        $this->view->proffession = $this->view->adm->viewRecord("ourbank_master_profession","id","DESC");
        $this->view->bank = $this->view->adm->viewRecord("ourbank_master_bank","id","DESC");
//         $this->view->branch = $this->view->adm->viewRecord("ourbank_master_branch","id","DESC");
        $this->view->blood = $this->view->adm->viewRecord("ourbank_master_bloodtype","id","ASC");
        $this->view->entitlements = $this->view->adm->viewRecord("ourbank_master_entitlements","id","ASC");
        $this->view->employment = $this->view->adm->viewRecord("ourbank_master_employmenttype","id","ASC");

        $family = $this->view->familydetails = $familyobj->getfamilydetails($this->view->id);
        foreach($family as $familyarray){
        $recordarray[]=$familyarray['id'];
        }
        $editfamily = $this->view->adm->editRecord("ourbank_family",$this->view->id);
        $villageid=$editfamily[0]['village_id'];

        $this->view->currentdate= date("d/m/Y");

        //update contact details
        if ($this->_request->getPost('Update')) {
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
            $cboID=$this->_getParam('cbomember');
            $bank=$this->_getParam('bank');
            $branch=$this->_getParam('branch');
            $banckAccount = $this->_getParam('banckAccount');
            $mobile=$this->_getParam('mobile');
            $recordid=$this->_getParam('recordid');
            $blood=$this->_getParam('blood');
            $dob= $this->_getParam('dob');
            $uid= $this->_getParam('uid');
            $employment=$this->_getParam('employ_status');


            $countname = count($mem_name);
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
                if ($cboID[$l] == $i+1) {
                    $cbo = 1;
                    $l++;
                } else {
                    $cbo = 0;
                }
// Check whether the record is available or not 
        if($recordid[$i]!=""){
                $familymembers = array('family_id' => $family_id,
                                    'breadwinner_id' => $bread,
                                    'head_id' => $head,
                                    'village_id'=>$villageid,
                                    'name' => $mem_name[$i],
                                    'name_inregional' => $mem_relname[$i],
                                    'alias' => $alias_name[$i],
                                    'alias_inregional' => $alias_relname[$i],
                                    'gender_id' => $gender[$i],
                                    'age' => $age[$i],
                                    'uid'=>$uid[$i],
                                    'dob'=>$this->view->dateconvertor->mysqlformat($dob[$i]),
                                    'relationship_id' => $relation[$i],
                                    'maritalstatus_id' => $marital[$i],
                                    'eductaion_id' => $education[$i],
                                    'employment_status'=>$employment[$i],
                                    'profession_id' => $proffession[$i],
                                    'entitlements' => $entitlement[$i],
                                    'cbo_member' => $cbo,
                                    'bank' => $bank[$i],
                                    'branch_po' => $branch[$i],
                                    'bank_ac' => $banckAccount[$i],
                                    'blood_id'=> $blood[$i],
                                    'mobile_number' => $mobile[$i],
                                    'created_by'=>$this->view->createdby, 
                                    'created_date'=>date("y/m/d H:i:s")
                                   );
               $familyobj->update($recordid[$i],$familymembers);
            }
// check the i value with Exist members value to add new members 
            else
            {
                $familymembers = array('family_id' => $family_id,
                                    'breadwinner_id' => $bread,
                                    'head_id' => $head,
                                    'village_id'=>$villageid,
                                    'name' => $mem_name[$i],
                                    'name_inregional' => $mem_relname[$i],
                                    'alias' => $alias_name[$i],
                                    'alias_inregional' => $alias_relname[$i],                                    'alias' => $alias_name[$i],
                                    'gender_id' => $gender[$i],
                                    'uid'=>$uid[$i],
                                    'dob'=>$this->view->dateconvertor->mysqlformat($dob[$i]),
                                    'age' => $age[$i],
                                    'relationship_id' => $relation[$i],
                                    'maritalstatus_id' => $marital[$i],
                                    'eductaion_id' => $education[$i],
                                    'employment_status'=>$employment[$i],
                                    'profession_id' => $proffession[$i],
                                    'entitlements' => $entitlement[$i],
                                    'cbo_member' => $cbo,
                                    'bank' => $bank[$i],
                                    'branch_po' => $branch[$i],
                                    'bank_ac' => $banckAccount[$i],
                                    'blood_id'=>$blood[$i],
                                    'mobile_number' => $mobile[$i],
                                    'created_by'=>$this->view->createdby, 
                                    'created_date'=>date("y/m/d H:i:s")
                                   );
               $lastid=$this->view->adm->addRecord("ourbank_familymember",$familymembers);

 // create a member code
                $o=str_pad($villageid,3,"0",STR_PAD_LEFT);
                $p = "01";
                $u=str_pad($lastid,6,"0",STR_PAD_LEFT);
                $membercode=$o.$p.$u;
                $this->view->adm->updateRecord("ourbank_familymember",$lastid,array('familycode'=>$membercode));
                }
           }

            $deletearray=array_diff($recordarray,$recordid);
            foreach($deletearray as $deltearr){
            $familyobj->deleteFamily($deltearr);
            }
          $this->_redirect('/familycommonview/index/commonview/id/'.$id);
        }
    }

}
