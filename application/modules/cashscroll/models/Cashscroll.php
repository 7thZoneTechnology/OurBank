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
class Cashscroll_Model_Cashscroll extends Zend_Db_Table
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
    public function totalSavingsCredit($fromDate,$toDate,$branch,$hierarchy) 


    {

				switch($hierarchy){
					case '3':
					{  $select = $this->select()
                       	->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_office'),array('id as vid','name as koota'))
                         ->where('A.parentoffice_id = "'.$branch.'"')
						->join(array('b' =>'ourbank_family'),'A.id = b.rev_village_id',array('b.id as familyid'))
						->join(array('c' =>'ourbank_familymember'),'b.id = c.family_id',array('c.id as memberid'))
						 ->join(array('C'=>'ourbank_accounts'),'c.id = C.member_id',array('id as accountid','account_number'))
                     	->where('C.status_id =3 OR C.status_id =1')
						->join(array('d'=>'ourbank_transaction'),'C.id = d.account_id')
                        ->where('d.amount_to_bank >0')
                        ->where('d.recordstatus_id = 3 OR d.recordstatus_id = 1')
  						->where('d.paymenttype_id <= 4')
                         ->where('d.transaction_date BETWEEN "'.$fromDate.'" AND "'.$toDate.'" ')

;
            //  die($select->__toString($select));
        return $this->fetchAll($select);}break;

case '4':
					{ 
                      
					 $select = $this->select()
                       	->setIntegrityCheck(false)
						->join(array('b' =>'ourbank_family'),array('b.id'))
                         ->where('b.rev_village_id = "'.$branch.'"')
						->join(array('c' =>'ourbank_familymember'),'b.id = c.family_id',array('c.id as memberid'))
						 ->join(array('C'=>'ourbank_accounts'),'c.id = C.member_id',array('id as accountid','account_number'))
                     	->where('C.status_id =3 OR C.status_id =1')
						->join(array('d'=>'ourbank_transaction'),'C.id = d.account_id')
                        ->where('d.amount_to_bank >0')
                        ->where('d.recordstatus_id = 3 OR d.recordstatus_id = 1')
  						->where('d.paymenttype_id <= 4')
                         ->where('d.transaction_date BETWEEN "'.$fromDate.'" AND "'.$toDate.'" ');
                 // die($select->__toString($select));
        return $this->fetchAll($select);}break;
}
}
    

	//debit 
   public function totalSavingsDebit($fromDate,$toDate,$branch,$hierarchy) 

  {

				switch($hierarchy){
					case '3':
					{  $select = $this->select()
                       	->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_office'),array('id as vid','name as koota'))
                         ->where('A.parentoffice_id = "'.$branch.'"')
						->join(array('b' =>'ourbank_family'),'A.id = b.rev_village_id',array('b.id as familyid'))
						->join(array('c' =>'ourbank_familymember'),'b.id = c.family_id',array('c.id as memberid'))
						 ->join(array('C'=>'ourbank_accounts'),'c.id = C.member_id',array('id as accountid','account_number'))
                     	->where('C.status_id =3 OR C.status_id =1')
						->join(array('d'=>'ourbank_transaction'),'C.id = d.account_id')
                        ->where('d.amount_from_bank >0')
                        ->where('d.recordstatus_id = 3 OR d.recordstatus_id = 1')
  						->where('d.paymenttype_id <= 4')
                         ->where('d.transaction_date BETWEEN "'.$fromDate.'" AND "'.$toDate.'" ')

;
            //     die($select->__toString($select));
        return $this->fetchAll($select);}break;

case '4':
					{ 
                      
					 $select = $this->select()
                       	->setIntegrityCheck(false)
						->join(array('b' =>'ourbank_family'),array('b.id'))
                         ->where('b.rev_village_id = "'.$branch.'"')
						->join(array('c' =>'ourbank_familymember'),'b.id = c.family_id',array('c.id as memberid'))
						 ->join(array('C'=>'ourbank_accounts'),'c.id = C.member_id',array('id as accountid','account_number'))
                     	->where('C.status_id =3 OR C.status_id =1')
						->join(array('d'=>'ourbank_transaction'),'C.id = d.account_id')
                        ->where('d.amount_from_bank >0')
                        ->where('d.recordstatus_id = 3 OR d.recordstatus_id = 1')
  						->where('d.paymenttype_id <= 4')
                         ->where('d.transaction_date BETWEEN "'.$fromDate.'" AND "'.$toDate.'" ');
                 // die($select->__toString($select));
        return $this->fetchAll($select);}break;
}
}
    

public function totalSavingsCreditg($fromDate,$toDate,$group) 
    {
        				$select = $this->select()
                       	->setIntegrityCheck(false)
                       	->join(array('a' => 'ourbank_group'),array('id'))
						->where('a.id = ?',$group)
// 						->join(array('b' =>'ourbank_familymember'),'a.village_id = b.village_id')
 						->join(array('c'=>'ourbank_accounts'),'a.id = c.member_id',array('c.id as accountid','c.account_number'))
                        ->where('c.status_id =3 OR c.status_id =1' )
						->from(array('d' => 'ourbank_transaction'))
                        ->where('d.transaction_date >= "'.$fromDate.'" AND d.transaction_date <= "'.$toDate.'"')
                        ->where('c.id =d.account_id' )
                        ->where('d.amount_to_bank >0')
  						->where('d.paymenttype_id <= 4')
// 
//   ***********************************************************
// 						->join(array('b' =>'ourbank_familymember'),'a.village_id = b.village_id')
// 						->join(array('c'=>'ourbank_accounts'),'b.id = c.member_id',array('c.id as accountid','c.account_number'))
//                         ->where('c.status_id =3 OR c.status_id =1' )
// 						->from(array('d' => 'ourbank_transaction'))
//                         ->where('d.transaction_date >= "'.$fromDate.'" AND d.transaction_date <= "'.$toDate.'"')
//                         ->where('c.id =d.account_id' )
//                         ->where('d.amount_to_bank >0')
//   						->where('d.paymenttype_id <= 4')
//                         ->where('d.recordstatus_id = 3 OR d.recordstatus_id = 1');
;


                    // die($select->__toString($select));
        return $this->fetchAll($select);
    }
public function totalSavingsDebitg($fromDate,$toDate,$group) 
    {
        $select = $this->select()
                       	->setIntegrityCheck(false)
                       	->join(array('a' => 'ourbank_group'),array('id'))
						->where('a.id = ?',$group)
// 						->join(array('b' =>'ourbank_familymember'),'a.village_id = b.village_id')
 						->join(array('c'=>'ourbank_accounts'),'a.id = c.member_id',array('c.id as accountid','c.account_number'))
                        ->where('c.status_id =3 OR c.status_id =1' )
						->from(array('d' => 'ourbank_transaction'))
                        ->where('d.transaction_date >= "'.$fromDate.'" AND d.transaction_date <= "'.$toDate.'"')
                        ->where('c.id =d.account_id' )
                        ->where('d.amount_from_bank >0')
  						->where('d.paymenttype_id <= 4');
// 
                    //  die($select->__toString($select));
        return $this->fetchAll($select);
    }


	//opening balance
    public function openingBalance($fromDate,$toDate,$group) {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_Assets'),array('(SUM(a.credit) - SUM(a.debit) ) as openingBalance'))
                        ->join(array('b'=>'ourbank_glsubcode'),'a.glsubcode_id_to = b.id')
                        ->join(array('c'=>'ourbank_transaction'),'a.transaction_id = c.transaction_id')
                        ->where('c.transaction_date >= "'.$fromDate.'" AND c.transaction_date <= "'.$toDate.'"')
  						->where('c.paymenttype_id <= 4')
                        ->where('a.office_id = "'.$branch.'"');
//die($select->__toString($select));
        return $this->fetchAll($select);
    }



public function openingBalanceg($fromDate,$toDate,$group) {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_group'),array('id'))
						->where('a.id = ?',$group)
                        ->join(array('b'=>'ourbank_Assets'),'a.village_id = b.office_id',array('(SUM(b.credit) - SUM(b.debit) ) as openingBalance'))
                        ->join(array('c'=>'ourbank_transaction'),'c.transaction_id = b.transaction_id')
  						->where('c.paymenttype_id <= 4')
                        ->where('c.transaction_date < "'.$fromDate.'"');
                        //->where('c.transaction_date >= "'.$fromDate.'" AND c.transaction_date <= "'.$toDate.'"');

//die($select->__toString($select));
        return $this->fetchAll($select);
    }








	public function subofficeFromUrl($hierarchy) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id,name  FROM ourbank_office WHERE officetype_id = $hierarchy";
        $result = $this->db->fetchAll($sql,array($hierarchy));
        return $result;


    	}
public function subgroupFromUrl($branch) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id,name  FROM ourbank_group WHERE village_id = $branch";
        $result = $this->db->fetchAll($sql,array($branch));
        return $result;


    	}
public function getOffice($id) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_master_villagelist'),array('id'))
						->where('a.village_id = ?',$id);

//die($select->__toString($select));


		$result = $this->fetchAll($select);
		return $result->toArray();
	}




}
