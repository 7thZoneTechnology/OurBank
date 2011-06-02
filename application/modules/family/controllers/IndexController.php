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
class Family_IndexController extends Zend_Controller_Action
{
    public function init()
    {
        $this->view->pageTitle =$this->view->translate("Family"); 
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];

//        $sessionName = new Zend_Session_Namespace('ourbank');
//        $this->view->createdby = $sessionName->primaryuserid;
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
        $result = $individual->getMemberDetails($this->view->createdby);
        $max_id=$individual->getoffice_hierarchy();
        $maxlevel=$max_id[0]['id'];
        $officename=$individual->getoffice($maxlevel);
//load office names and gender names into the drop down list box...
//         $officename = $this->view->adm->viewRecord("ourbank_master_villagelist","id","DESC");
        foreach($officename as $officename1){
        $searchForm->office->addMultiOption($officename1['office_id'],$officename1['name']);
        }



//paginator 
        $page = $this->_getParam('page',1);
        $paginator = Zend_Paginator::factory($result);
//search member details
        if ($this->_request->isPost() && $this->_request->getPost('Search')) 
        {
        $formData = $this->_request->getPost();
                if ($searchForm->isValid($formData)) 
                {
                $result = $individual->searchDetails($this->view->createdby,$searchForm->getValues());
                $page = $this->_getParam('page',1);
                $paginator = Zend_Paginator::factory($result);
                $this->view->paginator = $paginator;
		        $this->view->search = true;

                } 
        }
        $paginator->setItemCountPerPage($this->view->adm->paginator());
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }
}

