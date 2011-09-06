
<?php
/*
 *  create search form elements for cashscroll
 */
class Expensereport_Form_Search extends Zend_Form {
	
   public function init() {

    }
        public function __construct($path) {
        //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$decorator,$value
        $formfield = new App_Form_Field ();
        $hierarchy = $formfield->field('Select','hierarchy','','','mand','',true,'','','','','',0,'');
        $hierarchy->setAttrib('onchange', 'getlevels(this.value,"'.$path.'")');
        $hierarchy->setRegisterInArrayValidator(false);
        $branch = $formfield->field('Select','branch','','','mand','Branch',true,'','','','','',0,'');
        $branch->setAttrib('onchange', 'getgroups(this.value,"'.$path.'")');
        $branch->setRegisterInArrayValidator(false);
        $group = $formfield->field('Select','group','','','mand','Group',false,'','','','','',0,'');
        $datefrom = $formfield->field('Text','datefrom','','','mand','From date',true,'','','','','',0,'');
        $dateto = $formfield->field('Text','dateto','','','mand','To date',true,'','','','','',0,'');

        //add element to form
        $this->addElements(array($branch,$datefrom,$dateto,$hierarchy,$group));
    }
}
