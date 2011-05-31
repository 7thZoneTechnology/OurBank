

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

class Summarymfi_Model_Summary extends Zend_Db_Table
{
 protected $_name = 'ourbank_office';



        public function inactiveMemberDetails() {

                $select = $this->select()
                                ->setIntegrityCheck(false) 
                                ->from(array('A' => 'ourbank_office'),array('COUNT(name)'));
                            // die($select->__toString());
                $result = $this->fetchAll($select);
                return $result;
        }
        public function allMembers() {
                $select = $this->select()
                                ->setIntegrityCheck(false) 
                                ->from(array('A' => 'ourbank_familymember'),array('COUNT(id)'));
                      //       die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
                                   }
        public function activeMembers() 
        {
                 $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a' => 'ourbank_familymember'),array('a.id'),array('a.id','a.name'))
                                 ->join(array('b' => 'ourbank_accounts'),'b.member_id=a.id',array('b.member_id'))
                                 ->where('status_id=1 or status_id=3')
                                 ->where("b.account_number LIKE '%S%' and b.membertype_id=1")
                                  ->group('b.member_id');
                $result = $this->fetchAll($select);
                return $result;
         }

         public function inactiveMembers() 
         {
                 $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a' => 'ourbank_familymember'),array('a.id'),array('a.id','a.name'))
                                 ->join(array('b' => 'ourbank_accounts'),'b.member_id=a.id',array('b.member_id'))
                                 ->where('status_id=2')
                                 ->where("b.account_number LIKE '%S%' and b.membertype_id=1")
                                 ->group('b.member_id');
                $result = $this->fetchAll($select);
                return $result;
         }

        public function groupmembers()
        {
                 $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a' => 'ourbank_group'),array('a.id'),array('a.id','a.name'))
                                 ->join(array('b' => 'ourbank_groupmembers'),'b.group_id=a.id',array('count(b.member_id) as groupmembers'))
                                 ->group('b.group_id');
                //die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
        }

    
         public function loanAccounts() 
         {

                $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a' => 'ourbank_loanaccounts'),array('id'),array('a.id','loan_amount'))
                                 ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('id as accountno'));
                //                  die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
         }

         public function activeloanAccounts() 
         {

                $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a' => 'ourbank_loanaccounts'),array('id'),array('a.id','loan_amount'))
                                 ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('id as accountno'))
                                 ->where('status_id=1 or status_id=3');
                //                  die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
         }

         public function savingAccounts() 
         {
                 $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('b' => 'ourbank_accounts'),array('b.id'),array('COUNT(b.id) as savingaccounts'))
                                 ->where('status_id=1 or status_id=3')
                                 ->where("b.account_number LIKE '%S%'");
                //die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
         }

         public function savingbalance() 
         {
                 $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a'=>'ourbank_savings_transaction'),array('a.transaction_id'),array('SUM(a.amount_to_bank) as credit','SUM(a.amount_from_bank) as debit'))
                                 ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('b.id'))
                                 ->where('b.status_id=1 or b.status_id=3');
                //die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
         }

         public function fixedAccounts() 
         {
                $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a' => 'ourbank_fixedaccounts'),array('id'),array('a.fixedaccount_id as fixedaccounts','a.fixed_amount'))
                                 ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('b.id'))
                                 ->where('b.status_id =1 or b.status_id=3');
                                 //die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
         }

         public function recurringAccounts() 
         {
                $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a' => 'ourbank_recurringaccounts'),array('id'),array('COUNT(a.recurringaccount_id ) as recurringaccounts'))
                                 ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('b.id'))
                                 ->where('b.status_id =1 or b.status_id=3');
                                 //die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
         }

         public function recurringbalance() 
         {
                $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->join(array('a' => 'ourbank_recurringpaydetails'),array('id'),array('SUM(a.rec_payment_amount) as recurringbalance'))
                                 ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('b.id'))
                                 ->where('b.status_id =1 or b.status_id=3');
                                 //die($select->__toString($select));
                $result = $this->fetchAll($select);
                return $result;
         }

         public function loanDisburse() 
         {
            $select = $this->select()
                            ->setIntegrityCheck(false)
                            ->join(array('a' => 'ourbank_loan_disbursement'),array('a.loandisbursement_id'),array('SUM(amount_disbursed)'))
                                ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('b.id'));
                                    //die($select->__toString());
            $result = $this->fetchAll($select);
            return $result;
         }

         public function activeloanDisburse() 
         {
            $select = $this->select()
                            ->setIntegrityCheck(false)
                            ->join(array('a' => 'ourbank_loan_disbursement'),array('a.loandisbursement_id'),array('SUM(amount_disbursed)'))
                                ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('b.id'))
                                 ->where('b.status_id =1 or b.status_id=3');
                                    //die($select->__toString());
            $result = $this->fetchAll($select);
            return $result;
         }

         public function loanRepay() 
         {
            $select = $this->select()
                            ->setIntegrityCheck(false)
                            ->join(array('a' => 'ourbank_loan_repayment'),array('a.id'),array('SUM(paid_amount)','SUM(paid_interest)'))
                                ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('b.id'));
                                    //die($select->__toString());
            $result = $this->fetchAll($select);
            return $result;
         }

         public function activeloanRepay() 
         {
            $select = $this->select()
                            ->setIntegrityCheck(false)
                            ->join(array('a' => 'ourbank_loan_repayment'),array('a.id'),array('SUM(paid_amount)','SUM(paid_interest)'))
                                ->join(array('b' => 'ourbank_accounts'),'b.id=a.account_id',array('b.id'))
                                 ->where('b.status_id =1 or b.status_id=3');
                                    //die($select->__toString());
            $result = $this->fetchAll($select);
            return $result;
         }

         public function rateLoan($disbursed,$paid) 
         {
            return $rate=($paid*100)/$disbursed;
         }
                public function funders() {
                      $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->from(array('A' => 'ourbank_funder'),array('COUNT(DISTINCT(name))'));
                                           // die($select->__toString());
                $result = $this->fetchAll($select);
                return $result;
                    }
                public function fundings() {
                      $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->from(array('A' => 'ourbank_funding'),array('COUNT(id)'));
                                           // die($select->__toString());
                $result = $this->fetchAll($select);
                return $result;
                    }
                public function totalFundings() {
                      $select = $this->select()
                                 ->setIntegrityCheck(false)
                                 ->from(array('A' => 'ourbank_funding'),array('SUM(amount), COUNT(id)'));
                                           // die($select->__toString());
                $result = $this->fetchAll($select);
                return $result;
                    }
            

                //three query written in Controller page worked here
                public function query1() {
                        $this->db = Zend_Db_Table::getDefaultAdapter();
                        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
                                $sql="SELECT SUM(amount_disbursed) - (SELECT SUM(paid_amount ) FROM ourbank_loan_repayment ) test FROM ourbank_loan_disbursement";
                        $result = $this->db->fetchAll($sql);
                        return $result;
                }

                public function query2() {
                        $this->db = Zend_Db_Table::getDefaultAdapter();
                        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
                                $sql1="SELECT ROUND(100 * SUM(paid_amount ) / (SELECT SUM(amount_disbursed ) FROM ourbank_loan_disbursement )) rate FROM ourbank_loan_repayment";
                        $result = $this->db->fetchAll($sql1);
                        return $result;
                }
                public function query3() {
                        $this->db = Zend_Db_Table::getDefaultAdapter();
                        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
                                 $sql2="SELECT (SUM( amount_disbursed ) - (SELECT SUM(paid_amount) FROM `ourbank_loan_repayment` )) *100 / SUM( amount_disbursed ) paid FROM `ourbank_loan_disbursement`";
                        $result = $this->db->fetchAll($sql2);
                        return $result;
                }
}

