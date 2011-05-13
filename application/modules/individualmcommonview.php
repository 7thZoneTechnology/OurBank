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
class Individualmcommonview_Model_individualmcommonview extends Zend_Db_Table 
{
    protected $_name = 'ourbank_member';

    //get member details
    public function getmember($id)
    {

        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_member'),array('a.id'),array('a.name as membername','a.dateofbirth','a.mobile','a.street'))
                ->join(array('b'=>'ourbank_master_gender'),'b.id=a.gender',array('b.name as gendername'))
                ->join(array('c'=>'ourbank_master_castetype'),'c.id=a.caste',array('c.name as caste'))
                ->join(array('d'=>'ourbank_master_familytype'),'d.id=a.familytype',array('d.name as familytype'))
//                 ->join(array('e'=>'ourbank_master_povertytype'),'e.id=a.povertycreteria',array('e.name as povertytype'))
                ->join(array('f'=>'ourbank_master_villagelist'),'f.id =a.village_id',array('f.name'))
                ->where('a.id=?',$id);
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    //get module id and submodule id
    public function getmodule($modulename)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('ourbank_modules'),array('module_id'))
                        ->where('module_description=?',$modulename);
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getcrop($mebmerid)
   {
       $select=$this->select()
                       ->setIntegrityCheck(false)
                       ->join(array('a'=>'ourbank_cropdetails'),array('a.id'))
                       ->where('a.member_id=?',$mebmerid)
                       ->join(array('b'=>'ourbank_master_crop'),'b.id=a.crop_id',array('b.name'));
       // die($select->__toString($select));
       $result=$this->fetchAll($select);
       return $result->toArray();
   }

    public function getagriculturedetails($mebmerid)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_agriculture'),array('a.id'))
                        ->join(array('b'=>'ourbank_master_landtypes'),'b.id=a.land_id',array('b.name'))
                        ->join(array('c'=>'ourbank_master_ownershiptype'),'c.id=a.landowner_id',array('c.name as ownertype'))
                        ->where('a.member_id=?',$mebmerid);
      
       $result=$this->fetchAll($select);
       return $result->toArray();
    }

    public function getnonlivingassetsdetails($mebmerid){
     $select=$this->select()
                     ->setIntegrityCheck(false)
                     ->join(array('a'=>'ourbank_nonlivingassetsdetails'),array('a.id'))
                     ->where('a.member_id=?',$mebmerid)
                     ->join(array('b'=>'ourbank_master_nonliveassets'),'b.id=a.nonliveasset_id',array('b.name'));
     // die($select->__toString($select));
     $result=$this->fetchAll($select);
     return $result->toArray();
   }
 

    //getting economic details
    public function geteconomicdetails($mebmerid)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_familyeconomic'),array('a.id'))
                        ->where('a.member_id=?',$mebmerid)
                        ->join(array('b'=>'ourbank_family'),'b.member_id=a.member_id && b.id=a.familymember_id',array('b.name'))
                        ->join(array('c'=>'ourbank_profession'),'c.id=a.profession',array('c.profession'));
       $result=$this->fetchAll($select);
       return $result->toArray();
    }

    public function getlivingassetsdetails($mebmerid)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_liveassetdetails'),array('a.id'))
                      ->where('a.member_id=?',$mebmerid)
                      ->join(array('b'=>'ourbank_master_liveassets'),'b.id=a.liveasset_id',array('b.name'));
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }

  public function getloandetails($mebmerid)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_loandetails'),array('a.id'))
                      ->where('a.member_id=?',$mebmerid)
		      ->join(array('b'=>'ourbank_master_loanpurpose'),'b.id=a.purpose',array('b.name as purposename'))
                      ->join(array('c'=>'ourbank_master_loansource'),'c.id=a.source_id',array('c.name'));
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }

  public function getloantotal($mebmerid)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_loandetails'),array('a.id'),array('Sum(loanamount) as loantotal','Sum(repaymentamount) as repaytotal','Sum(dueamount) as duetotal','Sum(outstandingloan) as outstandingtotal'))
                      ->where('a.member_id=?',$mebmerid);
       //die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }
  
  public function getagritotal($mebmerid)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_agriculture'),array('a.id'),array('Sum(value) as total'))
                      ->where('a.member_id=?',$mebmerid);
       //die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }
    public function getexpense($mebmerid){
       $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_expensedetails'),array('a.id'))
                      ->where('a.member_id=?',$mebmerid)
                      ->join(array('b'=>'ourbank_master_expense'),'b.id=a.expense_id',array('b.name'));
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
    }
    public function getincometotal($mebmerid)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_incomedetails'),array('a.id'),array('Sum(value) as incometotal'))
                        ->where('a.member_id=?',$mebmerid);
                
       // die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
    public function getincomedetails($mebmerid){
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_incomedetails'),array('a.id'))
                        ->where('a.member_id=?',$mebmerid)
                        ->join(array('b'=>'ourbank_master_income'),'b.id=a.income_id',array('b.name'));
        // die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

        public function servicedetails($mebmerid)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_servicedetails'),array('a.id'))
                      ->join(array('b'=>'ourbank_master_servicesectors'),'b.id=a.service_id',array('b.name'))
                      ->where('a.member_id=?',$mebmerid);
       //die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }

  public function getactivities($mebmerid)
   {
       $select=$this->select()
                       ->setIntegrityCheck(false)
                       ->join(array('a'=>'ourbank_activities'),array('a.id'))
                       ->where('a.member_id=?',$mebmerid);
       // die($select->__toString($select));
       $result=$this->fetchAll($select);
       return $result->toArray();
   }

   public function getfamilydetails($mebmerid)
   {
       $select=$this->select()
                       ->setIntegrityCheck(false)
                       ->join(array('a'=>'ourbank_family'),array('a.id'))
                       ->where('a.member_id=?',$mebmerid)
                       ->join(array('b'=>'ourbank_master_realtionshiptype'),'a.relationship_id=b.id',array('b.name as relationname'))
                       ->join(array('c'=>'ourbank_master_educationtype'),'a.eductaion_id=c.id',array('c.name as qualifyname'))
                       ->join(array('d'=>'ourbank_master_gender'),'a.gender_id=d.id',array('d.name as gendername'))
                       ->join(array('e'=>'ourbank_master_profession'),'a.profession_id=e.id',array('e.name as proffessionname'))
                       ->join(array('f'=>'ourbank_master_skills'),'a.skill=f.id',array('f.name as skillname'))
                       ->join(array('h'=>'ourbank_master_maritalstatus'),'a.maritalstatus_id=h.id',array('h.name as maritalname'));
       $result=$this->fetchAll($select);
       return $result->toArray();
   }

 
}
