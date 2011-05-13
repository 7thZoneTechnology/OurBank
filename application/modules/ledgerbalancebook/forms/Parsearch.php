<?php
class Reports_Form_Parsearch extends ZendX_JQuery_Form {
	public function init() {
Zend_Dojo::enableForm($this);
	}

	public function __construct($path) {
Zend_Dojo::enableForm($this);
	parent::__construct($path);
	
		$fromdate = new ZendX_JQuery_Form_Element_DatePicker('fromdate');
		$fromdate->setAttrib('class', 'txt_put');
	
		$todate = new ZendX_JQuery_Form_Element_DatePicker('todate');
		$todate->setAttrib('class', 'txt_put');
		
		$branch = new Zend_Form_Element_Select('branch');
		$branch->addMultiOption('','Select');
		$branch->setAttrib('onchange', 'getOfficer(this.value,"'.$path.'")');
		$branch->setAttrib('class', 'txt_put');
		$branch->setAttrib('id', 'branchID');

		$officer = new Zend_Form_Element_Select('officer');
		$officer->addMultiOption('','Select');
		$officer->setAttrib('class', 'txt_put');
		$officer->setRegisterInArrayValidator(false);


		$submit = new Zend_Form_Element_Submit('Search');
		$pdf=new Zend_Form_Element_Submit('PDF');
	
		$this->addElements(array($fromdate,$todate,$branch,$officer,$submit,$pdf));
	}
}
