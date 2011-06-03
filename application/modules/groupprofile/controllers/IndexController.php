<?php
class Groupprofile_IndexController extends Zend_Controller_Action 
{
    public function init()
    {
        $this->view->pageTitle = 'Group Profile';
        $this->view->title = 'Loan Process';
        $this->view->accounts = new Groupprofile_Model_Groupprofile();
        $this->view->cl = new App_Model_Users ();
        $this->view->adm = new App_Model_Adm ();

                $this->view->globalvalue = $this->view->cl->getSession();// get session values
                $this->view->createdby = $this->view->globalvalue[0]['id'];
                $this->view->username = $this->view->globalvalue[0]['username'];

        		$data = $storage->read();
        		if(!$data){
           		 $this->_redirect('index/login');
                        }


        $finduser = $this->view->accounts->finduser($this->view->createdby);
    }
    public function indexAction()
    {
       $accountsForm = $this->view->form = new Loanprocess_Form_Search();
        if ($this->_request->isPost()) {
            $formData = $this->_request->getPost();
            if ($accountsForm->isValid($formData)) {
                    $membercode = $this->_request->getParam('membercode');
                    if (substr($membercode,4,1) == 2 || substr($membercode,4,1) == 3) {
                        $this->view->group = $this->view->accounts->getMember($membercode);
                        $this->view->groupDeatils = $this->view->accounts->groupDeatils($membercode);
                        $addForm = new Loanprocess_Form_Loanprocess(count($this->view->group));
                        $this->view->form=$addForm;
                        $this->view->membercode = $membercode;
                        $purpose = $this->view->adm->viewRecord("ourbank_master_loanpurpose","id","DESC");
                        for($i=1;$i<=count($this->view->group);$i++)
                        {  
                            $id = "purpose_id".$i;
                            foreach($purpose as $purpose1) { 
                                $addForm->$id->addMultiOption($purpose1['id'],$purpose1['name']);
                            }
                        }

                    } 

            }
        }
    }
}

