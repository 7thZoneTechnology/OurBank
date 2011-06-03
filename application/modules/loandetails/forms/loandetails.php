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
?>

<?php
class Loandetails_Form_loandetails extends Zend_Form {
    public function init()
    {
    } 
    public function __construct($number) 
    {
        //$number = number family members
        //create a health form eleAgriculturements...

        //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
        $formfield = new App_Form_Field ();

       for($i=1;$i<=$number;$i++) {

        $source = $formfield->field('Text','source'.$i,'','','','','','','','','','',0,0);
        $source->setAttrib('readonly','');
        $loanamount = $formfield->field('Text','loanamount'.$i,'','','','','','','','','','',0,0);
        $loanamount->setAttrib('size',10);
        $graterthan=new Zend_Validate_GreaterThan(0);
        $loanamount->addValidators(array(array('NotEmpty'),array('Float'),array($graterthan,true)));
        //$purpose = $formfield->field('Select','purpose'.$i,'','','','',true,'','','','','',0,0);
	$memberId = new Zend_Form_Element_Select('memberId'.$i);
        $memberId->removeDecorator('DtDdWrapper'); 
        $memberId->removeDecorator('HtmlTag');
        $memberId->removeDecorator('label');
        $interest = $formfield->field('Text','interest'.$i,'','','','','','','','','','',0,0);
        $interest->setAttrib('size',5);
        $graterthan=new Zend_Validate_GreaterThan(0);
        $lessthan=new Zend_Validate_LessThan(100);
        $interest->addValidators(array(array('NotEmpty'),array('Float'),array($graterthan,true),array($lessthan,true)));
	$purpose = new Zend_Form_Element_Select('purpose'.$i);
        $purpose->removeDecorator('DtDdWrapper'); 
        $purpose->removeDecorator('HtmlTag');
        $purpose->removeDecorator('label');
        $repayment = $formfield->field('Text','repayment'.$i,'','','','','','','','','','',0,0);
        $repayment->setAttrib('size',5);
        $deposit = $formfield->field('Text','deposit'.$i,'','','','','','','','','','',0,0);
        $deposit->setAttrib('size',5);
        $graterthan=new Zend_Validate_GreaterThan(0);
        $deposit->addValidators(array(array('NotEmpty'),array('Float'),array($graterthan,true)));
        $outstanding = $formfield->field('Text','outstanding'.$i,'','','','','','','','','','',0,0);
        $outstanding->setAttrib('size',10);
        $graterthan=new Zend_Validate_GreaterThan(0);
        $outstanding->addValidators(array(array('NotEmpty'),array('Float'),array($graterthan,true)));
        $source_id = $formfield->field('Hidden','source_id'.$i,'','','','','','','','','','',0,0);
	$record_id = $formfield->field('Hidden','record_id'.$i,'','','','','','','','','','',0,0);
        $this->addElements(array($source,$loanamount,$memberId,$interest,$purpose,$repayment,$deposit,$outstanding,$source_id,$record_id));
	}
    }

}
