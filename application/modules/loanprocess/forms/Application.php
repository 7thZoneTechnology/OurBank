<?php
class Loanprocess_Form_Application extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
        $purpose = $formfield->field('Select','purpose','','','mand','',true,'','','','','',0,0);
        $amtrequired = $formfield->field('Text','amount','','','','',false,'','','','','',0,0);
        $period = $formfield->field('Text','period','','','','',false,'','','','','',0,0);
        $duration = $formfield->field('Text','duration','','','','',false,'','','','','',0,0);
	$submit = $formfield->field('Submit','submit','','','','',false,'','','','','',0,0);
        $this->addElements(array($purpose,$amtrequired,$period,$duration,$submit));
    }
}