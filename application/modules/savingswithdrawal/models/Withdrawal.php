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
class Savingswithdrawal_Model_Withdrawal extends Zend_Db_Table 
{
    protected $_name = 'ourbank_familymember';
    public function search($acc) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql="SELECT 
               A.name as name,
               A.familycode as code,
               B.name as officename,
               B.id as officeid,
               D.account_number as number,
               D.id as accId,
               E.name as offername,
               E.glsubcode_id as gl,
               substr(A.familycode,5,1) as type,
               DATE_FORMAT(E.begindate, '%d/%m/%Y') as begindate,
               DATE_FORMAT(D.begin_date, '%d/%m/%Y') as createdDate
               FROM
               ourbank_familymember A,
               ourbank_accounts D,
               ourbank_office B,
               ourbank_productsoffer E
               WHERE
               B.id = A.village_id AND 
               (A.name = '$acc' OR D.account_number = '$acc') AND
               A.id = D.member_id AND 
               D.product_id = E.id AND
               (substr(A.familycode,5,1) = E.applicableto OR
               E.applicableto = 4) AND
               D.membertype_id = substr(A.familycode,5,1)
	       UNION
	       SELECT 
               A.name as name,
               A.groupcode as code,
               B.name as officename,
               B.id as officeid,
               D.account_number as number,
               D.id as accId,
               E.name as offername,
               E.glsubcode_id as gl,
               substr(A.groupcode,5,1) as type,
               DATE_FORMAT(E.begindate, '%d/%m/%Y') as begindate,
               DATE_FORMAT(D.begin_date, '%d/%m/%Y') as createdDate
               FROM
               ourbank_group A,
               ourbank_accounts D,
               ourbank_office B,
               ourbank_productsoffer E
               WHERE
               B.id = A.village_id AND 
               (A.name = '$acc' OR D.account_number = '$acc') AND
               A.id = D.member_id AND 
               D.product_id = E.id AND
               (substr(A.groupcode,5,1) = E.applicableto OR
               E.applicableto = 4) AND
               D.membertype_id = substr(A.groupcode,5,1)           
               ";
	//echo $sql;
        $result = $db->fetchAll($sql,array($acc));
        return $result;
    }
    public function transaction($acc) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                A.transaction_id as id,
                B.account_number as number,
                DATE_FORMAT(A.transaction_date, '%d/%m/%Y') as date,
                A.amount_to_bank as cr,
                A.amount_from_bank as dt,
                D.name as mode,
                E.name as name
                FROM 
                ourbank_transaction A,
                ourbank_accounts B,
                ourbank_master_paymenttypes D,
                ourbank_user E
                WHERE
                B.account_number  = '".$acc."' AND
                A.account_id = B.id AND
                A.paymenttype_id = D.id AND
                A.created_by = E.id  
                ORDER BY A.transaction_id DESC
                LIMIT 0,5
                ";
        $result = $db->fetchAll($sql);
        return $result;
    }
    public function deposit($acc,$amount,$date,$type,$transactionMode,$description,$paymenttype_details,$createdby) 
    {
	$cl = new App_Model_dateConvertor ();
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
	$accData = $this->search($acc);
	foreach ($accData as $accData) {
		$accId = $accData->accId;
		$gl = $accData->gl;
		$officeid = $accData->officeid;
	}
        // Transaction entry
        $input = array('account_id' => $accId,
                'glsubcode_id_to' => $gl,
                'transaction_date' => $cl->phpmysqlformat($date),
                'amount_from_bank' => $amount,
                'transactiontype_id' => 2,
                'recordstatus_id' => 3,
                'paymenttype_id'=> $transactionMode,
                'paymenttype_details'=> $paymenttype_details,
                'transaction_description' => $description,
                'balance' => $amount,
                'confirmation_flag' => 0,
                'created_by' => $createdby);
        $db->insert("ourbank_transaction",$input);
        $tranId = $db->lastInsertId('ourbank_transaction');

        // Saving transaction entry 
        $saving = array('transaction_id' => $tranId,
      	                'account_id' => $accId,
                        'transaction_date' => $cl->phpmysqlformat($date),
                        'transactiontype_id' => 2,
                        'glsubcode_id_to' => $gl,
                        'amount_from_bank' => $amount,
                        'paymenttype_id'=> $transactionMode,
                        'paymenttype_details'=> $paymenttype_details,
                        'transaction_description' => $description,
                        'transaction_by' => $createdby);
        $db->insert('ourbank_savings_transaction',$saving);
        if ((substr($acc,4,1) == 2 || substr($acc,4,1) == 3) && $type == 2) {
            $group = $this->getMember($acc);
      	    $count = count($group);
            foreach ($group as $group) {
                $groupsaving = array('transaction_id' => $tranId,
                                    'account_id' => $accId,
                                    'member_id' => $group->id,
                                    'transaction_date' => $cl->phpmysqlformat($date),
       			 	    'transaction_type' => 2,
                                    'transaction_amount' => $amount/$count,
                                    'transacted_by' => $createdby);
                $db->insert('ourbank_group_savingstransaction',$groupsaving);
            }
        }
        // Insertion into Liabilities
        $liabilities = array('office_id' => $officeid,
                            'glsubcode_id_from' => '',
                            'glsubcode_id_to' => $gl,
                            'transaction_id' => $tranId,
                            'debit' => $amount,
                            'record_status'=> 3);
        $db->insert('ourbank_Liabilities',$liabilities);
        $glresult = $this->getGlcode($officeid);
        foreach ($glresult as $glresult) {
                $cashglsubocde = $glresult->id;
        }
        // Insertion into Assets ourbank_Assets
        $assets =  array('office_id' => $officeid,
                        'glsubcode_id_from' => '',
                        'glsubcode_id_to' => $cashglsubocde,
                        'transaction_id' => $tranId,
                        'debit' => $amount,
                        'record_status' => 3);
        $db->insert('ourbank_Assets',$assets);
        return $tranId;

    }
    public function getGlcode($officeId)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
	$sql = "select id from ourbank_glsubcode where substr(header,5)=$officeId and glcode_id=2";
	return $result = $db->fetchAll($sql);
    }
    public function getMember($accNum)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select 
                C.id as code,
                C.name as name,
                C.id as id
                from
                ourbank_group as A,
                ourbank_groupmembers B,
                ourbank_familymember C,
                ourbank_accounts D
                where
                D.account_number = '".$accNum."' AND
                D.member_id = A.id AND
                A.id = B.group_id AND
                B.member_id = C.id 
                ";
	return $result = $db->fetchAll($sql);
    }
    public function groupWithdrawal($trandata)
    {
        $db = $this->getAdapter();
        //Grp transaction entry
        $db->insert('ourbank_group_savingstransaction',$trandata);
        return true; 
    }

    public function getbalance($acc){
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_accounts'),array('id'),array(null))
                ->join(array('b' => 'ourbank_savings_transaction'),'a.id = b.account_id',array('sum(amount_to_bank) - sum(amount_from_bank) as Balance'))
                ->where('a.account_number = ?',$acc);
        $result = $this->fetchAll($select);
        return $result->toArray(); // return get Balance
// die($select->__toString($select));
    }   

public function getminimumbal($acc){
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a' => 'ourbank_accounts'),array('id'),array(null))
                ->join(array('b' => 'ourbank_productsoffer'),'a.product_id = b.id',array(null))
                ->join(array('c' => 'ourbank_productssaving'),'c.productsoffer_id  = b.id',array('minmumdeposit'))
                ->where('a.account_number = ?',$acc);
        $result = $this->fetchAll($select);
        return $result->toArray(); // return get minimum Balance
// die($select->__toString($select));
    }


}

