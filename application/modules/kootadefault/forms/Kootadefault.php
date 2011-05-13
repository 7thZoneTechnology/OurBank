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

    class Kootadefault_Form_Kootadefault extends ZendX_JQuery_Form {
            public function init() {
            }
    
            public function __construct() {
                // create instance for common form field
                $formfield = new App_Form_Field ();
                // send required parameters to get respective form fields ( first parameter is a input type)
                $koota = $formfield->field('Select','koota','','','mand required','Office',true,'','','','','',0,'');
                $koota->setAttrib('onchange','getGroup(this.value)');

                $penaltylate = $formfield->field('Text','penaltylate','','','','Penalty for late attendance',false,'','','','','',1,'');
                $penaltyabsence = $formfield->field('Text','penaltyabsence','','','','Penalty for absence',false,'','','','','',1,'');
                $interest = $formfield->field('Text','interest','','','','Koota lending Interest (%)',false,'','','','','',1,'');
            
                $date = $formfield->field('Text','Created_Date','','','mand required','Registered date',true,'','','','','',1,'');

                $dateedit = $formfield->field('Text','dateedit','','','','Registered date',false,'','','','','',1,'');

                $submit = new Zend_Form_Element_Submit('Submit');
                $back = new Zend_Form_Element_Submit('Back');

                $this->addElements(array($koota,$penaltylate,$penaltyabsence,$interest,$date,$dateedit,$submit,$back));
            }
    }
