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
class Officemeetingindex_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle='Office meetings';
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();
        $this->view->username = $this->view->globalvalue[0]['username'];
        $this->view->createdby = $this->view->globalvalue[0]['id'];
		
// 		if (($this->view->globalvalue[0]['id'] == 0)) {
// 			$this->_redirect('index/logout');
// 		}
        $this->view->adm = new App_Model_Adm();
        $this->view->dateconvert = new App_Model_Users();

        $test = new DH_ClassInfo(APPLICATION_PATH . '/modules/meetingindex/controllers/');
        $module = $test->getControllerClassNames();
        $modulename = explode("_", $module[0]);
        $this->view->modulename = strtolower($modulename[0]);
    }

    public function indexAction(){
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }
        $this->view->title = "Office meetings";
        
        $searchForm = new Officemeetingindex_Form_Search();
        $this->view->form = $searchForm;
        
        $days = $this->view->adm->viewRecord("ourbank_master_frequencypayment","id","ASC");
        foreach($days as $days) {
            $searchForm->frequency->addMultiOption($days['id'],$days['name']);
        }

        $officelevel= $this->view->adm->viewRecord("ourbank_officehierarchy","id","ASC");
        foreach($officelevel as $officelevel1) {
            $searchForm->office->addMultiOption($officelevel1['id'],$officelevel1['type']);
        }

        $meeting = new Officemeetingindex_Model_Meeting();
        $result = $meeting->fetchAllmeetingdetails();

        $page = $this->_getParam('page',1);
        $paginator = Zend_Paginator::factory($result);
        $paginator->setItemCountPerPage(5);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;

        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();

                if ($searchForm->isValid($formData)) {
                    $meeting = new Officemeetingindex_Model_Meeting();
                    $result = $meeting->SearchMeeting($formData);
                    $page = $this->_getParam('page',1);
                    $paginator = Zend_Paginator::factory($result);
                    $paginator->setItemCountPerPage(5);
                    $paginator->setCurrentPageNumber($page);
                    $this->view->paginator = $paginator;
                }
        }
    }
}
