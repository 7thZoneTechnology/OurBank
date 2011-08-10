<?php
class Ledgerbalancebook_Model_Ledgerbookbalance extends Zend_Db_Table
{
protected $_name = 'ourbank_transaction';

    public function generalLedger($date) 
    {
        $db = $this->getAdapter();
        $sql = "select 
                    D.id as glsubcode_id,
                    D.header as subheader,
		   			D.glsubcode as glsubcode,
                    (sum(A.credit)+sum(A.debit)) as liabilitiesBalance
                    from 
		    ourbank_Liabilities A,
		    ourbank_glcode B,
		    ourbank_glsubcode D,
		    ourbank_transaction E
		    where (
			A.glsubcode_id_to = D.id AND 
		    B.id = D.glcode_id AND
		    B.ledgertype_id = 4 AND
		    A.transaction_id = E.transaction_id AND
                    E.transaction_date <= '$date') 
		    group by D.id";

        $result=$db->fetchAll($sql);
        return $result;

    }
    public function generalLedgerAssets($date,$branch) 
    {
        $db = $this->getAdapter();
        $sql = "select 
                    D.id as glsubcode_id,
                    D.header as subheader,
		    		D.glsubcode as glsubcode,
                    (sum(A.debit)+sum(A.credit)) as assetsBalance
                    from 
		    ourbank_Assets A,
		    ourbank_glcode B,
		    ourbank_glsubcode D,
		    ourbank_transaction E,
			ourbank_accounts F,
			ourbank_familymember G
		    where (
			A.glsubcode_id_to = D.id AND 
		    B.id = D.glcode_id AND

			F.id = E.account_id AND
			F.status_id =3 OR F.status_id =1 AND
			F.member_id = G.id AND
			G.village_id = '$branch' AND

		    B.ledgertype_id = 3 AND
		    A.transaction_id = E.transaction_id AND
                    E.transaction_date <= '$date') 
		    group by D.id";

 echo $sql;
        $result=$db->fetchAll($sql);
        return $result;

    }
	public function getOffice($id) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_master_villagelist'),array('id'))
						->where('a.village_id = ?',$id);
//die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}
	public function subofficeFromUrl($hierarchy) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id,name  FROM ourbank_office WHERE officetype_id = $hierarchy";
        $result = $this->db->fetchAll($sql,array($hierarchy));
        return $result;
    	}
	public function subgroupFromUrl($branch) {
        $this->db = Zend_Db_Table::getDefaultAdapter();
        $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT id,name  FROM ourbank_group WHERE village_id = $branch";
        $result = $this->db->fetchAll($sql,array($branch));
        return $result;


    	}
}