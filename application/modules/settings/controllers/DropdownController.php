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
class settings_DropdownController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle='Drop Down Settings';
		$this->view->adm = new App_Model_Adm();
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

    }

    public function indexAction() 
    {
        $addform=new settings_Form_Dropdown();
        $this->view->form=$addform;
	$this->view->title = "Drop Down";
	$tableName = $this->_request->getParam('tableName');
        $this->view->form->table_name->setValue($tableName);
	//echo $tableName;
	if(isset($tableName)) 
        {
	   $this->view->table = 10;
	   switch($tableName) 
            {
	       case "ourbank_master_accountype" :
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_accountype";
	       $this->view->name=$ledger['name']; 
	       }
	       break;

 			case "ourbank_master_bank" :
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_bank";
	       $this->view->name=$ledger['name']; 
	       }
	       break;

	       case "ourbank_master_bank" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_bank";
	       $this->view->name=$ledger['name'];
	       }
	       break;

	       case "ourbank_master_businesstype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_businesstype";
	       $this->view->name=$ledger['name'];
	       }
	       break;

	       case "ourbank_master_castetype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_castetype";
	       $this->view->name=$ledger['name'];
	       }
	       break;

	       case "ourbank_master_cbopromoter" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_cbopromoter";
	       $this->view->name =$ledger['name'];
	       }
	       break;

        	case "ourbank_master_cbos" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger)     
                {
	       $this->view->tableName = "ourbank_master_cbos";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_cookingfuel" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {  
	       $this->view->tableName = "ourbank_master_cookingfuel";
	       $this->view->name =$ledger['name'];
	       }
	       break;

 case "ourbank_master_countrylist" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {  
	       $this->view->tableName = "ourbank_master_countrylist";
	       $this->view->name =$ledger['name'];
	       }
	       break;


	       case "ourbank_master_crop" :  
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_crop";
	       $this->view->name =$ledger['name'];
	       }
	       break;


	       case "ourbank_master_currency" :  
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_currency";
	       $this->view->name =$ledger['name'];
	       }
	       break;


	       case "ourbank_master_diseasetypes" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_diseasetypes";
	       $this->view->name =$ledger['name'];
	       }
	       break;

  case "ourbank_master_districtlist" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_districtlist";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_educationtype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_educationtype";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_employmenttype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_employmenttype";
	       $this->view->name =$ledger['name'];
	       }
	       break;	


  			case "ourbank_master_entitlements" :
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_entitlements";
	       $this->view->name=$ledger['name']; 
	       }
	       break;

	case "ourbank_master_expense" :
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_expense";
	       $this->view->name=$ledger['name']; 
	       }
	       break;


	       case "ourbank_master_familyexpense" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_familyexpense";
	       $this->view->name=$ledger['name'];
	       }
	       break;

	       case "ourbank_master_familyincome" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_familyincome";
	       $this->view->name=$ledger['name'];
	       }
	       break;

	       case "ourbank_master_familytype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_familytype";
	       $this->view->name=$ledger['name'];
	       }
	       break;

	       case "ourbank_master_fundertype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_fundertype";
	       $this->view->name =$ledger['name'];
	       }
	       break;

        	case "ourbank_master_gender" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger)     
                {
	       $this->view->tableName = "ourbank_master_gender";
	       $this->view->sex =$ledger['sex'];
	       }
	       break;

	case "ourbank_master_hoblilist" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger)     
                {
	       $this->view->tableName = "ourbank_master_hoblilist";
	       $this->view->sex =$ledger['sex'];
	       }
	       break;

	       case "ourbank_master_housingtype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {  
	       $this->view->tableName = "ourbank_master_housingtype";
	       $this->view->name =$ledger['name'];
	       }
	       break;

 			case "ourbank_master_income" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {  
	       $this->view->tableName = "ourbank_master_income";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	case "ourbank_master_instalstatus" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {  
	       $this->view->tableName = "ourbank_master_instalstatus";
	       $this->view->name =$ledger['name'];
	       }
	       break;
	       case "ourbank_master_institutions" :  
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_institutions";
	       $this->view->name =$ledger['name'];
	       }
	       break;

 case "ourbank_master_kootas" :  
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_kootas";
	       $this->view->name =$ledger['name'];
	       }
	       break;

case "ourbank_master_kvs" :  
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_kvs";
	       $this->view->name =$ledger['name'];
	       }
	       break;


	       case "ourbank_master_landacquisition" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_landacquisition";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_landtypes" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_landtypes";
	       $this->view->name =$ledger['name'];
	       }
	       break;

  case "ourbank_master_ledgertypes" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_ledgertypes";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_liveassets" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_liveassets";
	       $this->view->name =$ledger['name'];
	       }
	       break;	








  case "ourbank_master_loanpurpose" :  
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_loanpurpose";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_loansource" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_loansource";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_maritalstatus" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_maritalstatus";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_membertypes" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_membertypes";
	       $this->view->name =$ledger['name'];
	       }
	       break;	


  			case "ourbank_master_nonliveassets" :
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_nonliveassets";
	       $this->view->name=$ledger['name']; 
	       }
	       break;

	       case "ourbank_master_ownershiptype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_ownershiptype";
	       $this->view->name=$ledger['name'];
	       }
	       break;

  			case "ourbank_master_paymenttypes" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_paymenttypes";
	       $this->view->name=$ledger['name'];
	       }
	       break;


	       case "ourbank_master_povertytype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_povertytype";
	       $this->view->name=$ledger['name'];
	       }
	       break;

	       case "ourbank_master_profession" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_profession";
	       $this->view->name=$ledger['name'];
	       }
	       break;

	       case "ourbank_master_realtionshiptype" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_realtionshiptype";
	       $this->view->name =$ledger['name'];
	       }
	       break;

        	case "ourbank_master_shgs" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger)     
                {
	       $this->view->tableName = "ourbank_master_shgs";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_skills" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {  
	       $this->view->tableName = "ourbank_master_skills";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_sourceofincome" :  
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_sourceofincome";
	       $this->view->name =$ledger['name'];
	       }
	       break;

 case "ourbank_master_taluklist" :  
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_taluklist";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_villages" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_villages";
	       $this->view->name =$ledger['name'];
	       }
	       break;

	       case "ourbank_master_villagelist" : 
	       $setting = new settings_Model_Dropdown();
	       $arrayTable = $setting->tableContent($tableName);
	       $this->view->tblcontent = $arrayTable;
	       foreach($this->view->tblcontent as $ledger) 
                {
	       $this->view->tableName = "ourbank_master_villagelist";
	       $this->view->name =$ledger['name'];
	       }
	       break;
            }
        }
       
        if($this->_request->isPost() && $this->_request->getPost('Add'))
        {
                


               $tName=$this->_request->getParam('table_name');
               $tInsert=$this->_request->getParam('textvalue');
              $pK=$this->_request->getParam('pK');
               $attribute=$this->_request->getParam('attribute');
                $setting=new settings_Model_Dropdown();
                $arrayTable=$setting->insertContent($tName,array($pK=>'',$attribute=>$tInsert));
                echo "<font color='red'>This value is successfully added</font>";

                

        } 
//                 $this->view->field2 = $year;
//                 $this->view->field3 = $bank;
    }
 public function commonviewAction() 
    {
$tName=$this->_request->getParam('ff');
 $id=$this->_request->getParam('id');
$settings = new settings_Model_Dropdown;
$this->view->details=$settings->getdetails($tName,$id);
$this->view->tableName =$tName;

}
public function editAction() 
    {
 $dropdownForm = new settings_Form_Drop();
        $this->view->form = $dropdownForm;
  		$tName=$this->_request->getParam('ff');

$this->view->tableName =$tName;

 if ($this->_request->isPost() && $this->_request->getPost('Update')) {
	    if ($this->_request->isPost()) {
		$formData = $this->_request->getPost();
		if ($dropdownForm->isValid($formData)) {
  		$tName=$this->_request->getParam('ff');
	$id=$this->_request->getParam('id');

//Zend_Debug::dump($dropdownForm->getValues());
  	$previousdata = $this->view->adm->editRecord($tName,$id);
	$this->view->adm->updateRecord($tName,$id,$dropdownForm->getValues());
			$this->_redirect('settings/dropdown');

}}
// }
// }
} else {
 $id=$this->_request->getParam('id');
			$this->view->id = $id;
$tName=$this->_request->getParam('ff');
			$this->view->ff = $tName;
$settings = new settings_Model_Dropdown;
$namedetails = $settings->getdetails($tName,$id);
$dropdownForm->populate($namedetails[0]);
}

}
public function deleteAction() 

    {
$dropdownForm = new settings_Form_Delete();
        $this->view->form = $dropdownForm;
 $id=$this->_request->getParam('id');
			$this->view->id = $id;

$tName=$this->_request->getParam('ff');
			$this->view->ff = $tName;

if($this->_request->isPost() && $this->_request->getPost('Delete')) {
		$formdata = $this->_request->getPost();
				if ($dropdownForm->isValid($formdata)) { 
 $id=$this->_request->getParam('id');
			$this->view->id = $id;

$tName=$this->_request->getParam('ff');
			$this->view->ff = $tName;


//deleting  record
       $redirect = $this->view->adm->deleteRecord("$tName",$id);
					//update
            $this->_redirect('/settings/dropdown');

}}
}
}
