<?php
class Reports_Form_Search extends ZendX_JQuery_Form {
    public function init() {
    Zend_Dojo::enableForm($this);
    }
      public function __construct($options = null) {
        Zend_Dojo::enableForm($this);
        parent::__construct($options);


        $field1 = new ZendX_JQuery_Form_Element_DatePicker('field1');
        $field1->setAttrib('class', 'txt_put');


        $field2 = new ZendX_JQuery_Form_Element_DatePicker('field2');
        $field2->setAttrib('class', 'txt_put');

	
	$field3 = new Zend_Form_Element_Select('field3');
        $field3->addMultiOption('','Select');
        $field3->setAttrib('class', 'txt_put');
	
	$field4 = new Zend_Form_Element_Text('field4');
       $field4->setAttrib('class', 'txt_put');

	$field5 = new Zend_Form_Element_Select('field5');
        $field5->addMultiOption('','Select');
        $field5->setAttrib('class', 'txt_put');

$field6 = new ZendX_JQuery_Form_Element_DatePicker('field6');
        $field6->setAttrib('class', 'txt_put');
	

        $submit = new Zend_Form_Element_Submit('Search');
	 $pdf=new Zend_Form_Element_Submit('PDF');

        $this->addElements(array($field1,$field2,$field3,$field4,$field5,$field6,$submit,$pdf));

    }
}
