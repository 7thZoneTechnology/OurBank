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
class Savingaccount_Model_Accounts extends Zend_Db_Table {
     protected $_name = 'ourbank_accounts';

     public function insertAccounts() 
     {
		$data = array('account_id'=> '');
		$this->insert($data);
     }

     public function UpDateAccounts($account_id,$accountNumber,$memberId,$productId,$grouporIndividualNumber,$createby) 
     {
        $data = array('account_number' =>$accountNumber,
                      'member_id' => $memberId,
                      'product_id' => $productId,
                      'membertype_id' => $grouporIndividualNumber,
                      'accountcreated_date' => date("Y-m-d"),
                      'accountcreated_by' => $createby,
                      'accountstatus_id'=> 1);
        $where = 'account_id = '.$account_id;
        $this->update($data , $where );
    }
	
    public function search($code) 
    {
        
		$keyvalue = array_filter($code);
		$searchcounter = count($keyvalue);
	if($searchcounter) {

$member_id=$code['s1'];
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
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
              (a.name like '".$member_id."%'  or a.familycode like '".$member_id."%') AND   
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
              (a.name like '".$member_id."%'  or a.groupcode like '".$member_id."%') AND
              substr(a.groupcode,5,1) = c.id";

        $result = $this->db->fetchAll($sql,$member_id);
         return $result;
        } else {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);

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
              a.id = d.member_id AND
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
              substr(a.groupcode,5,1) = c.id";
 
        $result = $this->db->fetchAll($sql);
          return $result;}
    }
    
    public function getDetails($code) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);

        $sql="SELECT 
              a.id as id,
              a.familycode as code,
              a.name as name,
              substr(a.familycode,5,1) as type,
              c.type as membertype,
              b.name as officename
              from
              ourbank_familymember a,
              ourbank_office b,
              ourbank_master_membertypes c
              where
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
              b.name as officename
              from
              ourbank_group a,
              ourbank_office b,
              ourbank_master_membertypes c
              where
              a.village_id= b.id and 
              substr(a.groupcode,5,1) = c.id and
              a.groupcode like '%' '$code' '%'";
              //echo $sql;
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
                B.shortname = 'ps'
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
		B.shortname = 'ps' ";
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
                substr(A.account_number,8,1) = 'S' AND
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
                substr(A.account_number,8,1) = 'S' AND
 		substr(D.groupcode,5,1) = A.membertype_id AND
		A.member_id = D.id AND
                A.product_id = B.id AND
                B.product_id = C.id AND
                C.category_id = 1";

        $result = $db->fetchAll($sql,array($code));
        return $result;
    }
    
    public function details($productId,$code) 
    {
        // Is been seen by nataraj sir
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                F.name as officename,
                F.id as officeid,
		E.id as id,
                E.familycode as code,
                substr(E.familycode,5,1) as typeID,
                E.name as name,
                B.name as productname,
                B.begindate as begindate,
                B.glsubcode_id as glsubID,
                C.minmumdeposit as minbalance,
                C.minimumbalanceforinterest as mininterest
                FROM
                ourbank_productsoffer B,
                ourbank_productssaving C,
                ourbank_familymember E,
                ourbank_office F,
	        ourbank_product G
                WHERE
                E.familycode = $code AND 
                B.id = $productId AND
                B.id = C.productsoffer_id AND
		G.id = B.product_id AND
		E.village_id = F.id AND
 		G.category_id = 1
                UNION
                SELECT 
                F.name as officename,
                F.id as officeid,
		E.id as id,
                E.groupcode as code,
                substr(E.groupcode,5,1) as typeID,
                E.name as name,
                B.name as productname,
                B.begindate as begindate,
                B.glsubcode_id as glsubID,
                C.minmumdeposit as minbalance,
                C.minimumbalanceforinterest as mininterest
                FROM
                ourbank_productsoffer B,
                ourbank_productssaving C,
                ourbank_group E,
                ourbank_office F,
		ourbank_product G
                WHERE
                E.groupcode = $code AND 
                B.id = $productId AND
                B.id = C.productsoffer_id AND
		G.id = B.product_id AND
		E.village_id = F.id AND
 		G.category_id = 1
                ";
                //echo $sql;
        return $db->fetchAll($sql,array($productId,$code));
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
    
    public function getGlcode($officeId,$glcode)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select id from ourbank_glsubcode where (office_id = $officeId && glcode_id = $glcode) ";
        return $result = $db->fetchAll($sql);
    }

    public function getMember($code)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $sql = "select 
                C.id as id,
                C.name as name
                from
                ourbank_group as A,
                ourbank_groupmembers B,
                ourbank_familymember C
                where
                A.groupcode = $code AND
                A.id = B.group_id AND
                B.member_id = C.id  
                ";
        //echo $sql;
        return $result = $db->fetchAll($sql);
    }


    public function getAccountid($memberid)
        {
            $db = Zend_Db_Table::getDefaultAdapter();
            $sql = "select id from ourbank_accounts where member_id = $memberid and tag_account != 0";
            return $result = $db->fetchOne($sql);
        }

    public function goupAcc($code,$productId,$accId,$amt,$tranID,$date,$count)
    {
        $db = $this->getAdapter();
        $group = $this->getMember($code);
        foreach($group as $group) {
                    // Acc entry
        $Accid = $this->getAccountid($group->id);

        $accdata = array('account_id' => $Accid,
                        'member_id' => $group->id,
                        'product_id' => $productId,
                        'status' => 3,
                        'created_by' => 1);
        $db->insert('ourbank_group_acccounts',$accdata);
        //Grp transaction entry
        $trandata = array('transaction_id' => $tranID,
                          'account_id' => $Accid,
                          'transaction_date' => $date,
                          'transaction_type' => 1,
                          'transaction_amount' => $amt/$count,
                          'member_id' => $group->id,
                          'transacted_by' => 1);
        $db->insert('ourbank_group_savingstransaction',$trandata);
        }
        return true; 
    }
}
