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
 *  model page for fetch and return trnsfer details and filtered search details
 */    
class Transferscroll_Model_Transferscroll extends Zend_Db_Table
{
    protected $_name = 'ourbank_transaction';
	
    public function officedetials() 
    {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_office'),array('a.id','a.name'))
                        ->where('a.officetype_id = 4');
                      //  die($select->__toString($select));
        return $this->fetchAll($select);
    }
//office name
    public function officename($branchid) 
    {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_office'),array('a.name as officename'))
                        ->where('a.id = "'.$branchid.'"');
                       //die($select->__toString($select));
        return $this->fetchAll($select);
    }
//credit
    public function totalSavingsCredit($date,$branchid) {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_transaction'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.transactiontype_id = 1 AND A.paymenttype_id = 5')
                        ->where('A.transaction_date = "'.$date.'"')
                        ->join(array('C'=>'ourbank_accounts'),'C.id = A.account_id')
                        ->where('C.status_id =3 OR C.status_id =1' )
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.id')
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id')
                        ->join(array('e' =>'ourbank_group'),'C.member_id = e.id')
                        ->join(array('f' =>'ourbank_familymember'),'C.member_id = f.id')
                        ->where('f.village_id = "'.$branchid.'"');
        $result = $this->fetchAll($select);
        return $result;
    }
	//debit
    public function totalSavingsDebit($date,$branchid) {
         $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_transaction'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.transactiontype_id = 2 AND A.paymenttype_id = 5')
                        ->where('A.transaction_date = "'.$date.'"')
                        ->join(array('C'=>'ourbank_accounts'),'C.id = A.account_id')
                        ->where('C.status_id =3 OR C.status_id =1' )
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.id')
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id')
                        ->join(array('e' =>'ourbank_group'),'C.member_id = e.id')
                        ->join(array('f' =>'ourbank_familymember'),'C.member_id = f.id')
                        ->where('f.village_id = "'.$branchid.'"');
                    //die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result;
    }
    
}
