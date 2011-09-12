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
class Ledger_Form_Search extends Zend_Dojo_Form {
    public function init() {

        $formfield = new App_Form_Field ();

        $field1 = $formfield->field('Select','field1','','','txt_put','',false,'','','','','','','');
        $field2 = $formfield->field('text','field2','','','txt_put','',false,'','','','','','','');
        $field3 = $formfield->field('text','field3','','','txt_put','',false,'','','','','','','');
        $field4 = $formfield->field('text','field4','','','txt_put','',false,'','','','','','','');
        $field5 = $formfield->field('Select','field5','','','txt_put','',false,'','','','','','','');
        $field6 = $formfield->field('text','field6','','','txt_put','',false,'','','','','','','');

        $submit = new Zend_Form_Element_Submit('Search');

        $this->addElements(array($field1,$field2,$field3,$field4,$field5,$field6,$submit));

    }
}