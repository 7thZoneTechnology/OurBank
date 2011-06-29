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
class Meeting_Form_Search extends Zend_Form {
    public function init() {
		$formfield = new App_Form_Field();
		$s1 = $formfield->field('Select','s1','','','','','','','','','','','','');//$search_weekdays,search_weekdays
		$s2 = $formfield->field('Text','s2','','','','','','','','','','','','');//$search_meeting_name,search_meeting_name
                $s3 = $formfield->field('Text','s3','','','','','','','','','','','','');//$search_meeting_place,search_meeting_place
		$s4 = $formfield->field('Text','s4','','','','','','','','','','','','');//$search_group_name,search_group_name
	        $this->addElements(array($s1,$s2,$s3,$s4));
    }
}
