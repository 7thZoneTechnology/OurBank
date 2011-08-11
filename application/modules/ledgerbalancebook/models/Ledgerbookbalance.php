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
    public function generalLedgerAssets($fromDate,$hierarchy,$branch) 
    {if ($hierarchy==3){
        $db = $this->getAdapter();
        $sql = "select 
                    D.id as glsubcode_id,
                    D.header as subheader,
		    		D.glsubcode as glsubcode,
                    (sum(A.credit)+sum(A.debit)) as assetsBalance,
					F.id as vid,
					G.id as memberid
                    from 
		    ourbank_Assets A,
		    ourbank_glcode B,
		    ourbank_glsubcode D,
			ourbank_office F,
			ourbank_familymember G,
			ourbank_accounts H,
		    ourbank_transaction E
		    where (
			A.glsubcode_id_to = D.id AND 
		    B.id = D.glcode_id AND
		    B.ledgertype_id = 3 AND

			F.parentoffice_id ='$branch' AND
			F.id = G.village_id AND
			G.id = H.member_id AND
			H.status_id =3 OR H.status_id =1 AND
	
		    A.transaction_id = E.transaction_id AND
                    E.transaction_date <= '$fromDate') 
		    group by D.id";

        $result=$db->fetchAll($sql);
        return $result;

    }}

}