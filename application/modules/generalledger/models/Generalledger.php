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


        $select = $this->select()
                       	->setIntegrityCheck(false)

             ->from(array('a' => 'ourbank_Liabilities'),array('sum(a.credit) as credit',
                    'sum(a.debit) as debit'))

             ->join(array('d' => 'ourbank_glsubcode'),'a.glsubcode_id_to = d.office_id',array('d.id as glsubcode_id','d.glsubcode as glsubcode','d.id','d.header as subheader'))

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
				  ->where('e.paymenttype_id = 1')
				  ->where('e.transaction_date BETWEEN "'.$date1.'" AND "'.$date2.'"');

//   die($select->__toString($select));
		return $this->fetchAll($select);
//     		}
// 		}
    }
    public function openingBalance($date,$branch,$hierarchy){

        $select = $this->select()
                       	->setIntegrityCheck(false)


		->from(array('a' =>'ourbank_Liabilities'),array('(sum(a.credit)-sum(a.debit)) as openingCash'))

		->join(array('f' =>'ourbank_glsubcode'),'a.glsubcode_id_to = f.id',array('f.id as glsubcode_id','f.header as subheader'))

		->join(array('b' =>'ourbank_glcode'),'b.id = f.glcode_id')

		->join(array('e' =>'ourbank_transaction'),'a.transaction_id = e.transaction_id')
			 ->where('e.amount_from_bank >0')
			 ->where('e.recordstatus_id = 3' OR 'e.recordstatus_id = 1')
			 ->where('e.paymenttype_id = 1')
			 ->where('e.transaction_date = "'.$date.'"')

		->join(array('g' =>'ourbank_office'),'a.office_id=g.id',array('g.id as vid'))
			 ->where('g.parentoffice_id = "'.$branch.'"')

		->join(array('h' =>'ourbank_familymember'),'g.id = h.village_id',array('h.id as memberid'))

		->join(array('i' =>'ourbank_accounts'),'h.id = i.member_id')
			 ->where('i.status_id =3' OR 'i.status_id =1');

// die($select->__toString($select));
		return $this->fetchAll($select);

	}

    public function generalLedgerAssets($date1,$date2,$branch,$hierarchy){

        $select = $this->select()
                       	->setIntegrityCheck(false)

		->from(array('a' =>'ourbank_Assets'),array('sum(a.credit) as credit','sum(a.debit) as debit'))

		->join(array('f' =>'ourbank_glsubcode'),'a.glsubcode_id_to = f.id',array('f.header as subheader','f.glsubcode as glsubcode'))

 		->join(array('b' =>'ourbank_glcode'),'b.id=f.glcode_id')

		->join(array('g' =>'ourbank_office'),'g.id = a.office_id')
			 ->where('g.parentoffice_id = "'.$branch.'"')

		->join(array('h' =>'ourbank_familymember'),'g.id = h.village_id',array('h.id as memberid'))

		->join(array('i' =>'ourbank_accounts'),'h.id = i.member_id')
			 ->where('i.status_id =3' OR 'i.status_id =1')

		->join(array('e' =>'ourbank_transaction'),'a.transaction_id = e.transaction_id')
 			 ->where('e.amount_from_bank >0')
			 ->where('e.recordstatus_id = 3' OR 'e.recordstatus_id = 1')
			 ->where('e.paymenttype_id = 1')
			 ->where('e.transaction_date BETWEEN "'.$date1.'" AND "'.$date2.'"')
			 ->group('f.id');
// // die($select->__toString($select));
		return $this->fetchAll($select);

    }

    public function openingBalanceAssets($date,$branch,$hierarchy) 
    {

        $select = $this->select()
                       	->setIntegrityCheck(false)

		->from(array('a' =>'ourbank_Assets'),array('(sum(a.credit)-sum(a.debit)) as openingCash'))

		->join(array('f' =>'ourbank_glsubcode'),'a.glsubcode_id_to=f.id',array('f.header as subheader','f.glsubcode as glsubcode'))

		->join(array('b' =>'ourbank_glcode'),'b.id=f.glcode_id')
     		 ->where('b.ledgertype_id = 3')

		->join(array('e' =>'ourbank_transaction'),'a.transaction_id=e.transaction_id')
			 ->where('e.transaction_date = "'.$date.'"')

		->join(array('g' =>'ourbank_office'),'g.id = a.office_id')
			 ->where('g.parentoffice_id = "'.$branch.'"')

		->join(array('h' =>'ourbank_familymember'),'g.id = h.village_id',array('h.id as memberid'))

		->join(array('i' =>'ourbank_accounts'),'h.id = i.member_id')
			 ->where('i.status_id =3' OR 'i.status_id =1')

			 ->group('f.id');

//     			die($select->__toString($select));
		return $this->fetchAll($select);

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