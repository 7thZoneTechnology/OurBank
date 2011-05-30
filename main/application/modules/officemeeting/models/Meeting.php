
<?php
class Officemeeting_Model_Meeting extends Zend_Db_Table 
{
    protected $_name = 'ourbank_meeting';

    public function fetchAllmeetingdetails() 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_meeting'),array('id'))
                ->join(array('b'=>'ourbank_group'),'b.id = a.group_id',array('b.id as gid','b.name as gname'))
                ->order(array('a.id DESC'));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function getBranch()
     {
       $db = $this->getAdapter();
        $sql = 'select * from ourbank_office
                       where officetype_id in
                   (select id from ourbank_officehierarchy
                       where Hierarchy_level in
                   (select max(Hierarchy_level) from ourbank_officehierarchy))';
       /*
       $result = $db->fetchAll($sql);
       return $result;*/
   }

    public function fetchofficenames($officeId) 
    {
        $select = $this->select()
                ->setIntegrityCheck(false)
                ->from('ourbank_office')
                ->where('officetype_id =  ?',$officeId);
       //  die ($select->__toString($select));
       $result = $this->fetchAll($select);
       return $result->toArray();
    }

    public function fetchMeetingdetailsForID($id)
    {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('a' => 'ourbank_officemeeting'),array('id'))
                ->where('a.id = '.$id)
                ->join(array('c'=>'ourbank_office'),'c.id = a.office_id',array('c.name as office_name'))
                ->join(array('d'=>'ourbank_officehierarchy'),'d.id = a.officelevel',array('d.type as office_level'))
                ->join(array('e' => 'ourbank_master_frequencypayment'),'e.id = a.frequency',array('e.id as wid','e.name as frequencyname'));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

    public function SearchMeeting($post) 
    {
        $select = $this->select()
                    ->setIntegrityCheck(false)  
                    ->join(array('a'=>'ourbank_meeting'),array('id'))
                    ->where('a.name like "%" ? "%"',$post['search_meeting_name'])
                    ->where('a.place like "%" ? "%"',$post['search_meeting_place'])
                    ->where('a.day like "%" ? "%"',$post['search_weekdays'])
                    ->join(array('b'=>'ourbank_group'),'b.id = a.group_id',array('b.name as gname'))
                    ->where('b.name like "%" ? "%"',$post['search_group_name'])
                    ->order(array('a.id desc'));
//         die ($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result->toArray();
    }

//get the office hierarchy id from the maximum hierarchy level
    public function getoffice_hierarchy() {
    $db = $this->getAdapter();
    $sql = "SELECT id FROM `ourbank_officehierarchy` where Hierarchy_level in (SELECT max(Hierarchy_level) FROM `ourbank_officehierarchy`)";
    $result = $db->fetchAll($sql);
    return $result;
//    echo $sql;
    }

//get the office name and id with respective office type
    public function getoffice($id){
        $select=$this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a'=>'ourbank_office'),array('a.id'),array('a.id as office_id','a.name'))
                    ->where('a.officetype_id=?',$id);
        //die($select->__toString($select));
        return $this->fetchAll($select);
    }

//fetch group head name
    public function fetchHeadName($group_id)
    {       
        $select=$this->select()
           ->setIntegrityCheck(false)
           ->join(array('a'=>'ourbank_familymember'),array('a.id'),array('a.id as head_id','a.name as headname'))
           ->join(array('b'=>'ourbank_group'),'b.head=a.id')
           ->where('b.id=?',$group_id);
       // die($select->__toString($select));
        return $this->fetchAll($select);
    }
}
