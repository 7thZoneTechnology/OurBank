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
class Prareport_IndexController extends Zend_Controller_Action
{
    public function init()
    {
        $this->view->pageTitle =$this->view->translate("Praservice Report");
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
		$this->view->form = new Prareport_Form_Search();
		$pramodel = new Prareport_Model_Prareport();

		$gramapanchayat = $this->view->adm->viewRecord("ourbank_master_gillapanchayath","id","DESC");
		foreach($gramapanchayat as $gramapanchayat){
				$this->view->form ->gramapanchayat->addMultiOption($gramapanchayat['id'],$gramapanchayat['name']);
			}

        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
             $formData = $this->_request->getPost();
                 if ($this->view->form->isValid($formData)) { 

					     $this->view->gramapanchayat = $praservice = $this->_request->getParam('gramapanchayat');
						 $this->view->result = $pramodel->fetchDetails($praservice);


			}
		}
	}
}