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

class Msdetails_Model_msdetails extends Zend_Db_Table 
{
    protected $_name = 'ourbank_familymember';

    public function search($acc) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql=" SELECT 
               A.name as name,
               B.name as officename,
               B.id as officeid,
               A.groupcode as code,
               D.account_number as number,
               D.id as accId,
               E.name as offername,
               E.glsubcode_id as gl,
               substr(A.groupcode,5,1) as type,
               DATE_FORMAT(E.begindate, '%d/%m/%Y') as begindate,
               DATE_FORMAT(D.begin_date, '%d/%m/%Y') as createdDate
               FROM
               ourbank_group A,
               ourbank_office B,
               ourbank_accounts D,
               ourbank_productsoffer E
               WHERE
               (A.name = '$acc' OR D.account_number = '$acc') AND
               B.id = A.village_id AND 
               (D.membertype_id=2 OR D.membertype_id=3) AND
               A.id = D.member_id AND 
               D.product_id = E.id
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
                A.member_id,
                C.name as membername,
                B.account_number as number,
                DATE_FORMAT(A.transaction_date, '%d/%m/%Y') as date,
                A.transaction_amount,
                D.name as mode,
                E.name as name
                FROM 
                ourbank_group_savingstransaction A,
                ourbank_accounts B,
                ourbank_transactiontype D,
                ourbank_user E,
                ourbank_familymember C
                WHERE
                B.account_number  = '".$acc."' AND
                A.account_id = B.id AND
                A.transaction_type = D.id AND
                A.member_id=C.id AND
                A.transacted_by = E.id  
                ORDER BY A.transaction_id DESC
                ";

        //echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
    }

    public function getcredit($accnum,$memberid)
    {
	$db = Zend_Db_Table::getDefaultAdapter();
$db->setFetchMode(Zend_Db::FETCH_OBJ);
	$sql = "select 
                SUM(E.transaction_amount) as creditbalance
		from
		ourbank_group as A,
		ourbank_groupmembers B,
		ourbank_familymember C,
                ourbank_accounts D,
                ourbank_group_savingstransaction E
		where
		D.account_number = '".$accnum."' AND
		D.member_id = A.id AND
                E.member_id=C.id AND
		A.id = B.group_id AND
                E.transaction_type=1 AND
		B.member_id = C.id AND
                E.member_id = '".$memberid."'
                group by(E.member_id)  
		";
        //echo $sql;
	return $result = $db->fetchOne($sql);
    }

    public function getdebit($accnum,$memberid)
    {
	$db = Zend_Db_Table::getDefaultAdapter();
	$sql = "select 
                SUM(E.transaction_amount) as debitbalance
		from
		ourbank_group as A,
		ourbank_groupmembers B,
		ourbank_familymember C,
                ourbank_accounts D,
                ourbank_group_savingstransaction E
		where
		D.account_number = '".$accnum."' AND
		D.member_id = A.id AND
                E.member_id=C.id AND
		A.id = B.group_id AND
                E.transaction_type=2 AND
		B.member_id = C.id AND
                E.member_id = '".$memberid."'
                group by(E.member_id)  
		";
        //echo $sql;
	return $result = $db->fetchOne($sql);
    }

    public function groupmember($accNum)
    {
	$db = Zend_Db_Table::getDefaultAdapter();
	$sql = "select 
		C.id as code,
		C.name as name
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
        //echo $sql;
	return $result = $db->fetchAll($sql);
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
}

