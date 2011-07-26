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
class Overduelist_Model_Overduelist extends Zend_Db_Table { 
    protected $_name = 'ourbank_accounts';

    public function search($date,$bank,$officer)
    {
 $this->db = Zend_Db_Table::getDefaultAdapter();
     
            $sql = "SELECT
                    count(a.installment_id) AS `totalinstallments`,
                    Sum(a.installment_amount) AS `overdue`,
                    `a`.`installment_date`, 
                    `b`.`id`,
                    `c`.`account_number`,
                    `e`.`officetype_id`,
                    `f`.`name`
                    FROM 
                    `ourbank_installmentdetails` AS `a` 
                    INNER JOIN `ourbank_loanaccounts` AS `b` ON b.account_id=a.account_id 
                    INNER JOIN `ourbank_accounts` AS `c` ON c.id=b.account_id 
                    INNER JOIN `ourbank_familymember` AS `f` ON f.id=c.member_id 
                    INNER JOIN `ourbank_office` AS `e` ON e.id=f.village_id 
                    WHERE 
                    (a.installment_date <= '$date') AND 
                    (a.installment_status=5) AND 
                    (b.created_by like '%' '$officer' '%') AND 
                    (c.membertype_id=1) AND 
                    (e.id like '%' '$bank' '%') 
                    GROUP BY 
                    `a`.`account_id` 
                    UNION
                    SELECT 
                    count(a.installment_id) AS `totalinstallments`,
                    Sum(a.installment_amount) AS `overdue`,
                    `a`.`installment_date`,
                    `b`.`id`,
                    `c`.`account_number`,
                    `e`.`officetype_id`,
                    `f`.`name` 
                    FROM 
                    `ourbank_installmentdetails` AS `a` 
                    INNER JOIN `ourbank_loanaccounts` AS `b` ON b.account_id=a.account_id 
                    INNER JOIN `ourbank_accounts` AS `c` ON c.id=b.account_id 
                    INNER JOIN `ourbank_group` AS `f` ON f.id=c.member_id 
                    INNER JOIN `ourbank_office` AS `e` ON e.id=f.village_id 
                    WHERE 
                    (a.installment_date <= '$date') AND 
                    (a.installment_status=5) AND 
                    (b.created_by like '%' '$officer' '%') AND 
                    (c.membertype_id=2 or c.membertype_id=3) AND 
                    (e.id like '%' '$bank' '%') 
                    GROUP BY 
                    `a`.`account_id`";
             //echo $sql;
            $result = $this->db->fetchAll($sql);
            return $result;
     }

        public function office($hiearchyid) {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('a' => 'ourbank_office'),array('name as villagename','id as village_id'))
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

        public function getloanofficer($bankid)
        {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('a' => 'ourbank_user'),array('name','id'))
                    ->where('a.bank_id =?',$bankid);
            //die($select->__toString($select));
            return $this->fetchAll($select);
        }

        public function getbanknames($bankid)
        {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('a' => 'ourbank_office'),array('name'))
                    ->where('a.id =?',$bankid);
            //die($select->__toString($select));
            return $this->fetchAll($select);
        }

        public function getofficername($officerid)
        {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('a' => 'ourbank_user'),array('name'))
                    ->where('a.id =?',$officerid);
            //die($select->__toString($select));
            return $this->fetchAll($select);
        }
}