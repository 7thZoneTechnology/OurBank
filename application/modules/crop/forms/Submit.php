<?php
    class Crop_Form_Submit extends Zend_Form {
	public function init() 
	{
	    Zend_Dojo::enableForm($this);
	}

	public function __construct($options = null) 
	{
	    Zend_Dojo::enableForm($this);
	    parent::__construct($options);
	    
			$submit = new Zend_Form_Element_Submit('Submit');
			$submit->setAttrib('id', 'save');

			$this->addElements(array($submit));
        }
    }
