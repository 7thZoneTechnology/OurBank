<?php
class Externalloan_Form_Account extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
        $name= $formfield->field('Text','name','','','mand','',false,'','','','','',0,0);

        $address= $formfield->field('Text','address','','','mand','',false,'','','','','',0,0);
        $period= $formfield->field('Text','period','','','mand','',false,'','','','','',0,0);
        $membercode = $formfield->field('Text','membercode','','','mand','',true,'','','','','',0,0);
		$membercode->addValidator('digits')
		 ->addErrorMessage('Numeric data only allowed');
        $submit = $formfield->field('Submit','Submit','','','','',false,'','','','','',1,0);
        $this->addElements(array($name,$address,$period,$membercode,$submit));
    }
}