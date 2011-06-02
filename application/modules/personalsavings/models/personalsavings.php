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

class Personalsavings_Model_personalsavings extends Zend_Db_Table
{
    protected $_name = 'ourbank_accounts';

    public function accountDetailsgroup()
    {
$db = $this->getAdapter();
        $sql = 'select 
                    sum(H.amount_to_bank) - sum(H.amount_from_bank)  as BalanceAmt,
                    G.account_id,G.transaction_id, 
                    B.name as offername, 
                    C.groupcode  as membercode ,C.name as membername, 
                    A.account_number,A.accountcreated_date,
                    E.name as loginname
                    
                FROM 
                    ourbank_accounts A, 
                    ourbank_productsoffer B,
                    ourbank_group C,
                    ourbank_user E, 
                    ourbank_transaction G, 
                    ourbank_product F,
                    ourbank_savings_transaction H

               where  
                    A.id = H.account_id && 
                    G.transaction_id = H.transaction_id  && 
                    C.id = A.member_id && A.product_id = B.id &&
                    B.product_id = F.id && 
                    (A.membertype_id = 2 || A.membertype_id = 3) && 
                    E.id = A.created_by && G.account_id = A.id &&
                    F.shortname = "ps" &&
                    (A.status_id = 3 || A.status_id = 1) &&
                    (G.recordstatus_id = 3 || G.recordstatus_id = 1) group by(H.account_id)';
        $result = $db->fetchAll($sql);
        return $result;
    }
       public function accountDetailsmem()
    {
$db = $this->getAdapter();
        $sql = 'select 
                    sum(H.amount_to_bank) - sum(H.amount_from_bank)  as BalanceAmt,
                    G.account_id,G.transaction_id,G.balance, 
                    B.name as offername, 
                    C.familycode as membercode ,C.name as membername, 
                    A.account_number,A.accountcreated_date,
                    E.name as loginname
                FROM 
                    ourbank_accounts A, 
                    ourbank_productsoffer B,
                    ourbank_familymember C,
                    ourbank_user E, 
                    ourbank_transaction G, 
                    ourbank_product F,
                    ourbank_savings_transaction H
                where  
                    A.id = H.account_id && 
                    G.transaction_id = H.transaction_id  &&  
                    C.id = A.member_id && A.product_id = B.id &&
                    B.product_id = F.id && 
                    A.membertype_id = 1 && 
                    E.id = A.created_by && G.account_id = A.id &&
                    F.shortname = "ps" &&
                    (A.status_id = 3 || A.status_id = 1) &&
                    (G.recordstatus_id = 3 || G.recordstatus_id = 1)';
        $result = $db->fetchAll($sql);
        return $result;

    }
}


// 
// class Personalsavings_Model_personalsavings extends Zend_Db_Table
// {
//     protected $_name = 'ourbank_productsoffer';
// 
//     public function accountDetails()
//     {
//         $db = $this->getAdapter();
//         $sql = 'select 
//                     G.account_id,G.transaction_id,G.balance, 
//                     B.name as offername, 
//                     C.familycode as membercode ,C.name as membername, 
//                     A.account_number,A.created_date,
//                     E.name as loginname
//                 FROM 
//                     ourbank_accounts A, 
//                     ourbank_productsoffer B,
//                     ourbank_familymember C,
//                     ourbank_user E, 
//                     ourbank_transaction G, 
//                     ourbank_product F
//                 where  
//                     G.transaction_id in (select max(transaction_id) 
//                     FROM ourbank_transaction group by account_id) &&
//                     C.id = A.member_id && A.product_id = B.id &&
//                     B.product_id = F.id && 
//                     A.membertype_id = 1 && 
//                     E.id = A.created_by && G.account_id = A.id &&
//                     F.shortname = "ps" &&
//                     (A.status_id = 3 || A.status_id = 1) &&
//                     (G.recordstatus_id = 3 || G.recordstatus_id = 1)
//             UNION
//                 select 
//                     G.account_id,G.transaction_id,G.amount_to_bank,G.amount_from_bank, 
// //                     B.name as offername, 
// //                     C.groupcode  as membercode ,C.name as membername, 
// //                     A.account_number,A.created_date,
// //                     E.name as loginname
//                 FROM 
// //                     ourbank_accounts A, 
// //                     ourbank_productsoffer B,
// //                     ourbank_group C,
// //                     ourbank_user E, 
//                     ourbank_transaction G, 
// //                     ourbank_product F
//                where  
//                     G.transaction_id in (select max(transaction_id) 
//                     FROM ourbank_transaction group by account_id) &&
//                     C.id = A.member_id && A.product_id = B.id &&
//                     B.product_id = F.id && 
//                     (A.membertype_id = 2 || A.membertype_id = 3) && 
//                     E.id = A.created_by && G.account_id = A.id &&
//                     F.shortname = "ps" &&
//                     (A.status_id = 3 || A.status_id = 1) &&
//                     (G.recordstatus_id = 3 || G.recordstatus_id = 1) group by(G.account_id)';
//         $result = $db->fetchAll($sql);
//         return $result;
// 
//     }
// }
