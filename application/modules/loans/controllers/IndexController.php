


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
class Loans_IndexController extends Zend_Controller_Action{

    public function init() 
    {
        $this->view->pageTitle="Loans";
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
 
        $this->view->adm = new App_Model_Adm();
        $this->view->dateconvert = new App_Model_dateConvertor();

            $dbobj = new Loans_Model_Loan();
            $glcodevalues = $dbobj->getAllGlcode();
            $name = array('loan');
            $saving ="not exist";
            foreach($glcodevalues as $glcodes){
                    if(in_array($glcodes->header,$name)){ 
                        $saving = "exist";
                    }
            }
            $desc = array('for loan');

            if($saving == "not exist"){
            for($i=0;$i<1;$i++){
            $Ledgertypeid = $this->view->adm->getsingleRecord('ourbank_master_ledgertypes','id','name','Assets'); // Get id for Liability

            $generateGl = $dbobj->generateGlCode($Ledgertypeid); // get Maximum value for particular ledger 
            $glCode=$generateGl->id;
            $result = $this->view->adm->getRecord('ourbank_master_ledgertypes','id',$Ledgertypeid); // Get id for Liability
                    foreach($result as $result1) {
                    $headerCon = substr($result1['name'], 0, 1);
                    }
                    if ($glCode) {
                        $fetchGlcode= $this->view->adm->getsingleRecord('ourbank_glcode','glcode','id',$glCode); // Get glcode 
                        $glCode=substr($fetchGlcode, 1, 2);
                        $glcodeId=str_pad($headerCon.(str_pad(($glCode + 1),2,0,STR_PAD_LEFT)),(8 - strlen($glCode) ),"0"); 
                        $glcode = $glcodeId;
                    } else {
                        $glcodeId=str_pad($headerCon."01",6,"0");
                        $glcode = $glcodeId;
                    }

            $dbobj->insertGlcode(array('id' => '',
                                        'glcode' => $glcode,
                                        'ledgertype_id' => $Ledgertypeid,
                                        'header' => $name[$i],
                                        'description' => $desc[$i],
                                        'created_date' =>date("Y-m-d"),
                                        'created_by'=>$this->view->createdby));
            }
            }
        }

    public function indexAction() 
    {
        $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
            $this->_redirect('index/login');
        }
        $this->view->title = $this->view->translate('Loans');
        $searchForm = new Management_Form_Search();
        $this->view->form = $searchForm;

        $loan = new Loans_Model_Loan();
        $result = $loan->getLoan();

        $page = $this->_getParam('page',1);
        $paginator = Zend_Paginator::factory($result);
        $paginator->setItemCountPerPage(5);
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;

        if ($this->_request->isPost() && $this->_request->getPost('Search')) 
        {
            $formData = $this->_request->getPost();
            if ($this->_request->isPost()) 
            {
                $formData = $this->_request->getPost();
                if ($searchForm->isValid($formData)) 
                {
                    $loan = new Loans_Model_Loan();
                    $result = $loan->searchLoan($searchForm->getValues());
                    $page = $this->_getParam('page',1);
                    $paginator = Zend_Paginator::factory($result);
                    $paginator->setItemCountPerPage(5);
                    $paginator->setCurrentPageNumber($page);
                    $this->view->paginator = $paginator;
                }
            }
        }
    }

    public function loansviewAction() 
    {
    }

    public function loansaddAction() 
    {
        $this->view->title = $this->view->translate("New loan");
        $loanForm = new Loans_Form_Loan();
        $this->view->form = $loanForm;

        $systemDate = $this->view->dateconvert->phpnormalformat(date('Y-m-d'));
        $this->view->form->begindate->setValue($systemDate); 

        $product = new Loans_Model_Product();
        $product = $product->fetchAllProductNames();
        foreach($product as $product) {
            $loanForm->product_id->addMultiOption($product['id'],$product['name']);
        }

        $membertype_id1 = $this->view->adm->viewRecord("ourbank_master_membertypes","id","DESC");
        foreach($membertype_id1 as $membertype_id){
            $loanForm->applicableto->addMultiOption($membertype_id['id'],$membertype_id['type']);
        }

        $loan = new Loans_Model_Loan();
//         $glsubcode = $loan->fetchAllglsubcode('3');//ledger id for Assets
//         foreach($glsubcode as $glsubcode) {
//             $loanForm->glsubcode_id->addMultiOption($glsubcode['id'],$glsubcode['header']."[".$glsubcode['glsubcode']."]");
//         }

//         $glsubcode = $loan->fetchAllglsubcode('2');//ledger id for income 2
//         foreach($glsubcode as $glsubcode) {
//             $loanForm->fee_glsubcode_id->addMultiOption($glsubcode['id'],$glsubcode['header']."[".$glsubcode['glsubcode']."]");
//             $loanForm->interest_glsubcode_id->addMultiOption($glsubcode['id'],$glsubcode['header']."[".$glsubcode['glsubcode']."]");
//         }

        $interesttype1 = $this->view->adm->viewRecord("ourbank_master_interesttypes","id","ASC");
        foreach($interesttype1 as $interesttypes){
            $loanForm->interesttype_id->addMultiOption($interesttypes['id'],$interesttypes['description']);
        }

        if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
            $formData = $this->_request->getPost();
            if ($this->_request->isPost()) {
                $formData = $this->_request->getPost();
                if ($loanForm->isValid($formData)) {
                    $begindate1=$this->view->dateconvert->phpmysqlformat($this->_request->getParam('begindate'));
                    $closedate1=$this->view->dateconvert->phpmysqlformat($this->_request->getParam('closedate'));
                    $begindate = $this->_request->getParam('begindate');
                    $closedate = $this->_request->getParam('closedate');
                    $minmumloanamount = $this->_request->getParam('minmumloanamount'); 
                    $maximunloanamount = $this->_request->getParam('maximunloanamount'); 
                    $minimumfrequency = $this->_request->getParam('minimumfrequency'); 
                    $maximumfrequency = $this->_request->getParam('maximumfrequency'); 

                    if($begindate1 > $closedate1) {
                        $this->view->datesinfo = "Closed date must be greater than begining date".-$begindate;
                    } elseif ($minmumloanamount > $maximunloanamount) {
                        $this->view->amounts = "Max amount must be greater than min amount".-$minmumloanamount;
                    } elseif ($minimumfrequency > $maximumfrequency) {
                        $this->view->freequency = "Maximum frequency must be greater than min frequency".-$minimumfrequency;
                    } else {
                        $productdetails = new Loans_Model_Loan();

                    $headerCon = "A";
                    $glsubcode = $loan->getGlCode('loan');
                    $glcode = $loan->getGlCodeid('loan');
                    $glcodeexist = $loan->getGlCodeexist('loan');
 
                    $glco=substr($glcodeexist, 1, 2);

                    if($glsubcode){
                        $first=substr($glsubcode, 0, 3);
                        $existcode=substr($glsubcode, 3, 3);
                        $existcode++;
                        $last = str_pad(($existcode),3,0,STR_PAD_LEFT);
                        $newglsubcode = $first.$last;                  
                    }
                    else{
                        $glcodeId=$headerCon.$glco."001";
                        $newglsubcode = $glcodeId;
                    }

                    $date=date("y/m/d H:i:s");
                    $glsubcodeid = $this->view->adm->addRecord('ourbank_glsubcode',
                                array('id' => '',
                                        'glsubcode' => $newglsubcode,
                                        'glcode_id' => $glcode,
                                        'subledger_id' => $glcode,
                                        'header' => $formData['offerproductname'],
                                        'description' => $formData['offerproduct_description'],
                                        'created_date' =>$date,
                                        'created_by'=>$this->view->createdby));

                        $result = $productdetails->addProductDetails($formData,$glsubcodeid);
                        $offerproduct_id  = Zend_Db_Table::getDefaultAdapter()->lastInsertId('ourbank_productsoffer','id');

                        $productloandetails = new Loans_Model_Productsloan();
                        $result = $productloandetails->Addproductsloan($formData,$offerproduct_id);

                        $From = $this->_request->getParam('from'); 
                        $To = $this->_request->getParam('to'); 
                        $Rate = $this->_request->getParam('rate'); 
                        $period_ofrange_description = $From.-$To;

                        $interestLoans = new Loans_Model_Interest();
                        $result = $interestLoans->Addinterestdetails($From,$To,$Rate,$period_ofrange_description,$offerproduct_id);

                        $memberCount = $this->_request->getParam('memberCount');


               

                        for ($i = 1;$i<=$memberCount; $i++)
                        {
                            $From = $this->_request->getParam('from'.$i);
                            $To = $this->_request->getParam('to'.$i); 
                            $Rate = $this->_request->getParam('rate'.$i);
                            $period_ofrange_description = $From.-$To;
                            if($From) {
                            $fMember = $productdetails->insertRow5('ourbank_interest_periods',array(
                                                'id' =>'',
                                                'period_ofrange_monthfrom' => $From,
                                                'period_ofrange_monthto'=> $To,
                                                'period_ofrange_description'=> $period_ofrange_description,
                                                'offerproduct_id' => $offerproduct_id,
                                                'Interest' => $Rate,
                                                'intereststatus_id' => 3));
                            }
                        }
                        $this->_redirect('/loans/index');
                    }
                }
            }
        }
    }

    public function loanseditAction()
    {
        $this->view->title = $this->view->translate("Edit loan");
        $offerproduct_id = (int)$this->_getParam('id');
        $this->view->offerproduct_id = $offerproduct_id;

        $loan = new Loans_Model_Loan();

        $loanForm = new Loans_Form_Loan();
        $this->view->form = $loanForm;

        $membertype_id = $this->view->adm->viewRecord("ourbank_master_membertypes","id","DESC");

        foreach($membertype_id as $membertype_id) {
                $loanForm->applicableto->addMultiOption($membertype_id['id'],$membertype_id['type']);
        }

        $product = new Loans_Model_Product();
        $product = $product->fetchAllProductNames();
        foreach($product as $product) {
                $loanForm->product_id->addMultiOption($product['id'],$product['name']);
        }

// //         $glsubcode = $loan->fetchAllglsubcode('3');//ledgercode for assets
// //         foreach($glsubcode as $glsubcode) {
// //                 $loanForm->glsubcode_id->addMultiOption($glsubcode['id'],$glsubcode['header']."[".$glsubcode['glsubcode']."]");
// //         }

//         $glsubcode = $loan->fetchAllglsubcode('2');//ledger id for income 2
//         foreach($glsubcode as $glsubcode) {
//             $loanForm->fee_glsubcode_id->addMultiOption($glsubcode['id'],$glsubcode['header']."[".$glsubcode['glsubcode']."]");
//             $loanForm->interest_glsubcode_id->addMultiOption($glsubcode['id'],$glsubcode['header']."[".$glsubcode['glsubcode']."]");
//         }

        $interesttype1 = $this->view->adm->viewRecord("ourbank_master_interesttypes","id","ASC");
        foreach($interesttype1 as $interesttypes){
                $loanForm->interesttype_id->addMultiOption($interesttypes['id'],$interesttypes['description']);
        }

        $loan = new Loans_Model_Loan();
        $result = $loan->viewLoanmy($offerproduct_id);
        $this->view->loan = $result;

        foreach($this->view->loan as $loan) {
            $this->view->form->product_id->setValue($loan['productid']);
            $this->view->form->offerproductname->setValue($loan['productname']);
            $this->view->form->offerproductshortname->setValue($loan['productshortname']);
            $this->view->form->offerproduct_description->setValue($loan['productdescription']);
            $this->view->form->begindate->setValue($this->view->dateconvert->phpnormalformat($loan['begindate']));
            $this->view->form->closedate->setValue($this->view->dateconvert->phpnormalformat($loan['closedate']));
            $this->view->form->applicableto->setValue($loan['applicableto']);
            $this->view->form->minmumloanamount->setValue($loan['minmumloanamount']);
            $this->view->form->maximunloanamount->setValue($loan['maximunloanamount']);
            $this->view->form->minimumfrequency->setValue($loan['minimumfrequency']);
            $this->view->form->maximumfrequency->setValue($loan['maximumfrequency']);
            $this->view->form->penal_Interest->setValue($loan['penal_Interest']);
// //             $this->view->form->fee_glsubcode_id->setValue($loan['fee_glsubcode_id']);
            $this->view->form->graceperiodnumber->setValue($loan['graceperiodnumber']);

// // //             $this->view->form->glsubcode_id->setValue($loan['glsubcode_id']);
            $this->view->form->interesttype_id->setValue($loan['interesttype_id']);
// // //             $this->view->form->interest_glsubcode_id->setValue($loan['Interest_glsubcode_id']);

            $offerproduct_id = $loan['productsoffer_id'];
        }

        $interest = new Loans_Model_Interest();
        $interestdeatils = $interest->Getinterestdetail($offerproduct_id);
        $this->view->interest1 = $interestdeatils;

        $loanForm->offerproductname->removeValidator('Db_NoRecordExists');
        $loanForm->offerproductshortname->removeValidator('Db_NoRecordExists');
        if ($this->_request->isPost() && $this->_request->getPost('Update')) {
            if ($this->_request->isPost()) {
                $formData = $this->_request->getPost();
                if ($loanForm->isValid($formData)) {
                        $loan = new Loans_Model_Loan();
                        $product_id = $this->_request->getParam('product_id'); 
                        $offerproductname = $this->_request->getParam('offerproductname'); 
                        $offerproductshortname = $this->_request->getParam('offerproductshortname'); 
                        $offerproduct_description = $this->_request->getParam('offerproduct_description'); 
                        $begindate = $this->view->dateconvert->phpmysqlformat($this->_request->getParam('begindate')); 
                        $closedate = $this->view->dateconvert->phpmysqlformat($this->_request->getParam('closedate')); 
                        $applicableto = $this->_request->getParam('applicableto'); 
                        $minmumloanamount = $this->_request->getParam('minmumloanamount'); 
                        $maximunloanamount = $this->_request->getParam('maximunloanamount'); 
                        $minimumfrequency = $this->_request->getParam('minimumfrequency'); 
                        $maximumfrequency = $this->_request->getParam('maximumfrequency'); 
                        $penal_Interest = $this->_request->getParam('penal_Interest');
                        $graceperiodnumber = $this->_request->getParam('graceperiodnumber'); 
//                         $glsubcode_id = $this->_request->getParam('glsubcode_id'); 
//                         $interesttype_id = $this->_request->getParam('interesttype_id'); 


                        $productnamedetails=$this->view->adm->editRecord('ourbank_product',$product_id);
                        foreach($productnamedetails as $productnamedetails) {
                                $productname=$productnamedetails['name'];
                        }

                        $applicabletodetails = $loan->viewappliesto($applicableto);
                        foreach($applicabletodetails as $applicabletodetails) {
                                $appliesto=$applicabletodetails['type'];
                        }

                    $result = $loan->viewLoanmy($offerproduct_id);
                    $this->view->loan = $result;
                    foreach($this->view->loan as $loan) {
                        $productnameold=$loan['productname1'];
                        $offerproductnameold=$loan['productname'];
                        $offerproductshortnameold=$loan['productshortname'];
                        $offerproduct_descriptionold=$loan['productdescription'];
                        $begindateold=$loan['begindate'];
                        $closedateold=$loan['closedate'];
                        $appliestoold=$loan['type'];
                        $minmumloanamountold=$loan['minmumloanamount'];
                        $maximunloanamountold=$loan['maximunloanamount'];
                        $minimumfrequencyold=$loan['minimumfrequency'];
                        $maximumfrequencyold=$loan['maximumfrequency'];
                        $penal_Interestold=$loan['penal_Interest'];
                        $graceperiodnumberold=$loan['graceperiodnumber'];

//                         $glsubcode_idold=$loan['glsubcode_id'];
//                         $interesttype_idold=$loan['interesttype_id'];
                    }

                    $updateOldloan = array('productname' => $productnameold,
                                        'offerproductname' => $offerproductnameold,
                                        'offerproductshortname' => $offerproductshortnameold,
                                        'offerproduct_description' => $offerproduct_descriptionold,
                                        'begindate' => $begindateold,
                                        'closedate' => $closedateold,
                                        'membertype' => $appliestoold,
//                                         'glsubcode_id' => $glsubcode_idold,
//                                         'interesttype_id' => $interesttype_idold,
                                        'minmumloanamount' => $minmumloanamountold,
                                        'maximunloanamount' => $maximunloanamountold,
                                        'minimumfrequency' => $minimumfrequencyold,
                                        'maximumfrequency' => $maximumfrequencyold,
                                        'penal_Interest' => $penal_Interestold,
                                        'graceperiodnumber' => $graceperiodnumberold);

                    $updateNewloan = array('productname' => $productname,
                                        'offerproductname' => $offerproductname,
                                        'offerproductshortname' => $offerproductshortname,
                                        'offerproduct_description' => $offerproduct_description,
                                        'begindate' => $begindate,
                                        'closedate' => $closedate,
                                        'membertype' => $appliesto,
//                                         'glsubcode_id' => $glsubcode_id,
//                                         'interesttype_id' => $interesttype_id,
                                        'minmumloanamount' => $minmumloanamount,
                                        'maximunloanamount' => $maximunloanamount,
                                        'minimumfrequency' => $minimumfrequency,
                                        'maximumfrequency' => $maximumfrequency,
                                        'penal_Interest' => $penal_Interest,
                                        'graceperiodnumber' => $graceperiodnumber);

                        $match = array();
                        foreach ($updateOldloan as $key=>$val) {
                            if ($val != $updateNewloan[$key]) {
                                $match[] = $key;
                            }
                        }

                        if(count($match) <= 0) {   /** if the values are not changed */
                            echo "Values are not changed in form";
                        } else {
                            if($begindate > $closedate) {
                                $this->view->datesinfo = "Closed date must be grater than beging date".-$begindate;
                            } elseif ($minmumloanamount > $maximunloanamount) { 
                                $this->view->amounts = "Max amount must be grater than min amount".-$minmumloanamount;
                            } elseif ($minimumfrequency > $maximumfrequency) { 
                                $this->view->freequency = "Maximum freequency must be grate than min freequency".-$minimumfrequency;
                            } else {


$adm = new App_Model_Adm();
$glcodes = $adm->getsingleRecord('ourbank_productsoffer','glsubcode_id','id',$offerproduct_id);


                            //Insert old data to productsofferlog
                            $productoffer=$this->view->adm->editRecord('ourbank_productsoffer',$offerproduct_id);
                            $this->view->adm->addRecord('ourbank_productsoffer_log',$productoffer[0]);
                            //Insert old data to productsloanlog
                            $loan = new Loans_Model_Loan();
                            $productloan = new Loans_Model_Productsloan();
                            $productsloan=$loan->fetchProductloan1('ourbank_productsloan',$offerproduct_id);
                            $this->view->adm->addRecord('ourbank_productsloan_log',$productsloan[0]);
                            //edit current table values
                            $loan->editOffer('ourbank_productsoffer',$formData,$offerproduct_id,$glcodes);
                            $productloan->editLoan('ourbank_productsloan',$formData,$offerproduct_id);
                            //fetch interest rates for offerproduct_id
                            $interestdetails=$loan->fetchProductloan('ourbank_interest_periods',$offerproduct_id);
                                foreach($interestdetails as $interestdetails1) {
                                        $interestdetails1['record_id']='';
                                        $loan->insertRow5('ourbank_interest_periods_log',$interestdetails1);
                                }
                        }

                        $loan->deleteRecord('ourbank_interest_periods','offerproduct_id',$offerproduct_id);

                        echo $count1 = $this->_request->getParam('count1');
                            for ($i = 1;$i <= $count1; $i++) {
                                if($this->_request->getParam('period_ofrange_monthfrom'.$i)) {
                                $period_ofrange_monthfrom = $this->_request->getParam('period_ofrange_monthfrom'.$i); 
                                $period_ofrange_monthto = $this->_request->getParam('period_ofrange_monthto'.$i);
                                $Interest = $this->_request->getParam('Interest'.$i);
                                $period_ofrange_description = $period_ofrange_monthfrom.-$period_ofrange_monthto;

                                $loan->insertRow5('ourbank_interest_periods',array(
                                                'period_ofrange_monthfrom' => $period_ofrange_monthfrom,
                                                'period_ofrange_monthto' => $period_ofrange_monthto,
                                                'period_ofrange_description' => $period_ofrange_description,
                                                'offerproduct_id' => $offerproduct_id,
                                                'Interest' => $Interest,
                                                'intereststatus_id'=> 3));
                                }
                            }

                        echo $memberCount = $this->_request->getParam('id');
                            for ($i = ($count1+1);$i<=$memberCount; $i++) {
                                $From = $this->_request->getParam('from'.$i); 
                                $To = $this->_request->getParam('to'.$i); 
                                $Rate = $this->_request->getParam('rate'.$i); 
                                $period_ofrange_description = $From.-$To;
                                if($From) {
                                    $loan->insertRow5('ourbank_interest_periods',array (
                                        'period_ofrange_monthfrom' => $From,
                                        'period_ofrange_monthto'=> $To,
                                        'period_ofrange_description'=> $period_ofrange_description,
                                        'offerproduct_id' => $offerproduct_id,
                                        'Interest' => $Rate,
                                        'intereststatus_id' => 3));
                                }
                            }
                        $this->_redirect('loans/index');
                        }
                }
            }
        }
    }

    public function loansdeleteAction() {
        $this->view->title = $this->view->translate("Delete loan");
        $offerproduct_id = $this->_getParam('id');
        $this->view->offerproduct_id = $offerproduct_id;
    }
}
