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
class Holidaycommonview_IndexController extends Zend_Controller_Action
{
	public function init() 
	{
	            $this->view->pageTitle='Holiday';
                    $this->view->adm = new App_Model_Adm();
                    $this->view->dateconvert = new App_Model_dateConvertor();
	}

	public function indexAction() 
	{
               
		
	}
	public function holidayaddAction() 
	{
		
		
		
	}
	
	public function categoryeditAction() 
	{
			
    }		
	public function holidayviewAction() 
	{
		//Acl
         $id=$this->_request->getParam('id');
//view function
			$holiday = new Holiday_Model_Holiday;
			$this->view->holidaydetails=$holiday->getHoliday($id);
	}	
	public function categorydeleteAction() 
	{

}
}