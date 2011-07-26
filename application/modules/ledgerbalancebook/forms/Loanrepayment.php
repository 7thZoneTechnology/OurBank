<?php
class Reports_Form_Loanrepayment extends ZendX_JQuery_Form {
    public function init() {
    Zend_Dojo::enableForm($this);
    }
      public function __construct($options = null) {
        Zend_Dojo::enableForm($this);
        parent::__construct($options);


        $accountnumber = new Zend_Form_Element_Text('accountnumber');
        $accountnumber->setAttrib('class', 'txt_put');

        $submit = new Zend_Form_Element_Submit('Search');

        $this->addElements(array($accountnumber,$submit));

    }
}
