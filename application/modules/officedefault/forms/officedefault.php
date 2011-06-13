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
/* create form elements for new office */
class Officedefault_Form_officedefault extends Zend_Form{

 public function init() {

    }
        public function __construct($path,$createdid) {
        //Zend_Dojo::enableForm($this);
        //parent::__construct($options);

        //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
        $formfield = new App_Form_Field ();

       


        $office_name = $formfield->field('Text','name','','','mand ','',true,'','','','','',0,0);
        $office_name->addValidator('Alpha', true, array('allowWhiteSpace'=>true));
        $office_name->addValidator(new Zend_Validate_Db_NoRecordExists('ourbank_office', 'name'));
        $officeshort_name = $formfield->field('Text','short_name','','','mand','',true,'','','','','',0,0);
        $officeshort_name->addValidators(array(array('NotEmpty'),array('stringLength', false, array(3,3))));
        $officeshort_name->addValidator('Alpha', true, array('allowWhiteSpace'=>true));

        $officedescription = $formfield->field('Text','officedescription','','','mand','',true,'','','','','',1,0);
     //  $officetypename = $formfield->field('Text','$officetypename','','','mand','',true,'','','','','',1,0);
        $officetypename=new Zend_Form_Element_Text('officetypename',array("disabled" => "disabled"));
        
        $officetype_id = $formfield->field('Select','officetype_id','','','mand','',true,'','','','','',0,0);
        $officetype_id->addMultiOption('','select'.'...');
//         $officetype_id->setAttrib('class','selectbutton');
        $officetype_id->setRegisterInArrayValidator(false);
        $officetype_id->setAttrib('onchange', 'getInterests(this.value,"'.$path.'"),getaddress(this.value,"'.$path.'")');
        //get url path from edit action

       $parentoffice_id = $formfield->field('Select','parentoffice_id','','','mand','',true,'','','','','',0,0);
      //$parentoffice_id = new Zend_Form_Element_Select('parentoffice_id');
	$parentoffice_id->addMultiOption('','Select OfficeType'.'...');
	//$parentoffice_id->setAttrib('class','selectbutton');
        $parentoffice_id->setRegisterInArrayValidator(false);
        
        $district = $formfield->field('Select','district','','','','','','','','','','',0,0);
	$district->setRegisterInArrayValidator(false);
        $district->setAttrib('onchange', 'gettaluk(this.value,"'.$path.'")');
        $taluque = $formfield->field('Select','taluque','','','','','','','','','','',0,0);
        $taluque->setRegisterInArrayValidator(false);
        $taluque->setAttrib('onchange', 'gethobli(this.value,"'.$path.'")');

        $hobli = $formfield->field('Select','hobli','','','','','','','','','','',0,0);
        $hobli->setRegisterInArrayValidator(false);
        $hobli->setAttrib('onchange', 'getpanchayath(this.value,"'.$path.'")');

        $panchayath = $formfield->field('Select','panchayath','','','','','','','','','','',0,0);
        $panchayath->setRegisterInArrayValidator(false);
        $created_by = $formfield->field('Hidden','createdby','','','','','','','','','','',0,$createdid);
        $created_date = $formfield->field('Hidden','createddate','','','','','','','','','','',0,date("y/m/d H:i:s"));

	//add elements to form
         $this->addElements(array($office_name,$officeshort_name,$officetype_id,$parentoffice_id,$created_by,$created_date,$taluque,$district,$hobli,$panchayath,$officetypename));
	}
}
/**class end*/
