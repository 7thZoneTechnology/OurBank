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
class Psdetails_IndexController extends Zend_Controller_Action
{
    public function init() 
    {
        $this->view->title = "Savings";
        $this->view->pageTitle = "Savings details";
        $this->view->type='savings';
        $this->view->savingsModel = new Savingsdeposit_Model_Savingsdeposit ();
        $this->view->cl = new App_Model_dateConvertor ();
        $this->view->adm = new App_Model_Adm ();
        $this->view->psdetails = new Psdetails_Model_Savingsdeposit();
    }
    public function indexAction() 
    {
        $this->view->form = new Savingsdeposit_Form_Search();
        if ($this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();
            if ($this->view->form->isValid($formData)) {
                $this->view->tran = $this->view->savingsModel->transaction($this->_request->getParam('accNum'));
                $this->view->details = $this->view->savingsModel->search($this->_request->getParam('accNum'));
                $accNum = $this->_request->getParam('accNum');
                $Balance = $this->view->psdetails->getbalance($accNum);
                foreach($Balance as $balances){
                    $this->view->balance =  $balance = $balances['Balance'];
                }
              // check its default savings or not
//               $tagAcc = $this->view->adm->getsingleRecord('ourbank_accounts','tag_account','account_number',$accNum);
// if($tagAcc != 0){
//               $tagAccdetails = $this->view->adm->getRecord('ourbank_accounts','account_number',$accNum);
// Zend_Debug::dump($tagAccdetails);
// }
                //if group members
                if (substr($accNum,4,1) == 2 or substr($accNum,4,1) == 3) {
                    $this->view->group = $this->view->savingsModel->getMember($accNum);
                }


            }
       }
    }
}


	

