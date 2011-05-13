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
 *  model page to fetch and filtered search details
 */    
class Daybook_Model_Daybook extends Zend_Db_Table
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

	//credit
    public function totalSavingsCredit($mode,$fromDate,$branchid) {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_transaction'),array('SUM(amount_to_bank) as amount_to_bank'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.transactiontype_id = 1 AND A.paymenttype_id = "'.$mode.'"')
                        ->where('A.transaction_date BETWEEN "'.$fromDate.'" AND "'.$fromDate.'" ')
                        ->join(array('C'=>'ourbank_accounts'),'A.account_id = C.id')
                        ->where('C.status_id =3 OR C.status_id =1 OR  C.status_id =5' )
                       ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.product_id')
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id')                        
			->group('D.shortname')
                        ->join(array('F' =>'ourbank_glsubcode'),'F.id = A.glsubcode_id_to')
                        ->join(array('G' =>'ourbank_glcode'),'G.id = F.glcode_id')

                        ->join(array('h' =>'ourbank_group'),'C.member_id = h.id','h.name as groupname')
                        ->join(array('j' =>'ourbank_familymember'),'C.member_id = j.id',array('j.name as memname'))
                        ->where('j.village_id = "'.$branchid.'"');
                   // die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result;
    }

	//debit
 public function totalSavingsDebit($mode,$fromDate,$branchid) {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_transaction'),array('SUM(amount_from_bank) as amount_from_bank'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.transactiontype_id = 2 AND A.paymenttype_id = "'.$mode.'"')
                        ->where('A.transaction_date BETWEEN "'.$fromDate.'" AND "'.$fromDate.'" ')
                        ->join(array('C'=>'ourbank_accounts'),'A.account_id = C.id')
                        ->where('C.status_id =3 OR C.status_id =1 OR  C.status_id =5' )
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.product_id')
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id')                        
			->group('D.shortname')
                        ->join(array('F' =>'ourbank_glsubcode'),'F.id = A.glsubcode_id_to')
                        ->join(array('G' =>'ourbank_glcode'),'G.id = F.glcode_id')

                        ->join(array('h' =>'ourbank_group'),'C.member_id = h.id','h.name as groupname')
                        ->join(array('j' =>'ourbank_familymember'),'C.member_id = j.id',array('j.name as memname'))
                        ->where('j.village_id = "'.$branchid.'"');
 //die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result;
    }
	//search
	public function openingBalance($fromDate,$branchid) {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_Assets'),array('(SUM(credit) - SUM(debit) ) as openingBalance'))

                        ->join(array('D'=>'ourbank_transaction'),'A.transaction_id = D.transaction_id')
                        ->where('D.transaction_date < "'.$fromDate.'" ')
                        ->join(array('B'=>'ourbank_glsubcode'),'A.glsubcode_id_to = B.glcode_id')
                        ->where('A.office_id = "'.$branchid.'"');
                        //die($select->__toString($select));
        return $this->fetchAll($select);
    }
}
