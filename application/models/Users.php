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
class App_Model_Users extends Zend_Db_Table
 {
    protected $_name="ourbank_master_gender";

    public function userinfo($username) {
            $select = $this->select()
                       ->setIntegrityCheck(false)  
                       ->join(array('a' => 'ourbank_user'),array('id'))
                       ->where('a.username = ?',$username);

      // die ($select->__toString($select));

       return $this->fetchAll($select);
    }

    public function username($userid) {
        $select = $this->select()
                       ->setIntegrityCheck(false)  
                       ->join(array('a' => 'ourbank_user'),array('id'))
			->join(array('c'=>'ourbank_grant'),'a.grant_id=c.id')
			 ->where('a.id = ?',$userid);

        $result = $this->fetchAll($select);
        return $result->toArray();
    }
    // For Acl Implementation
    public function getRole($role) {

        $this->db = Zend_Db_Table::getDefaultAdapter();
        $sql = "SELECT id from ourbank_grant where name = '".$role."'";
        $result = $this->db->fetchOne($sql);
        return $result;

    }

    public function getRoleName($roleid) {

        $this->db = Zend_Db_Table::getDefaultAdapter();
        $sql = "SELECT grantname from ourbank_grant where grant_id = ".$roleid;
        $result = $this->db->fetchOne($sql);
        return $result;

    }

    public function getLanguage() {

        $this->db = Zend_Db_Table::getDefaultAdapter();
        $sql = "SELECT code from ourbank_language where active = 1";
        $result = $this->db->fetchOne($sql);
        return $result;

    }

    public function getSession() {

       $sessionName = new Zend_Session_Namespace('ourbank');
        if($sessionName->primaryuserid > 0) {
            $userid = $this->view->createdby = $sessionName->primaryuserid;
            $loginname = $this->username($userid);
			$language = $this->getLanguage();
			array_push($loginname,$language);
            return $loginname;
			
        } else { return 0; }

    }
 }


