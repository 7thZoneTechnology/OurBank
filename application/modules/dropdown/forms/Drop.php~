<?php class Dropdown_Form_Drop extends Zend_Form {

public function __construct($path) 
    {
    parent::__construct($path);
	
        	$vtype=array('Alpha','StringLength');
		$formfield = new App_Form_Field ();

				// 	$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
                $name = $formfield->field('Select','name','','','','Name',true,'','','','','',1,0);
		$name->setAttrib('onchange', 'getnames(this.value,"'.$path.'")');

			   // Hidden Feilds 
            $this->addElements(array($name));
    
            }
        
}