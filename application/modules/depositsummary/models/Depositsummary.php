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

    public function fetchSavingsDetails($branch)
    {

                $select = $this->select()
                                ->setIntegrityCheck(false)  
                        ->from(array('A' => 'ourbank_office'),array('A.id as vid'))
                         	 ->where('A.parentoffice_id = "'.$branch.'"')

						->join(array('b' =>'ourbank_familymember'),'A.id = b.village_id',array('b.id as memberid'))

						->join(array('C'=>'ourbank_accounts'),'b.id = C.member_id')
                       		 ->where('C.status_id =3 OR C.status_id =1')

                        ->join(array('D' =>'ourbank_product'),'D.id = C.product_id',array('D.name as productname'))
                             ->where('D.category_id = 1')

                        ->join(array('E' => 'ourbank_productsoffer'),'D.id = E.product_id',array('id'))
							 ->group('E.name')
							 ->order('D.name');

//                 die($select->__toString());
				return $this->fetchAll($select);

	}
    public function accountBalanceDetails($branch)
    {
         $select = $this->select()
                        ->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_accounts'))
                        ->where('A.status_id = 3 || A.status_id = 1')
                        ->join(array('B'=>'ourbank_productsoffer'),'A.product_id = B.id',array('B.id as offerprodid'))
                        ->join(array('F' =>'ourbank_transaction'),'A.id = F.account_id')
                        ->where('F.recordstatus_id = 3 || F.recordstatus_id = 1')
                        ->join(array('J' =>'ourbank_product'),'B.product_id = J.id')
                        ->where('J.category_id = 1')
                        ->join(array('E'=>'ourbank_familymember'),'E.id = A.member_id')
                        ->join(array('G'=>'ourbank_office'),'G.id = E.village_id')
                        ->where('G.id = "'.$branch.'"');

// die($select->__toString());
                $result = $this->fetchAll($select);
                return $result->toArray();
    }

    public function SavingsDetails()
    {

                $select = $this->select()
                                ->setIntegrityCheck(false) 
                                ->join(array('B' => 'ourbank_productsoffer'),array('id'),array('B.name as prodoffername, count(B.name) as  countvalue'))
                               ->join(array('C'=>'ourbank_accounts'),'C.product_id = B.product_id')
                               ->where('C.status_id = 3 || C.status_id = 1')
                               ->join(array('D' =>'ourbank_product'),'D.id = B.product_id','name as productname')
                               ->where('D.category_id = 1')
                                ->group('B.name')
                                ->order('D.name');
                  //die($select->__toString());
                $result = $this->fetchAll($select);
                return $result->toArray();
    }

    public function accountBalance()
    {
         $select = $this->select()
                        ->setIntegrityCheck(false) 
                        ->from(array('A' => 'ourbank_accounts'))
                        ->where('A.status_id = 3 || A.status_id = 1')
                        ->join(array('B'=>'ourbank_productsoffer'),'A.product_id = B.product_id')
                        ->join(array('F' =>'ourbank_transaction'),'A.id = F.account_id')
                        ->where('F.recordstatus_id = 3 || F.recordstatus_id = 1')
                        ->join(array('J' =>'ourbank_product'),'B.product_id = J.id',array('name as productname'))
                        ->where('J.category_id = 1');
                //die($select->__toString());
                $result = $this->fetchAll($select);
                return $result->toArray();
    }

        public function officeNamefetch($offie_id) {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->from('ourbank_office')
                ->where('id = ?',$offie_id);
        //die($select->__toString());
        $result = $this->fetchAll($select);
        return $result->toArray();
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
}
