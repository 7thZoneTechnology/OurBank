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
class Incomeexpenditure_Model_Incomeexpenditure extends Zend_Db_Table {
    protected $_name = 'ourbank_transaction';
	public function incomedetails($date) {
          /*  $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a' => 'ourbank_transaction'),array('transaction_id'),array('glsubcode_id_to','transaction_date'))
                    ->where('a.transaction_date <= "'.$date.'"')
                    ->where('a.recordstatus_id =3 OR a.recordstatus_id = 1')
                    ->join(array('b'=>'ourbank_glsubcode'),'b.id = a.glsubcode_id_to',array('header'))
                    ->join(array('c'=>'ourbank_Income'),'c.glsubcode_id_to = a.glsubcode_id_to or c.glsubcode_id_from = a.glsubcode_id_to',array('sum(credit)-sum(debit) as credit'))
                    ->where('c.recordstatus_id = 3 OR c.recordstatus_id = 1')
                    ->where('c.tranasction_id  = a.transaction_id')
                    ->group('b.header');
//             die($select->__toString());
            $result = $this->fetchAll($select);
            return $result->toArray(); */

                $db = $this->getAdapter();
                $sql = "select sum(A.credit)-sum(A.debit) as credit from ourbank_Income A 
                            where A.tranasction_id in 
                            (select B.transaction_id from ourbank_transaction B 
                             where B.transaction_date <='".$date."' and 
                             B.recordstatus_id in (3,1)) and  A.recordstatus_id in (3,1) ";
                return $db->fetchAll($sql);

// SELECT A.glsubcode_id_to, A.transaction_date, B.header, sum(credit)-sum(debit) as credit FROM ourbank_transaction as A , ourbank_glsubcode as  B , ourbank_Income as C WHERE C.glsubcode_id_to=A.glsubcode_id_to or C.glsubcode_id_from=A.glsubcode_id_to AND (A.transaction_date <= "2011-07-15") AND (A.recordstatus_id =3 OR A.recordstatus_id = 1) AND (C.recordstatus_id = 3 OR C.recordstatus_id = 1) AND (C.tranasction_id = A.transaction_id) AND B.id = A.glsubcode_id_to GROUP BY B.header

// SELECT A.glsubcode_id_to, B.header, sum(C.credit)-sum(C.debit) as credit
// FROM ourbank_transaction as A , 
// ourbank_glsubcode as  B , 
// ourbank_Income as C 
// where (C.glsubcode_id_to or C.glsubcode_id_from) in
// (select D.glsubcode_id_to from
// ourbank_transaction D
// where D.transaction_date <= "2011-07-15")
// AND 
// A.glsubcode_id_to in (select glsubcode_id_to from ourbank_Income) AND
// (A.recordstatus_id =3 OR A.recordstatus_id = 1) AND
// (C.recordstatus_id = 3 OR C.recordstatus_id = 1) AND
// B.id = A.glsubcode_id_to
// GROUP BY B.header


	} 

        public function incomedetails1($date) {

                $db = $this->getAdapter();
                $sql = "select header from ourbank_glsubcode where id in (select glsubcode_id_to from ourbank_transaction where transaction_id in (select A.tranasction_id as credit from ourbank_Income A 
                            where A.tranasction_id in 
                            (select B.transaction_id from ourbank_transaction B 
                             where B.transaction_date <='".$date."' and 
                             B.recordstatus_id in (3,1)) and  A.recordstatus_id in (3,1) group by A.tranasction_id) and subledger_id=1)";
                return $db->fetchAll($sql);

	} 

	public function expendituredetails($date) {
            /*$select = $this->select()
		->setIntegrityCheck(false)
		->join(array('a' => 'ourbank_transaction'),array('transaction_id'),array('glsubcode_id_to','transaction_date'))
		->where('a.transaction_date <= "'.$date.'"')
		->where('a.recordstatus_id =3 OR a.recordstatus_id=1')
		->join(array('b'=>'ourbank_glsubcode'),'b.id=a.glsubcode_id_to',array('header'))
		->join(array('c'=>'ourbank_Expenditure'),'c.glsubcode_id_to=a.glsubcode_id_to or c.glsubcode_id_from=a.glsubcode_id_to',array('sum(credit)-sum(debit) as credit'))
                ->where('c.recordstatus_id =3 OR c.recordstatus_id=1')
                //->where('c.tranasction_id  = a.transaction_id')
		->group('b.header');
//         die($select->__toString());
        $result = $this->fetchAll($select);
        return $result->toArray();*/
                        $db = $this->getAdapter();
                $sql = "select sum(A.credit)-sum(A.debit) as credit from ourbank_Expenditure A 
                            where A.tranasction_id in 
                            (select B.transaction_id from ourbank_transaction B 
                             where B.transaction_date <='".$date."' and 
                             B.recordstatus_id in (3,1)) and  A.recordstatus_id in (3,1) ";
                return $db->fetchAll($sql);

        }

        public function expendituredetails1($date) {

                $db = $this->getAdapter();
                $sql = "select header from ourbank_glsubcode where id in (select glsubcode_id_to from ourbank_transaction where transaction_id in (select A.tranasction_id as credit from ourbank_Expenditure A 
                            where A.tranasction_id in 
                            (select B.transaction_id from ourbank_transaction B 
                             where B.transaction_date <='".$date."' and 
                             B.recordstatus_id in (3,1)) and  A.recordstatus_id in (3,1) group by A.tranasction_id) and subledger_id=2)";
                return $db->fetchAll($sql);
        }

        public function cashdetailscredit($date) {

            $db = $this->getAdapter();
            $sql = "select sum(credit)-sum(debit) as balance from ourbank_Assets where glsubcode_id_from in
                        (select B.glsubcode_id_to from 
                        ourbank_transaction B, ourbank_glsubcode C , ourbank_Assets D
                        where B.transaction_date <='".$date."' and 
                        B.recordstatus_id in (3,1) and C.id = B.glsubcode_id_to 
                        and C.header like 'cash%')
                        or glsubcode_id_to in (select B.glsubcode_id_to from 
                        ourbank_transaction B, ourbank_glsubcode C , ourbank_Assets D
                        where B.transaction_date <='".$date."' and 
                        B.recordstatus_id in (3,1) and C.id = B.glsubcode_id_to 
                        and C.header like 'cash%')";
            return $db->fetchAll($sql);

        }

        public function cashdetailsdebit($date) {

            $db = $this->getAdapter();
            $sql = "select sum(credit)-sum(debit) as balance from ourbank_Assets where glsubcode_id_from in
                        (select B.glsubcode_id_to from 
                        ourbank_transaction B, ourbank_glsubcode C , ourbank_Assets D
                        where B.transaction_date <='".$date."' and 
                        B.recordstatus_id in (3,1) and C.id = B.glsubcode_id_to 
                        and C.header like 'cash%')
                        or glsubcode_id_to in (select B.glsubcode_id_to from 
                        ourbank_transaction B, ourbank_glsubcode C , ourbank_Assets D
                        where B.transaction_date <='".$date."' and 
                        B.recordstatus_id in (3,1) and C.id = B.glsubcode_id_to 
                        and C.header like 'cash%')";
            return $db->fetchAll($sql);

        }

}

