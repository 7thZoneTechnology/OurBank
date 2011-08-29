<?php
class Sbcashscroll_Form_Search extends Zend_Dojo_Form {
   
	public function __construct($path) 
		{
			parent::__construct();

			$formfield = new App_Form_Field ();

        $field1 = new ZendX_JQuery_Form_Element_DatePicker('field1');
        $field1->setAttrib('class', 'txt_put');
 $hierarchy = $formfield->field('Select','hierarchy','','','mand','',true,'','','','','',0,'');
        $hierarchy->setAttrib('onchange', 'getlevels(this.value,"'.$path.'")');
        $hierarchy->setRegisterInArrayValidator(false);
        $branch = $formfield->field('Select','branch','','','mand','Branch',true,'','','','','',0,'');
        $branch->setAttrib('onchange', 'getgroups(this.value,"'.$path.'")');
        $branch->setRegisterInArrayValidator(false);
        $group = $formfield->field('Select','group','','','mand','Group',false,'','','','','',0,'');


        $submit = new Zend_Form_Element_Submit('Search');
	$pdf=new Zend_Form_Element_Submit('PDF');

        $this->addElements(array($field1,$submit,$pdf,$hierarchy,$branch,$group));

    }
}
