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
class Sbi_IndexController extends Zend_Controller_Action
{
	public function init() 
	{
        $this->view->pageTitle = $this->view->translate('Loan Application');
        $this->view->adm = new App_Model_Adm ();
		$this->view->dbobj = new Sbi_Model_Group();
	}

	public function indexAction() 
	{
		$this->view->form = $declarationform = new Sbi_Form_groupform();
		$this->view->groupcode = $groupcode = $this->_request->getParam('groupcode');

		if($this->_request->ispost() && $this->_request->getpost('groupcode')){

			$formdata = $this->_request->getpost();
			if($declarationform->isValid($formdata)){
			$groupmodel = $this->view->dbobj->getgroup('Group');
			$this->view->moduleid = $moduleid = $groupmodel[0]['module_id'];
			$this->view->dbobj->getgroupdetails($groupcode,$moduleid);
			$this->view->groupresult = $result = $this->view->dbobj->getgroupdetails($groupcode,$moduleid);

            }
	    }
	}
 }