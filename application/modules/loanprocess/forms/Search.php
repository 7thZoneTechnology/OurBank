<?php
class Loanprocess_Form_Search extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
         $s1 = $formfield->field('Text','s1','','','mand','',true,'','','','','',0,0);//$membercode,membercode
	$submit = $formfield->field('Submit','Submit','','','','',false,'','','','','',0,0);
        $this->addElements(array($s1,$submit));
    }
}