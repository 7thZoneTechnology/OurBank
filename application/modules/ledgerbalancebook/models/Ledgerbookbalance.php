<?php
class Ledgerbalancebook_Model_Ledgerbookbalance extends Zend_Db_Table
{
protected $_name = 'ourbank_transaction';

    public function generalLedger($date,$hierarchy,$branch) 
    {
//         $db = $this->getAdapter();
//         $sql = "select 
//                     D.id as glsubcode_id,
//                     D.header as subheader,
// 		    		D.glsubcode as glsubcode,
//                     (sum(A.credit)+sum(A.debit)) as liabilitiesBalance
//                     from 
// 		    ourbank_Liabilities A,
// 		    ourbank_glcode B,
// 		    ourbank_glsubcode D,
// 		    ourbank_transaction E
// 		    where (
// 			A.glsubcode_id_to = D.id AND 
// 		    B.id = D.glcode_id AND
// 		    B.ledgertype_id = 4 AND
// 		    A.transaction_id = E.transaction_id AND
//                     E.transaction_date <= '$date') 
// 		    group by D.id";
// // echo $sql;
//         $result=$db->fetchAll($sql);
//         return $result;



        $select = $this->select()
                       	->setIntegrityCheck(false)
		->from(array('a' =>'ourbank_Assets'),array('(sum(a.credit)+sum(a.debit)) as liabilitiesBalance'))

		->join(array('d' =>'ourbank_glsubcode'),'a.glsubcode_id_to=d.id',array('d.id as glsubcode_id','d.header as subheader','d.glsubcode as glsubcode'))

		->join(array('b' =>'ourbank_glcode'),'b.id=d.glcode_id')
			 ->where('b.ledgertype_id = 4')

        ->join(array('f' => 'ourbank_office'),'f.id=a.office_id',array('id as vid'))
             ->where('f.id = "'.$branch.'"')

		->join(array('c' =>'ourbank_familymember'),'f.id=c.village_id ',array('c.id as memberid'))

		->join(array('e' =>'ourbank_transaction'),'a.transaction_id=e.transaction_id')
			 ->where('e.transaction_date = "'.$date.'"')
			->group('d.id');

// die($select->__toString($select));

		return $this->fetchAll($select);

    }
    public function generalLedgerAssets($fromDate,$hierarchy,$branch) 
    {
		switch($hierarchy){
			case '4': {

        $select = $this->select()
                       	->setIntegrityCheck(false)
						->from(array('g' =>'ourbank_Assets'),array('g.transaction_id','sum(g.credit)+sum(g.debit) as assetsBalance'))

						->join(array('f' =>'ourbank_glsubcode'),'g.glsubcode_id_to = f.id',array('f.id as glsubcode_id','f.header as subheader','f.glsubcode as glsubcode'))

						->join(array('e' =>'ourbank_glcode'),'e.id=f.glcode_id')
							 ->where('e.ledgertype_id = 3')

                        ->join(array('A' => 'ourbank_office'),'A.id=g.office_id',array('id as vid'))
                             ->where('A.id = "'.$branch.'"')

						->join(array('b' =>'ourbank_familymember'),'A.id=b.village_id ',array('b.id as memberid'))

						->join(array('C'=>'ourbank_accounts'),'b.id = C.member_id')
                         	 ->where('C.status_id =3' OR 'C.status_id =1')

						->join(array('d' =>'ourbank_transaction'),'g.transaction_id = d.transaction_id')
							 ->where('d.transaction_date = "'.$fromDate.'"')

						->group('f.id');

//                     die($select->__toString($select));
        			return $this->fetchAll($select);} break;
					

			case '3': {

        $select = $this->select()
                       	->setIntegrityCheck(false)
						->from(array('g' =>'ourbank_Assets'),array('g.transaction_id','sum(g.credit)+sum(g.debit) as assetsBalance'))

						->join(array('f' =>'ourbank_glsubcode'),'g.glsubcode_id_to = f.id',array('f.id as glsubcode_id','f.header as subheader','f.glsubcode as glsubcode'))

						->join(array('e' =>'ourbank_glcode'),'e.id=f.glcode_id')
							 ->where('e.ledgertype_id = 3')

                        ->join(array('A' => 'ourbank_office'),'A.id=g.office_id',array('id as vid'))
                             ->where('A.parentoffice_id = "'.$branch.'"')

						->join(array('b' =>'ourbank_familymember'),'A.id=b.village_id',array('b.id'))

						->join(array('C'=>'ourbank_accounts'),'b.id = C.member_id')
                         	 ->where('C.status_id =3' OR 'C.status_id =1')

						->join(array('d' =>'ourbank_transaction'),'g.transaction_id = d.transaction_id')
							 ->where('d.transaction_date = "'.$fromDate.'"')
						->group('f.id');

//                      die($select->__toString($select));
        			return $this->fetchAll($select);} break;
					}
		}

}
/*
        $db = $this->getAdapter();
        $sql = "select 
                    D.id as glsubcode_id,
                    D.header as subheader,
		    		D.glsubcode as glsubcode,
                    (sum(A.credit)+sum(A.debit)) as assetsBalance,
					F.id as vid,
					G.id as memberid
                    from 
		    ourbank_Assets A,
		    ourbank_glcode B,
		    ourbank_glsubcode D,
			ourbank_office F,
			ourbank_familymember G,
			ourbank_accounts H,
		    ourbank_transaction E
		    where (
			A.glsubcode_id_to = D.id AND 
		    B.id = D.glcode_id AND
		    B.ledgertype_id = 3 AND

			F.parentoffice_id ='$branch' AND
			F.id = G.village_id AND
			G.id = H.member_id AND
			H.status_id =3 OR H.status_id =1 AND
	
		    A.transaction_id = E.transaction_id AND
                    E.transaction_date <= '$fromDate') 
		    group by D.id";
echo $sql;
        $result=$db->fetchAll($sql);
        return $result;

    }}*/