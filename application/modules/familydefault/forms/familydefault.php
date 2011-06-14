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

        $familyid = $formfield->field('Hidden','familyid','ourbank_family','family_id','mand required digits','',true,'','','','','',0,0);
		$familyid->addValidator('digits')
		 		 ->addErrorMessage('Enter Numeric data');
        $familyid->setAttrib('maxLength',5);

	$familyid1 = $formfield->field('Text','familyid1','','','mand required digits','',true,'','','','','',0,0);
	    $familyid1->addValidator('digits')
		 		  ->addErrorMessage('Enter Numeric data');
            $familyid1->setAttrib('maxLength',5);

        $sujeevana = $formfield->field('Text','sujeevana','','','required digits','',true,'','','','','',0,0);
		$sujeevana->addValidator('digits')
		 		  ->addErrorMessage('Enter Numeric data');
		$sujeevana->setAttrib('maxLength',5);
                $sujeevana->addValidator(new Zend_Validate_Alnum());

        $houseno=$formfield->field('Text','houseno','','','','',false,'','','','','',0,0);
                $houseno->setAttrib('maxLength',10);
        $minority=$formfield->field('Checkbox','minority','','','','',false,'','','','','',0,0);
	$caste = $formfield->field('Select','caste','','','required','',true,'','','','','',0,0);
                $caste->setRequired(true)
                        ->setRegisterInArrayValidator(false)
                        ->addValidators(array(array('NotEmpty')));
        $health = $formfield->field('MultiCheckbox','health','','','required','',true,'','','','','',0,0);
                $health->setSeparator(" ");
                $health->setAttrib('class','child'); 
                $health->setRequired(true)
                        ->addValidators(array(array('NotEmpty')));
        $ration = $formfield->field('Select','ration','','','mand required','',true,'','','','','',0,0);
        $jobno = $formfield->field('Text','jobno','','','','',false,'','','','','',0,0);
                $jobno->setAttrib('maxLength', 16);
        $income = $formfield->field('Select','income','','','required','',true,'','','','','',0,0);
                $income->setRequired(true)
                        ->setRegisterInArrayValidator(false)
                        ->addValidators(array(array('NotEmpty')));
        $familytype = $formfield->field('Select','familytype','','','required','',true,'','','','','',0,0);
                $familytype->setRequired(true)
                        ->setRegisterInArrayValidator(false)
                        ->addValidators(array(array('NotEmpty')));
        $street = $formfield->field('Text','street','','','','',false,'','','','','',0,0);
        $phone = $formfield->field('Text','phone','','','digits','',false,'','','','','',0,0);
		$phone->setAttrib('maxLength', 12);
	$rev_village = $formfield->field('Select','rev_village','','','required','',true,'','','','','',0,0);
	       $rev_village->setAttrib('onchange','gethabitationDetails("'.$path.'",this.value)');
               $rev_village->setRequired(true)
                        ->setRegisterInArrayValidator(false)
                        ->addValidators(array(array('NotEmpty')));

        $village = $formfield->field('Select','village','','','required','',true,'','','','','',0,0);
                $village->setRegisterInArrayValidator(false)
                        ->setRequired(true)
                         ->addValidators(array(array('NotEmpty')));

//         $village->setAttrib('onchange','getAreaDetails("'.$path.'",this.value)');

        $dateofbirth = $formfield->field('Text','memberdateofbirth','','','','',false,'','','','','',1,0);
	$mobile = $formfield->field('Text','mobile','','','mand required digits','',false,'','','','','',0,0);
		$mobile->setAttrib('maxLength', 11);

        $this->addElements(array($sujeevana,$houseno,$minority,$familyid1,$street,$village,$rev_village,$familytype,$caste,$ration,$health,$jobno,$income,$phone,$mobile));

    }
}
