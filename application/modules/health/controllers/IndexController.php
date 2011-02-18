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
class Health_IndexController extends Zend_Controller_Action 
{
    public function init() 
    {
//it is create session and implement ACL concept...
        $this->view->pageTitle=$this->view->translate('Health details');
        $globalsession = new App_Model_Users();
        $this->view->globalvalue = $globalsession->getSession();
        $this->view->createdby = $this->view->globalvalue[0]['id'];
        $this->view->username = $this->view->globalvalue[0]['username'];
//         if (($this->view->globalvalue[0]['id'] == 0)) {
//             $this->_redirect('index/logout');
//         }
        $this->view->adm = new App_Model_Adm();
    }

    public function indexAction() 
    {
    }

//add family health add action
    public function addhealthAction() 
    {
        $this->view->title = $this->view->translate("Add health details");
        $this->view->memberid=$familyid=$this->_getParam('id');
        $this->view->submoduleid = $this->_getParam('subId');

        $dbmodel=new Health_Model_health();
        $this->view->habitdetails = $dbmodel->gethabittypes();
        $this->view->challengedetails = $dbmodel->getchallengetypes();
        $this->view->membername = $dbmodel->getfamilymemberdetails($familyid);
//count number of family members
        $this->view->membercount = count($this->view->membername);
        if(count($this->view->membername)==0){
        $this->view->error = "No members in this family";
        }
// //insert the health details 
        if ($this->_request->isPost() && $this->_request->getPost('submit')) 
        {
        $habit = $this->_getParam('habit');
        $challenge = $this->_getParam('challenge');
        $submoduleid = $this->_getParam('subId');
        $familyid = $this->_getParam('memId');
    foreach($habit as $habitid){
        explode('-',$habitid);
                    $this->view->adm->addRecord("ourbank_healthhabitdetails",
                                                array('id' => '',
                                                'submodule_id' => $submoduleid,
                                                'family_id'=>$this->view->memberid,
                                                'member_id'=>$habitid[0],
                                                'habit_id'=>$habitid[2],
                                                'created_by'=>$this->view->createdby,
                                                'created_date'=>date("y/m/d H:i:s")
                                                ));
                    }
  foreach($challenge as $challengeid){
    explode('-',$challengeid);
                $this->view->adm->addRecord("ourbank_healthphychallenge",
                                                array('id' => '',
                                                'submodule_id' => $submoduleid,
                                                'family_id'=>$this->view->memberid,
                                                'member_id'=>$challengeid[0],
                                                'phychallenge_id'=>$challengeid[2],
                                                'created_by'=>$this->view->createdby,
                                                'created_date'=>date("y/m/d H:i:s")
                                                ));
		}

             $this->_redirect('/familycommonview/index/commonview/id/'.$familyid);
        }
    }

//edit family health details
    public function edithealthAction() 
    {
        $this->view->title = $this->view->translate("Edit health details");
        $this->view->memberid=$familyid=$this->_getParam('id');
        $this->view->submoduleid = $submoduleid = $this->_getParam('subId');

        $dbmodel=new Health_Model_health();
        $this->view->habitdetails = $dbmodel->gethabittypes();
        $this->view->challengedetails = $dbmodel->getchallengetypes();
        $this->view->membername = $dbmodel->getfamilymemberdetails($familyid);
//count number of family members
        $this->view->membercount = count($this->view->membername);


        if ($this->_request->isPost() && $this->_request->getPost('update')) 
        {
        $submoduleid = $this->_getParam('subId');
        $familyid = $this->_getParam('memId');

        $habit = $this->_getParam('habit');
        $challenge = $this->_getParam('challenge');

        $habits = $this->view->adm->getRecord('ourbank_healthhabitdetails','family_id',$familyid);
         for ($j = 0 ; $j< count($habits); $j++) {
                $this->view->adm->addRecord("ourbank_healthhabitdetails_log",$habits[$j]);
            }

        $challenges = $this->view->adm->getRecord('ourbank_healthphychallenge','family_id',$familyid);
         for ($j = 0 ; $j< count($challenges); $j++) {
                $this->view->adm->addRecord("ourbank_healthphychallenge_log",$challenges[$j]);
            }
        $this->view->adm->deleteRecordwithparam('ourbank_healthhabitdetails','family_id',$familyid);
        $this->view->adm->deleteRecordwithparam('ourbank_healthphychallenge','family_id',$familyid);
 -

        foreach($habit as $habitid){
        explode('-',$habitid);
                    $this->view->adm->addRecord("ourbank_healthhabitdetails",
                                                array('id' => '',
                                                'submodule_id' => $submoduleid,
                                                'family_id'=>$this->view->memberid,
                                                'member_id'=>$habitid[0],
                                                'habit_id'=>$habitid[2],
                                                'created_by'=>$this->view->createdby,
                                                'created_date'=>date("y/m/d H:i:s")
                                                ));
                    }
     foreach($challenge as $challengeid){
     explode('-',$challengeid);
                $this->view->adm->addRecord("ourbank_healthphychallenge",
                                                array('id' => '',
                                                'submodule_id' => $submoduleid,
                                                'family_id'=>$this->view->memberid,
                                                'member_id'=>$challengeid[0],
                                                'phychallenge_id'=>$challengeid[2],
                                                'created_by'=>$this->view->createdby,
                                                'created_date'=>date("y/m/d H:i:s")
                                                ));
		}
             $this->_redirect('/familycommonview/index/commonview/id/'.$familyid);
		}

        }
	
}
