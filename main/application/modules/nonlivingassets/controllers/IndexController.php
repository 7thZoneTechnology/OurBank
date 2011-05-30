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
class Nonlivingassets_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
//it is create session and implement ACL concept...
        $this->view->pageTitle=$this->view->translate('Other assets owned');
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
//         if (($this->view->globalvalue[0]['id'] == 0)) {
//             $this->_redirect('index/logout');
//         }
        $this->view->adm = new App_Model_Adm();
    }

    public function indexAction() 
    {
    }

//add family health add action
    public function addassetAction() 
    {
        $this->view->title = $this->view->translate("Add other assets owned");
                //Base line data
        $familycommon = new Familycommonview_Model_familycommonview(); 
        $this->view->memberid = $this->_getParam('id');
        $this->view->membername = $familycommon->getfamily($this->_getParam('id'));
        $revvillageid = $this->view->membername[0]['rev_village_id'];
        if ($revvillageid) {
            $revvillagename = $this->view->adm->editRecord("ourbank_master_villagelist",$revvillageid);
            $this->view->revvillagename=$revvillagename[0]['name']; 
        }
        //getting module id and submodule id
        $module=$familycommon->getmodule('Family');
        foreach($module as $module_id){ }
            $this->view->mod_id=$module_id['parent'];
            $this->view->sub_id=$module_id['module_id'];
            $this->view->insurance=$familycommon->getinsurance($this->_getParam('id'));
        //add non-living assets
        $this->view->memberid=$member_id=$this->_getParam('id');

        $this->view->submoduleid = $this->_getParam('subId');
//get all type of living assets
        $asset_model=new Nonlivingassets_Model_nonlivingassets();
//set the value of living assets drop down box...
        $this->view->nonliveasset_details = $this->view->adm->viewRecord("ourbank_master_nonliveassets","id","DESC");

        if ($this->_request->isPost() && $this->_request->getPost('submit')) 
            {
            $number = $this->_getParam('number');
            $value = $this->_getParam('value');
            $submoduleid = $this->_getParam('subid');
            $date = $this->_getParam('date');

            $i = 0;
			$dateconvert= new App_Model_dateConvertor();

            foreach($this->_getParam('assettype') as $val) {
                      if($date[$i]){
                        $dates = $dateconvert->mysqlformat($date[$i]);
                    } else {
                        $dates = '0000/00/00';
                    }
                    if($value[$i]){
                        $value = $value[$i];
                    } else {
                        $value = 0;
                    }
                $assettype = array('submodule_id' => $submoduleid,
                                    'family_id' => $member_id,
                                    'nonliveasset_id' => $val,
                                    'number'=>$number[$i],
                                    'date_of_value'=>$dates,
                                    'value'=>$value);
                $i++;
                $this->view->adm->addRecord("ourbank_nonlivingassetsdetails",$assettype);
            }
             $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
        }
    }

    public function editassetAction() 
    {
        $this->view->title=$this->view->translate('Edit other assets owned');
                //Base line data
        $familycommon = new Familycommonview_Model_familycommonview(); 
        $this->view->memberid = $this->_getParam('id');
        $this->view->membername = $familycommon->getfamily($this->_getParam('id'));
        $revvillageid = $this->view->membername[0]['rev_village_id'];
        if ($revvillageid) {
            $revvillagename = $this->view->adm->editRecord("ourbank_master_villagelist",$revvillageid);
            $this->view->revvillagename=$revvillagename[0]['name']; 
        }
        //getting module id and submodule id
        $module=$familycommon->getmodule('Family');
        foreach($module as $module_id){ }
            $this->view->mod_id=$module_id['parent'];
            $this->view->sub_id=$module_id['module_id'];
            $this->view->insurance=$familycommon->getinsurance($this->_getParam('id'));
        //edit non-living assets
        $this->view->memberid=$member_id=$this->_getParam('id');
        //load form for living assets
        $this->view->submoduleid = $this->_getParam('subId');
         //dynamically change the path name
       
         //get all type of living assets
        $this->view->nonliveasset_details = $this->view->adm->viewRecord("ourbank_master_nonliveassets","id","DESC");
         //update contact details
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
            $id=$this->_getParam('id');
            $submoduleid=$this->_getParam('subid');
            $asset_db = new Nonlivingassets_Model_nonlivingassets ();
            $editAsset = $asset_db->getAssetdetails($id);
            for ($j = 0 ; $j< count($editAsset); $j++) {
                $this->view->adm->addRecord("ourbank_nonlivingassetsdetails_log",$editAsset[$j]);
            }
            $asset_db->deleteasset($id);
            $number = $this->_getParam('number');
            $value = $this->_getParam('value');
                        $date = $this->_getParam('date');

            $i = 0;
			$dateconvert= new App_Model_dateConvertor();

            foreach($this->_getParam('assettype') as $val) {
                    if($date[$i]){
                        $dates = $dateconvert->mysqlformat($date[$i]);
                    } else {
                        $dates = '0000/00/00';
                    }
                    if($value[$i]){
                        $values = $value[$i];
                    } else {
                        $values = 0;
                    }
                $assettype = array('submodule_id' => $submoduleid,
                                    'family_id' => $id,
                                    'nonliveasset_id' => $val,
                                    'number'=>$number[$i],
                                    'date_of_value'=>$dates,
                                    'value'=>$values);
                $i++;
                $this->view->adm->addRecord("ourbank_nonlivingassetsdetails",$assettype);
            }
            $this->_redirect('/familycommonview/index/commonview/id/'.$id);
        } 
        else {
            //set the contact details in the contact form...
            $sub_id=$this->_getParam('subId');
            $id=$this->_getParam('id');
            $individualcommon=new Familycommonview_Model_familycommonview();
            $this->view->editAsset = $individualcommon->getnonlivingassetsdetails($id); 
            //$form->populate($editContact[0]);
        }

    }
}
