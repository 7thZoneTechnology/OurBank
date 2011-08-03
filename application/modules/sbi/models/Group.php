<?php
class Sbi_Model_Group extends Zend_Db_Table 
{
	protected $_name = 'ourbank_group';

	public function getgroup($modulename)
	{
       $select=$this->select()
         ->setIntegrityCheck(false)
             ->join(array('ourbank_modules'),array('module_id'))
             ->where('module_description=?',$modulename);

             $result=$this->fetchAll($select);
             return $result->toArray();
	}

	public function getgroupdetails($groupcode,$moduleid)
	{
	   $select = $this->select()
		->setIntegrityCheck(false)
			->join(array('a' => 'ourbank_group'),array('id','name','groupcode'))
            ->where('a.groupcode = ?',$groupcode)

			->join(array('d' => 'ourbank_groupmembers'),'d.group_id =a.id',array('count(d.id) as totalmember','d.member_id'))


			->join(array('b' => 'ourbank_address'),'b.id  = a.id', array('address1','address2','address3','city','district','state','zipcode'))
			->group('a.groupcode');
// die($select->__toString($select));
		$result = $this->fetchAll($select);
		return $result->toArray();
	}
}