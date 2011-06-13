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
?>

<?php 
class Praservice_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
//it is create session and implement ACL concept...
        $this->view->pageTitle=$this->view->translate('(PRA Based) Service Requirement at family member level');
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
        $this->view->familycommon = new Familycommonview_Model_familycommonview();

    }

    public function indexAction() 
    {
    }


    public function addAction() 
    {
        $this->view->title = $this->view->translate("PRA details");
        $this->view->memberid=$member_id=$this->_getParam('id');
        $this->view->membernames = $this->view->familycommon->getfamily($member_id);
        $this->view->insurance=$this->view->familycommon->getinsurance($member_id);

//count number of family members
        $family_model=new Praservice_Model_services();
        $this->view->service_details=$count_loan = $family_model->get_servicesdetails();

        $this->view->membername = $family_model->getfamilymemberdetails($member_id);
        $this->view->membercount = count($this->view->membername);
        $this->view->number=$number=count($count_loan);
//load form with respective to number of family member
        $addForm = new Praservice_Form_services($number);
        $this->view->form=$addForm;


//insert the Services details 
        if ($this->_request->isPost() && $this->_request->getPost('submit')) 
        {
            $formData = $this->_request->getPost();  //echo "<pre>"; print_r($formData);
            //for($i=1;$i<=$number;$i++)
            //{	
            if($this->_request->getParam('service')){   //echo '<pre>'; print_r($formData);
            $serviceandMem = $this->_request->getParam('service');
            foreach($serviceandMem as $service_Mem) {
            // Delimiters may be slash, dot, or hyphen
            list($memid,$sourceid) = split('-', $service_Mem); 
                //echo "member".$memid; echo "Source".$sourceid.'<br>';

                $this->view->adm->addRecord("ourbank_praservice",array('id' => '',
                                            'member_id'=>$memid,
                                            'family_id'=>$member_id,
					    'source_id'=>$sourceid,
                                            'created_date'=>date("y/m/d H:i:s"),
                                            'created_by'=>$this->view->createdby
                                            ));
		}
            }
              $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);
        }
    }


 public function editAction() 
    {
        $this->view->title = $this->view->translate("PRA details");
        $this->view->memberid=$member_id=$this->_getParam('id');
        $this->view->membernames = $this->view->familycommon->getfamily($member_id);
        $this->view->insurance=$this->view->familycommon->getinsurance($member_id);
        //count number of family members
        $this->view->praservice=$pramodel=new Praservice_Model_services();
        $this->view->service_details=$count_details = $pramodel->get_servicesdetails();
        $this->view->number=$number=count($count_details);
        //load form with respective to number of family member
        $addForm = new Praservice_Form_services($number);
        $this->view->form=$addForm;
        //set the value of member name and sex

        foreach($count_details as $count_details){
            $b='source_id'.$count_details['id'];
            $addForm->$b->setValue($count_details['id']);
         }

// Zend_Debug::dump($count_details);

        //set the value of Services details
//          $this->view->praupdate=$pradetails = $pramodel->get_service($member_id);  
//         $i=1;
//         foreach($count_details as $count_details){ 
//         $f='source_id'.$i;
// echo $f;
//         $addForm->$f->setValue($count_details['id']);
//         $i++;
//         }

        $this->view->membername = $pramodel->getfamilymemberdetails($member_id); 
        foreach($this->view->membername as $members) {  }
        $this->view->membercount = count($this->view->membername);

        //update the family health details...
        if ($this->_request->isPost() && $this->_request->getPost('update')) 
        {
//             $formData = $this->_request->getPost();  echo "<pre>"; print_r($formData);
		//insert main table details to log tables
		$habits = $this->view->adm->getRecord('ourbank_praservice','family_id',$member_id);
//                 echo '<pre>';print_r($habits); 
		for ($j = 0 ; $j< count($habits); $j++) { echo '<pre>'; print_r($habits[$j]);
		      $this->view->adm->addRecord("ourbank_praservice_log",$habits[$j]);
			}

            $pramodel->deleteservice($member_id);


        if($this->_request->getParam('service')){   //echo '<pre>'; print_r($formData);

            $serviceandMem = $this->_request->getParam('service');
            foreach($serviceandMem as $service_Mem) {
            // Delimiters may be slash, dot, or hyphen
            list($memid,$sourceid) = split('-', $service_Mem); 


                $this->view->adm->addRecord("ourbank_praservice",array('id' => '',
                                            'member_id'=>$memid,
                                            'family_id'=>$member_id,
					    'source_id'=>$sourceid,
                                            'created_date'=>date("y/m/d H:i:s"),
                                            'created_by'=>$this->view->createdby
                                            ));
		}
            }
              $this->_redirect('/familycommonview/index/commonview/id/'.$member_id);

        }
	
}
}
