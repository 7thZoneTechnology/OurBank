<?php
class Affidavit_Form_Affidavit extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
        $branch = $formfield->field('Text','branch','','','','',false,'','','','','',0,0);
        $membercode = $formfield->field('Text','taluk','','','','',false,'','','','','',0,0);
        $membercode = $formfield->field('Text','village','','','','',false,'','','','','',0,0);
        $membercode = $formfield->field('Text','memname','','','','',false,'','','','','',0,0);
        $membercode = $formfield->field('Text','branch','','','','',false,'','','','','',0,0);
	$submit = $formfield->field('Submit','Submit','','','','',false,'','','','','',0,0);
        $this->addElements(array($membercode,$submit));
    }
}