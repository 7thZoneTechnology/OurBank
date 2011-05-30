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

class Kootacommonview_IndexController extends Zend_Controller_Action{
    public function init() {
        $this->view->pageTitle='koota';

        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession(); // get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
//         if (($this->view->globalvalue[0]['id'] == 0)) {
//                 $this->_redirect('index/logout');
//         }
        $this->view->adm = new App_Model_Adm();// create instance for common model page of adm
        $this->view->db = new Kootacommonview_Model_Koota(); // create instance for common model page of koota 
    }
    public function indexAction()
	{       
	}
    public function commonviewAction(){
        $id=$this->_request->getParam('id');
        $this->view->kootaid=$id;
        $kootadetails=$this->view->db->getkoota($id); // get koota details
        $this->view->kootadetails=$kootadetails;
        $koota_members=$this->view->db->getkootamembers($id); // get koota members
        $this->view->kootamembers=$koota_members;
        }
}
