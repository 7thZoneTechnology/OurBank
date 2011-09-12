<?php
class Monthend_Model_Transaction extends Zend_Db_Table 
{
    protected $_name = 'ourbank_transaction';

    public function getloandetails($startdate,$enddate){
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_accounts'),array('a.id'),array('a.id','a.account_number'))
        ->join(array('b'=>'ourbank_loanaccounts'),'a.id=b.account_id',array('b.id as loanaccountid','b.loan_interest'))
        ->where('b.interesttype_id=3')
        ->join(array('c'=>'ourbank_loan_repayment'),'a.id=c.account_id',array('c.account_id','max(c.transaction_id) as paymentid'))
        ->where('c.paid_date <= "'.$enddate.'"')
        ->where('c.paid_date >= "'.$startdate.'"')
        ->where('c.monthend_tag=0')
        ->join(array('d'=>'ourbank_transaction'),'c.transaction_id=d.transaction_id',array(NULL))
        ->group('c.paid_date')
        ->group('c.account_id');
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

	public function findcurrentbalance($transid)
	{
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_loan_repayment'),array('a.id'),array('a.balanceamount','a.paid_date','a.installment_id'))
        ->where('a.transaction_id = ?',$transid);
   //     die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();

	}
	public function getmonthend($month,$year)
	{
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_monthend'),array('a.id'),array('a.id as Monthid','a.startdate','a.enddate','monthname(startdate) as Month'))
	->where('month(startdate) <= ?',$month)
	->where('month(enddate) <= ?',$month)
	->where('a.year <= ?',$year)
	->where('a.processed = 1')
	->order('a.startdate');
// // 	->limit(1);
// //        die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();

	}
    public function interestcalculation($fdate,$ldate,$trnsdate,$bal,$loaninterest,$installmentid)
    {
            $len = count($trnsdate);
                for($i=0;$i < $len;$i++)
                {
                    $be[]=explode('-',$trnsdate[$i]); //exploding
                    $gr[] = gregoriantojd($be[$i][1],$be[$i][2],$be[$i][0]); //gregorian format
                }
            // echo "len".$len;
            $fdateexp = explode('-',$fdate);
            $fdatevalue =  gregoriantojd($fdateexp[1],$fdateexp[2],$fdateexp[0]); //gregorian format

            $ldateexp = explode('-',$ldate);
            $ldatevalue =  gregoriantojd($ldateexp[1],$ldateexp[2],$ldateexp[0]); //gregorian format
            // //find difference between transaction date
            $interest = 0;
            $balance = 0;

        if($len == 0) {
            if($installmentid[0]!=1) {
            $diff = $gr[0] - $fdatevalue;
            $interest += $diff * $bal[0] * $loaninterest/100 * 1/365;
            $diff =  $ldatevalue - $gr[0];
            $interest += $diff * $bal[0] * $loaninterest/100 * 1/365;
            $balance += round($bal[0]+$interest,2);
            }
            else
            {
            $diff =  $ldatevalue - $gr[0];
            $interest += $diff * $bal[0] * $loaninterest/100 * 1/365;
            $balance += round($bal[0]+$interest,2);
            }
        }
        else {
        for($k=0;$k<$len;$k++)
	{	
                        if($k == 0) {
                            if($installmentid[$k]!=1) {
                            $diff = $gr[$k] - $fdatevalue;
                            $interest += $diff * $bal[$k] * $loaninterest/100 * 1/365;
                            }
                        } 
                        if($k != $len and $k !=0)
                        {
                           $diffdate = $gr[$k]-$gr[$k-1];
                           $interest += $diffdate * $bal[$k] * $loaninterest/100 * 1/365;
                        }

	 }
                           $diff =  $ldatevalue - $gr[$len-1];
                $interest += $diff * $bal[$len-1] * $loaninterest/100 * 1/365;
                $balance += round($bal[$len-1]+$interest,2);

        }
	
    $result = array(round($interest,2),$balance);
    return $result;
    }

    public function accUpdate($tablename,$accId,$input,$fieldname)
    {
    	$where[] = $fieldname."= '".$accId."'";
	$db = $this->getAdapter();
        $result = $db->update($tablename,$input,$where);
    }

}
