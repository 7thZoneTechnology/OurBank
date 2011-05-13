<?php
class Reports_Form_loandue extends ZendX_JQuery_Form {
    public function init() {
    Zend_Dojo::enableForm($this);
    }
      public function __construct($app) { 
        Zend_Dojo::enableForm($this);
	parent::__construct($app);

        $field1 = new ZendX_JQuery_Form_Element_DatePicker('field1');
        $field1->setAttrib('class', 'txt_put');
	$field1->setRequired(true);
	
	$field3 = new Zend_Form_Element_Select('field3');
	$field3->setAttrib('onchange', 'Getuser(this.value,"'.$app.'")');
			   //('onchange','getMember(this.value,"'.$app.'")');
        $field3->addMultiOption('','Select');
        $field3->setAttrib('class', 'txt_put');
	
	$field4 = new Zend_Form_Element_Text('field4');
        $field4->setAttrib('class', 'txt_put');

	$field5 = new Zend_Form_Element_Select('field5');
        $field5->addMultiOption('','Select');
        $field5->setAttrib('class', 'txt_put');
	$field5->setRegisterInArrayValidator(false);

        $submit = new Zend_Form_Element_Submit('Search');
	 $pdf=new Zend_Form_Element_Submit('PDF');

        $this->addElements(array($field1,$field3,$field4,$field5,$submit,$pdf));

    }
}
