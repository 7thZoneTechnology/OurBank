<?php
class Loandetailsg_Form_Search extends Zend_Form 
{

public function __construct($path) 
		{
                parent::__construct();
                //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$decorator,$value
                $formfield = new App_Form_Field ();
                //$vtype=array('Alpha');
        		$hierarchy = $formfield->field('Select','hierarchy','','','mand','',true,'','','','','',0,'');
        		$hierarchy->setAttrib('onchange', 'getlevels(this.value,"'.$path.'")');
        		$hierarchy->setRegisterInArrayValidator(false);

        		$branch = $formfield->field('Select','branch','','','mand','Branch',true,'','','','','',0,'');
        		$branch->setAttrib('onchange', 'getgroups(this.value,"'.$path.'")');
        		$branch->setRegisterInArrayValidator(false);

        		$group = $formfield->field('Text','group','','','mand','Group',false,'','','','','',0,'');

                $num = $formfield->field('Text','accNum','','','mand','accNum',true,'','','','','',0,'');

				$this->addElements(array($hierarchy,$branch,$group,$num));
		}

}