<?php
class Loandetailsg_Form_Search extends Zend_Form 
{
    public function init() 
    {
        //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
                $formfield = new App_Form_Field ();
/*
        $num = new Zend_Form_Element_Text('accNum');
        $num->setAttrib('class', 'txt_put');
	    $num->setRequired(true);*/

        $num = $formfield->field('Text','accNum','','','mand','',true,'','','','','',0,'');
		$num->addValidator('digits')
		 		  ->addErrorMessage('Enter Numeric data');

        $submit = new Zend_Form_Element_Submit('Search');
        $this->addElements(array($num,$submit));
    }
}