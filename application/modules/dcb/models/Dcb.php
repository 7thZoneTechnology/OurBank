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
 *  model page for fetch and return Dcb details, filtered search details
 */
class Dcb_Model_Dcb extends Zend_Db_Table
{
    protected $_name = 'ourbank_transaction';
    // loan details	
    public function fetchloanDetails($Date,$account,$Type) {
    if($Type == 2 or $Type == 3){
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('d'=>'ourbank_accounts'),array('id'))
                ->where('d.status_id=3 OR d.status_id=1')
                ->where('d.membertype_id=2 OR d.membertype_id=3')
                ->join(array('c'=>'ourbank_productsoffer'),'c.id = d.product_id')
                ->join(array('e'=>'ourbank_installmentdetails'),'d.id = e.account_id',array('e.installment_status','e.installment_principal_amount','e.installment_interest_amount','e.installment_date'))
                ->where('e.installment_date <="'.$Date.'"')
                ->join(array('f'=>'ourbank_group'),'f.id = d.member_id',array('f.id','f.village_id'))
                ->join(array('g'=>'ourbank_office'),'g.id = f.village_id',array('g.name as office_name','g.id as officeid'));
        //die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result;
      }
     if($Type==1){
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('d'=>'ourbank_accounts'),array('id'))
                ->where('d.status_id=3 OR d.status_id=1')
                ->where('d.membertype_id=1')
                ->where('d.account_number like "%" ? "%"',$account)
                ->join(array('c'=>'ourbank_productsoffer'),'c.id = d.product_id')
                ->join(array('e'=>'ourbank_installmentdetails'),'d.id = e.account_id',array('e.installment_status','e.installment_principal_amount','e.installment_interest_amount','e.installment_date'))
                ->where('e.installment_date <="'.$Date.'"')
                ->join(array('f'=>'ourbank_familymember'),'f.id = d.member_id',array('f.id','f.village_id'))
                ->join(array('g'=>'ourbank_office'),'g.id = f.village_id',array('g.name as office_name','g.id as officeid'));
        //die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result;
        }
    }

    public function fetchgrouploan($Date,$groupid) {
        $select = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('d'=>'ourbank_accounts'),array('id'))
                ->where('d.status_id=3 OR d.status_id=1')
                ->where('d.membertype_id=2 OR d.membertype_id=3')
                ->join(array('c'=>'ourbank_productsoffer'),'c.product_id = d.product_id')
                ->join(array('e'=>'ourbank_installmentdetails'),'d.id = e.account_id',array('e.installment_status','e.installment_principal_amount','e.installment_interest_amount','e.installment_date'))
                ->where('e.installment_date <="'.$Date.'"')
                ->join(array('f'=>'ourbank_group'),'f.id = d.member_id',array('f.id','f.village_id'))
                ->where('f.id like "%" ? "%"',$groupid)
                ->join(array('g'=>'ourbank_office'),'g.id = f.village_id',array('g.name as office_name','g.id as officeid'));
        //die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result;
    }

    public function fetchvillageloan($Date,$village)
    {
        $select1 = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('d'=>'ourbank_accounts'),array('id'))
                ->where('d.status_id=3 OR d.status_id=1')
                ->where('d.membertype_id=1')
                ->join(array('c'=>'ourbank_productsoffer'),'c.id = d.product_id')
                ->join(array('e'=>'ourbank_installmentdetails'),'d.id = e.account_id',array('e.installment_status','e.installment_principal_amount','e.installment_interest_amount','e.installment_date'))
                ->where('e.installment_date <="'.$Date.'"')
                ->join(array('f'=>'ourbank_familymember'),'f.id = d.member_id',array('f.id','f.village_id'))
                ->where('f.village_id like "%" ? "%"',$village)
                ->join(array('g'=>'ourbank_office'),'g.id = f.village_id',array('g.name as office_name','g.id as officeid'));

         $select2 = $this->select()
                ->setIntegrityCheck(false)  
                ->join(array('d'=>'ourbank_accounts'),array('id'))
                ->where('d.status_id=3 OR d.status_id=1')
                ->where('d.membertype_id=1')
                ->join(array('c'=>'ourbank_productsoffer'),'c.id = d.product_id')
                ->join(array('e'=>'ourbank_installmentdetails'),'d.id = e.account_id',array('e.installment_status','e.installment_principal_amount','e.installment_interest_amount','e.installment_date'))
                ->where('e.installment_date <="'.$Date.'"')
                ->join(array('f'=>'ourbank_group'),'f.id = d.member_id',array('f.id','f.village_id'))
                ->where('f.village_id like "%" ? "%"',$village)
                ->join(array('g'=>'ourbank_office'),'g.id = f.village_id',array('g.name as office_name','g.id as officeid'));

        $select = $this->select()
                ->union(array($select1, $select2));
        //die($select->__toString($select));
        $result = $this->fetchAll($select);
        return $result;
    }

//     // account details	
//     public function accounts() {
//             $select = $this->select()
//                     ->setIntegrityCheck(false)  
//                     ->join(array('a' => 'ourbank_accounts'),array('id'))
//                     ->where('a.status_id=3 OR a.status_id=1')
//                     ->join(array('D'=>'ourbank_familymember'),'D.id = a.member_id');
//             return $this->fetchAll($select);
//     }


    // office details
//     public function office() {
//             $select = $this->select()
//                     ->setIntegrityCheck(false)
//                     ->from(array('a' => 'ourbank_familymember'),array('village_id','id'))
//                     ->join(array('b'=>'ourbank_office'),'a.village_id = b.id',array('name as officename','id as officeid'))
//                     ->group('a.village_id');
//             return $this->fetchAll($select);
//     }

        public function office($village,$hiearchyid) {
            $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->from(array('a' => 'ourbank_office'),array('name as villagename','id as village_id'))
                    ->where('a.officetype_id =?',$hiearchyid)
                    ->where('a.id like "%" ? "%"',$village);
            //die($select->__toString($select));
            return $this->fetchAll($select);
        }

        public function getofficehierarchy()
        {
         $db = $this->getAdapter();
        $sql = "SELECT id as hierarchyid FROM `ourbank_officehierarchy` where Hierarchy_level in (SELECT max(Hierarchy_level) FROM `ourbank_officehierarchy`)";
        $result = $db->fetchAll($sql);
        return $result;
        }
	
}