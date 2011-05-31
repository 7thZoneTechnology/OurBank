<?php
class Sbcashscroll_Form_Search extends ZendX_JQuery_Form {
    public function init() {
    Zend_Dojo::enableForm($this);
    }
      public function __construct($options = null) {
        Zend_Dojo::enableForm($this);
        parent::__construct($options);


        $field1 = new ZendX_JQuery_Form_Element_DatePicker('field1');
        $field1->setAttrib('class', 'txt_put');


        $submit = new Zend_Form_Element_Submit('Search');
	$pdf=new Zend_Form_Element_Submit('PDF');

        $this->addElements(array($field1,$submit,$pdf));

    }
}
