<?php
class Loanprocess_Form_Jlgadvances extends Zend_Form 
{
    public function init() 
    {
    	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
       	$formfield = new App_Form_Field ();
        $dateofformation = $formfield->field('Text','dateofformation','','','','',false,'','','','','',0,0);
        $loantaken = $formfield->field('Checkbox','loantaken','','','','',false,'','','','','',0,0);
        $branchname = $formfield->field('Text','branchname','','','','',false,'','','','','',0,0);
        $limitenjoy = $formfield->field('Text','limitenjoy','','','','',false,'','','','','',0,0);
        $accno = $formfield->field('Text','accno','','','','',false,'','','','','',0,0);
        $dateofadvance = $formfield->field('Text','dateofadvance','','','','',false,'','','','','',0,0);
        $dateofclosure = $formfield->field('Text','dateofclosure','','','','',false,'','','','','',0,0);

        $totalmembers = $formfield->field('Text','totalmembers','','','','',false,'','','','','',0,0);
        $anymember = $formfield->field('Text','anymember','','','','',false,'','','','','',0,0);
        $periodicalmeeting = $formfield->field('Select','periodicalmeeting','','','','',false,'','','','','',0,0);
        $otherbankbranch = $formfield->field('Text','otherbankbranch','','','','',false,'','','','','',0,0);
        $repayment = $formfield->field('Text','repaymentinstallment','','','','',false,'','','','','',0,0);
        $interestrate = $formfield->field('Text','interestrate','','','','',false,'','','','','',0,0);
        $appsource = $formfield->field('Select','appsource','','','','',false,'','','','','',0,0);

        $samevil = $formfield->field('Text','samevillageavailability','','','','',false,'','','','','',0,0);
        $declaration = $formfield->field('Checkbox','declaration','','','','',false,'','','','','',0,0);
        $rotatedperiod = $formfield->field('Checkbox','rotatedperiod','','','','',false,'','','','','',0,0);
        $jlgothrbankacc = $formfield->field('Checkbox','Jlgothrbankacc','','','','',false,'','','','','',0,0);
        $memothrbankacc = $formfield->field('Checkbox','memberothrbankacc','','','','',false,'','','','','',0,0);
        $memavailbc = $formfield->field('Checkbox','memavailbc','','','','',false,'','','','','',0,0);
        $statuoryreq = $formfield->field('Checkbox','statuoryreq','','','','',false,'','','','','',0,0);

        $meetregfr = $formfield->field('Text','meetingregisterfrom','','','','',false,'','','','','',0,0);
        $meetregto = $formfield->field('Text','meetingregisterto','','','','',false,'','','','','',0,0);
        $savingregfr = $formfield->field('Text','savingregisterfrom','','','','',false,'','','','','',0,0);
        $savingregto = $formfield->field('Text','savingregisterto','','','','',false,'','','','','',0,0);   $internalregfrom = $formfield->field('Text','internalregfrom','','','','',false,'','','','','',0,0);
        $internalregto = $formfield->field('Text','internalregto','','','','',false,'','','','','',0,0);

        $jlgpassbook = $formfield->field('Checkbox','jlgpassbook','','','','',false,'','','','','',0,0);
        $totalsaving = $formfield->field('Text','totalsaving','','','','',false,'','','','','',0,0);
        $totalinterest = $formfield->field('Text','totalinterest','','','','',false,'','','','','',0,0);
        $revolvingfund = $formfield->field('Text','revolvingfund','','','','',false,'','','','','',0,0);
        $onssubsidy = $formfield->field('Text','onssubsidy','','','','',false,'','','','','',0,0);
        $totalcorpus = $formfield->field('Text','totalcorpus','','','','',false,'','','','','',0,0);
        $internallend = $formfield->field('Text','internallend','','','','',false,'','','','','',0,0);
        $otherexpense = $formfield->field('Text','otherexpense','','','','',false,'','','','','',0,0);
        $cashonhand = $formfield->field('Text','cashonhand','','','','',false,'','','','','',0,0);
        $amountinbank = $formfield->field('Text','amountinbank','','','','',false,'','','','','',0,0);

	$submit = $formfield->field('Submit','submit','','','','',false,'','','','','',0,0);
        $this->addElements(array($dateofformation,$loantaken,$branchname,$limitenjoy,$accno,$dateofadvance,$dateofclosure,$totalmembers,$anymember,$periodicalmeeting,$otherbankbranch,$repayment,$interestrate,$appsource,$samevil,$declaration,$rotatedperiod,$jlgothrbankacc,$memothrbankacc,$memavailbc,$statuoryreq,$meetregfr,$meetregto,$savingregfr,$savingregto,$internalregfrom,$internalregto,$jlgpassbook,$totalsaving,$totalinterest,$revolvingfund,$onssubsidy,$totalcorpus,$internallend,$otherexpense,$cashonhand,$amountinbank,$submit));
    }
}