<?php
class groupgrading_Form_shgadvances extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
        $gmeeting = $formfield->field('Text','gmeeting','','','','',false,'','','','','',0,0);
        $gattendance = $formfield->field('Text','gattendance','','','txt','',false,'','','','','',0,0);
        $gsaving = $formfield->field('Text','gsaving','','','txt','',false,'','','','','',0,0);
        $gmeetdiscipline = $formfield->field('Text','gmeetdiscipline','','','txt','',false,'','','','','',0,0);
        $gparticipation = $formfield->field('Text','gparticipation','','','txt','',false,'','','','','',0,0);
        $gweeklymeet = $formfield->field('Text','gweeklymeet','','','txt','',false,'','','','','',0,0);
        $gchangememb = $formfield->field('Text','gchangememb','','','txt','',false,'','','','','',0,0);
        $gpreparation = $formfield->field('Text','gpreparation','','','txt','',false,'','','','','',0,0);
        $gsigningmemb = $formfield->field('Text','gsigningmemb','','','txt','',false,'','','','','',0,0);
        $ggroupcooperation = $formfield->field('Text','ggroupcooperation','','','txt','',false,'','','','','',0,0);
        $ggroupsustaiable = $formfield->field('Text','ggroupsustaiable','','','txt','',false,'','','','','',0,0);

        $bookkeeping = $formfield->field('Text','bookkeeping','','','','',false,'','','','','',0,0);
        $bsavingattend = $formfield->field('Text','bsavingattend','','','txt','',false,'','','','','',0,0);
        $bloandisburse = $formfield->field('Text','bloandisburse','','','txt','',false,'','','','','',0,0);
        $bdiscussion = $formfield->field('Text','bdiscussion','','','txt','',false,'','','','','',0,0);
        $bincomeandexpend = $formfield->field('Text','bincomeandexpend','','','txt','',false,'','','','','',0,0);
        $bindividualsave = $formfield->field('Text','bindividualsave','','','txt','',false,'','','','','',0,0);
        $bindividualloan = $formfield->field('Text','bindividualloan','','','txt','',false,'','','','','',0,0);
        $bgeneralacc = $formfield->field('Text','bgeneralacc','','','txt','',false,'','','','','',0,0);

        $ppreviousloaninfo = $formfield->field('Text','ppreviousloaninfo','','','','',false,'','','','','',0,0);
        $ploanholder = $formfield->field('Text','ploanholder','','','txt','',false,'','','','','',0,0);
        $pusageofsaving = $formfield->field('Text','pusageofsaving','','','txt','',false,'','','','','',0,0);
        $ploanrepayment = $formfield->field('Text','ploanrepayment','','','txt','',false,'','','','','',0,0);
        $pminimumrepay = $formfield->field('Text','pminimumrepay','','','txt','',false,'','','','','',0,0); 

        $farmerschoolinfo = $formfield->field('Text','farmerschoolinfo','','','','',false,'','','','','',0,0);
        $fparticipation = $formfield->field('Text','fparticipation','','','txt','',false,'','','','','',0,0);
        $ffarmerschool = $formfield->field('Text','ffarmerschool','','','txt','',false,'','','','','',0,0);
        $fweeklyplan = $formfield->field('Text','fweeklyplan','','','txt','',false,'','','','','',0,0);
        $fschoollearning = $formfield->field('Text','fschoollearning','','','txt','',false,'','','','','',0,0);
        $totalmarks = $formfield->field('Text','totalmarks','','','amount','',false,'','','','','',0,0);
        $totalmarks->setAttrib('readonly',true);
        $percentage = $formfield->field('Text','percentage','','','percentage','',false,'','','','','',0,0);
        $percentage->setAttrib('readonly',true);
        $observe = $formfield->field('Textarea','observe','','','txt','',false,'','','',6,27,0,0);

        $this->addElements(array($gmeeting,$gattendance,$gsaving,$gmeetdiscipline,$gparticipation,$gweeklymeet,$gchangememb,$gpreparation,$gsigningmemb,$ggroupcooperation,$ggroupsustaiable,$bookkeeping,$bsavingattend,$bloandisburse,$bdiscussion,$bincomeandexpend,$bindividualsave,$bindividualloan,$bgeneralacc,$ppreviousloaninfo,$ploanholder,$pusageofsaving,$ploanrepayment,$pminimumrepay,$farmerschoolinfo,$fparticipation,$ffarmerschool,$fweeklyplan,$fschoollearning,$totalmarks,$percentage,$observe));
    }
}