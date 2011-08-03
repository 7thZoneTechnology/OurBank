<?php
class Sbi_Form_groupform extends Zend_Form 
{
    public function init() 
    {
    //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
	$formfield = new App_Form_Field ();
    $groupcode = $formfield->field('Text','groupcode','','','mand','',true,'','','','','',0,0);
	$groupcode->addValidator('digits')
	->addErrorMessage('Enter Numeric data');
	$submit = $formfield->field('Submit','Submit','','','','',false,'','','','','',1,0);

	$this->addElements(array($groupcode,$submit));
	}

}