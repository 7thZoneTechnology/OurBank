<?php

class Maintenance_IndexController extends Zend_Controller_Action {

    public function init() {
        $this->view->pageTitle='Maintenance';
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

