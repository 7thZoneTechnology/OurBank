<?php
class Receipts_Form_Receipts extends ZendX_JQuery_Form{

 public function init() {
        Zend_Dojo::enableForm($this);
    }
        public function __construct($path) {

        $fromglcode=new Zend_Form_Element_Select('fromglcode');
	$fromglcode->addMultiOption('','Select'.'...');
        $fromglcode->setAttrib('class', 'selectbutton');
//      $fromglcode->setAttrib('onchange', 'getglcode(this.value,"'.$path.'")');

        $fromglsubcode=new Zend_Form_Element_Select('fromglsubcode');
	$fromglsubcode->addMultiOption('','Select'.'...');
        $fromglsubcode->setAttrib('class', 'selectbutton');

        $toglcode=new Zend_Form_Element_Select('toglcode');
	$toglcode->addMultiOption('','Select'.'...');
        $toglcode->setAttrib('class', 'selectbutton');
//      $toglcode->setAttrib('onchange', 'gettoglcode(this.value,"'.$path.'")');

        $toglsubcode=new Zend_Form_Element_Select('toglsubcode');
	$toglsubcode->addMultiOption('','Select'.'...');
        $toglsubcode->setAttrib('class', 'selectbutton');
//      $toglsubcode->setAttrib('onchange', 'gettoglsubcode(this.value,"'.$path.'")');

        $balance1 = new Zend_Form_Element_Text('balance1');
        $balance1->setAttrib('readonly', 'true');

        $balance2 = new Zend_Form_Element_Text('balance2');
        $balance2->setAttrib('readonly', 'true');

        $amount=new Zend_Form_Element_Text('amount');
        $amount->setRequired(true)
                    ->addValidators(array(array('NotEmpty')));
        $amount->setAttrib('class', 'txt_put');
	$amount->setAttrib('onchange','getdateamount();');
        $amount->setAttrib('autocomplete','off');

        //$transactiondate=new ZendX_JQuery_Form_Element_DatePicker('transactiondate');
        $transactiondate=new Zend_Form_Element_Text('transactiondate');
        $transactiondate->setRequired(true)
                    ->addValidators(array(array('NotEmpty')));
        $transactiondate->setAttrib('autocomplete','off');
        $transactiondate->setAttrib('class', 'txt_put');
	$transactiondate->setAttrib('onchange','getdateamount();');

        $transactiondate1=new Zend_Form_Element_Text('transactiondate1');
        $transactiondate1->setAttrib('class', 'txt_put');
        $transactiondate1->setAttrib('readonly', 'true');

        $amount1=new Zend_Form_Element_Text('amount1');
        $amount1->setAttrib('class', 'txt_put');
        $amount1->setAttrib('readonly', 'true');

	$description = new Zend_Form_Element_Textarea('description');
	$description->setAttrib('class', 'textfield');
 	$description->setAttrib('rows','1');
	$description->setAttrib('cols','20');
	$description->setAttrib('id', 'description');

	$paymenttype = new Zend_Form_Element_Select('paymenttype');
	$paymenttype->addMultiOption('','select');
        $paymenttype->setAttrib('class', 'selectbutton');
	$paymenttype->setAttrib('id', 'paymenttype');
	$paymenttype->setAttrib('onchange','toggleField1();');

	$no = new Zend_Form_Element_Textarea('paymenttype_details');
	$no->setAttrib('class', 'textfield');
 	$no->setAttrib('rows','1');
	$no->setAttrib('cols','20');
	$no->setAttrib('id', 'paymenttype_details');
	$no->setRequired(true);

        $latestbalancefrom = new Zend_Form_Element_Text('latestbalancefrom');
        $latestbalancefrom->setAttrib('readonly', 'true');

        $latestbalanceto = new Zend_Form_Element_Text('latestbalanceto');
        $latestbalanceto->setAttrib('readonly', 'true');

        $submit = new Zend_Form_Element_Submit('Submit');
        $submit->setAttrib('class', 'officesubmit');

        $this->addElements(array($fromglcode,$fromglsubcode,$toglcode,$toglsubcode,$balance1,$balance2,$amount,$transactiondate,$description,$submit,$transactiondate1,$amount1,$paymenttype,$no,$latestbalancefrom,$latestbalanceto));
    }
}


/**class end*/
