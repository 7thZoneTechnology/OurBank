<?php
class Phone_IndexController extends Zend_Controller_Action 
{
    public function init()
    {
        $this->view->pageTitle='Phone';
	$this->view->phone = new Phone_Model_Phone();
    }

    public function indexAction() 
    { 
    }
    public function addphoneAction() 
    {
	if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
	    $this->view->phone->addPhone($this->_request->getPost());
            $this->_redirect("/phone/index/message/");
        }
    }
    public function messageAction() 
    {
        $this->view->pageTitle = 'Phone';
    }
}

