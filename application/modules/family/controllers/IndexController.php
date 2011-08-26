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
class Family_IndexController extends Zend_Controller_Action
{
    public function init()
    {
        $this->view->pageTitle =$this->view->translate("Family"); 
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
    }


//index action call individual index page...
    public function indexAction()
    {

       
        $this->view->title = $this->view->translate("Family");
//load searching form...
        $searchForm = new Family_Form_Search();
        $this->view->form = $searchForm;
//create a object for individual model...
        $individual = new Family_Model_familymodel();
       // $result = $individual->getMemberDetails($this->view->createdby);
        $max_id=$individual->getoffice_hierarchy();
        $maxlevel=$max_id[0]['id'];
        $officename=$individual->getoffice($maxlevel);
//load office names and gender names into the drop down list box...
        $officename = $this->view->adm->viewRecord("ourbank_master_villagelist","id","DESC");  
        foreach($officename as $officename1){ 
        $searchForm->s3->addMultiOption($officename1['village_id'],$officename1['name']);
        }
          if($_POST)
            $postedvalues = $this->view->adm->commonsearchquery($_REQUEST,1);
	else
	   $postedvalues = $this->view->adm->commonsearchquery($_REQUEST,2); 

         $result = $individual->searchDetails($this->view->createdby,$postedvalues);  
		$this->view->family = $result; //print_r($result);

        $page = $this->_getParam('page',1);
        $this->view->paginator = $this->view->adm->commonsearch($result,$page);
        $this->view->requestvalues=$this->view->adm->encodedvalue($postedvalues);
        if (!$result){
                       echo "<font color='RED'>Records Not Found Try Again...</font>";
                            }

    }
}

