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
/*
 *  create an office default for add, edit, delete and suboffice actions
 */
class Officedefault_IndexController extends Zend_Controller_Action{

    public function init() {
	//language translator
        $this->view->pageTitle=$this->view->translate('New Office');
	//session
        $sessionName = new Zend_Session_Namespace('ourbank');
        $this->view->createdby = $sessionName->primaryuserid;
        $this->view->adm = new App_Model_Adm();
        $individualcommon=new Familycommonview_Model_familycommonview();
        $module=$individualcommon->getmodule('Office');
	//module id for delete path
        foreach($module as $module_id){ }
        $this->view->mod_id=$module_id['parent'];
        $this->view->sub_id=$module_id['module_id'];

    }

    public function indexAction() {
    }
	//add action
    public function officeaddAction() {
	//language translator
        $this->view->title = $this->view->translate("New Office");
	//session
        $storage = new Zend_Auth_Storage_Session();
	$data = $storage->read();
	//redirect if not a session
	if(!$data){
            $this->_redirect('index/login');
	}
        $path = $this->view->baseUrl();
        $officeForm = new Officedefault_Form_officedefault($path,$this->view->createdby);
        $this->view->form = $officeForm; 
        $office = new Officedefault_Model_officedefault();
        $this->view->officeDetails = $office->getOffice();
        $this->view->officehierarchyselect = $office->officehierarchyselect();
	//load hierarchy office dropdown
        if($this->view->officehierarchyselect) {
        $officehierarchyoutid = $office->getOfficehierarchyDetailsout();
        foreach($officehierarchyoutid as $officehierarchyoutids) {
                $officeForm->officetype_id->addMultiOption($officehierarchyoutids->Hierarchy_level,$officehierarchyoutids->type);
                    }
        } else {

        $officehierarchy = new Officedefault_Model_officedefault();
        $officehierarchy = $officehierarchy->getOfficehierarchyDetails(); 
         foreach($officehierarchy as $officehierarchy) {
                $officeForm->officetype_id->addMultiOption($officehierarchy->id,$officehierarchy->type);
                    }
        }
	//validate poster values
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
             $formData = $this->_request->getPost(); 
            if($officeForm->isValid($formData)){
		//variable for form data 
                $officeid=$this->_request->getParam('officetype_id');
                $parentofficeid=$this->_request->getParam('parentoffice_id');
                $name=$this->_request->getParam('name');
                $shortname=$this->_request->getParam('short_name');
                $createdate=$this->_request->getParam('createddate');
		if($parentofficeid) {
 		$lastid=$this->view->adm->addRecord("ourbank_office",array('id' => '',
                                                'name'=>$name,
                                                'short_name' => $shortname,
                                                'officetype_id'=>$officeid,
                                                'parentoffice_id' => $parentofficeid,
                                                'createddate' =>$createdate,'createdby'=>$this->view->createdby));

               $maxid=$office->findlastlevel();
               foreach($maxid as $maxid1) {
               $villagelastid=$maxid1->lastid;}
               if($villagelastid==$officeid)
               { $this->view->adm->addRecord("ourbank_master_villagelist",array('id' => '','village_id'=>$lastid,'name'=>$name,'created_date' =>$createdate,'created_by'=>$this->view->createdby));
                  $this->view->adm->addRecord("ourbank_master_village",array('id' => '',
                                                'village_id'=>$lastid,
                                                'taluk_id' => $this->_request->getParam('taluque'),
                                                'panchayath_id' => $this->_request->getParam('panchayath'),
                                                'hobli_id' => $this->_request->getParam('hobli'),
                                                'district_id'=>$this->_request->getParam('district'),
                                                'created_date' =>$createdate,'created_by'=>$this->view->createdby));
               } 

	//insert glsubcode
        for($j=1;$j<=2;$j++){
             $fetchglcodedetails=$this->view->adm->editRecord('ourbank_glcode',$j);
           $ledgertype_id = $fetchglcodedetails[0]['ledgertype_id'];
           $glcode = $fetchglcodedetails[0]['glcode'];
           $header = $fetchglcodedetails[0]['header'];

           $ledger = new Officedefault_Model_officedefault();
           $genarateGlsub = $ledger->genarateGlsubCode1($ledgertype_id,$j);
           $glsubcode=$genarateGlsub->id;

           if($glsubcode) {
               $ini=substr($glsubcode,0,1);
               $last=substr($glsubcode,1,5);
               $last+=1;
               $last = str_pad($last,5,0,STR_PAD_LEFT);
               $glsubcode=$ini.$last;
               $glsubcode;
           } else {
               $glcode1=$ledger->fetchGlcode($j);
               $glcode=$glcode1->glcode;
               $ini=substr($glcode,0,1);
               $last=substr($glcode,1,5);
               $last+=1;
               $last = str_pad($last,5,0,STR_PAD_LEFT);
               $glsubcode=$ini.$last;
               $glsubcode;
           }
	//create cash and bank glsubcode
           if($j==1){ $headername="Bank";} else {$headername="Cash";}
           $gInsert = $ledger->insertGlsubcode(array('id' => '',
                           'glsubcode' => $glsubcode,
                           'glcode_id' => $j,
                           'subledger_id' => $ledgertype_id,
                           'header' => $headername.$lastid,
                           'description' => $headername.$lastid,
                           'created_date' =>$createdate,
                           'created_by'=>$this->view->createdby));
           }
         $this->_redirect('/officecommonview/index/commonview/id/'.$lastid);
		}
		}
        }
        }
    

    public function subofficeAction() {
	//disable layout
        $this->_helper->layout()->disableLayout();
	//view instance for office type
        $officetype_id=$this->view->officetypeid = $this->_request->getParam('officetype_id');
        $subOffice = new Officedefault_Model_officedefault();
        $path = $this->view->baseUrl();
        $officeForm = new Officedefault_Form_officedefault($path,$this->view->createdby);
        $this->view->form=$officeForm;
        $hierarchylevel2=$subOffice->hierarchylevel($officetype_id);
        $maxid=$subOffice->findlastlevel();
        foreach($maxid as $maxid1) {
         $lastid=$maxid1->lastid;}
        if($lastid==$officetype_id)
        {
        $this->view->subform=$lastid;
        $district = $this->view->adm->viewRecord("ourbank_master_districtlist","id","DESC");
        foreach($district as $district1){
        $officeForm->district->addMultiOption($district1['id'],$district1['name']);
        }

        $taluque = $this->view->adm->viewRecord("ourbank_master_taluklist","id","DESC");
        foreach($taluque as $taluque1){
        $officeForm->taluque->addMultiOption($taluque1['id'],$taluque1['name']);
        }
        }
	//list hierarchy level
        foreach($hierarchylevel2 as $hierarchylevel1) {
            $hierarchylevel=$hierarchylevel1->hierarchylevel; //level
        }
        
        $officetypeIds=$subOffice->officetypeid($hierarchylevel);
        foreach($officetypeIds as $officetypeIds1) {
            $officetypeId=$officetypeIds1->id;
        }
        if($officetypeId==1) { 
            $this->view->selectedSuboffice = $subOffice->subofficeFromUrl($officetypeId);
            $this->view->officetypename = $subOffice->officetypename($officetypeId);
        } 
        else {
            $this->view->selectedSuboffice = $subOffice->subofficeFromUrl($officetypeId);
            $this->view->officetypename = $subOffice->officetypename($officetypeId);
        }
	//fetch selected sub office and id
        if($this->view->selectedSuboffice) {
        foreach($this->view->selectedSuboffice as $eacharraysent) {
        $officeForm->parentoffice_id->addMultiOption($eacharraysent->id,$eacharraysent->name);
        }
        }
        else
        { 
        foreach($this->view->officetypename as $officetype) { 
        $officeForm->parentoffice_id->addMultiOption($officetype->id,$officetype->type);
        }
        }
    }
        
        public function gettalukAction()
        {
        $this->_helper->layout()->disableLayout();
        $path = $this->view->baseUrl();
        $officeForm = new Officedefault_Form_officedefault($path,$this->view->createdby);
        $this->view->form=$officeForm;
        $districteid=$this->view->districtid = $this->_request->getParam('districtid');
        $subOffice = new Officedefault_Model_officedefault();
        $taluklist=$subOffice->gettaluklist($districteid);
        foreach($taluklist as $taluklist1) {
        $officeForm->taluque->addMultiOption($taluklist1['id'],$taluklist1['name']);
        }
        }

        public function gethobliAction()
        {
        $this->_helper->layout()->disableLayout();
        $path = $this->view->baseUrl();
        $officeForm = new Officedefault_Form_officedefault($path,$this->view->createdby);
        $this->view->form=$officeForm;
        $hobliid=$this->view->hobliid = $this->_request->getParam('taluk_id');
        $subOffice = new Officedefault_Model_officedefault();
        $hoblilist=$subOffice->gethoblilist($hobliid);
        foreach($hoblilist as $hoblilist1) {
        $officeForm->hobli->addMultiOption($hoblilist1['id'],$hoblilist1['name']);
        }
        }

        public function getpanchayathAction()
        {
        $this->_helper->layout()->disableLayout();
        $path = $this->view->baseUrl();
        $officeForm = new Officedefault_Form_officedefault($path,$this->view->createdby);
        $this->view->form=$officeForm;
        $panchayath=$this->view->hobliid = $this->_request->getParam('hobli_id');
        $subOffice = new Officedefault_Model_officedefault();
        $panchayath=$subOffice->getpanchayathlist($panchayath);
        foreach($panchayath as $panchayath1) {
        $officeForm->panchayath->addMultiOption($panchayath1['id'],$panchayath1['name']);
        }
        }

        public function addressAction() {
	//disable layout
        $this->_helper->layout()->disableLayout();
	//view instance for office type
        $officetype_id=$this->view->officetypeid = $this->_request->getParam('officetype_id');
        $subOffice = new Officedefault_Model_officedefault();
        $path = $this->view->baseUrl();
        $officeForm = new Officedefault_Form_officedefault($path,$this->view->createdby);
        $this->view->form=$officeForm;
        $maxid=$subOffice->findlastlevel();
        foreach($maxid as $maxid1) {
         $lastid=$maxid1->lastid;}
        if($lastid==$officetype_id)
        {
            $this->view->subform=$lastid;
        $district = $this->view->adm->viewRecord("ourbank_master_districtlist","id","DESC");
        foreach($district as $district1){
        $officeForm->district->addMultiOption($district1['id'],$district1['name']);
        }

//         $taluque = $this->view->adm->viewRecord("ourbank_master_taluklist","id","DESC");
//         foreach($taluque as $taluque1){
//         $officeForm->taluque->addMultiOption($taluque1['id'],$taluque1['name']);
//         }
// 
//         $hobli = $this->view->adm->viewRecord("ourbank_master_hoblilist","id","DESC");
//         foreach($hobli as $hobli1){
//         $officeForm->hobli->addMultiOption($hobli1['id'],$hobli1['name']);
//         }
// 
//         $panchayath = $this->view->adm->viewRecord("ourbank_master_gillapanchayath","id","DESC");
//         foreach($panchayath as $panchayath1){
//         $officeForm->panchayath->addMultiOption($panchayath1['id'],$panchayath1['name']);
//         }
        }

        }

	//edit office
    public function officeeditAction(){
        $this->view->title = $this->view->translate("New Office");
        $storage = new Zend_Auth_Storage_Session();
	//redirect if not a session
	$data = $storage->read();
	if(!$data){
            $this->_redirect('index/login');
	}
        $path = $this->view->baseUrl();
	//sent url to model
        $officeForm = new Officedefault_Form_officedefault($path,$this->view->createdby);
        $this->view->form = $officeForm; 
          $office = new Officedefault_Model_officedefault();
       // $this->view->officeDetails = $office->getOffice();
      //  $this->view->officehierarchyselect = $office->officehierarchyselect();
        $this->view->id=$office_id=$this->_getParam('id');
//         $officehierarchy = $office->getOfficehierarchyDetails(); 
// 	//load office hierarchy drop down
//         foreach($officehierarchy as $officehierarchy) {
//           $officeForm->officetype_id->addMultiOption($officehierarchy->id,$officehierarchy->type);
//         }
        $edit_office = $this->view->adm->editRecord("ourbank_office",$office_id); 
        $officetype_id=$edit_office[0]['parentoffice_id']; 
        $typeid=$edit_office[0]['officetype_id'];
        $office_typeid=$edit_office[0]['officetype_id'];
        $officetypename=$office->getofficetypename($office_typeid);
        $this->view->form->officetypename->setValue($officetypename[0]['type']);
        $parentid = $office->subofficeFromUrledit($officetype_id);
        $maxid=$office->findlastlevel();
        foreach($maxid as $maxid1) {
        $villagelastid=$maxid1->lastid;
        }

        if($villagelastid==$edit_office[0]['officetype_id']){
        $this->view->villagelastid=$maxid;
        $villagename=$edit_office[0]['id'];
        $address=$office->getvillageaddress($villagename);

        $district = $this->view->adm->viewRecord("ourbank_master_districtlist","id","DESC");
        foreach($district as $district1){
        $officeForm->district->addMultiOption($district1['id'],$district1['name']);
        }

        $taluque = $office->gettaluklist($address[0]['district_id']);
        foreach($taluque as $taluque1){
        $officeForm->taluque->addMultiOption($taluque1['id'],$taluque1['name']);
        }

        $hoblilist = $office->gethoblilist($address[0]['taluk_id']);
        foreach($hoblilist as $hoblilist1){
        $officeForm->hobli->addMultiOption($hoblilist1['id'],$hoblilist1['name']);
        }

        $panchayath = $office->getpanchayathlist($address[0]['taluk_id']);
        foreach($panchayath as $panchayath1){
        $officeForm->panchayath->addMultiOption($panchayath1['id'],$panchayath1['name']);
        }
        $village_id=$address[0]['villageid'];
        $villageaddressid=$address[0]['id'];
        $this->view->form->district->setValue($address[0]['district_id']);
        $this->view->form->taluque->setValue($address[0]['taluk_id']);
        $this->view->form->hobli->setValue($address[0]['hobli_id']);
        $this->view->form->panchayath->setValue($address[0]['panchayath_id']);
        }
	//load parent office dropdown
       foreach($parentid as $parentid1) {
                $officeForm->parentoffice_id->addMultiOption($parentid1->id,$parentid1->name);
        }
        $officeForm->populate($edit_office[0]);
        $officeForm->name->removeValidator('Db_NoRecordExists');
        $officeForm->officetype_id->setRequired(false);
	//check and load poster data
                if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
            $formData = $this->_request->getPost(); 
            if($officeForm->isValid($formData)){ 
		//assign poster values to variable and send to model
                $parentofficeid=$this->_request->getParam('parentoffice_id');
                $name=$this->_request->getParam('name');
                $shortname=$this->_request->getParam('short_name');
                $createdate=$this->_request->getParam('createddate');
		if($parentofficeid) {
 		$lastid=$this->view->adm->updateRecord("ourbank_office",$office_id,array('id' => $office_id,
                                                'name'=>$name,
                                                'short_name' => $shortname,
                                                'parentoffice_id' => $parentofficeid,
                                                'createddate' =>$createdate,'createdby'=>$this->view->createdby));

echo $typeid;
               $maxid=$office->findlastlevel();
               foreach($maxid as $maxid1) {
               echo $villagelastid=$maxid1->lastid;}
               if($villagelastid==$typeid)
               {  /*$villageid=$this->view->adm->updateRecord("ourbank_master_villagelist",$village_id,array('name'=>$name,'village_id'=>$office_id,'created_date' =>$createdate,'created_by'=>$this->view->createdby));*/

                  $office->updatevillage($office_id,array(
                                                'taluk_id' => $this->_request->getParam('taluque'),
                                                'district_id'=>$this->_request->getParam('district'),
                                                'panchayath_id' => $this->_request->getParam('panchayath'),
                                                'hobli_id' => $this->_request->getParam('hobli'),
                                                'created_date' =>$createdate,'created_by'=>$this->view->createdby));
               } 
//	update and redirect if valid data
        $this->_redirect('/officecommonview/index/commonview/id/'.$office_id);
		}}
		}
}

    //delete action
    public function deleteofficeAction()
    {
        //Acl
        //$access = new App_Model_Access();
        //$checkaccess = $access->accessRights('Individual',$this->view->globalvalue[0]['name'],'editmembernameAction');
        //if (($checkaccess != NULL)) {
        //delete action
    
	//get poster id
        $id=$this->_request->getParam('id');	  
        $this->view->memberid=$id;

        $delform=new Officedefault_Form_Delete();
        $this->view->delete=$delform;
	
	//validate poster id details
        if ($this->_request->isPost() && $this->_request->getPost('Submit'))
        {
            $formdata = $this->_request->getPost();

            if($delform->isValid($formdata)) 
            { 
               $office = new Officedefault_Model_officedefault();
               $members=$office->memberfind($id);
               $office_id=$office->findoffice($id);
               if(!$members && !$office_id)
               {
                $this->view->adm->deletemember("ourbank_office",$id);
                $this->view->adm->deleteSubmodule("contact",$id,$this->view->sub_id);
                $this->view->adm->deleteSubmodule("address",$id,$this->view->sub_id);
                $this->_redirect('/office');
               }
               else
                { 
		//user message
		echo "<font color=red>Can not delete due to data dependency</font>";
                }
        }	
        // 	} else {
        //             $this->_redirect('index/index');
        // 	}
    }

}

    public function treestructureAction()
    {
        $treeobj = new Officedefault_Model_officedefault();
        $branch = $treeobj->getBranch();
        $alloffice = $treeobj->fetchoffice();
        if(count($alloffice)) {
            $this->view->rootname = $alloffice[0]['name'];
        }
        $branchId = $treeobj->getBranchId();
        if($branchId) {
            $this->view->branchId = $branchId[0]['id'];
        }
   }

}
