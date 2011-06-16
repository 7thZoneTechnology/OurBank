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
class Category_IndexController extends Zend_Controller_Action
{
	public function init() 
	{
                $this->view->pageTitle='Category';

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
                $dbobj = new Category_Model_Category();
                $categoryvalues = $dbobj->getAllCategory();

                $name = array('Savings','Loan');
                $desc = array('For savings products','For loan products');

                if(empty($categoryvalues)){
                for($i=0;$i<=1;$i++){
                    $dbobj->insertbaseCategory(array('id' => '',
                        'name' => $name[$i],'description' => $desc[$i],
                        'created_by' =>1,'created_date'=>date("Y-m-d")));
                }
                }






	}

	public function indexAction() 
	{
       		$this->view->title = "Category";
		$this->view->pageTitle = "Category";
		$storage = new Zend_Auth_Storage_Session();
		$data = $storage->read();
		if(!$data){
			$this->_redirect('index/login');
		}

        //  when delete particular category we should check that particular category is a basic one or not
                if($this->_helper->flashMessenger->getMessages()){
                $messages = $this->_helper->flashMessenger->getMessages();
                    foreach($messages as $error){
                        echo "<script> alert('$error');</script>";
                }
                }

//calling the category model
		$category = new Category_Model_Category();
		$categorydetails=$category->getCategoryinformation();
		$searchForm = new Category_Form_Search();
		$this->view->form = $searchForm;
                //pagination  -   for set of 5 at a time
		$page = $this->_getParam('page',1);
		//search action
		if ($this->_request->isPost() && $this->_request->getPost('Search')){
			if ($this->_request->isPost()){
				if ($searchForm->isValid($this->_request->getPost())){
					$result = $category->SearchCategory($searchForm->getValues());
                //pagination for the search result
                                        $paginator = Zend_Paginator::factory($result);
				}
			}
                $this->view->search = true;
		}
                else {
		$result = $category->getCategoryDetails();
		$paginator = Zend_Paginator::factory($result);
                // assign default values into paginator
                $paginator = Zend_Paginator::factory($result);
                }
        $paginator->setItemCountPerPage($this->view->adm->paginator());
        $paginator->setCurrentPageNumber($page);
        $this->view->paginator = $paginator;
	}
	public function categoryaddAction() 
	{

//calling the form		
		$this->view->title = "Category";
		$categoryForm = new Category_Form_category();
		$this->view->form = $categoryForm;
//submit action
		if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
				$formData = $this->_request->getPost();


				if ($this->_request->isPost()) {
					if ($categoryForm->isValid($formData)) {  
//                                         echo "created by".$this->view->createdby;
// adding the datas to the table
					$id = $this->view->adm->addRecord("ourbank_category",$categoryForm->getValues());
						$this->_redirect('/category/index/categoryview/id/'.$id);
				}
			}
		}
		
	}
	
	public function categoryeditAction() 
	{
                	$this->view->title = "Category";
//calling the form
			$categoryForm = new Category_Form_category();
			$this->view->form = $categoryForm;
//getting the id
			$id=$this->_getParam('id');
			$this->view->id = $id;
                        // check the id whether its belongs to base value 
                        if(($id == 1) || ($id == 2)){
                            $this->_helper->flashMessenger->addMessage('You cannot edit this category, its a basic category');
                            $this->_helper->redirector('index');
                       }

                        
//calling the category model
			$category = new Category_Model_Category;
			$categorydetails = $category->getCategory($id);
			$categoryForm->populate($categorydetails[0]);
//update action
			if ($this->_request->isPost() && $this->_request->getPost('Update')) {  
				$id = $this->_getParam('id');
				$formData = $this->_request->getPost();
				//print_r($formData);
				if ($categoryForm->isValid($formData)) { 
//editing the record

					$previousdata = $this->view->adm->editRecord("ourbank_category",$id);
// //updating the previous data
					$this->view->adm->updateLog("ourbank_category_log",$previousdata[0],$this->view->createdby);
// 					//update 					
					$this->view->adm->updateRecord("ourbank_category",$id,$categoryForm->getValues());
					$this->_redirect('category/index/');
				}
 			}
    }		
	public function categoryviewAction() 
	{
     		$this->view->title = "Category";
		//Acl
                $id=$this->_request->getParam('id');
//calling the category model			
                $category = new Category_Model_Category;
                $this->view->categorydetails=$category->getCategory($id);
	}
	public function categorydeleteAction() 
	{
      		$this->view->title = "Category";
//calling the delete form
		$delform = new Category_Form_Delete();
		$this->view->deleteform = $delform;
//getting the id
		$id = $this->_getParam('id');
		$this->view->id = $id;
//calling the category model
		$category = new Category_Model_Category;
		$this->view->categorydetails=$category->getCategory($id);
                $getstatus = $category->getcategorystatus($id);
//         // if that product id is not used by anyone we can delete that record
        if(!$getstatus)
            {
//delete action
		if($this->_request->isPost() && $this->_request->getPost('Delete')) {
		      $formdata = $this->_request->getPost();
				if ($delform->isValid($formdata)) { 
//editing the record 
                                    $previousdata = $this->view->adm->editRecord("ourbank_category",$id);
// //updating the previous data
                                    $this->view->adm->updateLog("ourbank_category_log",$previousdata[0],$this->view->createdby);
// delete that particular record
                                    $this->view->adm->deleteRecord('ourbank_category',$id);
                                    $this->_redirect('category/index/');
				}
                }
	}
 // if that category id is used by someone then we should assign message 
              else { 
                    $this->_helper->flashMessenger->addMessage('You cannot delete this product, its in usage');
                    $this->_helper->redirector('index');
               }
    }
}
