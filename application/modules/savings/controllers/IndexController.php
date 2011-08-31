<?php
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
class Savings_IndexController extends Zend_Controller_Action{
	public function init() 
	{
		$this->view->pageTitle='Savings';
		$this->view->Action= $this->getRequest()->getActionName();
		if($this->_request->getParam('savingtypeId')) {
			$this->view->producttype= $this->_request->getParam('savingtypeId');
		} else {
			$this->view->producttype= $this->_request->getParam('productType');
		}
                $this->view->adm = new App_Model_Adm();



         $storage = new Zend_Auth_Storage_Session();
        $data = $storage->read();
        if(!$data){
                $this->_redirect('index/login');
        }

        $sessionName = new Zend_Session_Namespace('ourbank');
        $userid=$this->view->createdby = $sessionName->primaryuserid;

        $login=new App_Model_Users();
        $loginname=$login->username($userid);
        foreach($loginname as $loginname) {
            $this->view->username=$loginname['username'];
        }

        }

//                 $globalsession = new App_Model_Users();
//                 $this->view->globalvalue = $globalsession->getSession();// get session values
//                 $this->view->createdby = $this->view->globalvalue[0]['id'];
//                 $this->view->username = $this->view->globalvalue[0]['username'];
// 				$storage = new Zend_Auth_Storage_Session();
//         		$data = $storage->read();
//         		if(!$data){
//            		 $this->_redirect('index/login');
//         			}
// // //                 $dbobj = new Savings_Model_Savings();
// // // 
// // //                     $status = $dbobj->getStatus('Savings');
// // // 
// // //                     if(!$status) {
// // //                     $headerCon = "L";
// // //                     $glsubcode = $dbobj->genarateGlCode('personal saving');
// // //                     $glcode = $dbobj->getGlCodeid('personal saving');
// // //                     $glcodeexist = $dbobj->getGlCodeexist('personal saving');
// // //                     $glco=substr($glcodeexist, 1, 2);
// // // 
// // //                     if($glsubcode){
// // //                         $first=substr($glsubcode, 0, 3);
// // //                         $existcode=substr($glsubcode, 3, 3);
// // //                         $existcode++;
// // //                         $last = str_pad(($existcode),3,0,STR_PAD_LEFT);
// // //                         $newglsubcode = $first.$last;                  
// // //                     }
// // //                     else{
// // //                         $glcodeId=$headerCon.$glco."001";
// // //                         $newglsubcode = $glcodeId;
// // //                     }
// // //                     $date=date("y/m/d H:i:s");
// // //                     $ledgertype = $this->view->adm->getsingleRecord('ourbank_master_ledgertypes','id','name','Liabilities');// get the ledgertype for Liability
// // //                     $officeid = $this->view->adm->getsingleRecord('ourbank_user','bank_id','id',$this->view->createdby);// get the ledgertype for Liability
// // //                     // Insert glsubcode details
// // //                     $glsubcodeid = $this->view->adm->addRecord('ourbank_glsubcode',
// // //                                 array('id' => '',
// // //                                         'office_id' => $officeid,
// // //                                         'glsubcode' => $newglsubcode,
// // //                                         'glcode_id' => $glcode,
// // //                                         'subledger_id' => $ledgertype,
// // //                                         'header' => 'Savings',
// // //                                         'description' => 'Savings',
// // //                                         'created_date' =>date("Y-m-d"),
// // //                                         'created_by'=>$this->view->createdby));
// // //                 }
// // // 
// // //                 $productvalues = $dbobj->getAllOffer('Savings');
// // //                 $procuctid = $dbobj->getProductid('ps');
// // // 
// // //                 $name = 'Savings';
// // //                 $desc = 'For savings products';
// // //                     // If product offer not available we have to insert base offer details
// // //                     if(empty($productvalues)){
// // //                     $offerid = $this->view->adm->addRecord('ourbank_productsoffer',array('id' => '',
// // //                         'name' => $name,'shortname' => 'sb',
// // //                         'product_id' =>$procuctid,'description' => $desc,'begindate' => date("Y-m-d"),'closedate'=>'','applicableto' => 4,'glsubcode_id' => $glsubcodeid));
// // // 
// // //                     // Insert product saving details
// // //                     $this->view->adm->addRecord('ourbank_productssaving',
// // //                                 array('productsoffer_id' => $offerid,
// // //                                         'frequencyofdeposit' => 1,
// // //                                         'minmumdeposit' => 1,
// // //                                         'minimumbalanceforinterest' => 1,
// // //                                         'frequencyofinterestupdating' => 'AvgBalance',
// // //                                         'Int_timefrequency_id' => 1)); 
// // // 
// // // //                     // Insert product saving details
// // //                     $this->view->adm->addRecord('ourbank_interest_periods',
// // //                                 array('id' => '',
// // //                                         'period_ofrange_monthfrom' => 1,
// // //                                         'period_ofrange_monthto' => 2,
// // //                                         'period_ofrange_description' => '1-1 Months',
// // //                                         'offerproduct_id' => $offerid,
// // //                                         'Interest' => 1,
// // //                                         'intereststatus_id' => 3));
// // //                 
// // // 
// // //                 }

// // // 	 }
	 
	public function indexAction() {
                //  when delete particular saving product offer we should check that particular saving product offer is used by other one or not according to result we should delete that record if that saving product offer is used by some one then we should display message
              
		$this->view->title = "Savings";
		$searchForm = new Savings_Form_Search();
		$this->view->form = $searchForm;
		$offerproduct = new Savings_Model_Savings();
if($_POST)
            $postedvalues = $this->view->adm->commonsearchquery($_REQUEST,1);
	else
	   $postedvalues = $this->view->adm->commonsearchquery($_REQUEST,2); 

                        $result = $offerproduct->SearchofferProduct($postedvalues); // get savings details

        $page = $this->_getParam('page',1);
        $this->view->paginator = $this->view->adm->commonsearch($result,$page);
        $this->view->requestvalues=$this->view->adm->encodedvalue($postedvalues);
			
		
	}

	public function savingsaddAction() { 
		$this->view->title = "Add Savings";
		$savingsForm = new Savings_Form_Savings();
		$this->view->form = $savingsForm;

		$offerproduct = new Savings_Model_Savings();
		$productDetails = $offerproduct->getProductDetails();
		foreach($productDetails as $product) {
			$savingsForm->productType->addMultiOption($product['shortname'],$product['name']);
		}
		$this->view->producttype= $this->_request->getParam('productType');
		if($this->view->producttype=='ps') { // if it is personal saving type navigate page to personal savings
			$this->persnolsavingsAction();
		}

		if($this->view->producttype=='fd') { // if it is fixed saving type navigate page to personal savings
			$this->fixedsavingsAction();
		}

		if($this->view->producttype=='rd') {// if it is recurring saving type navigate page to personal savings
			$this->recurringsavingsAction();
		}
	}
 
	public function persnolsavingsAction() {  

            // disable the layout to load new action page in common page
            $this->_helper->layout->disableLayout();
            $savingsForm = new Savings_Form_Savings();
            $this->view->producttype = 'ps';
            $this->view->form = $savingsForm;
		$savings = new Savings_Model_Savings();
		$select = $savings->fetchAllTimeFrequencyType();
                // load frequency type 
		foreach($select as $timefrequencytype) {
			$savingsForm->frequencyofdeposit->addMultiOption($timefrequencytype['id'],$timefrequencytype['name']);
                $savingsForm->Int_timefrequency_id->addMultiOption($timefrequencytype['id'],$timefrequencytype['name']);
		}
//                 // load applicable to  
// 
		$applicableto = $savings->fetchAllMemberType();
		foreach($applicableto as $applicableto) {
			$savingsForm->applicableto->addMultiOption($applicableto['id'],$applicableto['type']);
		}
// 
// // 		$glsubcode = $savings->fetchAllglsubcode('Liabilities');
// //                 // load glsubcode ids
// //                 if($glsubcode){
// //                     foreach($glsubcode as $glsubcode) {
// //                             $savingsForm->glsubcode_id->addMultiOption($glsubcode->id,$glsubcode->header." -[".$glsubcode->glsubcode."]");
// //                     }
// //                 }
       
// // //                 $feeglcode = $savings->fetchAllglsubcode('Expenditure');
// // //          if($feeglcode){
// // //                     foreach($feeglcode as $feeglcodes) {
// // //                         $savingsForm->feeglcode->addMultiOption($feeglcodes->id,$feeglcodes->header);
// // //                     }
// // //                 }
            if ($this->_request->isPost() && $this->_request->getPost('Submit')) { 

                    $formData = $this->_request->getPost();

                    $savingsForm->closedate->setRequired(false);
                    $savingsForm->minimum_deposit_amount->setRequired(false);
                    $savingsForm->maximum_deposit_amount->setRequired(false);
                    $savingsForm->frequency_of_deposit->setRequired(false);
                    $savingsForm->penal_Interest->setRequired(false);

                    // get all given input values
                    $closeddate = $this->_request->getParam('closedate');
                    $productType = $this->_request->getParam('productType');
                    $interestfrom = $this->_request->getParam('interestfrom'); 
                    $interestto = $this->_request->getParam('interestto');
                    $interestrate = $this->_request->getParam('interestrate');
                    $currentdate = $this->_request->getParam('currentdates');
                    $begindate = $this->_request->getParam('begindate');
                    $month='months';
                    $memberCount = $this->_request->getParam('memberCount');

                    $headerCon = "L";
                    $glsubcode = $savings->genarateGlCode('personal saving');
                    $glcode = $savings->getGlCodeid('personal saving');
                    $glcodeexist = $savings->getGlCodeexist('personal saving');
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


            // //get product id 
            $product_id = $this->view->adm->getsingleRecord('ourbank_product','id','shortname',$productType);
            $this->view->product_id = $product_id;

              $result=$savings->addofferproduct($formData,$product_id,$closeddate,$glsubcodeid);  //Insert Products offer 
                        $offerproductupdate_id  = Zend_Db_Table::getDefaultAdapter()->lastInsertId('ourbank_productsoffer','id');

                $result = $savings->addofferproductsavings($formData,$offerproductupdate_id);//Insert Products saving
                // insert interest period values
$countinterest = count($interestfrom);
for($i=0;$i<$countinterest;$i++){
                $description = $interestfrom[$i].-$interestto[$i].$month;
                 $interestarray = (array('id' =>'',
                                                                                                                                                    'period_ofrange_monthfrom' => $interestfrom[$i],
                                                                                                                                                    'period_ofrange_monthto'=> $interestto[$i],
                                                                                                                                                    'period_ofrange_description'=> $description,
                                                                                                                                                    'offerproduct_id' => $offerproductupdate_id,
                                                                                                                                                    'Interest' => $interestrate[$i],
                                                                                                                                                    'intereststatus_id'=>3));
                $this->view->adm->addRecord('ourbank_interest_periods',$interestarray);
                }

					$this->_redirect('savings/index');
			}
		}

	public function fixedsavingsAction() { 
            // disable the layout to load new action page in common page
            $this->_helper->layout->disableLayout();
		$savingsForm = new Savings_Form_Savings();
                $this->view->producttype = 'fd';
		$this->view->form = $savingsForm;
		$savings = new Savings_Model_Savings();
                $convertdate = new App_Model_dateConvertor();

		$interestperiods = new Savings_Model_Savings();
                $applicableto = $savings->fetchAllMemberType();
                // load applicable to values
		foreach($applicableto as $applicableto) {
			$savingsForm->applicableto->addMultiOption($applicableto['id'],$applicableto['type']);
		}
// // 		$glsubcode = $savings->fetchAllglsubcode('Liabilities');
// //                 // load glsubcode ids
// // 		foreach($glsubcode as $glsubcode) {
// // 			$savingsForm->glsubcode_id->addMultiOption($glsubcode->id,$glsubcode->header." -[".$glsubcode->glsubcode."]");
// // 		}

		$freequencyofdeposit = $savings->fetchAllTimeFrequencyType();
                //  load frequency type
		foreach($freequencyofdeposit as $freequency) {
                $savingsForm->frequency_of_deposit->addMultiOption($freequency['id'],$freequency['name']);
		}
// // //                $feeglcode = $savings->fetchAllglsubcode('Expenditure');
// // //                 // load feeglcode
// // //                foreach($feeglcode as $feeglcodes) {
// // //                                         $savingsForm->feeglcode->addMultiOption($feeglcodes->id,$feeglcodes->header);
// // //                                 }

		if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
			$formData = $this->_request->getPost();

			if ($this->_request->isPost()) {
				$savingsForm->minmumdeposit->setRequired(false);
				$savingsForm->frequencyofdeposit->setRequired(false);
				$savingsForm->Int_timefrequency_id->setRequired(false);
				$savingsForm->frequencyofinterestupdating->setRequired(false);
				$savingsForm->minimumbalanceforinterest->setRequired(false);
                                // receive all given input values 
                                $closeddate = $this->_request->getParam('closedate');
				$productType = $this->_request->getParam('productType');
					$interestfrom = $this->_request->getParam('interestfrom'); 
					$interestto = $this->_request->getParam('interestto');
					$interestrate = $this->_request->getParam('interestrate');
					$currentdate = $this->_request->getParam('currentdates');
					$begindate = $this->_request->getParam('begindate');
					$minimumamount = $this->_request->getParam('minimum_deposit_amount');
					$maximumamount = $this->_request->getParam('maximum_deposit_amount');
					$month='months';
					$memberCount = $this->_request->getParam('memberCount');

                    $headerCon = "L";
                    $glsubcode = $savings->genarateGlCode('fixed deposit');
                    $glcode = $savings->getGlCodeid('fixed deposit');
                    $glcodeexist = $savings->getGlCodeexist('fixed deposit');
                    $glco=substr($glcodeexist, 1, 2);
//                     foreach($genarateGl as $Glsubcode){
//                         $glsubcode = $Glsubcode['glsubcode'];
//                     }
//                    
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

            $product_id = $this->view->adm->getsingleRecord('ourbank_product','id','shortname',$productType);
            $this->view->product_id = $product_id;
            // check with close date and begindate
            if($convertdate->phpmysqlformat($closeddate) <= $convertdate->phpmysqlformat($begindate)) {
                $this->view->closedate= "<B style='color:red'>'closed date must be greater than begin date'$begindate</b>";
            } 
            // check with maximum and minimum amount
            else if($minimumamount >= $maximumamount) {
                $this->view->maximumamount= "<B style='color:red'>'maximum amount must be greater than minimum'$minimumamount</b>";
           }else {
                $result = $savings->addofferproduct($formData,$product_id,$closeddate,$glsubcodeid); //Insert Products offer 
            $offerproductupdate_id  = Zend_Db_Table::getDefaultAdapter()->lastInsertId('ourbank_productsoffer','id');

                // Insert fixed product details
                $result = $savings->addofferproductfixedrecurring($formData,$offerproductupdate_id);
                // insert interest period values
$countinterest = count($interestfrom);
for($i=0;$i<$countinterest;$i++){
                $description = $interestfrom[$i].-$interestto[$i].$month;
                 $interestarray = (array('id' =>'',
                                                                                                                                                    'period_ofrange_monthfrom' => $interestfrom[$i],
                                                                                                                                                    'period_ofrange_monthto'=> $interestto[$i],
                                                                                                                                                    'period_ofrange_description'=> $description,
                                                                                                                                                    'offerproduct_id' => $offerproductupdate_id,
                                                                                                                                                    'Interest' => $interestrate[$i],
                                                                                                                                                    'intereststatus_id'=>3));
                $this->view->adm->addRecord('ourbank_interest_periods',$interestarray);
                }
                }
            $this->_redirect('savings/index');

            }
        }

 }

	public function recurringsavingsAction() {   
            // disable the layout to load new action page in common page
                $this->_helper->layout->disableLayout();
		$savingsForm = new Savings_Form_Savings();
		$this->view->form = $savingsForm;
                $convertdate = new App_Model_dateConvertor();

		$savings = new Savings_Model_Savings();
                // load applicable to values
                $applicableto = $savings->fetchAllMemberType();
		foreach($applicableto as $applicableto) {
			$savingsForm->applicableto->addMultiOption($applicableto['id'],$applicableto['type']);
		}
                // load glsubcode ids
// // // 		$glsubcode = $savings->fetchAllglsubcode('Liabilities');
// // // 		foreach($glsubcode as $glsubcode) {
// // // 			$savingsForm->glsubcode_id->addMultiOption($glsubcode->id,$glsubcode->header." -[".$glsubcode->glsubcode."]");
// // // 		}
                // load frequency of deposit values
		$freequencyofdeposit = $savings->fetchAllTimeFrequencyType();
		foreach($freequencyofdeposit as $freequency) {
			$savingsForm->frequency_of_deposit->addMultiOption($freequency['id'],$freequency['name']);
		}
// // // //                $feeglcode =  $savings->fetchAllglsubcode('Expenditure');
// // // //                // load feeglcode values
// // // //                 foreach($feeglcode as $feeglcodes) {
// // // //                         $savingsForm->feeglcode->addMultiOption($feeglcodes->id,$feeglcodes->header);
// // // //                 }
		if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
			$formData = $this->_request->getPost();
			if ($this->_request->isPost()) {
				$savingsForm->minmumdeposit->setRequired(false);
				$savingsForm->frequencyofdeposit->setRequired(false);
				$savingsForm->Int_timefrequency_id->setRequired(false);
				$savingsForm->frequencyofinterestupdating->setRequired(false);
				$savingsForm->minimumbalanceforinterest->setRequired(false);
                                // receive all given input values 
				$closeddate = $this->_request->getParam('closedate');
                                $productType = $this->_request->getParam('productType');
                                $interestfrom = $this->_request->getParam('interestfrom'); 
                                $interestto = $this->_request->getParam('interestto');
                                $interestrate = $this->_request->getParam('interestrate');
                                $currentdate = $this->_request->getParam('currentdates');
                                $begindate = $this->_request->getParam('begindate');
                                $minimumamount = $this->_request->getParam('minimum_deposit_amount');
                                $maximumamount = $this->_request->getParam('maximum_deposit_amount');
                                $month='months';
                                $memberCount = $this->_request->getParam('memberCount');

                    $headerCon = "L";
                    $glsubcode = $savings->genarateGlCode('recurring deposit');
                    $glcode = $savings->getGlCodeid('recurring deposit');
                    $glcodeexist = $savings->getGlCodeexist('recurring deposit');
                    $glco=substr($glcodeexist, 1, 2);
//                     foreach($genarateGl as $Glsubcode){
//                         $glsubcode = $Glsubcode['glsubcode'];
//                     }
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
            $product_id = $this->view->adm->getsingleRecord('ourbank_product','id','shortname',$productType);
            $this->view->product_id = $product_id;
 	     // check with maximum and minimum date
             if($convertdate->phpmysqlformat($closeddate) <= $convertdate->phpmysqlformat($begindate)) {

                $this->view->closedate= "<B style='color:red'>'closed date must be grater than begin date'.'$begindate'</b>";
            // check with maximum and minimum amount
        } elseif($minimumamount >= $maximumamount) {
                $this->view->maximumamount= "<B style='color:red'>'maximum amount must be grater than minimum'.'$minimumamount'</b>";
        } else {
                $result = $savings->addofferproduct($formData,$product_id,$closeddate,$glsubcodeid); //Insert Products offer 


                $offerproductupdate_id  = Zend_Db_Table::getDefaultAdapter()->lastInsertId('ourbank_productsoffer','id');

                // Insert fixed product values 
               $result = $savings->addofferproductfixedrecurring($formData,$offerproductupdate_id);
                // insert interest period values
$countinterest = count($interestfrom);
for($i=0;$i<$countinterest;$i++){
                $description = $interestfrom[$i].-$interestto[$i].$month;
                 $interestarray = (array('id' =>'',
                                                                                                                                                    'period_ofrange_monthfrom' => $interestfrom[$i],
                                                                                                                                                    'period_ofrange_monthto'=> $interestto[$i],
                                                                                                                                                    'period_ofrange_description'=> $description,
                                                                                                                                                    'offerproduct_id' => $offerproductupdate_id,
                                                                                                                                                    'Interest' => $interestrate[$i],
                                                                                                                                                    'intereststatus_id'=>3));
                $this->view->adm->addRecord('ourbank_interest_periods',$interestarray);
                }
					}
                                $this->_redirect('savings/index');
				}
			}
		}
	public function savingsviewAction() {
		$this->view->title = "view Savings";
                // decode the input value
		$offerproduct_id =base64_decode($this->_getParam('offerproduct_id'));
                $this->view->id = $offerproduct_id;
		$offerproduct = new Savings_Model_Savings();
		$offerProductshortname = $offerproduct->offerProductshortname($offerproduct_id);
		foreach($offerProductshortname as $shortname) {
			$offerproductshortname=$shortname['shortname'];
		}
                // get product offer details for particular id
		$result = $offerproduct->viewofferProduct($offerproduct_id,$offerproductshortname);
		$this->view->offerproduct = $result;
                // get interest details for particular id
		$interestperiods = $offerproduct->viewinterest($offerproduct_id);
		$this->view->viewinterest = $interestperiods;
	}
// 
	public function savingseditAction() {
            $this->view->title = "Edit Savings";
            $offerproduct_id =base64_decode($this->_getParam('id'));
            $this->view->offerid = $offerproduct_id;
            $systemDate = date('Y-m-d');
            $savingsForm = new Savings_Form_Savings();
            $this->view->form = $savingsForm;
            $offerproduct = new Savings_Model_Savings();
            $convertdate = new App_Model_dateConvertor();

            $this->view->offerproduct_id = $offerproduct_id;
            $this->view->currentdates = $systemDate;
            $savingsForm->Submit->setName('Update');
            $savingsForm->offerproductname->removeValidator('Db_NoRecordExists');

            $offerProductshortname = $offerproduct->offerProductshortname($offerproduct_id);
            foreach($offerProductshortname as $shortname) {
                $offerproduct_shortname = $shortname['shortname'];
                $this->view->shortname = $offerproduct_shortname;
                $this->view->productshortname = $offerproduct_shortname;
                $savingsForm->offerproductname->setValue($shortname['name']);
	        $this->view->FDproductid=$shortname['product_id'];
            }
            // load applicable to values
            $applicableto = $offerproduct->fetchAllMemberType();
            foreach($applicableto as $applicableto) {
                    $savingsForm->applicableto->addMultiOption($applicableto['id'],$applicableto['type']);
            }
//             // load glsubcode id values
//             $glsubcode = $offerproduct->fetchAllglsubcode('Liabilities');
//             foreach($glsubcode as $glsubcode) {
//                     $savingsForm->glsubcode_id->addMultiOption($glsubcode->id,$glsubcode->header." -[".$glsubcode->glsubcode."]");
//             }
            // load frequency of deposit values
            $select = $offerproduct->fetchAllTimeFrequencyType();
            foreach($select as $timefrequencytype) {
                    $savingsForm->frequencyofdeposit->addMultiOption($timefrequencytype['id'],$timefrequencytype['name']);
             $savingsForm->Int_timefrequency_id->addMultiOption($timefrequencytype['id'],$timefrequencytype['name']);
                }
                // set all form field values
		$result = $offerproduct->viewofferProduct($offerproduct_id,$this->view->shortname);
            foreach($result as $saving) {  
                $this->view->form->savingproductname->setValue($saving['productname']);
                $this->view->form->offerproductname->setValue($saving['pname']);
                $this->view->form->offerproductshortname->setValue($saving['psname']);
                $this->view->form->offerproduct_description->setValue($saving['description']);
                $bdate = $convertdate->phpnormalformat($saving['begindate']);
                $this->view->form->begindate->setValue($bdate);
                $cdate = $convertdate->phpnormalformat($saving['closedate']);
                $this->view->form->closedate->setValue($cdate);
                $this->view->form->applicableto->setValue($saving['applicableto']);
//                 $this->view->form->glsubcode_id->setValue($saving['glsubcode_id']);
            } 
            if($this->view->shortname == 'ps') {
                $this->view->form->minmumdeposit->setValue($saving['minmumdeposit']);
                $this->view->form->frequencyofdeposit->setValue($saving['frequencyofdeposit']);
                $this->view->form->Int_timefrequency_id->setValue($saving['Int_timefrequency_id']);
                $this->view->form->frequencyofinterestupdating->setValue($saving['frequencyofinterestupdating']);
                $this->view->form->minimumbalanceforinterest->setValue($saving['minimumbalanceforinterest']);
            }
            if($this->view->shortname == 'fd' || $this->view->shortname == 'rd') {
                    $this->view->form->minimum_deposit_amount->setValue($saving['minimum_deposit_amount']);
                    $this->view->form->maximum_deposit_amount->setValue($saving['maximum_deposit_amount']);
                    $this->view->form->frequency_of_deposit->setValue($saving['frequency_of_deposit']);
                    $this->view->form->penal_Interest->setValue($saving['penal_Interest']);
		$frequency_of_deposit = $offerproduct->fetchAllTimeFrequencyType();
		foreach($frequency_of_deposit as $frequencyofdeposit) {
			$savingsForm->frequency_of_deposit->addMultiOption($frequencyofdeposit['id'],$frequencyofdeposit['name']);
		}
            }
            $interestperiods = $offerproduct->viewinterest($this->view->offerproduct_id);
            $this->view->viewinterest = $interestperiods;

        if ($this->_request->isPost() && $this->_request->getPost('Update')) { 
            $formData = $this->_request->getPost();
            $interestperiods = new Savings_Model_Savings();
                


// // // //                 if ($this->_request->isPost()) {
               $productshortname = $this->_request->getParam('shortname'); 
               $offerproductid = $this->_request->getParam('offerproduct_id');
               $Count = $this->_request->getParam('count');
               $memberCount = $this->_request->getParam('memberCount');
               $month='months';
               $closeddate = $this->_request->getParam('closedate');  

            if($productshortname == 'ps') { //make it as non mandatory fields
                $savingsForm->closedate->setRequired(false);
                $savingsForm->minimum_deposit_amount->setRequired(false);
                $savingsForm->maximum_deposit_amount->setRequired(false);
                $savingsForm->frequency_of_deposit->setRequired(false);
                $savingsForm->penal_Interest->setRequired(false);
            } else { //make it as non mandatory fields
                $savingsForm->minmumdeposit->setRequired(false);
                $savingsForm->frequencyofdeposit->setRequired(false);
                $savingsForm->Int_timefrequency_id->setRequired(false);
                $savingsForm->frequencyofinterestupdating->setRequired(false);
                $savingsForm->minimumbalanceforinterest->setRequired(false);
            }
               $existintid = array();

               $interestForProduct = $this->view->adm->getRecord("ourbank_interest_periods",'offerproduct_id',$offerproductid); 
               foreach($interestForProduct as $interestids){
                $existintid[] = $interestids['id'];
             }

// // //    if ($savingsForm->isValid($this->_request->getPost())) {
// 
// // // // Zend_Debug::dump($formData);
               $previousdata = $this->view->adm->editRecord("ourbank_productsoffer",$offerproductid); // get products offer details
               $result=$offerproduct->addofferproduct1($previousdata[0],$offerproductid); // insert into products offer details to log table
                $glcodes = $this->view->adm->getsingleRecord('ourbank_productsoffer','glsubcode_id','id',$offerproductid);


                $offerproduct->updateRecordpoffer($offerproductid,$formData,$this->view->shortname,$glcodes);
                // //if the record is belongs to personal savings
            if($productshortname == 'ps') {
                $previousdataps = $this->view->adm->getRecord("ourbank_productssaving",'productsoffer_id',$offerproductid); // get products saving details
                $result = $offerproduct->addofferproductsavingslog($previousdataps[0],$offerproductid);//Insert Products saving details to log table
            $offerproduct->updateRecordps($offerproductid,$formData);
            
            } 
else {
            $previousdatafd = $this->view->adm->getRecord("ourbank_product_fixedrecurring",'productsoffer_id',$offerproductid); // get products saving details
                $result = $offerproduct->fixedrecurringlog($previousdatafd[0],$offerproductid);//Insert Products
                // saving details to log table

            $offerproduct->updateRecordfd($offerproductid,$formData);
            }
            $interestrecord = $offerproduct->getRecord($offerproductid); //get interest details
                foreach($interestrecord as $intrecord){
                    $interestdata = (array('record_id' => '',
                                    'id' => $intrecord['id'],
                                    'period_ofrange_monthfrom'=> $intrecord['period_ofrange_monthfrom'],
                                    'period_ofrange_monthto'=> $intrecord['period_ofrange_monthto'],                 'period_ofrange_description' => $intrecord['period_ofrange_description'],      'offerproduct_id' => $intrecord['offerproduct_id'],
                                    'Interest' => $intrecord['Interest'],                                                'intereststatus_id'=>3));
                    $result = $offerproduct->addinterestlog('ourbank_interest_periods_log',$interestdata);
                }
// // //             insert interest values
            if($Count!=0)
            {
                    $i = 0;
                    foreach($existintid as $existintids){
                    $i++;
                    if($i<=$Count) { 
                        $From = $this->_request->getParam('ifrom'.$i); 
                        $To = $this->_request->getParam('iTo'.$i); 
                        $Rate = $this->_request->getParam('iRate'.$i); 
                        $month='months';
                        $period_ofrange_description = $From.-$To.$month;
                        $interestvalue = array(
                                            'period_ofrange_monthfrom' => $From,
                                            'period_ofrange_monthto'=> $To,
                                            'period_ofrange_description'=> $period_ofrange_description,
                                            'offerproduct_id' => $offerproductid,
                                            'Interest' => $Rate,
                                            'intereststatus_id'=>3);
                        $offerproduct->updateinterest($interestvalue,$existintids);
                    }
                }
            }
            if($memberCount!=0)
            {
            for ($i = 1;$i<=$memberCount; $i++) {
                $From = $this->_request->getParam('memberName'.$i); 
                $To = $this->_request->getParam('To'.$i); 
                $Rate = $this->_request->getParam('Rate'.$i); 
                $month='months';
                $period_ofrange_description = $From.-$To.$month;
                if($From) {
                $interestperiod = $this->view->adm->addRecord('ourbank_interest_periods',array('id' =>'',
                                                                        'period_ofrange_monthfrom' => $From,
                                                                        'period_ofrange_monthto'=> $To,
                                                                            'period_ofrange_description'=> $period_ofrange_description,
                                                                            'offerproduct_id' => $offerproductid,
                                                                            'Interest' => $Rate,
                                                                            'intereststatus_id'=>3));
                    }

            }
          }
            $this->_redirect('savings/index');

    
    }
}
	public function savingsdeleteAction() {
		$this->view->title = "Delete Savings";
                // decode given value 
		$offerproduct_id = base64_decode($this->_getParam('id'));
                $this->view->offerid = $offerproduct_id;
                 $this->view->form = $deleteform = new Savings_Form_Delete();
                $dbobj = new Savings_Model_Savings();
                // get the status of product 
                $status = $dbobj->getsavingstatus($offerproduct_id);
                $product = $dbobj->getproductname($offerproduct_id);
               foreach($product as $productd){
                    $this->view->productname = $productd['name'];
                    $productid = $productd['product_id'];
                }

                if(!$status)
                { 
                if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
// 
                    if ($this->view->form->isValid($this->_request->getPost())) {
                    $remarks = $this->_getParam('remarks');
                        // delete interest periods value for that product offer 
                            $deletefixedsaving = $this->view->adm->deleteRecordwithparam("ourbank_interest_periods",'offerproduct_id ',$offerproduct_id);
                        if($productid == 1){
                        $deletepersonalsaving = $this->view->adm->deleteRecordwithparam("ourbank_productssaving",'productsoffer_id ',$offerproduct_id);
                        }
                           // delete savings details if the offer is belongs to fixed or recurring saving product 
                         else {
                          $deletefixedsaving = $this->view->adm->deleteRecordwithparam("ourbank_product_fixedrecurring",'productsoffer_id ',$offerproduct_id);
                        }
                        // // delete product offer details 
                        $deleteofferdetails = $this->view->adm->deleteRecordwithparam("ourbank_productsoffer",'id',$offerproduct_id);
                        // // //delete savings details if the offer is belongs to personal saving product 

                             $this->_redirect('savings/index');

                        }
			}
		}else {

                    $this->_helper->flashMessenger->addMessage('You cannot delete this product offer, its in usage');
                    $this->_helper->redirector('index');
               }
	}
}
