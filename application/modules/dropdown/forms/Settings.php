<?php class Dropdown_Form_Settings extends Zend_Form {


		
	

	public function init() 
	{
}
public function __construct($path){
		$vtype=array('Alpha','StringLength');
		$formfield = new App_Form_Field ();

// 	$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value

		
	
        	$name = $formfield->field('Text','commonname','','','','',true,'','','','','',0,0);
        	$description = $formfield->field('Text','description','','','','',true,'','','','','',0,0);

           $state = $formfield->field('Select','state','','','','',true,'','','','','',0,0);
           $district = $formfield->field('Select','district','','','','',true,'','','','','',0,0);
           $taluk = $formfield->field('Select','taluk','','','','',true,'','','','','',0,0);
           $hobli = $formfield->field('Select','hobli','','','','',true,'','','','','',0,0);
           $gillapanchayath = $formfield->field('Select','gillapanchayath','','','','',true,'','','','','',0,0);
           $village = $formfield->field('Select','village','','','','',true,'','','','','',0,0);
           $habitation = $formfield->field('Select','habitation','','','','',true,'','','','','',0,0);
           $bank = $formfield->field('Select','bank','','','','',true,'','','','','',0,0);

        	$state->setAttrib('onchange', 'getstate(this.value,"'.$path.'")');
			$district->setAttrib('onchange', 'getdistrict(this.value,"'.$path.'")');
        	$taluk->setAttrib('onchange', 'gettaluk(this.value,"'.$path.'")');
        	$hobli->setAttrib('onchange', 'gethobli(this.value,"'.$path.'")');
        	$gillapanchayath->setAttrib('onchange', 'getgillapanchayath(this.value,"'.$path.'")');
			$village->setAttrib('onchange', 'getvillage(this.value,"'.$path.'")');

        	$bank->setAttrib('onchange', 'getbank(this.value,"'.$path.'")');



        

        // Hidden Feilds 
      

					
            $this->addElements(array($name,$state,$district,$taluk,$gillapanchayath,$description,$village,$habitation,$hobli,$bank));
    }
}
