<?php
class Accounting_IndexController extends Zend_Controller_Action 
{
   

 public function init() 
    {
       $this->view->pageTitle='Accounting';
       $this->view->pageTitle='Accounting';
        
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

    public function indexAction(){

    }
   
}

