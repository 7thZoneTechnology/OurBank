<?php
/*
############################################################################
#  This file is part of OurBank.
############################################################################
#  OurBank is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as
#  published by the Free Software Foundation, either version 3 of the
#  License, or (at your option) any later version.
############################################################################
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
############################################################################
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
############################################################################
*/
class Savingsdeposit_Form_Deposit extends Zend_Form 
{
    public function __construct($accNum)
    {
        parent::__construct($accNum);

        $date = new ZendX_JQuery_Form_Element_DatePicker('date');
        $date->setAttrib('class', 'txt_put');
        $date->setJQueryParam('dateFormat', 'yy-mm-dd');
        $date->setRequired(true);
	$date->setAttrib('size', 12);
// // 	$date->setAttrib('autocomplete', true);
	
	$date1 = new ZendX_JQuery_Form_Element_DatePicker('date1');
        $date1->setAttrib('class', 'txt_put');
        $date1->setJQueryParam('dateFormat', 'yy-mm-dd');
        $date1->setRequired(true);
	$date1->setAttrib('size', 12);
// // 	$date1->setAttrib('autocomplete', true);

		//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
		$formfield = new App_Form_Field ();
		$amount = $formfield->field('Text','amount','','','txt_put','',true,'','','','','',0,'');
        $graterthan=new Zend_Validate_GreaterThan(0);
        $amount->setRequired(true)
        ->addValidators(array(array('NotEmpty'),array('Float'),array($graterthan,true)));
		$amount->setAttrib('size', 12);
		$description = $formfield->field('Textarea','description','','','txt_put','',true,'','','',2,15,'',0,'');
		$description1 = $formfield->field('Textarea','description1','','','txt_put','',true,'','','',2,10,'',0,'');

		$transactionMode = $formfield->field('Select','transactionMode','','','tmode','',true,'','','','','',0,'');

		$transactionMode1 = $formfield->field('Select','transactionMode1','','','tmode','',true,'','','','','',0,'');



                $othrtext = new Zend_Form_Element_Text('othertext');
                $othrtext->setRequired(true);
                $othrtext->setAttrib('size', 12);

                $othrtext1 = new Zend_Form_Element_Text('othertext1');
                $othrtext1->setRequired(true);
                $othrtext1->setAttrib('size', 12);

                $acc = base64_encode($accNum);
		// hidden feilds
		$accNum = $formfield->field('Hidden','accNum','','','txt_put','',true,'','','','','',0,$acc);
		$sms = new Zend_Form_Element_Checkbox('sms');
                $back = new Zend_Form_Element_Submit('Back');

		$submit = new Zend_Form_Element_Submit('Submit');
		$this->addElements( array($date,$amount,$transactionMode,$transactionMode1,$description,$description1,$submit,$accNum,$back,$sms,$date1,$othrtext,$othrtext1));
	}
}
