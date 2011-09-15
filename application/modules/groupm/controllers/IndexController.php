<?php
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

class Groupm_IndexController extends Zend_Controller_Action
{
    public function init()
    {
        $this->view->pageTitle = "Group";
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
		$this->view->adm = new App_Model_Adm(); // create instance for common model page of adm
    }

    public function indexAction()
    { 
		$searchForm = new Groupm_Form_Search();
                $group = new Groupm_Model_Group();
		$this->view->form = $searchForm;
 		if ($this->_request->isPost() && $this->_request->getPost('Search')){
			$result = $group->searchDetails($this->_request->getPost());	// get search criteria values
			$page = $this->_getParam('page',1);
			$paginator = Zend_Paginator::factory($result); // assign searched values for pagination
			$paginator->setItemCountPerPage($this->view->adm->paginator());
			$paginator->setCurrentPageNumber($page);
				$this->view->paginator = $paginator;
			$this->view->search = true;
		} else {
			$this->view->title = "Group member"; 
			$storage = new Zend_Auth_Storage_Session();
			$data = $storage->read();
			if (!$data) {
				$this->_redirect('index/login');
            }
            $page = $this->_getParam('page',1);
            $paginator = Zend_Paginator::factory($group->getGroupDetails()); // assign default values for pagination
	    	$this->view->paginator = $paginator;
		}
	    $paginator->setItemCountPerPage($this->view->adm->paginator());
	    $paginator->setCurrentPageNumber($page);
     }
}
