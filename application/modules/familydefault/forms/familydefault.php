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
class  Familydefault_Form_familydefault extends Zend_Form 
{
    public function init() 
    {
    }
    public function __construct($path) 
    {
        parent::__construct($path);
        //create a indiviudal form element 
        //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
        $formfield = new App_Form_Field ();
        $vtype=array('Digits');

        $familyid = $formfield->field('Text','familyid','','','','',true,'','','','','',0,0);
        $familyid->addValidators(array(
          array('stringLength', false, array(1,5)),
        ));
        $familyid->addValidator(new Zend_Validate_Alnum());
        $sujeevana = $formfield->field('Text','sujeevana','','','','',true,'','','','','',0,0);
        $sujeevana->addValidator(new Zend_Validate_Alnum());
        $houseno=$formfield->field('Text','houseno','','','','',true,'','','','','',0,0);
        $houseno->addValidators(array(
          array('stringLength', false, array(1,6)),
        ));
        $minority=$formfield->field('Checkbox','minority','','','','',false,'','','','','',0,0);
        $caste = $formfield->field('Select','caste','','','','',true,'','','','','',0,0);
        $caste->setAttrib('onchange', 'Getsubcaste(this.value,"'.$path.'")');
        $subcaste = $formfield->field('Select','subcaste','','','','',true,'','','','','',0,0);
	$subcaste->setRegisterInArrayValidator(false);
        $health = $formfield->field('MultiCheckbox','health','','','','',true,'','','','','',0,0);
        $health->setSeparator(" ");
        //$health->setAttrib('onclick','setCheck(this.value)'); 
        $health->setAttrib('class','child'); 
        $ration = $formfield->field('Select','ration','','','','',false,'','','','','',0,0);
        $jobno = $formfield->field('Text','jobno','','','','',false,'','','','','',0,0);
        $jobno->addValidators(array(
                            array('alnum'),
                            array('stringLength', false, array(16, 16)),
                            ));    
        $income = $formfield->field('Select','income','','','','',true,'','','','','',0,0);
        $familytype = $formfield->field('Select','familytype','','','','',true,'','','','','',0,0);
        $street = $formfield->field('Text','street','','','','',false,'','','','','',0,0);
        $phone = $formfield->field('Text','phone','','','','',false,'','','','','',0,0);
        $phone->addValidator(new Zend_Validate_Digits());
        $phone->addValidators(array(
          array('stringLength', false, array(11,11)),
        ));
        $village = $formfield->field('Select','village','','','','',true,'','','','','',0,0);
        $village->setAttrib('onchange','getAreaDetails("'.$path.'",this.value)');
        $rev_village = $formfield->field('Select','rev_village','','','','',true,'','','','','',0,0);
        $dateofbirth = $formfield->field('Text','memberdateofbirth','','','','',false,'','','','','',1,0);
	$mobile = $formfield->field('Text','mobile','','','','',false,'','','','','',0,0);
        $mobile->addValidator(new Zend_Validate_Digits());
        $mobile->addValidators(array(
          array('stringLength', false, array(10,10)),
        ));

        $this->addElements(array($familyid,$sujeevana,$houseno,$minority,$street,$village,$rev_village,$familytype,$caste,$subcaste,$ration,$health,$jobno,$income,$phone,$mobile));

    }
}
