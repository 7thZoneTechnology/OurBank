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
class Individual_Form_Search extends Zend_Form
{
    public function __construct() 
    {
        parent::__construct(); 
        $formfield = new App_Form_Field ();

        $membername = $formfield->field('Text','membername','','','','',false,'','','','','',0,0);
        $membername->setAttrib('size',12);
        $village = $formfield->field('Select','village','','','','',false,'','','','','',0,0);
              $regional = $formfield->field('Text','name_inregional','','','','',false,'','','','','',0,0);
        $regional->setAttrib('size',12);

        $this->addElements(array($membername,$village,$regional));
    }
}