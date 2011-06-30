



<?php
class Loanaccount_Form_Accounts extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
        $s1 = $formfield->field('Text','s1','','','mand','',true,'','','','','',0,0);//$membercode,membercode
        //hidden feilds
	$Type = $formfield->field('Hidden','Type','','','','',false,'','','','','',0,0);
	$submit = $formfield->field('Submit','Submit','','','','',false,'','','','','',0,0);
        $this->addElements(array($s1,$Type,$submit));
    }
}