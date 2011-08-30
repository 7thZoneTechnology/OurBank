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

class Depositsummary_Model_Depositsummary extends Zend_Db_Table
{
    protected $_name = 'ourbank_productsoffer';

    public function fetchSavingsDetails($office_id,$hierarchy) {
		switch($hierarchy){
				case '4': {
                $select = $this->select()
                                ->setIntegrityCheck(false)  
                                ->join(array('B' => 'ourbank_productsoffer'),array('id'),array('B.name as prodoffername, count(B.name) as  countvalue'))

                                ->join(array('C'=>'ourbank_accounts'),'C.product_id = B.product_id')
                                     ->where('C.status_id = 3 || C.status_id = 1')

                                ->join(array('D' =>'ourbank_product'),'D.id = B.product_id','D.name as productname')
                                     ->where('D.category_id = 1')

                                ->join(array('E'=>'ourbank_familymember'),'E.id = C.member_id',array('E.name as membername'))

                                ->join(array('F'=>'ourbank_office'),'F.id = E.village_id',array('F.name as officename'))
                                     ->where('F.id = "'.$office_id.'"')
                                     ->group('B.name')
                                     ->order('D.name');
//                  die($select->__toString());
                $result = $this->fetchAll($select);
                return $result->toArray();
    		}break;

				case '3': {
                $select = $this->select()
                                ->setIntegrityCheck(false)  
                                ->join(array('B' => 'ourbank_productsoffer'),array('id'),array('B.name as prodoffername, count(B.name) as  countvalue'))

                                ->join(array('C'=>'ourbank_accounts'),'C.product_id = B.product_id',array('C.product_id'))
                                     ->where('C.status_id = 3 || C.status_id = 1')

                                ->join(array('D' =>'ourbank_product'),'D.id = B.product_id','D.name as productname')
                                     ->where('D.category_id = 1')

                                ->join(array('E'=>'ourbank_groupmembers'),'E.id = C.member_id',array('E.id as gmid'))
                                ->join(array('G'=>'ourbank_group'),'E.group_id = G.id',array('G.id as gid'))

                                ->from(array('F'=>'ourbank_office'))
                                     ->where('F.parentoffice_id = "'.$office_id.'"')
                                     ->group('B.name')
                                     ->order('D.name');
//                   die($select->__toString());
                $result = $this->fetchAll($select);
                return $result->toArray();
    		}break;
		}
	}
    public function accountBalanceDetails($office_id,$hierarchy)  {
		switch($hierarchy){
				case '4': {
         $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->from(array('A' => 'ourbank_accounts'),array('A.id as accid'))
                             ->where('A.status_id = 3 || A.status_id = 1')

                        ->join(array('B'=>'ourbank_productsoffer'),'A.product_id = B.id',array('B.id as offerprodid'))

						->join(array('F' =>'ourbank_savings_transaction'),'A.id = F.account_id',array('F.balance'))

                        ->join(array('J' =>'ourbank_product'),'B.product_id = J.id',array('J.id as productid'))
                             ->where('J.category_id = 1')

                        ->join(array('E'=>'ourbank_familymember'),'E.id = A.member_id',array('E.id as familymemid'))

                        ->join(array('G'=>'ourbank_office'),'G.id = E.village_id',array('G.id as officeid'))
                             ->where('G.id = "'.$office_id.'"');
//                 die($select->__toString());
                $result = $this->fetchAll($select);
                return $result->toArray();
    		}break;

				case '3': {
         $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->from(array('A' => 'ourbank_accounts'))
                             ->where('A.status_id = 3' || 'A.status_id = 1'||'A.membertype_id=2'||'A.membertype_id=3')

                        ->join(array('B'=>'ourbank_productsoffer'),'A.product_id = B.id',array('B.id as offerprodid'))

						->join(array('F' =>'ourbank_savings_transaction'),'A.id = F.account_id',array('F.balance'))

                        ->join(array('J' =>'ourbank_product'),'B.product_id = J.id')
                             ->where('J.category_id = 1')

                        ->join(array('E'=>'ourbank_groupmembers'),'E.id = A.member_id',array('E.id as gmid'))
                        ->join(array('K'=>'ourbank_group'),'E.group_id = K.id',array('K.id as gid'))

                        ->from(array('G'=>'ourbank_office'))
                             ->where('G.parentoffice_id = "'.$office_id.'"');

// //                  die($select->__toString());
                $result = $this->fetchAll($select);
                return $result->toArray();
    		}break;
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
