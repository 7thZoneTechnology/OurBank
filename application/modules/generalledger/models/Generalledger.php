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
class Generalledger_Model_Generalledger extends Zend_Db_Table
{
    protected $_name = 'ourbank_transaction';

    public function generalLedger($date1,$date2,$branch,$hierarchy){

		switch($hierarchy){
			case '3': {
        $select = $this->select()
                       	->setIntegrityCheck(false)

             ->from(array('d' => 'ourbank_glsubcode'),array('d.id as glsubcode_id','d.glsubcode as glsubcode','d.id','d.header as subheader'))

             ->join(array('a' => 'ourbank_Liabilities'),'a.glsubcode_id_to = d.id',array('sum(a.credit) as credit',
                    'sum(a.debit) as debit'))

             ->join(array('b' => 'ourbank_glcode'),'b.id=d.glcode_id')
				  ->where('b.ledgertype_id = 4')

             ->join(array('g' => 'ourbank_office'),'g.id = a.office_id')
				  ->where('g.parentoffice_id = "'.$branch.'"')

             ->join(array('h' => 'ourbank_familymember'),'g.id = h.village_id')

             ->join(array('i' => 'ourbank_accounts'),'h.id = i.member_id')
					->where('i.status_id =3' OR 'i.status_id =1')

             ->join(array('e' => 'ourbank_transaction'),'a.transaction_id = e.transaction_id')
                  ->where('e.amount_from_bank >0')
				  ->where('e.recordstatus_id = 3' OR 'e.recordstatus_id = 1')
				  ->where('e.paymenttype_id = 4')
				  ->where('e.transaction_date BETWEEN "'.$date1.'" AND "'.$date2.'"');

// // die($select->__toString($select));
		return $this->fetchAll($select);




// //         $db = $this->getAdapter();
// //         $sql = "select 
// // 					G.id as vid,
// // 					H.id as memberid,
// //                     D.id as glsubcode_id,
// // 					A.glsubcode_id_to,
// // 					D.glsubcode as glsubcode,
// // 					D.id,
// //                     D.header as subheader,
// //                     sum(A.credit) as credit,
// //                     sum(A.debit) as debit
// //                     from 
// // 		    		ourbank_Liabilities A,
// // 					ourbank_glcode B,
// // 		    		ourbank_glsubcode D,
// // 					ourbank_office G,
// // 					ourbank_familymember H,
// // 					ourbank_accounts I,
// // 					ourbank_transaction E
// // 		    		where (
// //   		  	A.glsubcode_id_to = D.id AND 
// // 			B.id = D.glcode_id AND
// // 		    B.ledgertype_id = 4 AND
// // 			G.parentoffice_id = '$branch' AND
// // 			G.id = H.village_id AND
// // 			H.id = I.member_id AND
// // 					I.status_id =3 OR I.status_id =1 AND
// // 		    A.transaction_id = E.transaction_id AND
// // 					E.amount_from_bank >0 AND
// // 					E.recordstatus_id = 3 OR E.recordstatus_id = 1 AND
// // 					E.paymenttype_id <= 4 AND
// // 			E.transaction_date BETWEEN '$date1' AND '$date2')
// // 		    group by D.id";
// // // echo $sql;
// // 
// //         $result=$db->fetchAll($sql);
// //         return $result;


    }}
    }
    public function openingBalance($date,$branch,$hierarchy){
// 	if ($hierarchy==3){
//         $db = $this->getAdapter();
//         $sql = "select 
// 					G.id as vid,
// 					H.id as memberid,
//                     F.id as glsubcode_id,
// 		    		F.glsubcode as glsubcode,
//                     F.header as subheader,
//                     (sum(A.credit)-sum(A.debit)) as openingCash
//                     from 
// 		    ourbank_Liabilities A,
// 		    ourbank_glcode B,
// 	        ourbank_transaction E,
// 			ourbank_office G,
// 			ourbank_familymember H,
// 			ourbank_accounts I,
// 		    ourbank_glsubcode F
// 		    where (A.glsubcode_id_to = F.id AND 
// 		    B.id = F.glcode_id AND
// 		    B.ledgertype_id = 4 AND
// 			G.parentoffice_id = '$branch' AND
// 			G.id = H.village_id AND
// 			H.id = I.member_id AND
// 					I.status_id =3 OR I.status_id =1 AND
// 		    A.transaction_id = E.transaction_id AND
// 					E.amount_from_bank >0 AND
// 					E.recordstatus_id = 3 OR E.recordstatus_id = 1 AND
// 					E.paymenttype_id <= 4 AND
//                     E.transaction_date < '$date') 
// 		    group by F.id";
// //echo $sql;
// 
// 
//         $result=$db->fetchAll($sql);
//         return $result;
// 	}
    }
    public function generalLedgerAssets($date1,$date2,$branch,$hierarchy){

		switch($hierarchy){
			case '3': {
        $select = $this->select()
                       	->setIntegrityCheck(false)

		->join(array('f' =>'ourbank_glsubcode'),array('f.header as subheader','f.glsubcode as glsubcode'))

		->join(array('a' =>'ourbank_Assets'),'a.glsubcode_id_to = f.id',array('sum(a.credit) as credit',
                    'sum(a.debit) as debit'))

		->join(array('b' =>'ourbank_glcode'),'b.id=f.glcode_id')

		->join(array('e' =>'ourbank_transaction'),'a.transaction_id = e.transaction_id')
			 ->where('e.amount_from_bank >0')
			 ->where('e.recordstatus_id = 3' OR 'e.recordstatus_id = 1')
			 ->where('e.paymenttype_id = 4')
			 ->where('e.transaction_date BETWEEN "'.$date1.'" AND "'.$date2.'"')

		->join(array('g' =>'ourbank_office'),'g.id = a.office_id')
			 ->where('g.parentoffice_id = "'.$branch.'"')

		->join(array('h' =>'ourbank_familymember'),'g.id = h.village_id',array('h.id as memberid'))

		->join(array('i' =>'ourbank_accounts'),'h.id = i.member_id')
			 ->where('i.status_id =3' OR 'i.status_id =1');
die($select->__toString($select));
		return $this->fetchAll($select);}break;}


//         $db = $this->getAdapter();
//         $sql = "select 
// 					G.id as vid,
// 					H.id as memberid,
//                     F.id as glsubcode_id,
// 		    		F.glsubcode as glsubcode,
//                     F.header as subheader,
//                     sum(A.credit) as credit,
//                     sum(A.debit) as debit
//                     from 
// 		    ourbank_Assets A,
// 		    ourbank_glcode B,
// 		    ourbank_transaction E,
// 			ourbank_office G,
// 			ourbank_familymember H,
// 			ourbank_accounts I,
// 		    ourbank_glsubcode F
// 		    where (A.glsubcode_id_to = F.id AND 
// 		    B.id = F.glcode_id AND
// 		    B.ledgertype_id = 3 AND
// 			G.parentoffice_id = '$branch' AND
// 			G.id = H.village_id AND
// 			H.id = I.member_id AND
// 					I.status_id =3 OR I.status_id =1 AND
// 		    A.transaction_id = E.transaction_id AND
// 					E.amount_from_bank >0 AND
// 					E.recordstatus_id = 3 OR E.recordstatus_id = 1 AND
// 					E.paymenttype_id <= 4 AND
//                     E.transaction_date BETWEEN '$date1' AND '$date2') 
// 		    group by F.id";
// //  echo $sql;
// 
//          $result=$db->fetchAll($sql);
//          return $result;

    }

    public function openingBalanceAssets($date,$branch,$hierarchy) 
    {
		switch($hierarchy){
			case '3': {
        $select = $this->select()
                       	->setIntegrityCheck(false)
		->join(array('f' =>'ourbank_glsubcode'),array('f.id as glsubcode_id','f.header as subheader','f.glsubcode as glsubcode'))

		->join(array('a' =>'ourbank_Assets'),'a.glsubcode_id_to=f.id',array('(sum(a.credit)-sum(a.debit)) as openingCash'))

		->join(array('b' =>'ourbank_glcode'),'b.id=f.glcode_id')
     		 ->where('b.ledgertype_id = 3')

		->join(array('e' =>'ourbank_transaction'),'a.transaction_id=e.transaction_id')
			 ->where('e.transaction_date = "'.$date.'"')

			 ->group('f.id');

// 			die($select->__toString($select));
		return $this->fetchAll($select);}break;}

    }

	public function suboffice($hierarchy) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id,name  FROM ourbank_office WHERE officetype_id = $hierarchy";
        $result = $this->db->fetchAll($sql,array($hierarchy));
        return $result;


    	}
	public function subgroup($branch) {
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