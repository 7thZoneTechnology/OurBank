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
/*
Class for common Add Delete and Modify 

*/
class App_Model_Adm extends Zend_Db_Table 
{
    protected $_name = 'ourbank_office';

    public function addRecord($table,$params) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
	$db->insert($table,$params);
	return $db->lastInsertId('id');
    }

    public function viewRecord($table,$param,$type)
    {
         $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->from($table)
                        ->order($param.' '.$type);
        return $this->fetchAll($select);
    }

    public function editRecord($table,$param)
    { 
        $select = $this->select()
                                ->setIntegrityCheck(false)  
                                ->join(array('a' => $table),array('id'))
                ->where('a.id = ?',$param);
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function lastinsertedID($table) 
    {
        $db = $this->getAdapter();
        $sql = 'select max(id) from '.$table;
        $result = $db->fetchAll($sql);
        return $result;
    }


    public function updateRecord($table,$param,$data)  
    {
		$db = $this->getAdapter();
        $db->update($table, $data , array('id = '.$param));
        return;
    }

    public function deleteRecord($table,$param)  
    {
	$db = $this->getAdapter();
        $db->delete($table,array('id = '.$param));
        return;
    }

    public function updateLog($table,$param,$id)
    {
        foreach($param as $param1) {
                        $createdBy = $param1["created_by"];
                        $date = $param1["created_date"];
        }

        $replacement1 = array('created_by' => $createdBy,'created_date' => $date);

        $replacement2 = array('created_by' => $id,'created_date' => date("y-m-d H:i:s"));

        $merg = array_replace($param, $replacement1, $replacement2);
        $this->addRecord($table,$merg);
    }
	

    public function getmodule($table,$id,$submodule)
    {
        $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('b' => 'ourbank_modules'),array('module_id'))
                        ->where('b.module_description = ?',$submodule)
                        ->join(array('c' => $table),'c.submodule_id = b.module_id')
                        ->where('id = ?',$id);
        // die($select->__toString($select));
        return $this->fetchAll($select);
    }

    public function paginator()
    {
        return 5;
    }
    
    // Action methods
    public function deleteAction($table,$redirect,$id)
    {
        $previousdata = $this->editRecord($table,$id);
        $this->addRecord($table."_log",$previousdata[0]);
        //update 					
        $this->deleteRecord($table,$id);
        return $redirect;
    }

    public function deletemember($table,$id)
    {
        $previousdata = $this->editRecord($table,$id);
        $this->addRecord($table."_log",$previousdata[0]);
        //update 					
        $this->deleteRecord($table,$id);
        return 1;
    }

    public function editSubmodule($table,$param,$submoduleID)
    {
        $select = $this->select()
                    ->setIntegrityCheck(false)  
                    ->join(array('a' => $table),array('id'))
                    ->where('a.id = ?',$param)
                    ->where('a.submodule_id = ?',$submoduleID);
        // die ($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
    // Edit submodule method
    public function updateSubmodule($table,$param,$submoduleID,$data)
    {
        $db = $this->getAdapter();
        $db->update($table, $data , array('id = '.$param,'submodule_id = '.$submoduleID));
        return;
    }

    public function deleteSubmodule($table,$param,$submoduleID)
    {
        $previousdata = $this->editSubmodule($table,$param,$submoduleID);
        if ($previousdata) {
                $this->addRecord($table."_log",$previousdata[0]);
                //update 					
                $db = $this->getAdapter();
                $db->delete($table,array('id = '.$param),'submodule_id = '.$submoduleID);
        } 
        return ;
    }
    public function getsingleRecord($table,$param1,$param2,$value)
    {
        $db = $this->getAdapter();
        $sql = "select $param1 from $table 
                where $param2 ='".$value."'";
                $result = $db->fetchOne($sql);
        return $result;
    }
    public function getRecord($table,$parameter,$value)
    { 
        $select = $this->select()
                                ->setIntegrityCheck(false)  
                                ->join(array('a' => $table),array('id'))
                ->where($parameter.'=?',$value);
        $result = $this->fetchAll($select);
        return $result->toArray();
    }
    public function deleteRecordwithparam($table,$param,$value)  
    {
        $db = $this->getAdapter();
        $sql = "delete from ".$table." where ".$param." = ". $value;
        $db->exec($sql);
    }
}
