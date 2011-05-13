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
/*
 *  create an office controller to view all details
 */
class Office_IndexController extends Zend_Controller_Action
{
   public function init() 
   {
        $this->view->pageTitle=$this->view->translate('New Office');
	//check session and redirect
        $storage = new Zend_Auth_Storage_Session();
	$data = $storage->read();
	if(!$data){
            $this->_redirect('index/login');
	}
        $sessionName = new Zend_Session_Namespace('ourbank');
        $this->view->createdby = $sessionName->primaryuserid;
    }

   public function indexAction() 
   {
        $sessionName = new Zend_Session_Namespace('ourbank');
        $storage = new Zend_Auth_Storage_Session();
	$data = $storage->read();
	if(!$data){
            $this->_redirect('index/login');
	}
        $sessionName->primaryuserid;
        $this->view->title = $this->view->translate('New Office');
	//create instance office form
        $searchForm = new Office_Form_Search();
        $this->view->form = $searchForm;
	//create instance office model
        $office = new Office_Model_office();
        $office = $office->getOfficetype();
	//load office type of dropdown
        foreach($office as $office) {
                $searchForm->office->addMultiOption($office['id'],$office['type']);
                    }
        $sessionName = new Zend_Session_Namespace('ourbank');
        $this->view->createdby = $sessionName->primaryuserid;
        $office = new Office_Model_office();
	//validate filterer search 
        $sub1 = $this->_request->getPost('search');

if(($sub1 == 'search') && ($this->_request->getParam('office') == '') && ($this->_request->getParam('shortname') == '') && ($this->_request->getParam('officename') ==''))  {

       $result = $office->getOffice();
}
else if(($sub1 == 'Search') && (($this->_request->getParam('office') != '') || ($this->_request->getParam('shortname') != '') || ($this->_request->getParam('officename') !=''))){

              $this->view->s1 = $officeid = $this->_request->getParam('office');
              $this->view->s2 = $shortname = $this->_request->getParam('shortname');
              $this->view->s3 = $officename = $this->_request->getParam('officename');
		    //return filtered values to view
                    $result = $office->SearchOffice($officeid,$shortname,$officename);

}

else if(($this->_request->getParam('s1') != '') || ($this->_request->getParam('s2') != '') || ($this->_request->getParam('s3') !='')) {

                                $this->view->s1 = $officeid = $this->_request->getParam('s1');
                                $this->view->s2 = $shortname = $this->_request->getParam('s2');
                                $this->view->s3 = $officename = $this->_request->getParam('s3');

               $result = $office->SearchOffice($officeid,$shortname,$officename);
                            }
else{
        $result = $office->getOffice();
}

        $page = $this->_getParam('page',1);
        $paginator = Zend_Paginator::factory($result);
        $paginator->setItemCountPerPage(5);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
    }
}
