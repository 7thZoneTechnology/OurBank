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
 *  create an action for add, edit, delete
 */
class Funderdetails_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle=$this->view->translate("Funder");
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
        $this->view->adm = new App_Model_Adm();
        $this->view->funder = new Fundercommonview_Model_fundercommon ();
        $module=$this->view->funder->getmodule('Funder');
        foreach($module as $module_id){ }
        $this->view->mod_id=$module_id['parent'];
        $this->view->sub_id=$module_id['module_id'];
    }

    public function indexAction() 
    {
    }

        //add Action
    public function addfunderAction()
    {
        //Acl
//         $this->view->title='Add Institution';
//         $access = new App_Model_Access();
//         $checkaccess = $access->accessRights('Funder',$this->view->globalvalue[0]['name'],'addfunderAction');
//         if (($checkaccess != NULL)) {
        $this->view->title = $this->view->translate("Funder Details"); 

	//create instance of funder
        $form = new Funderdetails_Form_funderdetails($this->view->id);
        $this->view->form=$form;
	//load funder type drop down
        $fundertype = $this->view->adm->viewRecord("ourbank_master_fundertype","id","DESC");
        foreach($fundertype as $fundertype1) { 
                $form->type->addMultiOption($fundertype1['id'],$fundertype1['name']);
        }

	// get poster data
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) 
        {
            $formData = $this->_request->getPost();
		//poster data validation
            if($form->isValid($formData))
            {
  $funder = new Funderdetails_Model_funderdetails();
        $funders=$funder->getfunder();
       


        $date=date("y/m/d H:i:s");

if(!$funders) {
        $ledger = new Ledger_Model_Ledger();
  $glInsert = $ledger->insertGlcode(array('id' => '',
                        'glcode' => 'L02000',
 						'ledgertype_id' => 4,
                        'header' => $formData['name'],
 						'description' => $formData['name'],
                        'created_date' =>$date,
						 'created_by'=>$this->view->createdby));
 $glcode_id=$funder->findmaxlevel();

			 foreach ($glcode_id as $glcode_id) {
$lastid=$glcode_id->lastid;
}

 $this->view->adm->addRecord("ourbank_funder",array('id' => '',
                                                'code' => 0,
                                                'type' =>$formData['type'],
												'name'=>$formData['name'],
												'glcode_id'=>$lastid,
												'status'=>$formData['status'],
												'created_by'=>$this->view->createdby,
												'created_date' =>$date));
	$this->_redirect('/funder');

				}else {
 				$glfunder=$funder->findmaxfunder();
			 foreach ($glfunder as $glfunder) {
				$lastfunderid=$glfunder->lastid;
}

$funder = new Funderdetails_Model_funderdetails();
        $funderslast=$funder->getfunderlast($lastfunderid);
			 foreach ($funderslast as $funderslast) {
$glid=$funderslast['glcode_id'];

}
 $gllast=$funder->getglcode($glid);
			 foreach ($gllast as $gllast) {
$glcode1=$gllast['glcode'];
}
 $ini=substr($glcode1,0,1);
             $last=substr($glcode1,1,5);
          		$last+=1000;
               $last = str_pad($last,5,0,STR_PAD_LEFT);
               $glcode=$ini.$last;
        $glcode;
        $ledger = new Ledger_Model_Ledger();

 $glInsert = $ledger->insertGlcode(array('id' => '',
                        'glcode' => $glcode, 'ledgertype_id' => 4,
                        'header' => $formData['name'], 'description' => $formData['name'],
                        'created_date' =>$date, 'created_by'=>$this->view->createdby));
$glcode_id=$funder->findmaxlevel();

			 foreach ($glcode_id as $glcode_id) {
$lastid=$glcode_id->lastid;
}
$this->view->adm->addRecord("ourbank_funder",array('id' => '',
                                                'code' => 0,
                                                'type' =>$formData['type'],
												'name'=>$formData['name'],
												'glcode_id'=>$lastid,
												'status'=>$formData['status'],
												'created_by'=>$this->view->createdby,
												'created_date' =>$date));
	$this->_redirect('/funder');
}
}

            
        }
 }
    
    public function editfunderAction()
    {
	//Acl
// 	$access = new App_Model_Access();
// 	$checkaccess = $access->accessRights('Funder',$this->view->globalvalue[0]['name'],'editfunderAction');
// 	if (($checkaccess != NULL)) {

	$form = new Funderdetails_Form_funderdetails($this->view->id);
	$this->view->form=$form;

	$fundertype = $this->view->adm->viewRecord("ourbank_master_fundertype","id","DESC");
        //load funder type drop down 	
	foreach($fundertype as $fundertype1) { 
	$form->type->addMultiOption($fundertype1['id'],$fundertype1['name']);
	} 
	// get poster data
	if ($this->_request->isPost() && $this->_request->getPost('update')) { 
            $formData = $this->_request->getPost();
	    //validate poster data
            if ($form->isValid($formData)) { 
            $id = intval($this->_request->getParam('id'));
            $previousdata = $this->view->adm->editRecord("ourbank_funder",$id);
            $this->view->adm->updateLog("ourbank_funder_log",$previousdata[0],$this->view->id);
            $this->view->adm->updateRecord("ourbank_funder",intval($this->_request->getParam('id')),$form->getValues());
            $this->_redirect('/fundercommonview/index/commonview/id/'.intval($this->_request->getParam('id')));
    
            } 
	} else {   
	$id=intval($this->_request->getParam('id'));
	$this->view->id=$id;
	$this->view->title = "Edit Member Details"; 
        $funderdetails = $this->view->adm->editRecord("ourbank_funder",$id);
        $form->populate($funderdetails[0]);
        }
	/*} else {
	$this->_redirect('index/index');
	}*/	
	
    }

        //view funder Action
    public function viewfunderAction() 
    {
    }

        //delete Action
    public function deleteAction()
    {
        //Acl
//         $access = new App_Model_Access();
//         $checkaccess = $access->accessRights('Funder',$this->view->globalvalue[0]['name'],'editfunderAction');
//         if (($checkaccess != NULL)) {

        $id=$this->_request->getParam('id');
        $this->view->funderid=$id;
	// create instance of delete
        $delform=new Funderdetails_Form_Delete();
        $this->view->delete=$delform;
	// search for the search criterias
        if ($this->_request->isPost() && $this->_request->getPost('Submit'))
        {
            $formdata = $this->_request->getPost();
		// form data validate
            if($delform->isValid($formdata)) 
            { 
                $id=$this->_request->getParam('id');
                $formdata = $this->_request->getPost();
                if($delform->isValid($formdata)) {
                $redirect = $this->view->adm->deleteAction("ourbank_funder","funder",$id);
                $this->view->adm->deleteSubmodule("ourbank_contact",$id,$this->view->sub_id);
                $this->view->adm->deleteSubmodule("ourbank_address",$id,$this->view->sub_id);
                }
		// if not valid redirct action
                $this->_redirect("/".$redirect);
            }
        }
//         }
//         else {
//         $this->_redirect('index/index');
//         }
    }
}
