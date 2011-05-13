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
class Meetingbookreport_Form_Search extends Zend_Form {

    public function __construct($path) {
        parent::__construct($path);

       $formfield = new App_Form_Field ();

        $meeting_name = new Zend_Form_Element_Select('meeting_name');
        $meeting_name->addMultiOption('','Select...');
        $meeting_name->setAttrib('class', 'mand');
        $meeting_name->setAttrib('id', 'meeting_name');
        $meeting_name->setAttrib('onchange', 'getMeeting(this.value,"'.$path.'",10)');
        $meeting_name->setRequired(true);

//         $datefrom = $formfield->field('Text','datefrom','','','mand','datefrom',true,'','','','','',0,'');
//         $meetingno = $formfield->field('Text','meetingno','','','mand','meetingno',true,'','','','','',0,'');

        $meetingno = new Zend_Form_Element_Select('meetingno');
        $meetingno->addMultiOption('','Week  - Date');
        $meetingno->setAttrib('class', 'mand');
        $meetingno->setAttrib('id', 'meetingno');
        $meetingno->setRegisterInArrayValidator(false);
        $meetingno->setRequired(true);

        $submit = $formfield->field('Submit','Submit','','','','Submit','','','','','','','','');
       $this->addElements( array($meeting_name,$meetingno,$submit));
    }
}