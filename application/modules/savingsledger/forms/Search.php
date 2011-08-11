<?php
class Savingsledger_Form_Search extends ZendX_JQuery_Form {
    public function init() {
    Zend_Dojo::enableForm($this);
    }
      public function __construct($path) {
        $formfield = new App_Form_Field ();

        $hierarchy = $formfield->field('Select','hierarchy','','','mand','',true,'','','','','',0,'');
        $hierarchy->setAttrib('onchange', 'getlevels(this.value,"'.$path.'")');
        $hierarchy->setRegisterInArrayValidator(false);
        $branch = $formfield->field('Select','branch','','','mand','Branch',true,'','','','','',0,'');
        $branch->setAttrib('onchange', 'getgroups(this.value,"'.$path.'")');
        $branch->setRegisterInArrayValidator(false);
        $group = $formfield->field('Select','group','','','mand','Group',false,'','','','','',0,'');
        $field1 = $formfield->field('Text','datefrom','','','mand','From date',true,'','','','','',0,'');
        $field2 = $formfield->field('Text','dateto','','','mand','To date',true,'','','','','',0,'');
        $field4 = $formfield->field('Text','acc','','','mand','acc',true,'','','','','',0,'');

        $submit = new Zend_Form_Element_Submit('Search');

        $this->addElements(array($hierarchy,$branch,$group,$field1,$field2,$field4,$submit));

    }
}
