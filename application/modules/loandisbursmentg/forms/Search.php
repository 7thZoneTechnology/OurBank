<?php
class Loandisbursmentg_Form_Search extends Zend_Form 
{
    public function init() 
    {
        //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
        $member_id = new Zend_Form_Element_Text('accNum');
        $member_id->setAttrib('class', 'txt_put');
        $submit = new Zend_Form_Element_Submit('Search');
        $this->addElements(array($member_id,$submit));
    }
}