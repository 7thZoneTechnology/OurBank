<?php
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

    class  Groupmdefault_Form_groupdefault extends Zend_Form {
            public function init() {

        Zend_Dojo::enableForm($this);
            }
    
            public function __construct($app) {
                // create instance for common form field
                $formfield = new App_Form_Field ();
                // send required parameters to get respective form fields ( first parameter is a input type)
                $office = $formfield->field('Select','office','','','mand required','Office',true,'','','','','',0,'');
                $office->setAttrib('onchange','getMember(this.value,"'.$app.'")');
                $groupname = $formfield->field('Text','groupname','','','mand required','Group name',true,'','','','','',1,'');

                 $officedit = $formfield->field('Text','offedit','','','mand','offedit',false,'','','','','',0,'');
                 $offeditv = $formfield->field('Hidden','offeditv','','','mand','offeditv',false,'','','','','',0,'');


                $savingamt = $formfield->field('Text','savingamt','','','mand','Savings per week',true,'','','','','',1,'');
                $penaltylate = $formfield->field('Text','penaltylate','','','mand','Penalty for late attendance',true,'','','','','',1,'');
                $penaltyabsence = $formfield->field('Text','penaltyabsence','','','mand','Penalty for absence',true,'','','','','',1,'');
                $interest = $formfield->field('Text','interest','','','mand','Group lending Interest (%)',true,'','','','','',1,'');

                $bank = $formfield->field('Select','bank','','','mand required','Bank',true,'','','','','',1,'');
                $bank->setAttrib('onchange','getBranch(this.value)');

                $branch = $formfield->field('Select','branch','','','mand required','Bank branch',true,'','','','','',0,'');

                 $place = $formfield->field('Text','place','','','mand','Place',true,'','','','','',1,'');
                 $time = $formfield->field('Text','times','','','mand','Time',true,'','','','','',1,'');
                 $day = $formfield->field('Select','day','','','mand','Day',true,'','','','','',1,'');

                $date = $formfield->field('Text','Created_Date','','','mand required','Group registered date',true,'','','','','',1,'');

                $code = new Zend_Form_Element_Hidden('code');
                $submit = new Zend_Form_Element_Submit('Submit');
                $back= new Zend_Form_Element_Button('Back');
                $this->addElements(array($office,$groupname,$officedit,$offeditv,$savingamt,$penaltylate,$penaltyabsence,$interest,$bank,$branch,$place,$date,$time,$code,$day,$submit,$back));

   
            }
    }
