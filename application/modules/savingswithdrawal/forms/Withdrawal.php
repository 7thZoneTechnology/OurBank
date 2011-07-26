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
class Savingswithdrawal_Form_Withdrawal extends Zend_Form 
{
    public function __construct($accNum,$balance,$minimumbalance)
    {
        parent::__construct($accNum,$balance,$minimumbalance);

        $limitamount = $balance - $minimumbalance;

        $date = new ZendX_JQuery_Form_Element_DatePicker('date');
        $date->setAttrib('class', 'txt_put');
        $date->setJQueryParam('dateFormat', 'yy-mm-dd');
        $date->setRequired(true);
        $date->setAttrib('autocomplete','off');
	$date->setAttrib('size', 12);
	
	$date1 = new ZendX_JQuery_Form_Element_DatePicker('date1');
        $date1->setAttrib('class', 'txt_put');
        $date1->setJQueryParam('dateFormat', 'yy-mm-dd');
        $date1->setRequired(true);
        $date1->setAttrib('autocomplete','off');
	$date1->setAttrib('size', 12);


		//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
		$formfield = new App_Form_Field ();



// 		$amount = $formfield->field('Text','amount','','','txt_put maxvalue','',true,'','','','','',0,'');
//                 $lessthan=new Zend_Validate_LessThan($limitamount);
//                 $amount->setRequired(true)
//                 ->addValidators(array(array('NotEmpty'),array('Float')));
//                 $amount->setAttrib('size', 10);

		$description = $formfield->field('Textarea','description','','','txt_put','',true,'','','',2,10,'',0,'');
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
		$this->addElements( array($date,$transactionMode,$transactionMode1,$description,$description1,$submit,$accNum,$back,$sms,$othrtext,$othrtext1,$date1));
	}
}
