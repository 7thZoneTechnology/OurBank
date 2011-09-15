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
    public function totalSavingsCredit($fromDate,$toDate,$branch) 
    {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_transaction'))
                        ->where('A.amount_to_bank >0')
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
  						->where('A.paymenttype_id <= 4')
                        // ->where('A.transaction_date BETWEEN "'.$fromDate.'" AND "'.$toDate.'" ')
                        ->where('A.transaction_date <= "'.$fromDate.'" AND A.transaction_date >= "'.$toDate.'"')
                        ->join(array('C'=>'ourbank_accounts'),'C.id = A.account_id')
                        ->where('C.status_id =3 OR C.status_id =1')
                        ->join(array('f' =>'ourbank_familymember'),'C.member_id = f.id',array('village_id'))
                         ->where('f.village_id = "'.$branch.'"');
                  //    die($select->__toString($select));
        return $this->fetchAll($select);
    }

	//debit 
    public function totalSavingsDebit($fromDate,$toDate,$branch) {
         $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_transaction'))
                        ->where('A.amount_from_bank >0')
                        ->where('A.recordstatus_id = 3 OR A.recordstatus_id = 1')
                        ->where('A.transaction_date <= "'.$fromDate.'" AND A.transaction_date >= "'.$toDate.'"')
                        ->join(array('C'=>'ourbank_accounts'),'C.id = A.account_id')
                        ->where('C.status_id =3 OR C.status_id =1' )
                        ->join(array('f' =>'ourbank_familymember'),'C.member_id = f.id')
                        ->where('f.village_id = "'.$branch.'"');
                   // die($select->__toString($select));
        return $this->fetchAll($select);

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
                        ->where('d.amount_from_bank >0');
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
}
