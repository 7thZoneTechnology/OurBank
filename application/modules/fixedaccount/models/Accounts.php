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
class Fixedaccount_Model_Accounts extends Zend_Db_Table {
     protected $_name = 'ourbank_accounts';

    public function search($code) 
    {
       $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        //a.village_id= b.id and
        //a.village_id= b.id and

        $sql="SELECT 
              DISTINCT a.id as id,
              a.familycode as code,
              a.name as name,
              b.id as officeid,
              b.name as officename,
              substr(a.familycode,5,1) as type,
	      c.type as membertype
              from
              ourbank_familymember a,
              ourbank_office b,
              ourbank_master_membertypes c,
              ourbank_groupmembers d
              where
              a.village_id= b.id and
              a.id = d.member_id and
              (a.name like '%' '$code' '%'  or a.familycode like '%' '$code' '%') AND
              substr(a.familycode,5,1) = c.id  
              union
              SELECT
	      DISTINCT a.id as id,
              a.groupcode as code,
              a.name as name,
              b.id as officeid,
              b.name as officename,
	      substr(a.groupcode,5,1) as type,
              c.type as membertype
              from
              ourbank_group a,
              ourbank_office b,
              ourbank_master_membertypes c
              where
              a.village_id= b.id and
              (a.name like '%' '$code' '%'  or a.groupcode like '%' '$code' '%') AND
              substr(a.groupcode,5,1) = c.id";
             // echo $sql;
        $result = $this->db->fetchAll($sql,array($code));
        return $result;
    }
    
    public function getDetails($code)
    {
       $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        //
        //a.village_id= b.id and

        $sql="SELECT 
                    a.id as id,
                    a.familycode as code,
                    a.name as name,
                    substr(a.familycode,5,1) as type,
                    c.type as membertype,
                    b.name as officename,
                    d.name as groupname
                    from
                    ourbank_familymember a,
                    ourbank_office b,
                    ourbank_master_membertypes c,
                    ourbank_group d,
                    ourbank_groupmembers e
                    where
                    a.id= e.member_id and 
                    e.group_id= d.id and 
                    a.village_id= b.id and 
                    substr(a.familycode,5,1) = c.id and
                    a.familycode like '%' '$code' '%'

              union

              SELECT 
                    a.id as id,
                    a.groupcode as code,
                    a.name as name,
                    substr(a.groupcode,5,1) as type,
                    c.type as membertype,
                    b.name as officename,
                    a.name as groupname
                    from
                    ourbank_group a,
                    ourbank_office b,
                    ourbank_master_membertypes c
                    where
                    a.village_id= b.id and 
                    substr(a.groupcode,5,1) = c.id and
                    a.groupcode like '%' '$code' '%'";
//               echo $sql;
        $result = $db->fetchAll($sql,array($code));
        return $result;
    }


    public function fetchSavingsProducts($code) {
       $db = Zend_Db_Table::getDefaultAdapter();

        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "select 
                A.name as name,
                A.id as id
                from 
                ourbank_productsoffer A,
                ourbank_product B,
                ourbank_familymember C
                where 
                C.familycode = $code AND 
                (substr(C.familycode,5,1) = A.applicableto OR
                A.applicableto = 4) AND 
                A.product_id = B.id AND 
                B.category_id = 1 AND
                B.shortname = 'fd'
                UNION
                select 
                A.name as name,
                A.id as id
                from 
                ourbank_productsoffer A,
                ourbank_product B,
                ourbank_group C
                where 
                C.groupcode = $code AND 
                (substr(C.groupcode,5,1) = A.applicableto OR
                A.applicableto = 4) AND 
		A.product_id = B.id AND 
		B.category_id = 1 AND
		B.shortname = 'fd' ";
        $result = $db->fetchAll($sql,array($code));
        return $result;
    }

    public function accountsSearch($code) 
    {
 $db = Zend_Db_Table::getDefaultAdapter();

        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                A.account_number as number,
                B.name as name
                FROM
                ourbank_accounts A,
                ourbank_productsoffer B,
                ourbank_product C,
                ourbank_familymember D
                WHERE
                D.familycode = $code AND
                substr(A.account_number,8,1) = 'F' AND
                substr(D.familycode,5,1) = A.membertype_id AND
                A.member_id = D.id AND
                A.product_id = B.id AND
                B.product_id = C.id AND
                C.category_id = 1
                UNION
                SELECT 
                A.account_number as number,
                B.name as name
                FROM
                ourbank_accounts A,
                ourbank_productsoffer B,
                ourbank_product C,
                ourbank_group D
                WHERE
                D.groupcode = $code AND
                substr(A.account_number,8,1) = 'F' AND
		substr(D.groupcode,5,1) = A.membertype_id AND
		A.member_id = D.id AND
                A.product_id = B.id AND
                B.product_id = C.id AND
                C.category_id = 1";

        $result = $db->fetchAll($sql,array($code));
        return $result;
           }

    public function details($productId,$membercode) 
    {
      $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);



        $sql = "SELECT 
                    E.familycode as code,
                    substr(E.familycode,5,1) as type,
                    E.name as name,
                    F.name as officename,
                    F.id as officeid,
                    B.name as productname,
                    B.begindate as begindate,
                    B.glsubcode_id as glsubID,
                    C.minimum_deposit_amount as minbalance,
                    C.penal_Interest as mininterest,
                    d.name as groupname

                    FROM 
                    ourbank_productsoffer B,
                    ourbank_product_fixedrecurring C,
                    ourbank_familymember E,
                    ourbank_office F,
                    ourbank_group d,
                    ourbank_groupmembers e
                    WHERE
                    (E.familycode like '$membercode' '%') AND 
                    B.id = $productId AND
                    B.id = C.productsoffer_id AND
                    E.id= e.member_id and 
                    e.group_id= d.id and 
                    F.id = E.village_id
                UNION
                SELECT 
                    E.groupcode as code,
                    substr(E.groupcode,5,1) as type,
                    E.name as name,
                    E.name as groupname,
                    F.name as officename,
                    F.id as officeid,
                    B.name as productname,
                    B.begindate as begindate,
                    B.glsubcode_id as glsubID,
                    C.minimum_deposit_amount as minbalance,
                    C.penal_Interest as mininterest
                    FROM 
                    ourbank_productsoffer B,
                    ourbank_product_fixedrecurring C,
                    ourbank_group E,
                    ourbank_office F
                    WHERE
                    (E.groupcode like '$membercode' '%') AND 
                    B.id = $productId AND
                    B.id = C.productsoffer_id AND
                    F.id = E.village_id";
// echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
    }

    public function getInterestRates($id)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT
                period_ofrange_description ,
                Interest
                FROM
                ourbank_interest_periods
                WHERE
               	offerproduct_id = $id 
                ";
        $result = $db->fetchAll($sql,array($id));
        return $result;
    }

    public function accUpdate($accId,$input)
    {
        $where[] = "id = '".$accId."'";
        $db = $this->getAdapter();
        $result = $db->update('ourbank_accounts',$input,$where);
    }

    public function getGlcode($officeId)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select id from ourbank_glsubcode where substr(header,5)=$officeId and glcode_id=2";
        return $result = $db->fetchAll($sql);
    }

    public function interestperiods($productId) {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select  min(period_ofrange_monthfrom) as minperiod,
                max(period_ofrange_monthto) as maxperiod 
                from ourbank_interest_periods 
                where offerproduct_id='$productId' 
                AND intereststatus_id=3 ";
        $result = $db->fetchAll($sql);
        return $result;
    }

    public function getInterestvalue($productId,$interestId) {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select  Interest,id from ourbank_interest_periods 
                where offerproduct_id= $productId 
                AND $interestId between period_ofrange_monthfrom and period_ofrange_monthto";
        $result = $db->fetchAll($sql);
        return $result;
    }

    public function fetchmembers($group_id) {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select  id,name from ourbank_familymember 
                where id in (select member_id from ourbank_groupmembers where group_id = $group_id)";
        $result = $db->fetchAll($sql);
        return $result;
    }
}
