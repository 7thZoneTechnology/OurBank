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
// create class for fixed account 
class Fixedaccount_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
        $this->view->pageTitle = 'Fixed';
        $this->view->title = 'Accounting';
        $this->view->accounts = new Fixedaccount_Model_Accounts();
        $this->view->cl = new App_Model_dateConvertor();
        $this->view->adm = new App_Model_Adm();

        $storage = new Zend_Auth_Storage_Session();
                $data = $storage->read();
                if(!$data){
                        $this->_redirect('index/login'); // once session get expired it will redirect to Login page
                }

        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid; // get the stored session id 

        $login=new App_Model_Users();
        $loginname=$login->username($userid);
        foreach($loginname as $loginname) {
            $this->view->username=$loginname['username']; // get the user name
        }
    }
    public function indexAction() 
    {
        $accountsForm = $this->view->form = new Fixedaccount_Form_Accounts();
// // get Individual list and group list in a single instance
        if ($this->_request->isPost() && $this->_request->getPost('Search')) {
            $formData = $this->_request->getPost();
            if ($accountsForm->isValid($formData)) {
                $result = $this->view->accounts->search($this->_request->getParam('membercode'));
                if($result) {
                    $this->view->result =$result;
                 } else {
                    $this->view->errormsg = "No records found";
                }
            }
        }
       
    }

    // Display the complete details about savings 
    public function detailsAction() 
    {
        $memberId= base64_decode($this->_request->getParam('Id'));
        $memberCode= base64_decode($this->_request->getParam('code'));
        $this->view->result = $this->view->accounts->getDetails($memberCode);
        $this->view->memberId = $memberId;
        $this->view->savingsProducts = $this->view->accounts->fetchSavingsProducts($memberCode);
        $this->view->account = $this->view->accounts->accountsSearch($memberCode);
    }

    // create fixed saving account for that group or member
    public function createaccountAction()
    {
        $path=$this->view->baseUrl();
      

//                 /*fetching member code*/
                if ($this->_request->isPost()) {
                        /*if the information is Posted*/
                 $productId = base64_decode($this->_request->getPost('Id'));
                 $memberId = base64_decode($this->_request->getPost('memberId'));
                 $membercode = base64_decode($this->_request->getPost('code'));
                } else {
                        /*if the information is from url*/
               $productId = base64_decode($this->_request->getParam('Id'));
               $memberId = base64_decode($this->_request->getParam('memberId'));
               $membercode = base64_decode($this->_request->getParam('code'));
                }


      

// offer details
        $this->view->offerdetails = $this->view->accounts->getofferdetails($productId);

        foreach($this->view->offerdetails as $account) {
        $minimumbal = $account['minbalance'];
        $maxbal = $account['maxbalance'];
        }


        $fixedForm = new Fixedaccount_Form_Fixed($path,$minimumbal,$maxbal);
        $this->view->fixedForm = $fixedForm;


// check whether the group belongs to SHG or JLG and get Group members 
        if(substr($membercode,4,1)=='2' or substr($membercode,4,1)=='3') {
        $this->view->account = $this->view->accounts->detailsforgroup($membercode);
        }else {
        $this->view->account = $this->view->accounts->detailsforindividual($membercode);
        }  
// // // Zend_Debug::dump($this->view->account);





 $fixedForm->Id->setValue(base64_encode($productId));
        $fixedForm->memberId->setValue(base64_encode($memberId));
        $fixedForm->code->setValue(base64_encode($membercode));

   // get interest period 
       $interestperiods=$this->view->accounts->interestperiods($productId);
        foreach($interestperiods  as $interestperiods){ 
                $minimumperiod = $interestperiods['minperiod'];
                $interestperiods1 = $interestperiods['maxperiod'];
                }
        // load the interest periods
        for($i=$minimumperiod;$i<=$interestperiods1;$i++)  {
                $fixedForm->period->addMultiOption($productId.'-'.$i,$i);
        }

       

        // check whether the group belongs to SHG or JLG and get Group members 
        if(substr($membercode,4,1)=='2' or substr($membercode,4,1)=='3') {
            $this->view->gp_members=$groupmembers = $this->view->accounts->fetchmembers($memberId);
        }
             $this->view->interestRates = $this->view->accounts->getInterestRates($productId);
        if ($this->_request->isPost() && $this->_request->getPost('Submit')) 
        {
        $formData = $this->_request->getPost();


        if($this->_request->getPost('period')){
        $id = $this->_request->getPost('period');
        $value=explode('-',$id);
        $interestid = $this->view->accounts->getInterestvalue($value[0],$value[1]);

        foreach($interestid as $interestvalue1) {
             $interestid = $interestvalue1->id;
        }
    }

                if ($fixedForm->isValid($formData)) {

                foreach ($this->view->offerdetails as $offer) {
                    $begindate = $offer['begindate'];
                    $glsubID = $offer['glsubID'];
                } 

                foreach ($this->view->account as $account) {
                    $officeid = $account['officeid'];
                    $typeID = $account['type'];
                }

            $membercode = base64_decode($this->_request->getParam('code'));
            $type = substr($membercode,4,1);

// //                         Insertion into ourbank_account 
                $data = array('account_number' => 1,
                                'member_id' => $memberId,
                                'product_id' => $productId,
                                'begin_date' => $this->view->cl->phpmysqlformat($this->_request->getPost('date')),
                                'membertype_id' => $type,
                                'accountcreated_date'=> date('Y-m-d'),
                                'created_by' => $this->view->createdby,
                                'status_id'=>1);
                $accId = $this->view->adm->addRecord('ourbank_accounts',$data);
                        // Account number formation 
                        // <-----------14 digit number ---------->
                        // <--3-->/<--2-->/<---->/<--3-->/<--6-->
                        // 00office_id/0membertype_id/0product type/typeofacc [L/S/F/R]/00000account_id
                $b=str_pad($officeid,3,"0",STR_PAD_LEFT);
                $t=str_pad($typeID,2,"0",STR_PAD_LEFT);
                $pid=str_pad($productId,2,"0",STR_PAD_LEFT);
                $p=str_pad("F",1,"0",STR_PAD_LEFT);
                $a=str_pad($accId,6,"0",STR_PAD_LEFT);
                $account = array('account_number' =>$b.$t.$pid.$p.$a);
                $this->view->accounts->accUpdate($accId,$account);
//                         // Insertion into transaction 
                $input = array('account_id' => $accId,
                                'glsubcode_id_to' => $glsubID,
                                'transaction_date' => $this->view->cl->phpmysqlformat($this->_request->getPost('date')),
                                'amount_from_bank' => '',
                                'amount_to_bank' => $this->_request->getPost('tAmount'),
                                'paymenttype_id' => 1,
                                'transactiontype_id' => 1,
                                'recordstatus_id' => 3,
                                'transaction_description'=> "Opening amount",
                                'balance' => $this->_request->getPost('tAmount'),
                                'confirmation_flag' => 0,
                                'created_by' => $this->view->createdby);
                $tranID = $this->view->adm->addRecord('ourbank_transaction',$input);
//                     Insertion into Fixed accounts

                $begindate1=$this->view->cl->phpmysqlformat($this->_request->getPost('date'));
                $period1=$this->_request->getPost('period');echo "<br>";
                $id1=explode('-',$period1);
                $maturedate = date('Y-m-d',strtotime(date("Y-m-d", strtotime($begindate1)) . " +".$id1[1]." months"));

                $saving = array('account_id' => $accId,
                                'begin_date' => $begindate1,
                                'mature_date' => $maturedate,
                                'fixed_amount' => $this->_request->getPost('tAmount'),
                                'timefrequncy_id' => '',
                                'fixed_interest' => $interestid,
                                'premature_interest' => 1,
                                'fixedaccountstatus_id'=> 1,
                                'created_by' => $this->view->createdby,
                                'created_date' => date('Y-m-d'),
                                'recordstatus_id' => 3);
                $this->view->adm->addRecord('ourbank_fixedaccounts',$saving);
//                     Insertion into Liabilities
                $liabilities = array('office_id' => $officeid,
                                        'glsubcode_id_from' => '',
                                        'glsubcode_id_to' => $glsubID,
                                        'transaction_id' => $tranID,
                                        'credit' => $this->_request->getPost('tAmount'),
                                        'record_status'=> 3);
                $this->view->adm->addRecord('ourbank_Liabilities',$liabilities);
                $glresult = $this->view->accounts->getGlcode($officeid);
                foreach ($glresult as $glresult) {
                    $cashglsubocde = $glresult->id;
                }
//                     Insertion into group members_accounts 

                    $member_array = $groupmembers;

                    foreach($groupmembers as $member_array1) {
                        $gp_mem=array('account_id' => $accId,
                                        'member_id' => $member_array1['id'],
                                        'product_id' => $productId,
                                        'status' => 3,
                                        'created_date' => date('Y-m-d'),
                                        'created_by' => $this->view->createdby);
                        $this->view->adm->addRecord('ourbank_group_acccounts',$gp_mem);
                    }
                        if($type ==1){
                            $noofmembers = count($member_array);
                            $splitamt = ($this->_request->getPost('tAmount')) / $noofmembers;
                            foreach($member_array as $member_array1) {
                            $gp_mem=array('transaction_id' => $tranID,
                                        'account_id' => $accId,
                                        'member_id' => $member_array1['id'],
                                        'transaction_date' => date('Y-m-d'),
                                        'transaction_type' => 1,
                                        'transaction_amount' => $splitamt,
                                        'transaction_interest' => $interestid,
                                        'created_date' => date('Y-m-d'),
                                        'transaction_by' => $this->view->createdby);
                            $this->view->adm->addRecord('ourbank_group_fixedtransaction',$gp_mem);
                            }
                        }else {
                        foreach($groupmembers as $member_array1) {
                            $gp_mem=array('transaction_id' => $tranID,
                                        'account_id' => $accId,
                                        'member_id' => $member_array1['id'],
                                        'transaction_date' => date('Y-m-d'),
                                        'transaction_type' => 1,
                                        'transaction_amount' => $this->_request->getParam($member_array1['id']),
                                        'transaction_interest' => $interestid,
                                        'created_date' => date('Y-m-d'),
                                        'transaction_by' => $this->view->createdby);
                            $this->view->adm->addRecord('ourbank_group_fixedtransaction',$gp_mem);
                            }

                        }
                   // // Insertion into Assets ourbank_Assets
                $assets =  array('office_id' => $officeid,
                                'glsubcode_id_from' => '',
                                'glsubcode_id_to' => $glsubID,
                                'transaction_id' => $tranID,
                                'credit' => $this->_request->getPost('tAmount'),
                                'record_status' => 3);
                $this->view->adm->addRecord('ourbank_Assets',$assets);
                $this->_redirect("/fixedaccount/index/message/acNum/".base64_encode($b.$t.$pid.$p.$a));
            }
        }
    }

    // Once account creation got over display the account id
    public function messageAction() 
    {
        $this->view->pageTitle = 'Accounting';
        $this->view->acNum = base64_decode($this->_request->getParam('acNum'));
    }
    // Using this method we can get interest periods
    public function getinterestsAction()
    {
        $this->_helper->layout->disableLayout();
        $id = $this->_request->getParam('interest');

        $value=explode('-',$id);
        $interestvalue = $this->view->accounts->getInterestvalue($value[0],$value[1]);

        foreach($interestvalue as $interestvalue1) {
             $this->view->interest = $interestvalue1['Interest'];
             $this->view->interestid = $interestvalue1['id'];
        }
    }
}

