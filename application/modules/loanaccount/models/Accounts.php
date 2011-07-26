<?php
class Loanaccount_Model_Accounts extends Zend_Db_Table 
{
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
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                a.id as id,
                a.familycode as code,
                a.name as name,
                b.name as officename,
                substr(a.familycode,5,1) as type,
                c.type as membertype
                from  
                ourbank_familymember a,
                ourbank_office b,
                ourbank_master_membertypes c,
                ourbank_group e,
                ourbank_groupmembers d
                where
                a.id=d.member_id and
                a.village_id= b.id and
                d.group_id= e.id and
                (a.name like '$code' '%'  or a.familycode like '$code' '%') AND
                substr(a.familycode,5,1) = c.id
                union
                SELECT 
                a.id as id,
                a.groupcode as code,
                a.name as name,
                b.name as officename,
                substr(a.groupcode,5,1) as type,
                c.type as membertype
                from
                ourbank_group a,
                ourbank_office b,
                ourbank_master_membertypes c,
                ourbank_groupmembers d
                where
                a.village_id= b.id and
                d.group_id= a.id and
                (a.name like '$code' '%'  or a.groupcode like '$code' '%') AND
                substr(a.groupcode,5,1) = c.id";
//         echo $sql;
        $result = $this->db->fetchAll($sql,array($code));
        return $result;
    }
    
    public function getDetails($code) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql="SELECT 
              a.id as id,
              a.familycode as code,
              a.name as name,
              b.name as officename,
	      substr(a.familycode,5,1) as type,
	      c.type as membertype
              from
              ourbank_familymember a,
              ourbank_office b,
              ourbank_master_membertypes c
              where
              a.village_id= b.id and 
	      substr(a.familycode,5,1) = c.id and
              a.familycode like '$code' '%'
              union
	      SELECT a.id as id,
              a.groupcode as code,
              a.name as name,
              b.name as officename,
              substr(a.groupcode,5,1) as type,
              c.type as membertype
              from
              ourbank_group a,
              ourbank_office b,
              ourbank_master_membertypes c
              where
              a.village_id= b.id and 
	      substr(a.groupcode,5,1) = c.id and
              a.groupcode like '$code' '%'";
        $result = $db->fetchAll($sql,array($code));
        return $result;
    }
    
    public function fetchLoanProducts($code) {
        $db = Zend_Db_Table::getDefaultAdapter();

        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "select 
                A.name as name,
                A.id as id
                from 
                ourbank_productsoffer A,
                ourbank_product B,
                ourbank_familymember C,
                ourbank_loanprocess D
                where 
                C.familycode = $code AND 
                (substr(C.familycode,5,1) = A.applicableto OR
                A.applicableto = 4 ) AND 
	        A.product_id = B.id AND 
	        C.id = D.member_id AND
	        D.status =5 AND
		B.category_id = 2
		UNION
		select
                A.name as name,
                A.id as id
                from 
                ourbank_productsoffer A,
                ourbank_product B,
                ourbank_group C,
                ourbank_loanprocess D,
                ourbank_groupmembers E
                where 
                C.groupcode = $code AND 
                (substr(C.groupcode,5,1) = A.applicableto OR
                C.id =  E.group_id AND
                A.applicableto = 4 ) AND 
	        A.product_id = B.id AND 
	        E.member_id  = D.member_id AND
	        D.status =5 AND
		B.category_id = 2
		";
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
                substr(D.familycode,5,1) = A.membertype_id AND
		A.member_id = D.id AND
                A.product_id = B.id AND
                B.product_id = C.id AND
                C.category_id = 2
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
                substr(D.groupcode,5,1) = A.membertype_id AND
		A.member_id = D.id AND
                A.product_id = B.id AND
                B.product_id = C.id AND
                C.category_id = 2
                ";
//         echo $sql;
        $result = $db->fetchAll($sql,array($code));
        return $result;
    }
    
    public function details($productId,$code) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
		E.id as memberId,
                E.familycode as code,
                substr(E.familycode,5,1) as typeID,
                E.name as name,
                F.name as officename,
                F.id as officeid,
                B.name as productname,
                B.begindate as begindate,
                B.closedate as closedate,
                B.glsubcode_id as glsubID,
                C.minmumloanamount as minamount,
                C.maximunloanamount as maxamount,
                C.penal_Interest as penalInterest,
                C.minimumfrequency as minInstallments,
                C.maximumfrequency as maxInstallments
                FROM 
                ourbank_productsoffer B,
                ourbank_productsloan C,
                ourbank_office F,
                ourbank_familymember E
                WHERE
                E.familycode = $code AND 
                B.id = $productId AND
                F.id = E.village_id AND
                B.id = C.productsoffer_id
                UNION 
                SELECT 
		E.id as memberId,
                E.groupcode as code,
                substr(E.groupcode,5,1) as typeID,
                E.name as name,
                F.name as officename,
                F.id as officeid,
                B.name as productname,
                B.begindate as begindate,
                B.closedate as closedate,
                B.glsubcode_id as glsubID,
                C.minmumloanamount as minamount,
                C.maximunloanamount as maxamount,
                C.penal_Interest as penalInterest,
                C.minimumfrequency as minInstallments,
                C.maximumfrequency as maxInstallments
                FROM 
                ourbank_productsoffer B,
                ourbank_productsloan C,
                ourbank_office F,
                ourbank_group E
                WHERE
                E.groupcode = $code AND 
                B.id = $productId AND
                F.id = E.village_id AND
                B.id = C.productsoffer_id 
                ";
//        echo $sql;
        $result = $db->fetchAll($sql,array($productId,$code));
        return $result;
    }
    
    public function getInterestRates($id)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT
                period_ofrange_description,
                Interest
                FROM
                ourbank_interest_periods
                WHERE
               	offerproduct_id = $id";
               	//echo $sql;
        $result = $db->fetchAll($sql,array($id));
        return $result;
    }
       
    public function getInterest($productId,$interest) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT 
                id,
                interest
                FROM  
                ourbank_interest_periods 
                WHERE 
                period_ofrange_monthfrom <= $interest AND
                period_ofrange_monthto >= $interest AND
                offerproduct_id = $productId";
//                echo $sql;
        $result = $db->fetchAll($sql,array($productId));
        return $result;
    }
    public function accUpdate($accId,$input)
    {
    	$where[] = "id = '".$accId."'";
	$db = $this->getAdapter();
        $result = $db->update('ourbank_accounts',$input,$where);
    
    }

    public function Updatestatus($memberId,$type){
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $data = array('status'=> 0);
        $where='member_id='.$memberId.' and membertype='.$type;
        $this->db->update('ourbank_loanprocess',$data,$where);
    }

    public function savingAcc($code)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT
                A.id,
                A.account_number
                FROM
                ourbank_accounts A,
		ourbank_familymember B
                WHERE
               	A.member_id = B.id AND
		B.familycode = $code AND 
                A.account_number LIKE '%S%' AND
                A.membertype_id = substr(B.familycode,5,1) 
                UNION   
                SELECT
                A.id,
                A.account_number
                FROM
                ourbank_accounts A,
		ourbank_group B
                WHERE
               	A.member_id = B.id AND
		B.groupcode = $code AND 
                A.account_number LIKE '%S%'  AND
                A.membertype_id = substr(B.groupcode,5,1)
                ";
        $result = $db->fetchAll($sql,array($code));
        return $result;
    }

    public function getmemberlist($memberId,$typeID)
    {
        if($typeID == 2 or $typeID == 3){
            $select=$this->select()
            ->setIntegrityCheck(false)
            ->join(array('a' => 'ourbank_group'),array('id'),array('id as groupid'))
            ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.group_id',array('b.member_id as id'))
            ->join(array('c'=>'ourbank_loanprocess'),'c.member_id=b.member_id',array('c.member_id as memberid'))
            ->where('c.membertype=?',$typeID)
            ->where('c.status=5')
            ->where('a.id=?',$memberId);
        }
        if($typeID ==1){
            $select=$this->select()
            ->setIntegrityCheck(false)
            ->join(array('a' => 'ourbank_familymember'),array('id'),array('id as groupid'))
            ->join(array('b' => 'ourbank_groupmembers'),'a.id=b.member_id',array('b.member_id as id'))
            ->join(array('c'=>'ourbank_loanprocess'),'c.member_id=b.member_id',array('c.member_id as memberid'))
            ->where('c.membertype=?',$typeID)
            ->where('c.status=5')
            ->where('a.id=?',$memberId);
        }
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray(); // return group member details
    }
}
