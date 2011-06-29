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
 class Holiday_Form_Search extends Zend_Form {


	public function init() 
	{

		$vtype=array('Alpha','StringLength');
		$formfield = new App_Form_Field ();

// 	$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value

		
	
        	$s1 = $formfield->field('Text','s1','','','mand','Holiday name',false,'','','','','',0,0);
        	$s2 = $formfield->field('Select','s2','','','mand','Office name',false,'','','','','',0,0);
			$s3 = $formfield->field('Text','s3','','','mand','Holiday from',false,'','','','','',0,0);
			 $s3->setAttrib('autocomplete','off'); 
			$s4 = $formfield->field('Text','s4','','','mand','Holiday upto',false,'','','','','',0,0);
			 $s4->setAttrib('autocomplete','off'); 

  $submit = new Zend_Form_Element_Submit('Search');
        $submit->setAttrib('id', 'submitbutton');
        $submit->removeDecorator('DtDdWrapper');

					
		$this->addElements(array($s1,$s2,$s3,$s4,$submit));
    }
}