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
//create individual form element
class Prakoota_Form_Search extends Zend_Dojo_Form {


	public function init() {    }
    public function __construct($path) {
        $formfield = new App_Form_Field ();
        		$hierarchy = $formfield->field('Select','hierarchy','','','mand','',true,'','','','','',0,'');
        		$hierarchy->setAttrib('onchange', 'getlevels(this.value,"'.$path.'")');
        		$hierarchy->setRegisterInArrayValidator(false);
				$hierarchy->setAttribs(array('style' => 'width: 160px;'));
        		$branch = $formfield->field('Select','branch','','','mand','Branch',true,'','','','','',0,'');
        		$branch->setAttrib('onchange', 'getgroups(this.value,"'.$path.'")');
        		$branch->setRegisterInArrayValidator(false);
				$branch->setAttribs(array('style' => 'width: 160px;'));

        		$submit = new Zend_Form_Element_Submit('Search');
        		//adding form elements
        		$this->addElements(array($hierarchy,$branch,$submit));

    }
}
