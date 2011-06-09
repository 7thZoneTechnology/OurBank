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
/**
* this class facilates the month-end process
* for savigs and loans
*/
class Monthend_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle='Month end';
        $this->view->adm = new App_Model_Adm ();
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();// get session values
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }

    }
    public function indexAction() 
    {
        if ($this->_request->getPost('Procced')) {
            $transaction = new Monthend_Model_Transaction();
            $tran  = $transaction->transaction();
            //
            $interest = 0; $recentInterest =0; $balance=0; $int=0; $amount=0;
            foreach ($tran as $tran) 
            {
                $accresult = $transaction->getSavingsDetails($tran->id);
                foreach ($accresult as $dat)
                {
                    $trnsdate[] = $dat->transaction_date;
                    $bal[] = $dat->balance;
                    $glSub[] = $dat->glSub;
                    $id[] = $dat->id;
                }
                $len = count($trnsdate);
                for ($i=0;$i<$len;$i++)
                {
                $be[]=explode('-',$trnsdate[$i]); //exploding
                $gr[] = gregoriantojd($be[$i][1],$be[$i][2],$be[$i][0]); //gregorian format
                }
                //find difference between transaction date
                for ($i=0;$i<$len;$i++)
                {  
                    if($i==$len-1)
                    {
                    } else {
                        $diffdate[] = $gr[$i+1]-$gr[$i]."<br>";
                    }
                }
                //Interest calculation
                if (count($diffdate)) {
                    for($i=0;$i<$len;$i++)  
                    {
                        $balance = $balance + $bal[$i];
                        if($diffdate[$i] !=0)
                        {	
                            $interest = ($diffdate[$i] * $balance * 3)/(100 * 365);
    
                        } else if ($diffdate[$i] == 0) {
                            //$interest = ($balance * 3)/(100 *365);
                        }
                        //echo "<br/>".$balance." - ".$interest." - ".$diffdate[$i]."<br/>";
                        $int += $interest;
                    }
                }
                $amount = round($int,2); 
                // Insertion into transaction 
                $input = array('account_id' => end($id),
                                'glsubcode_id_to' => end($glSub),
                                'transaction_date' => date("y/m/d H:i:s"),
                                'amount_to_bank' => $amount,
                                'paymenttype_id' => 1,
                                'transactiontype_id' => 1,
                                'recordstatus_id' => 3,
                                'transaction_description'=> "Opening amount",
                                'balance' => $amount,
                                'confirmation_flag' => 0,
                                'created_by' => 1);
                $tranID = $this->view->adm->addRecord('ourbank_transaction',$input);
                // Insertion into saving transaction 
                $saving = array('transaction_id' =>$tranID,
                                'account_id' => end($id),
                                'transaction_date' => date("y/m/d H:i:s"),
                                'transactiontype_id' => 1,
                                'glsubcode_id_to' => end($glSub),
                                'amount_to_bank' => $amount,
                                'paymenttype_id' => 1,
                                'transaction_description'=> "interest credited",
                                'transaction_by' => 1);
                $this->view->adm->addRecord('ourbank_savings_transaction',$saving);
                // Insertion into Assets Cr entry
                // Retrive the offcie id 
                $assets =  array('office_id' => 1,
                                'glsubcode_id_from' => '',
                                'glsubcode_id_to' => end($glSub),
                                'transaction_id' => $tranID,
                                'credit' => $amount,
                                'record_status' => 3);
                $this->view->adm->addRecord('ourbank_Assets',$assets);
                // Insertion into Expenditure dt entry
                // Retrive the offcie id + glsub code for expenditure
                $assets =  array('office_id' => 1,
                                'glsubcode_id_from' => '',
                                'glsubcode_id_to' => end($glSub),
                                'tranasction_id' => $tranID,
                                'debit' => $amount,
                                'recordstatus_id' => 3);
                $this->view->adm->addRecord('ourbank_Expenditure',$assets);
                // Insertion into Assets Dt entry
                // Retrive the offcie id 
                $assets =  array('office_id' => 1,
                                'glsubcode_id_from' => '',
                                'glsubcode_id_to' => end($glSub),
                                'transaction_id' => $tranID,
                                'debit' => $amount,
                                'record_status' => 3);
                $this->view->adm->addRecord('ourbank_Assets',$assets);
                $interest = 0; $amount =0; $balance=0; $int=0;
            } //end of for
            $this->_redirect("/monthend/index/message");
        }
    }
    public function messageAction() 
    {
    }
}

