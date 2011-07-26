<?php
class settings_IndexController extends Zend_Controller_Action {
public function init() {
        $this->view->pageTitle='Settings';
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

    public function indexAction() {
	
	$settingsForm = new settings_Form_Settings();
	$this->view->form = $settingsForm;
	
	   $settingModel=new settings_Model_Setting();
	   $allLanguage=$settingModel->fetchAllLanguage();
	   foreach($allLanguage as $eacharraysent) {
	   $this->view->form->languages->addMultiOption($eacharraysent->language_id,$eacharraysent->langauge_name);
	   }



    }
   
}

