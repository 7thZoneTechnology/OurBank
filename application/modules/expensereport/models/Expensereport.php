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
 *  model page for fetch and return Cashscroll details, filtered search details
 */
class Expensereport_Model_Expensereport extends Zend_Db_Table
{
    protected $_name = 'ourbank_transaction';


    public function officedetials() 
    {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_office'),array('a.id','a.name'))
                        ->where('a.officetype_id = 4');
                      //  die($select->__toString($select));
        return $this->fetchAll($select);
    }
public function getHier() {
		$select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_officehierarchy'),array('id'))
                ->where('a.id !=1 AND id !=2');
		// die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
	}
//office name
    public function officename($branchid) 
    {
        $select = $this->select()
                       ->setIntegrityCheck(false)
                        ->from(array('a' => 'ourbank_office'),array('a.name as officename'))
                        ->where('a.id = "'.$branchid.'"');
                       //die($select->__toString($select));
        return $this->fetchAll($select);
    }

	//credit
    public function totalSavingsCredit($fromDate,$toDate,$branch,$hierarchy) 


    {

switch($hierarchy)
{
		case '3':
					  $select = $this->select()
                       	->setIntegrityCheck(false)
                        ->from(array('A' => 'ourbank_master_villagelist'),array('village_id'))
                         ->where('A.panchayath_id = "'.$branch.'"')
 						->join(array('b' =>'ourbank_family'),'b.rev_village_id=A.village_id',array('b.id'))
					//	->join(array('c' =>'ourbank_familymember'),'b.id = c.family_id',array('c.id as memberid'))
						 ->join(array('C'=>'ourbank_expensedetails'),'b.id = C.family_id',array('(sum(C.value)) as value','expense_id'))
						 ->join(array('d'=>'ourbank_master_income'),'d.id = C.expense_id',array('name as incomename','id as expenseid'))
						->group('d.name');
//             die($select->__toString($select));
       break;

case '4':
					 $select = $this->select()
                       	->setIntegrityCheck(false)
						->join(array('b' =>'ourbank_family'),array('b.id'),array('b.id'))
                         ->where('b.rev_village_id = "'.$branch.'"')
						//->join(array('c' =>'ourbank_familymember'),'b.id = c.family_id',array('c.id as memberid'))
						 ->join(array('C'=>'ourbank_expensedetails'),'b.id = C.family_id',array('(sum(C.value)) as value'))
						 ->join(array('d'=>'ourbank_master_expense'),'d.id = C.expense_id',array('name as incomename','id as expenseid'))
						->group('d.name')
->order('d.id ASC');


;
                 // die($select->__toString($select));
       break;

case '5':
					 $select = $this->select()
                       	->setIntegrityCheck(false)
						->join(array('b' =>'ourbank_groupmembers'),array('b.id'))
                         ->where('b.id = "'.$branch.'"')
						->join(array('c' =>'ourbank_familymember'),'c.id = b.member_id',array('c.id as memberid'))
						 ->join(array('C'=>'ourbank_expensedetails'),'C.family_id = c.family_id',array('expense_id'))
						 ->join(array('d'=>'ourbank_master_expense'),'d.id = C.expense_id',array('(sum(C.value)) as value','name as incomename','id as expenseid'))
						->group('d.name')
					->order('d.id ASC');

                
        		break;
}
// die($select->__toString($select));
$result = $this->fetchAll($select);
return $result->toArray();

}
    public function totalSavingsCreditg($group) {

                       $select = $this->select()
                       	->setIntegrityCheck(false)
                       	->join(array('a' => 'ourbank_groupmembers'),array('id'))
						->where('a.group_id = ?',$group)
						->join(array('b' =>'ourbank_familymember'),'a.member_id = b.id')
							->join(array('C'=>'ourbank_expensedetails'),'b.id = C.family_id',array('(sum(C.value)) as value','expense_id'))
						 ->join(array('d'=>'ourbank_master_expense'),'d.id = C.expense_id',array('name as incomename'))
						->group('d.name')


;
               //   die($select->__toString($select));
        return $this->fetchAll($select);


}
 public function totalincome() {

                         $select = $this->select()
                       	->setIntegrityCheck(false)
                       	->join(array('a' => 'ourbank_master_income'),array('id'));
						//->where('a.group_id = ?',$group)
               //   die($select->__toString($select));
        return $this->fetchAll($select);


}




}
