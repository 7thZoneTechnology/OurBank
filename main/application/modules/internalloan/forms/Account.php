<?php
class Declaration_Form_Account extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
        $name= $formfield->field('Text','name','','','mand','',false,'','','','','',0,0);
        $son= $formfield->field('Text','son','','','mand','',false,'','','','','',0,0);
        $age= $formfield->field('Select','age','','','mand','',false,'','','','','',0,0);

        $address= $formfield->field('Text','address','','','mand','',false,'','','','','',0,0);
        $period= $formfield->field('Text','period','','','mand','',false,'','','','','',0,0);
        $names= $formfield->field('Text','names','','','mand','',false,'','','','','',0,0);
        $membercode = $formfield->field('Text','membercode','','','mand','',true,'','','','','',0,0);

        $submit = $formfield->field('Submit','Submit','','','','',false,'','','','','',1,0);
        $this->addElements(array($name,$son,$age,$address,$period,$names,$membercode,$submit));
    }
}