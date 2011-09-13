<?php
class Ledgerbalancebook_Model_Ledgerbookbalance extends Zend_Db_Table
{
protected $_name = 'ourbank_transaction';

    public function generalLedger($date,$hierarchy,$branch) 
    {
		switch($hierarchy){
			case '4': {
        $select = $this->select()
                       	->setIntegrityCheck(false)
		->from(array('a' =>'ourbank_Liabilities'),array('(sum(a.credit)-sum(a.debit)) as liabilitiesBalance'))

		->join(array('d' =>'ourbank_glsubcode'),'a.glsubcode_id_to=d.id',array('d.id as glsubcode_id','d.header as subheader','d.glsubcode as glsubcode'))

		->join(array('b' =>'ourbank_glcode'),'b.id=d.glcode_id')
// 			 ->where('b.ledgertype_id = 4')

        ->join(array('f' => 'ourbank_office'),'f.id=a.office_id',array('id as vid'))
             ->where('f.id = "'.$branch.'"')

		->join(array('c' =>'ourbank_familymember'),'f.id=c.village_id ',array('c.id as memberid'))
/*
		->join(array('e' =>'ourbank_transaction'),'a.transaction_id=e.transaction_id')
			 ->where('e.transaction_date = "'.$date.'"')*/
			->group('d.id');

//      die($select->__toString($select));

		return $this->fetchAll($select);
		}break;

		case '3': {

        $select = $this->select()
                       	->setIntegrityCheck(false)
		->from(array('a' =>'ourbank_Liabilities'),array('(sum(a.credit)-sum(a.debit)) as liabilitiesBalance'))

		->join(array('d' =>'ourbank_glsubcode'),'a.glsubcode_id_to=d.id',array('d.id as glsubcode_id','d.header as subheader','d.glsubcode as glsubcode'))

		->join(array('b' =>'ourbank_glcode'),'b.id=d.glcode_id')
// 			 ->where('b.ledgertype_id = 4')

        ->join(array('f' => 'ourbank_office'),'f.id=a.office_id',array('id as vid'))
             ->where('f.parentoffice_id = "'.$branch.'"')

		->join(array('c' =>'ourbank_familymember'),'f.id=c.village_id ',array('c.id as memberid'))


/*
		->join(array('e' =>'ourbank_transaction'),'a.transaction_id=e.transaction_id')
			 ->where('e.transaction_date = "'.$date.'"')*/
			->group('d.id');

//    die($select->__toString($select));

		return $this->fetchAll($select);
		}break;
		}
    }
    public function generalLedgerAssets($date,$hierarchy,$branch) 
    {
		switch($hierarchy){
			case '4': {

        $select = $this->select()
                       	->setIntegrityCheck(false)
						->from(array('g' =>'ourbank_Assets'),array('g.transaction_id','sum(g.debit) as assetsBalance'))


						->join(array('f' =>'ourbank_glsubcode'),'g.glsubcode_id_to = f.id',array('f.id as glsubcode_id','f.header as subheader','f.glsubcode as glsubcode'))

						->join(array('e' =>'ourbank_glcode'),'e.id=f.glcode_id')
							 ->where('e.ledgertype_id = 3')

                        ->join(array('A' => 'ourbank_office'),'A.id=g.office_id',array('id as vid'))
                             ->where('A.id = "'.$branch.'"')

						->join(array('b' =>'ourbank_familymember'),'A.id=b.village_id ',array('b.id as memberid'))

// 						->join(array('C'=>'ourbank_accounts'),'b.id = C.member_id')
//                          	 ->where('C.status_id =3' OR 'C.status_id =1')

						->join(array('d' =>'ourbank_transaction'),'g.transaction_id = d.transaction_id')
							 ->where('d.transaction_date = "'.$date.'"')

						->group('f.id')
						->group('g.glsubcode_id_to');

//                      die($select->__toString($select));
        			return $this->fetchAll($select);} break;
					

			case '3': {

        $select = $this->select()
                       	->setIntegrityCheck(false)
						->from(array('g' =>'ourbank_Assets'),array('g.transaction_id','sum(g.debit) as assetsBalance'))


						->join(array('f' =>'ourbank_glsubcode'),'g.glsubcode_id_to = f.id',array('f.id as glsubcode_id','f.header as subheader','f.glsubcode as glsubcode'))

						->join(array('e' =>'ourbank_glcode'),'e.id=f.glcode_id')
							 ->where('e.ledgertype_id = 3')

                        ->join(array('A' => 'ourbank_office'),'A.id=g.office_id',array('id as vid'))
                             ->where('A.parentoffice_id = "'.$branch.'"')

						->join(array('b' =>'ourbank_familymember'),'A.id=b.village_id ',array('b.id as memberid'))

// 						->join(array('C'=>'ourbank_accounts'),'b.id = C.member_id')
//                          	 ->where('C.status_id =3' OR 'C.status_id =1')

						->join(array('d' =>'ourbank_transaction'),'g.transaction_id = d.transaction_id')
							 ->where('d.transaction_date = "'.$date.'"')

						->group('f.id')
						->group('g.glsubcode_id_to');

//                      die($select->__toString($select));
        			return $this->fetchAll($select);} break;
					}
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
