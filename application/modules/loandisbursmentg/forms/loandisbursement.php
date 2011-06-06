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

	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
	$formfield = new App_Form_Field ();

        $date = new ZendX_JQuery_Form_Element_DatePicker('date');
        $date->setAttrib('class', 'txt_put');
        $date->setJQueryParam('dateFormat', 'yy-mm-dd');
        $date->setRequired(true);

        $Amount = new Zend_Form_Element_Text('Amount');
        $Amount->setAttrib('class', 'textfield');
        $lessthan=new Zend_Validate_LessThan(array('max' => $loanamount+1,'inclusive' =>false));
        $Amount->setRequired(true)
                ->addValidators(array(array('NotEmpty'),array('Float'),array($lessthan,true)));

	$transactionMode = $formfield->field('Select','transactionMode','','','tmode','',true,'','','','','',0,'');
	$etransfer = $formfield->field('Select','etransfer','','','etran','',false,'','','','','',0,'');
        $etransfer->setRegisterInArrayValidator(false);
	$memberid = $formfield->field('Hidden','memberid','','','memberclass','',false,'','','','','',0,'');
	$membertypeid = $formfield->field('Hidden','membertypeid','','','membertypeclass','',false,'','','','','',0,'');
	$pathhidden = $formfield->field('Hidden','pathhidden','','','pathclass','',false,'','','','','',0,'');

	$othrtext = new Zend_Form_Element_Text('othertext');
	$othrtext->setAttrib('size', 12);

        $description = new Zend_Form_Element_Textarea('description');
        $description->setAttrib('rows', '2');
        $description->setAttrib('cols', '20');
        $description->setRequired(true);

        $sms = new Zend_Form_Element_Checkbox('sms');
        
        $back = new Zend_Form_Element_Submit('Back');
        $back->setAttrib('id', 'button2');

        $submit = new Zend_Form_Element_Submit('Submit');
        $submit->setAttrib('id', 'button');
        $this->addElements( array($date,$Amount,$transactionMode,$etransfer,$othrtext,$description,$sms,$memberid,$pathhidden,$membertypeid,$submit,$back));
    }
}
