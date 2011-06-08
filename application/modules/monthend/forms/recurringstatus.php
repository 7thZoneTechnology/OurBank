<?php

class Transaction_Form_recurringstatus extends Zend_Form
{
	public function __construct($options = null)
	{
		parent::__construct($options);
		parent::__construct();

		$account_id = new Zend_Form_Element_Hidden('accountId');
		$product_id = new Zend_Form_Element_Hidden('productId');

		$newStatus = new Zend_Form_Element_Select('newStatus');
		$newStatus->setAttrib('class', 'NormalBtn');
		$newStatus->setRequired(true);
		$newStatus->addMultiOption('','Select...');

		$description = new Zend_Form_Element_Textarea('description');
		$description->setAttrib('class', 'textfield');
		$description->setAttrib('rows','2');
		$description->setAttrib('cols','20');
		$description->setRequired(true);

		$newStatus1 = new Zend_Form_Element_Hidden('newStatus1');
		$description1 = new Zend_Form_Element_Hidden('description1');
	
		$submit = new Zend_Form_Element_Submit('Submit');
		$submit->setLabel('submit');
		$submit->setAttrib('class', 'recurring');

		$Confirm = new Zend_Form_Element_Submit('Confirm');
		$Confirm->setLabel('Confirm');
		$Confirm->setAttrib('class', 'recurring');

		$this->addElements(array($submit,$description,$newStatus,$account_id,$product_id,$Confirm,$newStatus1,$description1));
    }
}
