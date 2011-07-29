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
class Family_Form_Search extends Zend_Dojo_Form {

    public function init() {
        //create a object field
         //$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
        $formfield = new App_Form_Field ();
        $s1 = $formfield->field('Text','s1','','','','Membercode','','','','','','',0,0);//$code,code
        //$familyid = $formfield->field('Text','familyid','','','','Member name','','','','','','',0,0);//$familyid,familyid
        $s3 = $formfield->field('Select','s3','','','','Bank name','','','','','','',0,0);//$office,office
        $s2 = $formfield->field('Text','s2','','','','Gender','','','','','','',0,0);//$house,house
    
        $submit = new Zend_Form_Element_Submit('Search');
        //adding form elements
        $this->addElements(array($s1,$s3,$s2,$submit));

    }
}
