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
/**
* Class does add and edit crop deatils of a particular family
*/
class crop_IndexController extends Zend_Controller_Action{

    public function init() 
	{
        $this->view->pageTitle=$this->view->translate('Membership');
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
        $this->view->id=$subId=$this->_getParam('id');
        $this->view->subId=$subId=$this->_getParam('subId');
        $this->view->modId=$modId=$this->_getParam('modId');
        $addressmodel=new Familycommonview_Model_familycommonview();
        $module_name=$addressmodel->getmodule($subId);
        foreach($module_name as $module_view)
        {
            $address=$module_view['module_description'];
        }
        $this->view->pageTitle='Individual crop details';
        $this->view->adm = new App_Model_Adm();
    }

    public function indexAction() 
    {
    }

    public function addcropAction() 
    {
        $this->view->title=$this->view->translate('Add Crop');
        //Base line data
        $familycommon = new Familycommonview_Model_familycommonview(); 
        $this->view->memberid = $this->_getParam('id');

        $this->view->membername = $familycommon->getfamily($this->_getParam('id'));
        //agriculture view
        $this->view->agriculture=$edit_agriculture =$familycommon->getagriculturedetails($this->_getParam('id'));

$this->view->acretotal =$familycommon->getacretotal($this->_getParam('id'));
        $this->view->guntatotal =$familycommon->getguntatotal($this->_getParam('id'));
        $revvillageid = $this->view->membername[0]['rev_village_id'];
        if ($revvillageid) {
            $revvillagename = $this->view->adm->editRecord("ourbank_master_villagelist",$revvillageid);
        }
        //getting module id and submodule id
        $module=$familycommon->getmodule('Family');
        foreach($module as $module_id){ }
            $this->view->mod_id=$module_id['parent'];
            $this->view->sub_id=$module_id['module_id'];
            $this->view->insurance=$familycommon->getinsurance($this->_getParam('id'));
        //load crop details form with two arguments ...
        $form = new Crop_Form_Crop($this->_getParam('id'),$this->_getParam('subId'));
        $this->view->memberid=$member_id=$this->_getParam('id');

        $this->view->form=$form;
        $this->view->submitform = new Crop_Form_Submit();
        //dynamically change the path name
        $addressmodel=new Address_Model_addressInformation();
        $module_name=$addressmodel->getmodule($this->view->subId);
        foreach($module_name as $module_view) {
            $path1=$module_view['module_description'].'commonview';
        }
        $path1= $this->view->path1=strtolower($path1);

        $funder = $this->view->adm->viewRecord("ourbank_master_crop","id","DESC");
	foreach($funder as $funder) {
	   $form->crop_id->addMultiOption($funder['id'],$funder['name']);
	}
        $dateconvert= new App_Model_dateConvertor();
	$crop = new Crop_Model_Crop ();
	$this->view->cropdetails = $crop->getCrop();
	$this->view->seasondetails = $crop->getSeason();


	$this->view->units = $crop->getUnits();

        if ($this->_request->getPost('submit')) {
            $formdata=$this->_request->getPost();
             echo '<pre>'; print_r($formdata);
         //   if($formdata['enteredacre']>=$formdata['availableacre']){ 
         //   $this->view->errormsg="<p style='color:red;'>The Entered acres should be less than or equal to ".$formdata['availableacre']; 
     //       } else {   
            $tenant=$this->_getParam('tenant');
            $season=$this->_getParam('season');

            $acer=$this->_getParam('acre');   
            $gunta=$this->_getParam('gunta');
            $unit=$this->_getParam('unit');
            $realised=$this->_getParam('realised');
            $quantity=$this->_getParam('quantity');
            $marketed=$this->_getParam('marketed');
            $price=$this->_getParam('price');
            $soldDate = $this->_getParam('date');
            $i = 0;
            foreach($this->_getParam('crop_id') as $val) {
                        if($soldDate[$i]){ $date=$dateconvert->mysqlformat($soldDate[$i]); } else { $date=''; }
                $crop = array('family_id' => $member_id,
                              'crop_id' => $val,
 'land_id' => $tenant[$i],
                              'season_id' => $season[$i],
                              'acre' => $acer[$i],
                              'gunta' => $gunta[$i],
                              'unit'=>$unit[$i],
                              'quantity' => $quantity[$i],
                              'marketed'=>$marketed[$i],
                              'price'=>$price[$i],
                              'realised'=>$realised[$i],
                              'sold_date'=>$date);
                $i++;
                $this->view->adm->addRecord("ourbank_cropdetails",$crop);
            }
            $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
               // }
        }
    }
    
    //editing contact details
    public function editcropAction() 
    {
        $this->view->title=$this->view->translate('Edit Contact');
        $this->view->title=$this->view->translate('Add Crop');
        //Base line data
        $familycommon = new Familycommonview_Model_familycommonview(); 
        $this->view->memberid = $this->_getParam('id');
        $this->view->membername = $familycommon->getfamily($this->_getParam('id'));
        //agriculture view
        $this->view->agriculture=$edit_agriculture =$familycommon->getagriculturedetails($this->_getParam('id'));
 $this->view->acretotal =$familycommon->getacretotal($this->_getParam('id'));
        $this->view->guntatotal =$familycommon->getguntatotal($this->_getParam('id'));

        $revvillageid = $this->view->membername[0]['rev_village_id'];
        if ($revvillageid) {
            $revvillagename = $this->view->adm->editRecord("ourbank_master_villagelist",$revvillageid);
        }
        //getting module id and submodule id
        $module=$familycommon->getmodule('Family');
        foreach($module as $module_id){ }
            $this->view->mod_id=$module_id['parent'];
            $this->view->sub_id=$module_id['module_id'];
            $this->view->insurance=$familycommon->getinsurance($this->_getParam('id'));
        //load crop details form with two arguments ...
        $form = new Crop_Form_Crop($this->_getParam('id'),$this->_getParam('subId'));
        $this->view->form = $form;
        $this->view->id = $this->_getParam('id');
        $this->view->submitform = new Crop_Form_Submit();
        //dynamically change the path name
        $addressmodel=new Address_Model_addressInformation();
        $module_name=$addressmodel->getmodule($this->view->subId);
        foreach($module_name as $module_view)
        {$path1=$module_view['module_description'].'commonview';}
        $path1= $this->view->path1=strtolower($path1);
	$crop = new Crop_Model_Crop ();
	$this->view->cropdetails = $crop->getCrop();
	$this->view->seasondetails = $crop->getSeason();
	$this->view->units = $crop->getUnits();

        //update contact details
        if ($this->_request->getPost('submit')) {
                    $formdata=$this->_request->getPost();
//             echo '<pre>'; print_r($formdata);
         //   if($formdata['enteredacre']>=$formdata['availableacre']){ 
         //   $this->view->errormsg="<p style='color:red;'>The Entered acres should be less than or equal to ".$formdata['availableacre']; 
        //   } else { 
            $id=$this->_getParam('id');
            $crop = new Crop_Model_Crop ();
            $editCrop = $crop->getCropdetails($id);
            for ($j = 0 ; $j< count($editCrop); $j++) {
                $this->view->adm->addRecord("ourbank_cropdetails_log",$editCrop[$j]);
            }
            $crop->deletecrop($id);
            $tenant=$this->_getParam('tenant');
            $acer=$this->_getParam('acre');
            $gunta=$this->_getParam('gunta');
            $season=$this->_getParam('season');

            $unit=$this->_getParam('unit');
            $quantity=$this->_getParam('quantity');
            $marketed=$this->_getParam('marketed');
            $price=$this->_getParam('price');
            $realised=$this->_getParam('realised');
            $soldDate = $this->_getParam('date');
            $dateconvert= new App_Model_dateConvertor();
            $i = 0;
            foreach($this->_getParam('crop_id') as $val) {
                        if($soldDate[$i]){ $date=$dateconvert->mysqlformat($soldDate[$i]); } else { $date=''; }
                $crop = array('family_id' => $id,
                              'crop_id' => $val,
                            'land_id' => $tenant[$i],
                              'season_id' => $season[$i],

                              'acre' => $acer[$i],
                              'gunta' => $gunta[$i],
                              'unit'=>$unit[$i],
                              'quantity' => $quantity[$i],
                              'marketed'=>$marketed[$i],
                              'price'=>$price[$i],
                              'realised'=>$realised[$i],
                              'sold_date'=>$date);
                $i++;
                $this->view->adm->addRecord("ourbank_cropdetails",$crop);
            }
            $this->_redirect('/familycommonview/index/commonview/id/'.$id);
         //   }
        } else {
            //set the contact details in the contact form...
            $sub_id=$this->_getParam('subId');
            $id=$this->_getParam('id');
            $individualcommon=new Familycommonview_Model_familycommonview();
            $this->view->editCrop = $individualcommon->getcrop($this->_getParam('id'));
        }
    }
}
