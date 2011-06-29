<?php
class Loanaccount_Form_Accounts extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
        $membercode = $formfield->field('Text','membercode','','','mand','',true,'','','','','',0,0);
        //hidden feilds
	$Type = $formfield->field('Hidden','Type','','','','',false,'','','','','',0,0);
	$submit = $formfield->field('Submit','Submit','','','','',false,'','','','','',0,0);
        $this->addElements(array($membercode,$Type,$submit));
    }
} }
}