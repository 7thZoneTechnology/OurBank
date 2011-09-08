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
class Nregskoota_IndexController extends Zend_Controller_Action
{
    public function init()
    {
        $this->view->pageTitle =$this->view->translate("GP & Koota Wise Poverty & NREGS Reports");
        $this->view->tilte = $this->view->translate('Reports');
    	$this->view->type = "fieldReports";
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
		$path = $this->view->baseUrl();
		$this->view->form = $searchForm = new Nregskoota_Form_Search($path);
		$familymodel = new Nregskoota_Model_Nregskoota();

		$searchForm->hierarchy->addMultiOptions(array( '3'=>'Koota', '4'=>'Village','5'=>'Gilla panchayath'));

		if ($this->_request->isPost() && $this->_request->getPost('Search')) {
	        $formData = $this->_request->getPost(); 
        if ($searchForm->isValid($formData)) { 

 			$this->view->hierarchy = $hierarchy = $this->_request->getParam('hierarchy');
 			$this->view->branch = $branch = $this->_request->getParam('branch');

			$this->view->result = $familymodel->fetchDetails($hierarchy,$branch);
			}
		}
	}

 	public function sublevelAction() 
    {
        $path = $this->view->baseUrl();
        $this->_helper->layout()->disableLayout();
		$this->view->form = $searchForm = new Nregskoota_Form_Search($path);

        $hierarchy=$this->view->hierarchy = $this->_request->getParam('hierarchy');
        $familymodel = new Nregskoota_Model_Nregskoota();
        $officelevel = $familymodel->subofficeFromUrl($hierarchy);
  			foreach($officelevel as $officetype) { 
        $searchForm->branch->addMultiOption($officetype->id,$officetype->name);
        }
    }
}