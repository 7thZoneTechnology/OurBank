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


//add, view, delete individual members 
class Familydefault_IndexController extends Zend_Controller_Action 
{

    //create a session and create common object modules
    public function init() 
    {
        $this->view->pageTitle=$this->view->translate('Family Information');
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
//         if (($this->view->globalvalue[0]['id'] == 0)) {
//         $this->_redirect('index/logout');
//         }

        $this->view->adm = new App_Model_Adm();
        $this->view->commonmodel=$individualcommon=new Familycommonview_Model_familycommonview();
//get the module id and submodule id
        $module=$individualcommon->getmodule('Family');
        foreach($module as $module_id){ }
        $this->view->mod_id=$module_id['parent'];
        $this->view->sub_id=$module_id['module_id'];
    }

    public function indexAction() 
    {}

//add individual member
    public function addfamilyAction()
    {

        //add Action
        $path = $this->view->baseUrl();
        $this->view->title = $this->view->translate("Family Information");;
//load form for individual
        $addForm = new Familydefault_Form_familydefault($path);
        $this->view->form=$addForm;

        $caste = $this->view->adm->viewRecord("ourbank_master_castetype","id","DESC");
        foreach($caste as $casteresult){
        $addForm->caste->addMultiOption($casteresult['id'],$casteresult['name']);
        }

        $familytype = $this->view->adm->viewRecord("ourbank_master_familytype","id","DESC");
        foreach($familytype as $familytype1){
        $addForm->familytype->addMultiOption($familytype1['id'],$familytype1['name']);
        }

        $rationcard = $this->view->adm->viewRecord("ourbank_master_rationcard","id","DESC"); 
        foreach($rationcard as $rationcard1){
        $addForm->ration->addMultiOption($rationcard1['id'],$rationcard1['name']);
        }

        $this->view->insurance = $this->view->adm->viewRecord("ourbank_master_insurance","id","ASC");
        $this->view->countvalue=count($this->view->insurance);
        foreach($this->view->insurance as $insurance1){
                $addForm->health->addMultiOption($insurance1['id'],$insurance1['name']);
        }

        $sourceincome = $this->view->adm->viewRecord("ourbank_master_sourceofincome","id","DESC");
        foreach($sourceincome as $sourceincome1){
        $addForm->income->addMultiOption($sourceincome1['id'],$sourceincome1['name']);
        }

		$familymodel = new Familydefault_Model_familydefault();
		$hierarchy = $familymodel->getofficehierarchy();
       	foreach($hierarchy as $hiearchyids){
       	$hiearchyid = $hiearchyids['hierarchyid'];
       	}
       	$institution = $familymodel->office($hiearchyid);

       	foreach($institution as $institution)
       	{
          //$searchForm->bank_id->addMultiOption($institution['village_id'],$institution['villagename']);
		$addForm->rev_village->addMultiOption($institution['village_id'],$institution['villagename']);
//         $addForm->village->addMultiOption($institution['village_id'],$institution['villagename']);
       	}
 

//         $village = $this->view->adm->viewRecord("ourbank_master_villagelist","id","DESC");
//         foreach($village as $village1){
//         $addForm->village->addMultiOption($village1['village_id'],$village1['name']);
//         $addForm->rev_village->addMultiOption($village1['village_id'],$village1['name']);
//         }

        if ($this->_request->isPost() && $this->_request->getPost('Submit')) 
        {
            $formData = $this->_request->getPost(); 
            $healtharray=$this->_request->getParam('health'); /*print_r($healtharray); //echo count($healtharray);*/
            if($addForm->isValid($formData))
            {
        // add individual member
        $lastid = $this->view->adm->addRecord("ourbank_family",array(
                                        'id' => '',
                                        'family_id'=>$this->_request->getParam('familyid'),
                                        'sujeevana'=>$this->_request->getParam('sujeevana'),
                                        'house_no'=>$this->_request->getParam('houseno'),
                                        'street' => $this->_request->getParam('street'),
                                        'village_id'=>$this->_request->getParam('village'),
                                        'rev_village_id'=>$this->_request->getParam('rev_village'),
                                        'mobile'=>$this->_request->getParam('mobile'),
                                        'phone'=>$this->_request->getParam('phone'),
                                        'familytype_id' => $this->_request->getParam('familytype'), 
                                        'minority_id' => $this->_request->getParam('minority'), 
                                        'caste_id'=>$this->_request->getParam('caste'),
//                                         'subcaste_id'=>$this->_request->getParam('subcaste'),
                                        'ration_id'=>$this->_request->getParam('ration'),                                        'nregs_jobno'=>$this->_request->getParam('jobno'),
                                        'income_id'=>$this->_request->getParam('income'),
                                        'created_date' =>date("y/m/d H:i:s"),
                                        'created_by'=>$this->view->createdby));


            foreach($healtharray as $health){
                $this->view->adm->addRecord("ourbank_insurance",array(
                                        'id' => '',
                                        'family_id'=>$lastid,
                                        'insurance_id'=>$health));
            }
//create a member code

                $o=str_pad($this->_request->getParam('village'),3,"0",STR_PAD_LEFT);
                $u=str_pad($lastid,6,"0",STR_PAD_LEFT);
                $code=$o.$u;
                $this->view->adm->updateRecord("ourbank_family",$lastid,array('code'=>$code));
// //create a saving account number 
//                 $product=new Familydefault_Model_familydefault();
//                 $saving=$product->productoffers("psi");
//                 $lastid1 = $this->view->adm->addRecord("ourbank_accounts",array('id' => '',
//                                 'member_id'=>$lastid,
//                                 'product_id' => $saving,
//                                 'accountcreated_date' => date("y/m/d H:i:s"), 
//                                 'membertype_id'=>'1',
//                                 'created_date' =>date("y/m/d H:i:s"),
//                                 'created_by'=>$this->view->createdby,'status_id'=>'3'));
//                 $u1=str_pad($lastid1,6,"0",STR_PAD_LEFT);
//                 $p1="0".$saving;
//                 $accountno=$o.$p.$p1."S".$u1;
//                 $this->view->adm->updateRecord("ourbank_accounts",$lastid1,array('account_number'=>$accountno));

               $this->_redirect('/familycommonview/index/commonview/id/'.$lastid);
            }
        }	

    }

//edit individual member 
    public function editfamilyAction()
    {
        //Acl
        //$access = new App_Model_Access();
        //$checkaccess = $access->accessRights('Individual',$this->view->globalvalue[0]['name'],'editmembernameAction');
        //if (($checkaccess != NULL)) {
        $path = $this->view->baseUrl();
        $family_id=$this->_getParam('id');
        $this->view->memberid=$family_id;
        $this->view->title = $this->view->translate("Family Information"); 

//load individual form
		$familymodel = new Familydefault_Model_familydefault();

        $addForm = new Familydefault_Form_familydefault($path);
        $convertdate = new App_Model_dateConvertor();
        $this->view->form=$addForm;

//load gender and office names in the drop down list box
        $familydefaultmodule= new Familydefault_Model_familydefault();
        $caste = $this->view->adm->viewRecord("ourbank_master_castetype","id","DESC");
        foreach($caste as $casteresult){
        $addForm->caste->addMultiOption($casteresult['id'],$casteresult['name']);
        }

        $familytype = $this->view->adm->viewRecord("ourbank_master_familytype","id","DESC");
        foreach($familytype as $familytype1){
        $addForm->familytype->addMultiOption($familytype1['id'],$familytype1['name']);
        }

        $rationcard = $this->view->adm->viewRecord("ourbank_master_rationcard","id","DESC");
        foreach($rationcard as $rationcard1){
        $addForm->ration->addMultiOption($rationcard1['id'],$rationcard1['name']);
        }

        $this->view->insurance = $insurance=$this->view->adm->viewRecord("ourbank_master_insurance","id","ASC");
        $this->view->countvalue=count($this->view->insurance);
        $i=0;

//        $addForm->health->addMultiOption(1,'none');
        foreach($insurance as $insurance1){ 
                $addForm->health->addMultiOption($insurance1['id'],$insurance1['name']);
        }

        $sourceincome = $this->view->adm->viewRecord("ourbank_master_sourceofincome","id","DESC");
        foreach($sourceincome as $sourceincome1){
        $addForm->income->addMultiOption($sourceincome1['id'],$sourceincome1['name']);
        }


		$hierarchy = $familymodel->getofficehierarchy();
       	foreach($hierarchy as $hiearchyids){
       	$hiearchyid = $hiearchyids['hierarchyid'];
       	}
       	$institution = $familymodel->office($hiearchyid);

       	foreach($institution as $institution)
       	{
          //$searchForm->bank_id->addMultiOption($institution['village_id'],$institution['villagename']);
//         $addForm->village->addMultiOption($institution['village_id'],$institution['villagename']);
        $addForm->rev_village->addMultiOption($institution['village_id'],$institution['villagename']);
       	}

//         $village = $this->view->adm->viewRecord("ourbank_master_villagelist","id","DESC");
//         foreach($village as $village1){
//         $addForm->village->addMultiOption($village1['village_id'],$village1['name']);
//         $addForm->rev_village->addMultiOption($village1['village_id'],$village1['name']);
//         }

//set the individual member value in the edit form
        $edit_member = $this->view->adm->editRecord("ourbank_family",$family_id);
        $insurancedetails=$this->view->commonmodel->getinsurance($family_id);
        foreach($insurancedetails as $details){ $inarray[]=$details['insurance_id'];
        }
          $this->view->form->health->setValue($inarray);
//         $casteid=$edit_member[0]['caste_id'];
//         $subcaste = $familydefaultmodule->getsubcaste($casteid);
//         foreach($subcaste as $subcaste1){
//         $addForm->subcaste->addMultiOption($subcaste1['subcaste_id'],$subcaste1['subcastename']);
//         }
		$villageid=$edit_member[0]['rev_village_id']; 
		$habitation = $familydefaultmodule->gethabitation($villageid);
        foreach($habitation as $village){
        $addForm->village->addMultiOption($village['id'],$village['villagename']);
        }
   
        foreach($edit_member as $editmembername)
        {   $this->view->form->familyid->setValue($editmembername['family_id']);
            $this->view->form->sujeevana->setValue($editmembername['sujeevana']);
            $this->view->form->minority->setValue($editmembername['minority_id']);
            $this->view->form->houseno->setValue($editmembername['house_no']);
            $this->view->form->street->setValue($editmembername['street']);
            $this->view->form->rev_village->setValue($editmembername['rev_village_id']);
            $this->view->form->village->setValue($editmembername['village_id']);
            $this->view->form->phone->setValue($editmembername['phone']);
            $this->view->form->mobile->setValue($editmembername['mobile']);  
            $this->view->form->familytype->setValue($editmembername['familytype_id']);
            $this->view->form->caste->setValue($editmembername['caste_id']);
            $this->view->form->ration->setValue($editmembername['ration_id']);
            $this->view->form->jobno->setValue($editmembername['nregs_jobno']);
            $this->view->form->income->setValue($editmembername['income_id']);
        }
        $path = $this->view->baseUrl();
        echo "<script type=text/javascript>getAreaDetails('".$path."',".$editmembername['village_id'].");</script>";
        //update individual member details
        if ($this->_request->isPost() && $this->_request->getPost('Update')) 
        {
            $formData = $this->_request->getPost();
            if($addForm->isValid($formData))
            {
            $healtharray=$this->_request->getParam('health');
            $olddate = $this->view->adm->editRecord("ourbank_family",$family_id);
            $this->view->adm->updateLog("ourbank_family_log",$olddate[0],$this->view->createdby);

            foreach($olddate as $olddate)
            $olddate['membercode'];
            $this->view->adm->updateRecord("ourbank_family",$family_id,array(
                                        'family_id'=>$this->_request->getParam('familyid'),
                                        'sujeevana'=>$this->_request->getParam('sujeevana'),
                                        'house_no'=>$this->_request->getParam('houseno'),
                                        'street' => $this->_request->getParam('street'),
                                        'village_id'=>$this->_request->getParam('village'),
                                        'rev_village_id'=>$this->_request->getParam('rev_village'),
                                        'mobile'=>$this->_request->getParam('mobile'),
                                        'phone'=>$this->_request->getParam('phone'),
                                        'familytype_id' => $this->_request->getParam('familytype'), 
                                        'minority_id' => $this->_request->getParam('minority_id'), 
                                        'caste_id'=>$this->_request->getParam('caste'),
                                        'ration_id'=>$this->_request->getParam('ration'),
                                        'nregs_jobno'=>$this->_request->getParam('jobno'),
                                        'income_id'=>$this->_request->getParam('income'),
                                        'created_date' =>date("y/m/d H:i:s"),
                                        'created_by'=>$this->view->createdby));

            $familydefaultmodule->deleteinsurance($family_id);
            foreach($healtharray as $health){
                $this->view->adm->addRecord("ourbank_insurance",array(
                                        'id' => '',
                                        'family_id'=>$family_id,
                                        'insurance_id'=>$health));
            }

           $this->_redirect('/familycommonview/index/commonview/id/'.$family_id);
            }
        }
        // // 	} else {
        // //             $this->_redirect('index/index');}
    }

    public function viewmemberAction()
    {
    }

//delete individual member 
    public function deletememberAction()
    {
        //Acl
        //$access = new App_Model_Access();
        //$checkaccess = $access->accessRights('Individual',$this->view->globalvalue[0]['name'],'editmembernameAction');
        //if (($checkaccess != NULL)) {
        //delete action
    
        $id=$this->_request->getParam('id'); 
        $this->view->memberid=$id;

//load delete form 
        $delform=new Familydefault_Form_Delete();
        $this->view->delete=$delform;
        if ($this->_request->isPost() && $this->_request->getPost('Submit'))
        {
            $formdata = $this->_request->getPost();
            //print_r($formdata);
            if($delform->isValid($formdata)) 
            { 
            $delete=new Familydefault_Model_familydefault();
            $account=$delete->findaccount($id);
//delete member details, contact and address details...
            if(!$account){
            $this->view->adm->deletemember("ourbank_family",$id);
            }
             else
                { echo "<font color=red>This member having active accounts</font>";
                }
            }$this->_redirect('/family');
            
        }	
        // 	} else {
        //             $this->_redirect('index/index');
        // 	}
    }
    public function getcitiesAction()
    {
        $this->_helper->layout->disableLayout();
        $path = $this->view->baseUrl();
        $addForm = new Familydefault_Form_familydefault($path);
        $villageID = $this->_getParam('villageID');
        $villageObj = new Familydefault_Model_familydefault();
        $otherIds = $villageObj->getIds($villageID);
        if($otherIds) {
            $taluk=$villageObj->editRecord("ourbank_master_taluklist",$otherIds[0]['taluk_id']);
            $district=$villageObj->editRecord("ourbank_master_districtlist",$otherIds[0]['district_id']);
            $cities = $this->view->cities = $taluk[0]['name']."@".$district[0]['name']."";
            echo $cities;
        }
    }


// 	public function getsubcasteAction() {
//          	$this->_helper->layout->disableLayout();
//                 $path = $this->view->baseUrl();
// 	        $casteid = $this->_request->getParam('casteid');
//  	        $searchForm = new Familydefault_Form_familydefault($path);
//                 $this->view->form = $searchForm;
//  	        $familymodel= new Familydefault_Model_familydefault();
//  	        $this->view->subcaste=$familymodel->getsubcaste($casteid);
// 	        foreach($this->view->subcaste as $subcaste) 
//                 {
// 	        $searchForm->subcaste->addMultiOption($subcaste['subcaste_id'],$subcaste['subcastename']);
// 	        }
// 	}

	public function gethabitationAction() {
         	$this->_helper->layout->disableLayout();
            $path = $this->view->baseUrl();

	        $rev_villageid = $this->_request->getParam('rev_village');

 	        $searchForm = new Familydefault_Form_familydefault($path);
            $this->view->form = $searchForm;

 	        $habitation= new Familydefault_Model_familydefault();
// 
 	        $this->view->village=$habitation->gethabitation($rev_villageid);
 	        foreach($this->view->village as $village) 
            {
	        $searchForm->village->addMultiOption($village['id'],$village['villagename']);
	        }
	}
}

