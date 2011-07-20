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

class Groupm_Form_Search extends Zend_Form {
   
	public function __construct() 
		{
			parent::__construct();
			//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$decorator,$value
			$formfield = new App_Form_Field ();
                        // send parameters to get input fields 
			$s1 = $formfield->field('Text','s1','','','','Group code',false,'','','','','',1,'');//$groupcode,groupcode
			$s2 = $formfield->field('Text','s2','','','','Group name',false,'','','','','',1,'');//$groupname,groupname
                        $s3 = $formfield->field('Text','s3','','','','Village name',false,'','','','','',1,'');//$groupname,groupname
			$this->addElements(array($s1,$s2,$s3));
		}
}
