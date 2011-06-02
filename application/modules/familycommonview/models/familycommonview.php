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
class Familycommonview_Model_familycommonview extends Zend_Db_Table 
{
    protected $_name = 'ourbank_family';

    //get member details
    public function getfamily($id)
    {

        $select=$this->select()
            ->setIntegrityCheck(false)
            ->join(array('a'=>'ourbank_family'),array('a.id'))
            ->join(array('c'=>'ourbank_master_castetype'),'c.id=a.caste_id',array('c.name as caste'))
            ->join(array('d'=>'ourbank_master_familytype'),'d.id=a.familytype_id',array('d.name as familytype'))
            ->join(array('f'=>'ourbank_office'),'f.id =a.rev_village_id',array('f.name as villagename'))
/*            ->join(array('e'=>'ourbank_master_subcaste'),'e.id =a.subcaste_id',array('e.name as subcaste'))*/
            ->join(array('g'=>'ourbank_master_rationcard'),'g.id =a.ration_id',array('g.name as ration'))
            ->join(array('i'=>'ourbank_master_sourceofincome'),'i.id =a.income_id',array('i.name as income'))
 			 ->where('a.id=?',$id)
		    ->join(array('j'=>'ourbank_master_habitation'),'j.id =a.village_id',array('j.name as names'));
//        die($select->__toString($select));
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
                       ->where('a.family_id=?',$mebmerid)
                       ->join(array('b'=>'ourbank_master_crop'),'b.id=a.crop_id',array('b.name'))
                        ->join(array('c'=>'ourbank_master_landtypes'),'c.id=a.land_id',array('c.name as landtypename'))
                        ->join(array('d'=>'ourbank_master_seasons'),'d.id=a.season_id',array('d.name as season'));

       // die($select->__toString($select));
       $result=$this->fetchAll($select);
       return $result->toArray();
   }

    public function getagriculturedetails($familyid)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_agriculture'),array('a.id'))
                        ->join(array('b'=>'ourbank_master_landtypes'),'b.id=a.land_id',array('b.name'))
                        ->join(array('c'=>'ourbank_familymember'),'c.id =a.landowner_name',array('c.name as membername'))
                        ->join(array('d'=>'ourbank_master_villagelist'),'d.id =a.villagename',array('d.name as villagename'))
                        ->where('a.family_id=?',$familyid);
       //die($select->__toString($select));
       $result=$this->fetchAll($select);
       return $result->toArray();
    }

     public function getnonlivingassetsdetails($mebmerid){
     $select=$this->select()
                     ->setIntegrityCheck(false)
                     ->join(array('a'=>'ourbank_nonlivingassetsdetails'),array('a.id'))
                     ->where('a.family_id=?',$mebmerid)
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
       return $result-toArray();
    }

    public function getlivingassetsdetails($mebmerid)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_liveassetdetails'),array('a.id'))
                      ->where('a.family_id=?',$mebmerid)
                      ->join(array('b'=>'ourbank_master_liveassets'),'b.id=a.liveasset_id',array('b.name'));
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }

   public function getloandetails($familyid)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_loandetails'),array('a.id'))
		      ->join(array('b'=>'ourbank_master_loanpurpose'),'b.id=a.purpose_id',array('b.name as purposename'))
                      ->join(array('c'=>'ourbank_master_loansource'),'c.id=a.source_id',array('c.name'))
                      ->join(array('d'=>'ourbank_familymember'),'d.id=a.member_id',array('d.name as membername'))
                      ->where('d.family_id=?',$familyid);

      //die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }
  public function getsavingsdetails($mebmerid)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_savingdetails'),array('a.id'))
                      ->where('a.family_id=?',$mebmerid)
                      ->join(array('c'=>'ourbank_master_deposit'),'c.id=a.source_id',array('c.name'));

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
  
 
    public function getexpense($mebmerid){
       $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_expensedetails'),array('a.id'))
                      ->where('a.family_id=?',$mebmerid)
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

    public function gethabithealth($familyid){
       $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_healthhabitdetails'),array('a.id'))
                      ->where('a.family_id=?',$familyid)
                      ->join(array('b'=>'ourbank_master_habit'),'b.id=a.habit_id',array('b.name as habitname'))
                      ->join(array('c'=>'ourbank_familymember'),'c.id=a.member_id',array('c.name as membername'));
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
    }
 public function gethabitphychallenge($familyid){
       $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_healthphychallenge'),array('a.id'))
                      ->where('a.family_id=?',$familyid)
                        ->join(array('b'=>'ourbank_master_phychallenge'),'b.id=a.phychallenge_id',array('b.name as challengename'))
                        ->join(array('c'=>'ourbank_familymember'),'c.id=a.member_id',array('c.name as membername'));      
      $result=$this->fetchAll($select);
      return $result->toArray();
    }  

public function getchronicdisease($familyid){
       $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_healthdiseasedetails'),array('a.id'))
                      ->where('a.family_id=?',$familyid)
                        ->join(array('b'=>'ourbank_master_diseasetypes'),'b.id=a.healthdisease',array('b.name as diseasename'))
                      ->join(array('c'=>'ourbank_familymember'),'c.id=a.member_id',array('c.name as membername'));      
      $result=$this->fetchAll($select);
      return $result->toArray();
    } 
    public function getfamilyname($familyid)
    {
        $select=$this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a'=>'ourbank_familymember'),array('a.id'),array('id','name'))
                        ->where('a.family_id=?',$familyid);
    
        $result=$this->fetchAll($select);
        return $result->toArray();
    }
    
    
    public function getfamilydetails($mebmerid)
    {
        $select=$this->select()
        ->setIntegrityCheck(false)
        ->join(array('a'=>'ourbank_familymember'),array('a.id'))
        ->where('a.family_id=?',$mebmerid)
        ->join(array('b'=>'ourbank_master_realtionshiptype'),'a.relationship_id=b.id',array('b.name as relationname'))
        ->join(array('d'=>'ourbank_master_employmenttype'),'d.id =a.employment_status',array('d.name as employmentname'))
        ->join(array('c'=>'ourbank_master_educationtype'),'a.eductaion_id=c.id',array('c.name as qualifyname'))
        ->join(array('h'=>'ourbank_master_maritalstatus'),'a.maritalstatus_id=h.id',array('h.name as maritalname'))
        ->join(array('i'=>'ourbank_master_branch'),'a.branch_po=i.id',array('i.name as branchname'))
        ->join(array('j'=>'ourbank_master_bloodtype'),'a.blood_id=j.id',array('j.name as blood'))
        ->join(array('g'=>'ourbank_master_bank'),'a.bank=g.id',array('g.name as bankname'))                ->join(array('k'=>'ourbank_master_gender'),'a.gender_id = k.id',array('k.name as gendername'))

        ->join(array('m'=>'ourbank_master_cbopromoter'),'a.promoter_id=m.id',array('m.name as promoter'))
        ->join(array('n'=>'ourbank_master_cbos'),'a.cbo_id=n.id',array('n.name as cbos'))
        ->join(array('r'=>'ourbank_master_accountype'),'a.accouttype_id =r.id',array('r.name as accountype'));

     //   die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
   }

        public function getentitlement($id){
	$select=$this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a'=>'ourbank_memberentitlememnt'),array('a.id'),array('a.entitlement_id'))
                    ->join(array('c'=>'ourbank_master_entitlements'),'c.id=a.entitlement_id',array('c.name as entitlename'))
                    ->where('a.member_id=?',$id);
         // die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
        }

        public function getprofession($id){
	$select=$this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a'=>'ourbank_memberprofession'),array('a.id'),array('a.profession_id'))
                    ->join(array('c'=>'ourbank_master_profession'),'c.id=a.profession_id',array('c.name as professionname'))
                    ->where('a.member_id=?',$id);
         // die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
        }

//pra based services
        public function praservice($mebmerid)
	{
	$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_praservice'),array('a.id'))
			->join(array('b'=>'ourbank_master_servicesectors'),'b.id=a.source_id',array('b.name'))
			->where('a.family_id=?',$mebmerid);
//          die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
	}
//end pra based services

//basic infrastructure

//view housingtype,ownership,cookfuel infrastructure

         public function housingtype($mebmerid)
	{
	$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_infrastructure'),array('a.id'))
			->join(array('b'=>'ourbank_master_housingtype'),'b.id=a.housetype_id',array('b.name'))
			->where('a.member_id=?',$mebmerid);
	//die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
	}
         public function ownership($mebmerid)
	{
	$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_infrastructure'),array('a.id'))
			->join(array('b'=>'ourbank_master_ownershiptype'),'b.id=a.ownership_id',array('b.name'))
			->where('a.member_id=?',$mebmerid);
	//die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
	}
         public function cookfuel($mebmerid)
	{
	$select=$this->select()
			->setIntegrityCheck(false)
			->join(array('a'=>'ourbank_infrastructure'),array('a.id'))
			->join(array('b'=>'ourbank_master_cookingfuel'),'b.id=a.fuel_id',array('b.name'))
			->where('a.member_id=?',$mebmerid);
	//die($select->__toString($select));
	$result=$this->fetchAll($select);
	return $result->toArray();
	}

    public function getinsurance($id)
    {

        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_insurance'),array('a.id'))
                ->join(array('b'=>'ourbank_master_insurance'),'b.id=a.insurance_id',array('b.name as insurancename'))
                ->where('a.family_id=?',$id);
      //      die($select->__toString($select));
            $result=$this->fetchAll($select);
            return $result->toArray();
    }
public function getacretotal($id)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_agriculture'),array('a.id'),array('Sum(acre) as total'))
                      ->where('a.family_id=?',$id);
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }
public function getguntatotal($id)
  {
      $select=$this->select()
                      ->setIntegrityCheck(false)
                      ->join(array('a'=>'ourbank_agriculture'),array('a.id'),array('Sum(gunta) as total'))
                      ->where('a.family_id=?',$id);
      // die($select->__toString($select));
      $result=$this->fetchAll($select);
      return $result->toArray();
  }

//end basic infrastructure
}
