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

class Individual_IndexController extends Zend_Controller_Action{

    public function init() 
    {
        $this->view->pageTitle=$this->view->translate('Individual');

        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }
        //getting module name and change the side bar dynamically 
        $this->view->adm = new App_Model_Adm();
        $this->view->db = new Individual_Model_Individual();
    }

    public function indexAction() 
    {
        $this->view->form =$searchform = new Individual_Form_Search();
            $villagelist = $this->view->adm->viewRecord('ourbank_master_villagelist','id','asc'); // get village list
// Zend_Debug::dump($villagelist);
            foreach($villagelist as $villages){
                $searchform->village->addMultiOption($villages['id'],$villages['name']);
            }

        if ($this->_request->isPost() && $this->_request->getPost('Search')){
			$result = $this->view->db->searchDetails($this->_request->getPost());	// get search criteria values
			$page = $this->_getParam('page',1);
			$paginator = Zend_Paginator::factory($result); // assign searched values for pagination
			$paginator->setItemCountPerPage($this->view->adm->paginator());
			$paginator->setCurrentPageNumber($page);
				$this->view->paginator = $paginator;
			$this->view->search = true;
		} else {
			$this->view->title = "Individual member"; 
			$storage = new Zend_Auth_Storage_Session();
			$data = $storage->read();
			if (!$data) {
				$this->_redirect('index/login');
            }
            
            $page = $this->_getParam('page',1);
            $paginator = Zend_Paginator::factory($this->view->db->getMemberdetails()); // assign default values for pagination
	    	$this->view->paginator = $paginator;
		}
	    $paginator->setItemCountPerPage($this->view->adm->paginator());
	    $paginator->setCurrentPageNumber($page);


    }

    public function addactivitiesAction() 
    {
        $this->view->title=$this->view->translate('Add activity');
        //load contact details form with two arguments ...
//         $form = new Activities_Form_Activities($this->_getParam('id'),$this->_getParam('subId'));
//         $this->view->memberid=$member_id=$this->_getParam('id');
//         $subid = $this->_getParam('subId');
//         $this->view->form=$form;
//         $this->view->submitform = new Bank_Form_Submit();
//         //dynamically change the path name
//         $addressmodel=new Address_Model_addressInformation();
//         $module_name=$addressmodel->getmodule($this->view->subId);
//         foreach($module_name as $module_view) {
//             $path1=$module_view['module_description'].'commonview';
//         }
//          $path1= $this->view->path1=strtolower($path1);
// 
//         if ($this->_request->getPost('submit')) {
//             $acer=$this->_getParam('activity');
//             $count = count($acer);
//             for($i = 0; $i< $count; $i++) 
//             {
//                 $activities = array('submodule_id' => $subid,
//                                     'member_id' => $member_id,
//                                     'activity' => $acer[$i],
//                                     'created_by' => '1');
//                 $this->view->adm->addRecord("ourbank_activities",$activities);
//             }
//             $this->_redirect('/individualmcommonview/index/commonview/id/'.$member_id);
//         }
    }
    
    //editing contact details
    public function editactivitiesAction() 
    {
//         $this->view->title=$this->view->translate('Edit activity');
//         //load contact details form with two arguments ...
//         $form = new Activities_Form_Activities($this->_getParam('id'),$this->_getParam('subId'));
//         $this->view->subid=$this->_getParam('subId');
//         $this->view->form = $form;
//         $this->view->id = $this->_getParam('id');
//         $this->view->submitform = new Bank_Form_Submit();
//         //dynamically change the path name
//         $addressmodel=new Address_Model_addressInformation();
//         $module_name=$addressmodel->getmodule($this->view->subId);
//         foreach($module_name as $module_view) {
//             $path1=$module_view['module_description'].'commonview';
//         }
//         $path1= $this->view->path1=strtolower($path1);
//         $activityobj=new Activities_Model_Activities();
//         $this->view->activity=$activityobj->getActivitydetails($this->view->id);
// 
//         //update contact details
//         if ($this->_request->getPost('Update'))
//         {
//             $id=$this->_getParam('id');
//             $subid = $this->_getParam('subId');
//             $editact = $this->view->activity=$activityobj->getActivitydetails($this->view->id);
//             $count = count($editact);
// 
//             for ($j = 0 ; $j< $count; $j++) {
//                 $this->view->adm->addRecord("ourbank_activities_log",$editact[$j]);
//             }
//             $activityobj->deleteActivity("ourbank_activities",$id);
//             $activity=$this->_getParam('activity');
//             $count1 = count($activity);
//             for($i = 0; $i< $count1; $i++) 
//             {
//                 $activities = array('submodule_id' => $subid,
//                                     'member_id' => $id,
//                                     'activity' => $activity[$i],
//                                     'created_by' => '1');
//                 $this->view->adm->addRecord("ourbank_activities",$activities);
//             }
//             $this->_redirect('/individualmcommonview/index/commonview/id/'.$id);
//         } 
    }
}
