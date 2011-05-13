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
class Infrastructure_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
//it is create session and implement ACL concept...

        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
	$sessionName = new Zend_Session_Namespace('ourbank');
           $this->view->createdby = $sessionName->primaryuserid;
//         if (($this->view->globalvalue[0]['id'] == 0)) {
//             $this->_redirect('index/logout');
//         }
        $this->view->adm = new App_Model_Adm();
    }

    public function indexAction() 
    {
    }


    public function addAction() 
    {
        $this->view->pageTitle=$this->view->translate('Basic Infrastructure');
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
        //add infrastructure
        $this->view->title = $this->view->translate("PRA details");
        $this->view->memberid=$member_id=$this->_getParam('id');

	//count number of family members
        $infra_model=new Infrastructure_Model_infrastructure();

        $this->view->housetype=$housetype= $infra_model->housetype();
	$this->view->ownership=$ownership= $infra_model->houseownership();
	$this->view->cookingfuel=$cookingfuel= $infra_model->cookingfuel();
		
       $this->view->number=$number=count($housetype);
	//load form with respective to number of family member
        $addForm = new Infrastructure_Form_infrastructure($number);
        $this->view->form=$addForm;


	//insert the infrastructure details 
        if ($this->_request->isPost() && $this->_request->getPost('submit')) 
        {
	$house1 = $this->_request->getParam('housetype');
	$owner1 = $this->_request->getParam('ownership');
	$fuel1 = $this->_request->getParam('cookingfuel'); 


       $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->memberid=$member_id=$this->_getParam('id');
            $formData = $this->_request->getPost();  

		if($formData) { 
                $this->view->adm->addRecord("ourbank_infrastructure",array('id' => '',
                                            'member_id'=>$member_id,
					'housetype_id'=>$house1,
                                          'ownership_id'=>$owner1,
                                            'fuel_id'=>$fuel1,
                                            'created_date'=>date("y/m/d H:i:s"),
                                           'created_by'=>$this->view->createdby
                                            ));
                    }
             $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
        }
    }


 public function editAction() 
    {
        $this->view->pageTitle=$this->view->translate('Basic Infrastructure');
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
        // edit infrastructure 
        $this->view->title = $this->view->translate("PRA details");
        $this->view->memberid=$member_id=$this->_getParam('id');


        $infra_model=new Infrastructure_Model_infrastructure();

	$this->view->memberid=$member_id=$this->_getParam('id');
	//view page listing infrastructure  details
        $this->view->housetype=$housetype= $infra_model->housetype();
	$this->view->ownership=$ownership= $infra_model->houseownership();
	$this->view->cookingfuel=$cookingfuel= $infra_model->cookingfuel();

	$this->view->edithousingtype = $infra_model->edithousingtype($member_id);
	$this->view->editownership = $infra_model->editownership($member_id);
	$this->view->editcookfuel = $infra_model->editcookfuel($member_id);

	//update the infrastructure details...
        if ($this->_request->isPost() && $this->_request->getPost('update')) 
        {
            $formData = $this->_request->getPost();
		$house1 = $this->_request->getParam('housetype');
		$owner1 = $this->_request->getParam('ownership');
		$fuel1 = $this->_request->getParam('cookingfuel'); 

       		$this->view->createdby = $this->view->globalvalue[0]['id'];
      		$this->view->memberid=$member_id=$this->_getParam('id');

		//insert main table details to log tables
		$habits = $this->view->adm->getRecord('ourbank_infrastructure','member_id',$member_id); 
		for ($j = 0 ; $j< count($habits); $j++) { echo '<pre>'; print_r($habits[$j]);
		      $this->view->adm->addRecord("ourbank_infrastructure_log",$habits[$j]);
		   }
	// removing the existing record
           $infra_model->deleteinfrastructure($member_id);

                if($formData) { 
                $this->view->adm->addRecord("ourbank_infrastructure",array('id' => '',
                                            'member_id'=>$member_id,
					'housetype_id'=>$house1,
                                          'ownership_id'=>$owner1,
                                            'fuel_id'=>$fuel1,
                                            'created_date'=>date("y/m/d H:i:s"),
                                           'created_by'=>$this->view->createdby
                                            ));
                    }
	//redirecting page to family view
             $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
        }
    }
}
