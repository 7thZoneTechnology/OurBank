<?php
class Par_Form_Search extends Zend_Dojo_Form 
{
        public function init() 
        {
        Zend_Dojo::enableForm($this);
	}

	public function __construct($path) 
        {
        Zend_Dojo::enableForm($this);
	parent::__construct($path);
	$formfield = new App_Form_Field ();
// 	$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
        $branch = $formfield->field('Select','branch','','','','',false,'','','','','',0,0);
	$branch->setAttrib('onchange', 'Getuser(this.value,"'.$path.'")');
        $loanofficer = $formfield->field('Select','loanofficer','','','','',false,'','','','','',0,0);
        $fromdate = $formfield->field('Text','fromdate','','','','',false,'','','','','',0,0);
        $submit = new Zend_Form_Element_Submit('Search');
        $pdf=new Zend_Form_Element_Submit('PDF');
        $this->addElements(array($fromdate,$branch,$loanofficer,$submit,$pdf));
	}
}
