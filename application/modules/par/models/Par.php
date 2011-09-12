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

class Par_Model_Par extends Zend_Db_Table
{	protected $_name = 'ourbank_transaction';
	
	public function parrisk($fromdate,$branchId,$officer) {

		$select = $this->select()
			->setIntegrityCheck(false)
			->join(array('A' => 'ourbank_installmentdetails'),array('Installmentserial_id'))
			->where('A.installment_date <= "'.$fromdate.'"')
			->where('A.installment_status = 5')
			->where('A.created_by like "%" ? "%"',$officer)
			->join(array('C'=>'ourbank_accounts'),'C.id = A.account_id')
			->where('C.status_id =3 OR C.status_id =1' )
			->join(array('d'=>'ourbank_familymember'),'d.id=C.member_id',array('id'))
			->join(array('e'=>'ourbank_office'),'e.id=d.village_id')
			->where('e.id  like "%" ? "%"',$branchId);
                //die($select->__toString($select));
		return $this->fetchAll($select);
	}

	public function getAmount($date1,$date2,$accno) {
		$select = $this->select()
			->setIntegrityCheck(false)
			->join(array('A' => 'ourbank_installmentdetails'),array('Installmentserial_id'),'SUM(installment_amount) as sumofdue')
			->where('A.installment_date between "'.$date1.'" and "'.$date2.'"')
			->where('A.installment_status = 5')
			->join(array('C'=>'ourbank_accounts'),'C.id = A.account_id')
			->where('C.account_number = "'.$accno.'"')
			->where('C.status_id =3 OR C.status_id =1' );
//                    die($select->__toString());

		return $this->fetchAll($select);
	}

	public function getAmount1($date1,$accno) {
		$select = $this->select()
			->setIntegrityCheck(false)
			->join(array('A' => 'ourbank_installmentdetails'),array('Installmentserial_id'),'SUM(installment_amount) as sumofdue')
			->where('A.installment_date < "'.$date1.'"')
			->where('A.installment_status = 5')
			->join(array('C'=>'ourbank_accounts'),'C.id = A.account_id')
			->where('C.account_number = "'.$accno.'"')
			->where('C.status_id =3 OR C.status_id =1' );
//                    die($select->__toString());

		return $this->fetchAll($select);
	}

	public function gettmembername($accountNo) {
		$select = $this->select()
			->setIntegrityCheck(false)
			->join(array('C'=>'ourbank_accounts'),array('account_id'))
			->where('C.account_number = "'.$accountNo.'"')
			->where('C.status_id =3 OR C.status_id =1' )
			->join(array('D'=>'ourbank_familymember'),'D.id = C.member_id');
		return $this->fetchAll($select);
	}

// 	public function getBranch() {
// 		$db = $this->getAdapter();
// 			$sql = 'select * from ourbank_office 
// 					where officetype_id in 
// 				(select officetype_id from ourbank_officehierarchy 
// 					where Hierarchy_level in
// 				(select max(Hierarchy_level) from ourbank_officehierarchy))';
// 		$result = $db->fetchAll($sql);
// 		return $result;
//         }

        public function office($hiearchyid) {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('a' => 'ourbank_office'),array('name','id'))
                    ->where('a.officetype_id =?',$hiearchyid);
            //die($select->__toString($select));
            return $this->fetchAll($select);
        }

        public function getofficehierarchy()
        {
         $db = $this->getAdapter();
        $sql = "SELECT id as hierarchyid FROM `ourbank_officehierarchy` where Hierarchy_level in (SELECT max(Hierarchy_level) FROM `ourbank_officehierarchy`)";
        $result = $db->fetchAll($sql);
        return $result;
        }

	public function getUser($branch_id) {
		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_usernamesupdates'),array('usernames_id'),array('a.firstname','a.office_id','a.user_id'))
			->where('a.office_id=?',$branch_id)
			->where('a.recordstatus_id=3')
			->join(array('b'=>'ourbank_loanaccounts'),'b.transacted_by = a.user_id')
			->group('b.transacted_by');
               die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}

	public function getUser1($branch_id) {
		$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_user'),array('id'),array('a.name as officername','a.bank_id','a.id as user_id'))
			->join(array('b'=>'ourbank_office'),'b.id = a.bank_id')
                        ->where('b.id=?',$branch_id);
                //die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}
	public function fetchbranch($branch_id) {
		$select=$this->select()
			->setIntegrityCheck(false)
			->from('ourbank_office',array('name'))
			->where('id  like "%" ? "%"',$branch_id);
//                    die($select->__toString());
		$result = $this->fetchAll($select);
		return $result->toArray();
	}
}
