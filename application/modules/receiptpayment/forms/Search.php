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
class Receiptpayment_Form_Search extends ZendX_JQuery_Form 
{
    public function init() 
    {
        $date1 = new ZendX_JQuery_Form_Element_DatePicker('field1');
        $date1->setJQueryParams(array("changeMonth" => "true","changeYear" => "true"));
        $date2 = new ZendX_JQuery_Form_Element_DatePicker('field2');
        $date2->setJQueryParams(array("changeMonth" => "true","changeYear" => "true"));
        $this->addElements(array($date1,$date2));
   }
}