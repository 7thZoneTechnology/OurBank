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
class Maintenance_IndexController extends Zend_Controller_Action {

    public function init() {


        $this->view->pageTitle='Maintenance';

        $users = new App_Model_Users();
        $this->view->createdby = $users->checkSession();
        if($this->view->createdby == 0){
                $this->_redirect('index/login'); // once session get expired it will redirect to Login page
        }

        $this->view->adm = new App_Model_Adm();
        $this->view->dayendobject = new Maintenance_Model_Dayend();
    }

    public function indexAction() {
      	$storage = new Zend_Auth_Storage_Session();
	$data = $storage->read();
	if(!$data){
		$this->_redirect('index/login');
	}
       $this->view->title = "Maintenance";

       $Transaction = $this->view->dayendobject->transactionByDate();
       $this->view->transaction = $Transaction;
    }
    public function dayendAction() {

        $formdata = $this->_request->getPost();
    }



}

