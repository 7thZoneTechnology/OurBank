<?php
class Loandisbursmentg_Form_loandisbursement extends Zend_Form 
{
    public function init()
    {
    }
    public function __construct($loanamount)
    {
        Zend_Dojo::enableForm($this);
        parent::__construct($loanamount);

        $date = new ZendX_JQuery_Form_Element_DatePicker('date');
        $date->setAttrib('class', 'txt_put');
        $date->setJQueryParam('dateFormat', 'yy-mm-dd');
        $date->setRequired(true);

        $Amount = new Zend_Form_Element_Text('Amount');
        $Amount->setAttrib('class', 'textfield');
        $lessthan=new Zend_Validate_LessThan(array('max' => $loanamount+1,'inclusive' =>false));
        $Amount->setRequired(true)
                ->addValidators(array(array('NotEmpty'),array('Float'),array($lessthan,true)));

        $description = new Zend_Form_Element_Textarea('description');
        $description->setAttrib('rows', '2');
        $description->setAttrib('cols', '20');
        $description->setRequired(true);

        $sms = new Zend_Form_Element_Checkbox('sms');
        
        $back = new Zend_Form_Element_Submit('Back');
        $back->setAttrib('id', 'button2');

        $submit = new Zend_Form_Element_Submit('Submit');
        $submit->setAttrib('id', 'button');
        $this->addElements( array($date,$Amount,$description,$submit,$back,$sms));
    }
}
