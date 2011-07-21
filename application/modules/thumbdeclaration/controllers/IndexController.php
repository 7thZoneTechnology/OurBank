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
class Thumbdeclaration_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->pageTitle = $this->view->translate('Membership');
        $this->view->title = 'Accounting';
        $this->view->adm = new App_Model_Adm ();
        $this->view->dbobj = new Thumbdeclaration_Model_Dec();
    }

    public function indexAction() 
    {

        $declarationform = new Thumbdeclaration_Form_Account();
        $this->view->form = $declarationform;
        $this->view->membercode = $memcode = $this->_request->getParam('membercode');
        //submit action
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
                $formData = $this->_request->getPost();
                if ($declarationform->isValid($formData)) {

        $module=$this->view->dbobj->getmodule('Group'); //print_r($module);
        $this->view->moduleid = $moduleid=$module[0]['module_id'];
        $this->view->dbobj->groupDeatils($memcode,$moduleid);
        $this->view->groupresult=$results =  $this->view->dbobj->groupDeatils($memcode,$moduleid);

//         echo '<pre>'; print_r($this->view->groupresult);
//         $this->view->groupmember=$membername =  $this->view->dbobj->getmember($memcode);
//         $this->view->represent=$repname =  $this->view->dbobj->represent($memcode);
//         $this->view->loans=$loans =  $this->view->dbobj->getgrouploans($memcode);
                }

        }
    }
}
