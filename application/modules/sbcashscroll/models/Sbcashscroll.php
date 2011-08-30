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
class Sbcashscroll_Model_Sbcashscroll extends Zend_Db_Table
{
    protected $_name = 'ourbank_transaction';
    public function totalSavingsCredit($Date,$hierarchy,$branch,$group) {

switch($hierarchy){
					case '4':
					{ 
        $select = $this->select()
                       ->setIntegrityCheck(false)
						->join(array('h' =>'ourbank_family'),array('h.id'))
                         ->where('h.rev_village_id = "'.$branch.'"')
						->join(array('i' =>'ourbank_familymember'),'h.id = i.family_id',array('i.id as memberid'))
                        ->join(array('C'=>'ourbank_accounts'),'i.id = C.member_id',array('account_number'))
                        ->where('C.status_id =3 OR C.status_id =1')
  						->join(array('A' => 'ourbank_transaction'),'C.id = A.account_id',array('account_id','amount_to_bank','paymenttype_id'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.amount_to_bank >0')
//                         ->where('A.transaction_date BETWEEN "'.$date.'" AND "'.$date.'" ');
                        ->where('A.transaction_date <= "'.$Date.'"')
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.id',array('id as offerid'))
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id',array('id as pid'))
 						->join(array('F'=>'ourbank_category'),'F.id = D.category_id',array('id as cid'))
  						->where('F.id = 1')
                        ->join(array('E' =>'ourbank_glsubcode'),'E.id = A.glsubcode_id_to')
                        ->order('A.transaction_id');
              
     // die($select->__toString());
        $result = $this->fetchAll($select);
        return $result;}break;

case '3':
					{ 
        $select = $this->select()
                       ->setIntegrityCheck(false)

  ->from(array('L' => 'ourbank_office'),array('id as vid','name as koota'))
                         ->where('L.parentoffice_id = "'.$branch.'"')
						->join(array('h' =>'ourbank_family'),'L.id = h.rev_village_id',array('h.id as familyid'))
						->join(array('i' =>'ourbank_familymember'),'h.id = i.family_id',array('i.id as memberid'))
                        ->join(array('C'=>'ourbank_accounts'),'i.id = C.member_id',array('account_number'))
                        ->where('C.status_id =3 OR C.status_id =1')
  						->join(array('A' => 'ourbank_transaction'),'C.id = A.account_id',array('account_id','amount_to_bank','paymenttype_id'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.amount_to_bank >0')
//                         ->where('A.transaction_date BETWEEN "'.$date.'" AND "'.$date.'" ');
                        ->where('A.transaction_date <= "'.$Date.'"')
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.id',array('id as offerid'))
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id',array('id as pid'))
 						->join(array('F'=>'ourbank_category'),'F.id = D.category_id',array('id as cid'))
  						->where('F.id = 1')
                        ->join(array('E' =>'ourbank_glsubcode'),'E.id = A.glsubcode_id_to')
                        ->order('A.transaction_id');
                 //   die($select->__toString());
        $result = $this->fetchAll($select);
        return $result;}break;

    }}
//array('SUM(transaction_amount)/10 as savingcredit','paymenttype_mode'))

   public function totalSavingsDebit($Date,$hierarchy,$branch,$group) {

switch($hierarchy){
					case '4':
					{ 
        $select = $this->select()
                       ->setIntegrityCheck(false)
						->join(array('h' =>'ourbank_family'),array('h.id'))
                         ->where('h.rev_village_id = "'.$branch.'"')
						->join(array('i' =>'ourbank_familymember'),'h.id = i.family_id',array('i.id as memberid'))
                        ->join(array('C'=>'ourbank_accounts'),'i.id = C.member_id',array('account_number'))
                        ->where('C.status_id =3 OR C.status_id =1')
  						->join(array('A' => 'ourbank_transaction'),'C.id = A.account_id',array('account_id','amount_from_bank','paymenttype_id'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.amount_from_bank >0')
//                         ->where('A.transaction_date BETWEEN "'.$date.'" AND "'.$date.'" ');
                        ->where('A.transaction_date <= "'.$Date.'"')
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.id',array('id as offerid'))
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id',array('id as pid'))
 						->join(array('F'=>'ourbank_category'),'F.id = D.category_id',array('id as cid'))
  						->where('F.id = 1')
                        ->join(array('E' =>'ourbank_glsubcode'),'E.id = A.glsubcode_id_to')
                        ->order('A.transaction_id');
              
  //    die($select->__toString());
        $result = $this->fetchAll($select);
        return $result;}break;

case '3':
					{ 
        $select = $this->select()
                       ->setIntegrityCheck(false)

  ->from(array('L' => 'ourbank_office'),array('id as vid','name as koota'))
                         ->where('L.parentoffice_id = "'.$branch.'"')
						->join(array('h' =>'ourbank_family'),'L.id = h.rev_village_id',array('h.id as familyid'))
						->join(array('i' =>'ourbank_familymember'),'h.id = i.family_id',array('i.id as memberid'))
                        ->join(array('C'=>'ourbank_accounts'),'i.id = C.member_id',array('account_number'))
                        ->where('C.status_id =3 OR C.status_id =1')
  						->join(array('A' => 'ourbank_transaction'),'C.id = A.account_id',array('account_id','amount_from_bank','paymenttype_id'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.amount_from_bank >0')
//                         ->where('A.transaction_date BETWEEN "'.$date.'" AND "'.$date.'" ');
                        ->where('A.transaction_date <= "'.$Date.'"')
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.id',array('id as offerid'))
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id',array('id as pid'))
 						->join(array('F'=>'ourbank_category'),'F.id = D.category_id',array('id as cid'))
  						->where('F.id = 1')
                        ->join(array('E' =>'ourbank_glsubcode'),'E.id = A.glsubcode_id_to')
                        ->order('A.transaction_id');
                 //   die($select->__toString());
        $result = $this->fetchAll($select);
        return $result;}break;

    }}

   public function totalsavingsCreditg($Date,$hierarchy,$branch,$group) {
   $select = $this->select()
                       ->setIntegrityCheck(false)
						->join(array('h' =>'ourbank_groupmembers'),array('h.id'))
                         ->where('h.group_id = "'.$group.'"')
// 						->join(array('h' =>'ourbank_family'),'L.id = h.rev_village_id',array('h.id as familyid'))
// 
// 						->join(array('i' =>'ourbank_familymember'),'h.id = i.family_id',array('i.id as memberid'))
                        ->join(array('C'=>'ourbank_accounts'),'C.member_id = h.member_id',array('account_number'))
                        ->where('C.status_id =3 OR C.status_id =1')
  						->join(array('A' => 'ourbank_transaction'),'C.id = A.account_id',array('account_id','amount_to_bank','paymenttype_id'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.amount_to_bank >0')
                       // ->where('A.transaction_date BETWEEN "'.$date.'" AND "'.$date.'" ');
                        ->where('A.transaction_date <= "'.$Date.'"')
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.id',array('id as offerid'))
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id',array('id as pid'))
 						->join(array('F'=>'ourbank_category'),'F.id = D.category_id',array('id as cid'))
  						->where('F.id = 1')
                        ->join(array('E' =>'ourbank_glsubcode'),'E.id = A.glsubcode_id_to')
                        ->order('A.transaction_id');
              
    //  die($select->__toString());
        $result = $this->fetchAll($select);
        return $result;

}
  public function totalsavingsDebitg($Date,$hierarchy,$branch,$group) {
   $select = $this->select()
                       ->setIntegrityCheck(false)
						->join(array('h' =>'ourbank_groupmembers'),array('h.id'))
                         ->where('h.group_id = "'.$group.'"')
// 						->join(array('h' =>'ourbank_family'),'L.id = h.rev_village_id',array('h.id as familyid'))
// 
// 						->join(array('i' =>'ourbank_familymember'),'h.id = i.family_id',array('i.id as memberid'))
                        ->join(array('C'=>'ourbank_accounts'),'C.member_id = h.member_id',array('account_number'))
                        ->where('C.status_id =3 OR C.status_id =1')
  						->join(array('A' => 'ourbank_transaction'),'C.id = A.account_id',array('account_id','amount_from_bank','paymenttype_id'))
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.amount_from_bank >0')
                       // ->where('A.transaction_date BETWEEN "'.$date.'" AND "'.$date.'" ');
                        ->where('A.transaction_date <= "'.$Date.'"')
                        ->join(array('B'=>'ourbank_productsoffer'),'C.product_id = B.id',array('id as offerid'))
                        ->join(array('D' =>'ourbank_product'),'D.id = B.product_id',array('id as pid'))
 						->join(array('F'=>'ourbank_category'),'F.id = D.category_id',array('id as cid'))
  						->where('F.id = 1')
                        ->join(array('E' =>'ourbank_glsubcode'),'E.id = A.glsubcode_id_to')
                        ->order('A.transaction_id');
              
   //   die($select->__toString());
        $result = $this->fetchAll($select);
        return $result;
}
public function getHier() {
		$select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_officehierarchy'),array('id'))
                ->where('a.id !=1 AND id !=2');
		// die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
	}


}
