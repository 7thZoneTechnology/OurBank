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
class Product_IndexController extends Zend_Controller_Action
{
	public function init() 
	{
            $this->view->pageTitle='Product';

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
 

//                  $globalsession = new App_Model_Users();
//                 $this->view->globalvalue = $globalsession->getSession();// get session values
//                 $this->view->createdby = $this->view->globalvalue[0]['id'];
//                 $this->view->username = $this->view->globalvalue[0]['username'];
// 				$storage = new Zend_Auth_Storage_Session();
//         		$data = $storage->read();
//         		if(!$data){
//            		 $this->_redirect('index/login');
//         			}
// //         if (($this->view->globalvalue[0]['id'] == 0)) {
// //              $this->_redirect('index/logout');
// //         }
            $this->view->adm = new App_Model_Adm();       
            $dbobj = new Product_Model_Product();
            $productvalues = $dbobj->getAllProduct();

            $name = array('personal saving','fixed deposit','recurring deposit');
            $shortname = array('ps','fd','rd');
            $desc = array('for Personal savings','for fixed deposit','for recurring deposit');

            if(empty($productvalues)){
            for($i=0;$i<=2;$i++){
                $dbobj->insertbaseProduct(array('id' => '',
                    'name' => $name[$i], 'shortname' => $shortname[$i],
                    'category_id' => '1', 'description' => $desc[$i],
                    'created_by' =>$this->view->createdby,'created_date'=>date("Y-m-d")));
            }
            }
	}

	public function indexAction() 
	{
		$this->view->title = "Product";
// 		$storage = new Zend_Auth_Storage_Session();
// 		$data = $storage->read();
// 		if(!$data){
// 			$this->_redirect('index/login');
// 		}


                //  when delete particular product we should check that particular product is a basic one or not
                if($this->_helper->flashMessenger->getMessages()){
                        $messages = $this->_helper->flashMessenger->getMessages();
                            foreach($messages as $error){
                                echo "<script> alert('$error');</script>";
                        }
                }

		$product = new Product_Model_Product();
		$categorydetails=$product->getProductinformation();
// 		$this->view->changelog=$category->getUpdatesinformation();
		$searchForm = new Product_Form_Search();
		$this->view->form = $searchForm;
		$page = $this->_getParam('page',1);
		$category_id = $product->getCategoryDetails();
                $institution = $this->view->adm->viewRecord("ourbank_category","id","DESC");
			foreach($institution as $institution) {
				$searchForm->category_id->addMultiOption($institution['id'],$institution['name']);
			}
		if ($this->_request->isPost() && $this->_request->getPost('Search')){
                    if ($this->_request->isPost()){
                        if ($searchForm->isValid($this->_request->getPost())){
                            $result = $product->SearchProduct($searchForm->getValues());
                            $paginator = Zend_Paginator::factory($result);

                        }
                    }
                $this->view->search = true;
		}
                else {
                        $result = $product->getCategoryDetails();
                        $paginator = Zend_Paginator::factory($result);
                } 
                $paginator->setItemCountPerPage($this->view->adm->paginator());
                $paginator->setCurrentPageNumber($page);
                $this->view->paginator = $paginator;          
	}
	public function productaddAction() 
	{
		$this->view->title = "Product";
		$productForm = new Product_Form_Product();
		$this->view->form = $productForm;
                $categoryname = $this->view->adm->viewRecord("ourbank_category","id","DESC");
			foreach($categoryname as $categoryname){
				$productForm->category_id->addMultiOption($categoryname['id'],$categoryname['name']);
			}
		if ($this->_request->isPost() && $this->_request->getPost('Submit')) {
				$formData = $this->_request->getPost();
				if ($this->_request->isPost()) {
					if ($productForm->isValid($formData)) {  
					$id = $this->view->adm->addRecord("ourbank_product",$productForm->getValues());
                                        $this->_redirect('/productcommonview/index/productview/id/'.$id);
				}
			}
		}
		
	}
	
	public function producteditAction() 
	{
		$this->view->title = "Product";
                $productForm = new Product_Form_Product();
                $this->view->form = $productForm;
                $id=$this->_getParam('id');
                $this->view->id = $id;
//                 $categoryid = $this->view->adm->getsingleRecord('ourbank_product','category_id','id',$id);
                if(($id == 1) || ($id == 2) || ($id == 3)){
                    $this->_helper->flashMessenger->addMessage('You cannot edit this product, its a basic product');
                            $this->_helper->redirector('index');
                }
                $productname = $this->view->adm->viewRecord("ourbank_category","id","DESC");
                foreach($productname as $productname){
                        $productForm->category_id->addMultiOption($productname['id'],$productname['name']);
                }
                $product = new Product_Model_Product;
                $productdetails = $product->getProduct($id);
                $productForm->populate($productdetails[0]);
                if ($this->_request->isPost() && $this->_request->getPost('Update')) {  
                        $id = $this->_getParam('id');
                        $formData = $this->_request->getPost();
                        //print_r($formData);
                        if ($productForm->isValid($formData)) { 
                            $previousdata = $this->view->adm->editRecord("ourbank_product",$id);
                            $this->view->adm->updateLog("ourbank_product_log",$previousdata[0],$this->view->createdby);
                            //update 					
                            $this->view->adm->updateRecord("ourbank_product",$id,$productForm->getValues());
                            $this->_redirect('product/index/');
                        }
                }
    }		

	public function productdeleteAction() 
	{
        $this->view->title='Product';
        $delform = new Product_Form_Delete();
        $this->view->deleteform = $delform;
        $dbobj = new Product_Model_Product();
        $id = $this->_getParam('id');
        $this->view->id = $id;
        $this->view->productdetails = $this->view->adm->getRecord('ourbank_product','id',$id);
        $getstatus = $dbobj->getproductstatus($id);
//         // if that product id is not used by anyone we can delete that record
        if(!$getstatus)
            { 
                if ($this->_request->isPost() && $this->_request->getPost('Delete')) {  
                    $id = $this->_getParam('id');
                    $formData = $this->_request->getPost();
                    //print_r($formData);
                    if ($delform->isValid($formData)) { 
                        $previousdata = $this->view->adm->editRecord("ourbank_product",$id);
                        $this->view->adm->updateLog("ourbank_product_log",$previousdata[0],$this->view->createdby);
                        //delete 	
                        $this->view->adm->deleteRecordwithparam('ourbank_product','id',$id);		
                        $this->_redirect('product/index/');
                    }
                }   
        }
 // if that product id is used by someone then we should assign message 
              else { 
                    $this->_helper->flashMessenger->addMessage('You cannot delete this product, its in usage');
                    $this->_helper->redirector('index');
               }
        }
}
