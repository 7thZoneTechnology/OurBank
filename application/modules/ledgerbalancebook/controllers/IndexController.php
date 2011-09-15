<?php
class Ledgerbalancebook_IndexController extends Zend_Controller_Action
{
    function init()
    {
	$this->view->pageTitle = "Ledger balancebook";
 	$this->view->title = "reports";
    $this->view->type = "generalFields";
    $this->view->adm = new App_Model_Adm();
	$this->view->dateconvertor = new App_Model_dateConvertor();
	}

    function indexAction()
    {
	$path = $this->view->baseUrl();
	$this->view->form = $searchForm = new Ledgerbalancebook_Form_Search($path);
						$dateconvertor = new App_Model_dateConvertor();
            			$GeneralList = new Ledgerbalancebook_Model_Ledgerbookbalance();

      $officename = $GeneralList->getHier();
			foreach($officename as $officename){
				$searchForm->hierarchy->addMultiOption($officename['id'],$officename['type']);
			}
	if ($this->_request->isPost() && $this->_request->getPost('Search')) {
		$formData = $this->_request->getPost();

	if ($searchForm->isValid($formData)) { 
		$this->view->date1 = $this->_request->getParam('date1');
        $fromDate = $dateconvertor->mysqlformat($this->view->date1);
		$hierarchy=$this->_request->getParam('hierarchy');
		$branch = $this->_request->getParam('branch');

        $this->view->ledegerList = $GeneralList->generalLedger($fromDate,$hierarchy,$branch);
        $this->view->ledegerListAssets = $GeneralList->generalLedgerAssets($fromDate,$hierarchy,$branch);
	}
	}
    }

}