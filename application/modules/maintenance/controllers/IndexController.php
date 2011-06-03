<?php

class Maintenance_IndexController extends Zend_Controller_Action {

    public function init() {
        $this->view->pageTitle='Maintenance';
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
      	$storage = new Zend_Auth_Storage_Session();
	$data = $storage->read();
	if(!$data){
		$this->_redirect('index/login');
	}
       $this->view->title = "Maintenance";
    }

}

