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

/*
 *  model page for fetch and return Cashscroll details, filtered search details
 */
class Ledgerreport_Model_Ledgerreport extends Zend_Db_Table
{
    protected $_name = 'ourbank_transaction';
	//credit
    public function getGl($id) 
    {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_transaction'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.glsubcode_id_to = "'.$id.'"')
                        ->join(array('C'=>'ourbank_glsubcode'),'C.id = A.glsubcode_id_to')
                       ;

                       // die($select->__toString());
        return $this->fetchAll($select);
        
    }
}
