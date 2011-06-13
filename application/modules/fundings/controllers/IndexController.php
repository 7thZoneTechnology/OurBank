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
class Fundings_IndexController extends Zend_Controller_Action 
{
    public function init()
     {
        $this->view->pageTitle='Fundings';
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
//         if (($this->view->glourbankalvalue[0]['id'] == 0)) {
//              $this->_redirect('index/logout');
//         }
		$this->view->adm = new App_Model_Adm();
		//$this->view->activity = new Funding_Model_Funding();
     }

    public function indexAction() 
    {   
        $this->view->title='Fundings';
		$searchForm = new Fundings_Form_Search();
		$this->view->form = $searchForm;
		if ($this->_request->isPost() && $this->_request->getPost('Search')) {
	    	$formData = $this->_request->getPost();
	    	if ($this->_request->isPost()) {
				$formData = $this->_request->getPost();
				if ($searchForm->isValid($formData)) {
                                $convertdate = new Fundings_Model_dateConvertor();
                                if($formData['field7']){
                                $formData['field7']=$convertdate->phpmysqlformat($formData['field7']);}
                                if($formData['field8']){
                                $formData['field8']=$convertdate->phpmysqlformat($formData['field8']);}
		    		$fundings = new Fundings_Model_Fundings();

		    		$page = $this->_getParam('page',1);
				$result=$fundings->SearchFundings($formData);
				$countresult=count($result);
				if($countresult==0){
		 		$this->view->errormsg=1;
				}
				else {
				$this->view->errormsg=0;
				}
		    		$paginator = Zend_Paginator::factory($result);
				}
	    	}
		} else {
            $fundings = new Fundings_Model_Fundings();
            $page = $this->_getParam('page',1);
            $paginator = Zend_Paginator::factory($this->view->adm->viewRecord("ourbank_funding","id","DESC"));

		}
            $paginator->setItemCountPerPage($this->view->adm->paginator());
            $paginator->setCurrentPageNumber($page);
            $this->view->paginator = $paginator;
    }
    
    public function addfundingsAction() 
    {   
        $this->view->title='Add Fundings';
        //Acl
//         $access = new App_Model_Access();
//         $checkaccess = $access->accessRights('Fundings',$this->view->glourbankalvalue[0]['name'],'addfundingsAction');
//        	if (($checkaccess != NULL)) {
	
			$form = new Fundings_Form_Fundings();
			$this->view->form = $form;
			$this->view->submitform = new Fundings_Form_Submit();

			$funder = $this->view->adm->viewRecord("ourbank_funder","id","DESC");
			foreach($funder as $funder) {
				$form->funder_id->addMultiOption($funder['id'],$funder['name']);
			}
		
			$currency = $this->view->adm->viewRecord("ourbank_master_currency","id","DESC");
			foreach($currency as $currency) {
				$form->currency_id->addMultiOption($currency['id'],$currency['name']);
			}
			
			if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
				if ($this->_request->isPost()) {
					$formData = $this->_request->getPost();
					if ($form->isValid($formData)) { 

$fundings = new Fundings_Model_Fundings();
$fundin=$fundings->getfundings();
if(!$fundin) {


$funderid=$formData['funder_id'];
$fundings = new Fundings_Model_Fundings();
        $fund=$fundings->getfunder($funderid);

			 foreach ($fund as $fund) {
$glcodeid=$fund['glcode_id'];
}
        $fundgl=$fundings->getglcode($glcodeid);

			 foreach ($fundgl as $fundgl) {
 $glcodeid=$fundgl['id'];

 $glcode=$fundgl['glcode'];
$subledger=$fundgl['ledgertype_id'];
}


$ini=substr($glcode,0,1);
             $last=substr($glcode,1,5);
          		$last+=1;
               $last = str_pad($last,5,0,STR_PAD_LEFT);
            $glsubcode=$ini.$last;
$userid=$this->view->createdby;
   $officeid=$fundings->getuseroffice($userid);
 foreach ($officeid as $officeid) {
 $office=$officeid['bank_id'];
}
        $date=date("y/m/d H:i:s");

 $glInsert = $fundings->insertGlsubcode(array('id' => '',
                        'glsubcode' => $glsubcode, 'office_id' => $office,
                        'glcode_id' => $glcodeid, 'subledger_id' => $subledger,'header' => $formData['name'],'description' => $formData['name'],
                        'created_date' =>$date, 'created_by'=>$this->view->createdby));

$glsubcode_id=$fundings->findmaxlevel();

			 foreach ($glsubcode_id as $glsubcode_id) {
$lastid=$glsubcode_id->lastid;
}



        $date=date("y/m/d H:i:s");
$userid=$this->view->createdby;
   $officeid=$fundings->getuseroffice($userid);
 foreach ($officeid as $officeid) {
 $office=$officeid['bank_id'];
}


$this->view->adm->addRecord("ourbank_funding",array('id' => '',
                                                'funder_id' => $formData['funder_id'],
                                                'name' =>$formData['name'],
												'amount'=>$formData['amount'],
												'glsubcode_id'=>$lastid,
												'interest'=>$formData['interest'],
												'currency_id'=>$formData['currency_id'],
												'exchangerate'=>$formData['exchangerate'],
												'beginingdate'=>$formData['beginingdate'],
												'closingdate'=>$formData['closingdate'],
												'created_by'=>$this->view->createdby,
												'created_date' =>$date));
	    	$this->_redirect('/fundings');
}else {
$funderid=$formData['funder_id'];



$glfunding=$fundings->findmaxfunding($funderid);

			 foreach ($glfunding as $glfunding) {
 $lastfundingid=$glfunding->lastid;
}
        $fundinlast=$fundings->getfundingslast($lastfundingid);
		foreach ($fundinlast as $fundinlast) {
		$glsubcode=$fundinlast['glsubcode_id'];

}

        $subcode=$fundings->getglsubcode($glsubcode);
foreach ($subcode as $subcode) {
		$glsubcode=$subcode['glsubcode'];
		$glcodeid=$subcode['glcode_id'];
$subledger=$subcode['subledger_id'];

}


$ini=substr($glsubcode,0,1);
             $last=substr($glsubcode,1,5);
          		$last+=1;
               $last = str_pad($last,5,0,STR_PAD_LEFT);
            $glnewcode=$ini.$last;


        $date=date("y/m/d H:i:s");
$userid=$this->view->createdby;
   $officeid=$fundings->getuseroffice($userid);
 foreach ($officeid as $officeid) {
 $office=$officeid['bank_id'];
}
 $glInsert = $fundings->insertGlsubcode(array('id' => '',
                        'glsubcode' => $glnewcode, 'office_id' => $office,
                        'glcode_id' => $glcodeid, 'subledger_id' => $subledger,'header' => $formData['name'],'description' => $formData['name'],
                        'created_date' =>$date, 'created_by'=>$this->view->createdby));

$glsubcode_id=$fundings->findmaxlevel();

			 foreach ($glsubcode_id as $glsubcode_id) {
$lastid=$glsubcode_id->lastid;
}





$this->view->adm->addRecord("ourbank_funding",array('id' => '',
                                                'funder_id' => $formData['funder_id'],
                                                'name' =>$formData['name'],
												'amount'=>$formData['amount'],
												'glsubcode_id'=>$lastid,
												'interest'=>$formData['interest'],
												'currency_id'=>$formData['currency_id'],
												'exchangerate'=>$formData['exchangerate'],
												'beginingdate'=>$formData['beginingdate'],
												'closingdate'=>$formData['closingdate'],
												'created_by'=>$this->view->createdby,
												'created_date' =>$date));
	    	$this->_redirect('/fundings');

}
// 						$id = $this->view->adm->addRecord("ourbank_funding",$form->getValues());		
// 						$this->_redirect('/fundingscommonview/index/commonview/id/'.$id);
					}
				}
			}
// 		} else {
// 		}
    }

    public function editfundingsAction() 
    {
    
        $this->view->title='Edit Fundings';
		//Acl
//         $access = new App_Model_Access();
//         $checkaccess = $access->accessRights('Fundings',$this->view->glourbankalvalue[0]['name'],'editfundingsAction');
//        	if (($checkaccess != NULL)) {
        $form = new Fundings_Form_Fundings();
        $this->view->form = $form;
        
        $fundings = new Fundings_Model_Fundings();
        
			$funder = $this->view->adm->viewRecord("ourbank_funder","id","DESC");
			foreach($funder as $funder) {
				$form->funder_id->addMultiOption($funder['id'],$funder['name']);
			}
			

			
			$currency = $this->view->adm->viewRecord("ourbank_master_currency","id","DESC");
			foreach($currency as $currency) {
				$form->currency_id->addMultiOption($currency['id'],$currency['name']);
			}
                     
        if ($this->_request->isPost() && $this->_request->getPost('Update')) {
	    if ($this->_request->isPost()) {
		$formData = $this->_request->getPost();
		if ($form->isValid($formData)) {
			$id=$this->_request->getParam("id");
 
		            $editfundings = $this->view->adm->editRecord("ourbank_funding",$id);

					$this->view->adm->updateLog("ourbank_funding_log",$editfundings[0],1);
					//update 					
					$this->view->adm->updateRecord("ourbank_funding",$id,$form->getValues());
					$this->_redirect("/fundings");

    	            //$this->_redirect('/fundingscommonview/index/commonview/id/'.$this->_request->getPost('funding_id'));
		}
	    }
	} else {
	        
	    $this->view->id=$this->_request->getParam("id");
	    $fundings = new Fundings_Model_Fundings();
        $editfundings = $fundings->viewfundings($this->view->id);
        $form->populate($editfundings[0]);
	}
// 	} else {
// 	     $this->_redirect('index/index');
// 
// 	}
    }
    public function viewfundingsAction () 
    {
    
    }
    public function deletefundingsAction() 
	{
    	//Acl
//         $access = new App_Model_Access();
//         $checkaccess = $access->accessRights('Fundings',$this->view->glourbankalvalue[0]['name'],'deletefundingsAction');
//        	if (($checkaccess != NULL)) {    
		$this->view->title='Delete funding';
        

        
        $form = new Fundings_Form_Delete();
        $this->view->form = $form;
        
        $this->view->id = $this->_request->getParam('id');
			if($this->_request->isPost() ) {

// 			
        		$this->view->id = $this->_request->getParam('id');
			$id=$this->_request->getParam("id");

				$this->view->adm->deleteAction("ourbank_funding","fundings",$id);//  				}
				$this->_redirect("/fundings");
			}
//     } else {
//                                    $this->_redirect('index/index');
// 
//     
//     }
    }

}

