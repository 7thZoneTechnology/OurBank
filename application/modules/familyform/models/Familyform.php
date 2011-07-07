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
class Familyform_Model_Familyform extends Zend_Db_Table 
{
    protected $_name = 'ourbank_familymember';

    public function getFamilydetails($id) 
	{
        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_familymember'),array('id','dob'))
                ->where('a.familycode=?',$id)
                ->join(array('b'=>'ourbank_family'),'b.id=a.family_id')
                ->join(array('c'=>'ourbank_office'),'c.id=b.id',array('c.name as villagename'))
                ->join(array('d'=>'ourbank_master_gender'),'d.id=a.gender_id',array('d.name as sex'))
                ->join(array('e'=>'ourbank_master_castetype'),'e.id=b.caste_id',array('e.name as castetype'))
                ->join(array('f'=>'ourbank_master_educationtype'),'f.id=a.eductaion_id',array('f.name as educationname'))
                ->join(array('g'=>'ourbank_master_familytype'),'g.id=b.familytype_id',array('f.name as familytype'));


				
// 		 die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
   	}
 public function getfamily($id)
    {

        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_familymember'),array('a.id'))
        ->where('a.familycode=?',$id)
         ->join(array('b'=>'ourbank_master_realtionshiptype'),'a.relationship_id=b.id',array('b.name as relationname'))
         ->join(array('k'=>'ourbank_master_gender'),'a.gender_id=k.id',array('k.name as genername'))
         ->join(array('c'=>'ourbank_master_educationtype'),'a.eductaion_id=c.id',array('c.name as qualifyname'))
        ->join(array('e'=>'ourbank_master_profession'),'a.promoter_id=e.id',array('e.name as proffessionname'))
         ->join(array('h'=>'ourbank_master_maritalstatus'),'a.maritalstatus_id=h.id',array('h.name as maritalname'))
         ->join(array('i'=>'ourbank_master_branch'),'a.branch_po=i.id',array('i.name as branchname'))
        ->join(array('j'=>'ourbank_master_bloodtype'),'a.blood_id=j.id',array('j.name as blood'))
         ->join(array('g'=>'ourbank_master_bank'),'a.bank=g.id',array('g.name as bankname'));
//         die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
    public function getliving()
    {

        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_master_liveassets'),array('a.id'));
       
//        die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
  public function getnonliving()
    {

        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_master_nonliveassets'),array('a.id'));
       
       // die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
  public function getlivingassetsdetails($id)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_familymember'),array('a.id'))
                      ->where('a.familycode=?',$id)
                      ->join(array('b'=>'ourbank_family'),'a.family_id=b.id')
						->join(array('c'=>'ourbank_liveassetdetails'),'c.family_id=b.id',array('number as number','value as value'))
                      ->join(array('d'=>'ourbank_master_liveassets'),'d.id=c.liveasset_id',array('d.name'));
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }

 public function getagriculturedetails($id)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
						->join(array('d'=>'ourbank_familymember'),array('d.id'))
                      	->where('d.familycode=?',$id)
						->join(array('e'=>'ourbank_family'),'d.family_id=e.id')
                        ->join(array('a'=>'ourbank_agriculture'),'e.id=a.land_id',array('a.id','a.landowner_name','a.villagename','a.survey_no','acre','gunta'))
                        ->join(array('b'=>'ourbank_master_landtypes'),'b.id=a.land_id',array('b.name'));
						
      // die($select->__toString($select));
       $result=$this->fetchAll($select);
       return $result->toArray();
    }
 public function getagritotal($id)
  {
      					$select=$this->select()
                      ->setIntegrityCheck(false)
                        ->join(array('d'=>'ourbank_familymember'),array('d.id'))
                      	->where('d.familycode=?',$id)
                        ->join(array('e'=>'ourbank_family'),'d.family_id=e.id')
                      ->join(array('a'=>'ourbank_agriculture'),'e.id=a.land_id',array('a.id'));
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }
public function Searchloanprocess($id){
 $this->db = Zend_Db_Table::getDefaultAdapter();
     
            $sql = "
            SELECT 
              a.familycode as code,
              a.name as name,
              b.request_amount as Amount,
              b.member_id as memberid , 
              b.created_date as requestdate ,
              c.name as loanstatus ,
              d.name as loanpurpose
            from
              ourbank_familymember a,
              ourbank_loanprocess b,
              ourbank_master_loanstatus c,
              ourbank_master_loanpurpose d
            where
              a.id = b.member_id and
              b.purpose = d.id and
              b.status = c.id and
              b.membertype = 1
              and
              (a.familycode like '%' '$id' '%')";
        
//echo $sql;
            $result = $this->db->fetchAll($sql);
            return $result;
        }
public function searchaccounts($id) 
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);

        $sql="SELECT 
                A.name as name,
                A.familycode as code,
                B.name as officename,
                B.id as officeid,
                D.account_number as number,
                D.id as accId,
                E.name as loanname,
                E.glsubcode_id as gl,
                F.loan_amount as amount,
                F.loan_installments as installments,
                DATE_FORMAT(F.loansanctioned_date, '%d/%m/%Y') as sanctioned,
                F.loan_interest as interest,
                F.interesttype_id as interesttype,
                F.savingsaccount_id as sAccId
                FROM
                ourbank_familymember A,
                ourbank_office B,
                ourbank_accounts D,
                ourbank_productsoffer E,
                ourbank_loanaccounts F
                WHERE 
                (A.familycode = '$id') AND
                D.membertype_id = substr(A.familycode,5,1) AND
                D.member_id = A.id AND
                B.id=A.village_id AND
                D.product_id = E.id AND
                F.account_id = D.id";
       //  echo $sql;
        $result = $db->fetchAll($sql);
        return $result;
    }
}
