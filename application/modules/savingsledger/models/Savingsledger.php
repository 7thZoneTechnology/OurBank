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
    
class Savingsledger_Model_Savingsledger extends Zend_Db_Table
{
     protected $_name = 'ourbank_accounts';

    public function getAccountDetails($accountNo)
    {

        $db = $this->getAdapter();
        $sql = "Select B.name as membername,
                       D.name as offername,    
                       B.familycode as membercode,
                       C.account_number,
                       E.name as office_name
                    from 
                       ourbank_familymember B,
                       ourbank_accounts C,
                       ourbank_productsoffer D,
                       ourbank_office E
                    WHERE
                        (C.account_number = '$accountNo') AND
                        (C.status_id = '3' OR C.status_id = '1') AND
                        (C.product_id = D.id) AND
                        (C.member_id = B.id ) AND
                        (E.id = B.village_id) 
            UNION
                Select A.name as membername,
                       D.name as offername,
                       A.groupcode  as membercode,
                       C.account_number,
                       E.name as office_name
                    from 
                       ourbank_group A,
                       ourbank_accounts C,
                       ourbank_productsoffer D,
                       ourbank_office E
                WHERE
                 (C.account_number = '$accountNo') AND
                        (C.status_id = '3' OR C.status_id = '1') AND
                        (C.product_id = D.id) AND
                        (C.member_id = A.id ) AND
                        (E.id = A.village_id)";
        $result = $db->fetchAll($sql);
        return $result;
    }



    public function fetchTransactionDetails($accountNo,$dateFrom,$dateTo)
    {


        if($accountNo && !$dateFrom && !$dateTo) {
                  $select = $this->select()
                    ->setIntegrityCheck(false) 
                    ->join(array('a' => 'ourbank_accounts'),array('id'))
                    ->where('a.status_id = 3 OR a.status_id = 1')
                    ->where('a.account_number like  ? "%"',$accountNo)
                    ->join(array('b' => 'ourbank_productsoffer'),'a.product_id = b.id')
                    ->join(array('f' => 'ourbank_transaction'),'f.account_id = a.id',array('amount_to_bank','amount_from_bank','transaction_date','transactiontype_id','balance','transaction_id as Transactionid','transaction_date'))
                    ->where('f.recordstatus_id = 3 || f.recordstatus_id = 1')
                    ->join(array('g' => 'ourbank_transactiontype'),'f.transactiontype_id = g.id')
                    ->join(array('h' => 'ourbank_master_paymenttypes'),'f.paymenttype_id = h.id',array('name as paymenttype'))
                    ->join(array('i' => 'ourbank_user'),'f.created_by = i.id')
		    ->join(array('j' => 'ourbank_familymember'),'a.member_id = j.id');

        } 
        else if(!$accountNo && $dateFrom && $dateTo) {
        $select = $this->select()
                    ->setIntegrityCheck(false) 
                    ->join(array('a' => 'ourbank_accounts'),array('id'))
                    ->where('a.status_id = 3 OR a.status_id = 1')
//                      ->where('a.account_number like "%" ? "%"',$accountNo)
                    ->where('f.transaction_date >= "'.$dateFrom.'"  AND f.transaction_date <= "'.$dateTo.'"')
                    ->join(array('b' => 'ourbank_productsoffer'),'a.product_id = b.id')
                    ->join(array('f' => 'ourbank_transaction'),'f.account_id = a.id',array('amount_to_bank','amount_from_bank','transaction_date','transactiontype_id','balance','transaction_id as Transactionid','transaction_date'))
                    ->where('f.recordstatus_id = 3 || f.recordstatus_id = 1')
                    ->join(array('g' => 'ourbank_transactiontype'),'f.transaction_type_id = g.id')
                    ->join(array('h' => 'ourbank_master_paymenttypes'),'f.paymenttype_id = h.id',array('name as paymenttype'))
                    ->join(array('i' => 'ourbank_user'),'f.created_by = i.id')
		    ->join(array('j' => 'ourbank_familymember'),'a.member_id = j.id');
        }
	 else if($accountNo && $dateFrom && !$dateTo) {
        $select = $this->select()
                    ->setIntegrityCheck(false) 
                    ->join(array('a' => 'ourbank_accounts'),array('id'))
                    ->where('a.status_id = 3 OR a.status_id = 1')
                    ->where('a.account_number like "%" ? "%"',$accountNo)
                    ->where('f.transaction_date >= "'.$dateFrom.'"')
                    ->join(array('b' => 'ourbank_productsoffer'),'a.product_id = b.id')
                    ->join(array('f' => 'ourbank_transaction'),'f.account_id = a.id',array('amount_to_bank','amount_from_bank','transaction_date','transactiontype_id','balance','transaction_id as Transactionid','transaction_date'))
                    ->where('f.recordstatus_id = 3 || f.recordstatus_id = 1')
                    ->join(array('g' => 'ourbank_transactiontype'),'f.transaction_type_id = g.id')
                    ->join(array('h' => 'ourbank_master_paymenttypes'),'f.paymenttype_id = h.id',array('name as paymenttype'))
                    ->join(array('i' => 'ourbank_user'),'f.created_by = i.id')
		    ->join(array('j' => 'ourbank_familymember'),'a.member_id = j.id');

        }

	else if($accountNo && !$dateFrom && $dateTo) {
        $select = $this->select()
                    ->setIntegrityCheck(false) 
                    ->join(array('a' => 'ourbank_accounts'),array('id'))
                    ->where('a.status_id = 3 OR a.status_id = 1')
                    ->where('a.account_number like "%" ? "%"',$accountNo)
                    ->where(' f.transaction_date <= "'.$dateTo.'"')
                   ->join(array('b' => 'ourbank_productsoffer'),'a.product_id = b.id')
                    ->join(array('f' => 'ourbank_transaction'),'f.account_id = a.id',array('amount_to_bank','amount_from_bank','transaction_date','transactiontype_id','balance','transaction_id as Transactionid','transaction_date'))
                    ->where('f.recordstatus_id = 3 || f.recordstatus_id = 1')
                    ->join(array('g' => 'ourbank_transactiontype'),'f.transaction_type_id = g.id')
                    ->join(array('h' => 'ourbank_master_paymenttypes'),'f.paymenttype_id = h.id',array('name as paymenttype'))
                    ->join(array('i' => 'ourbank_user'),'f.created_by = i.id')
		    ->join(array('j' => 'ourbank_familymember'),'a.member_id = j.id');

        }
	
	else if(!$accountNo && $dateFrom && !$dateTo) {
        $select = $this->select()
                    ->setIntegrityCheck(false) 
                    ->join(array('a' => 'ourbank_accounts'),array('id'))
                    ->where('a.status_id = 3 OR a.status_id = 1')
//                      ->where('a.account_number like "%" ? "%"',$accountNo)
                    ->where('f.transaction_date >= "'.$dateFrom.'"')
                    ->join(array('b' => 'ourbank_productsoffer'),'a.product_id = b.id')
                    ->join(array('f' => 'ourbank_transaction'),'f.account_id = a.id',array('amount_to_bank','amount_from_bank','transaction_date','transactiontype_id','balance','transaction_id as Transactionid','transaction_date'))
                    ->where('f.recordstatus_id = 3 || f.recordstatus_id = 1')
                    ->join(array('g' => 'ourbank_transactiontype'),'f.transaction_type_id = g.id')
                    ->join(array('h' => 'ourbank_master_paymenttypes'),'f.paymenttype_id = h.id',array('name as paymenttype'))
                    ->join(array('i' => 'ourbank_user'),'f.created_by = i.id')
		    ->join(array('j' => 'ourbank_familymember'),'a.member_id = j.id');


        }
	else if(!$accountNo && !$dateFrom && $dateTo) {
        $select = $this->select()
                    ->setIntegrityCheck(false) 
                    ->join(array('a' => 'ourbank_accounts'),array('id'))
                    ->where('a.status_id = 3 OR a.status_id = 1')
//                      ->where('a.account_number like "%" ? "%"',$accountNo)
                    ->where('f.transaction_date <= "'.$dateTo.'"')
                    ->join(array('b' => 'ourbank_productsoffer'),'a.product_id = b.id')
                    ->join(array('f' => 'ourbank_transaction'),'f.account_id = a.id',array('amount_to_bank','amount_from_bank','transaction_date','transactiontype_id','balance','transaction_id as Transactionid','transaction_date'))
                    ->where('f.recordstatus_id = 3 || f.recordstatus_id = 1')
                     ->join(array('g' => 'ourbank_transactiontype'),'f.transaction_type_id = g.id')
                    ->join(array('h' => 'ourbank_master_paymenttypes'),'f.paymenttype_id = h.id',array('name as paymenttype'))
                    ->join(array('i' => 'ourbank_user'),'f.created_by = i.id')
		    ->join(array('j' => 'ourbank_familymember'),'a.member_id = j.id');


        }

        else  {
        $select = $this->select()
                    ->setIntegrityCheck(false) 
                    ->join(array('a' => 'ourbank_accounts'),array('id'))
                    ->where('a.status_id = 3 OR a.status_id = 1')
                    ->where('a.account_number like "%" ? "%"',$accountNo)
                    ->where('f.transaction_date >= "'.$dateFrom.'"  AND f.transaction_date <= "'.$dateTo.'"')
                    ->join(array('b' => 'ourbank_productsoffer'),'a.product_id = b.id')
                    ->join(array('f' => 'ourbank_transaction'),'f.account_id = a.id',array('amount_to_bank','amount_from_bank','transaction_date','transactiontype_id','balance','transaction_id as Transactionid','transaction_date'))
                    ->where('f.recordstatus_id = 3 || f.recordstatus_id = 1')
                    ->join(array('g' => 'ourbank_transactiontype'),'f.transactiontype_id = g.id')
                    ->join(array('h' => 'ourbank_master_paymenttypes'),'f.paymenttype_id = h.id',array('name as paymenttype'))
                    ->join(array('i' => 'ourbank_user'),'f.created_by = i.id')
		    ->join(array('j' => 'ourbank_familymember'),'a.member_id = j.id');
        }
        return $this->fetchAll($select);

    }


        public function transaction_type()
        {
            $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            $sql = 'SELECT * FROM ourbank_transaction_type ';
            $result = $this->db->fetchAll($sql);
            return $result;
        }

	public function balance($account_number)
        {
            $db = $this->getAdapter();
            $sql = 'SELECT (SUM(amount_to_bank)-SUM(amount_from_bank)) as bal FROM ourbank_transaction where account_id in(select account_id from ourbank_accounts where account_number="'.$account_number.'")';
            $result = $db->fetchAll($sql);
        return $result;
        }

        public function transactionMode()
        {
            $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            $sql = 'SELECT * FROM ourbank_paymenttypes ';
            $result = $this->db->fetchAll($sql);
            return $result;
        }
}
