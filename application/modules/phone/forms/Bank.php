<?php
class Bank_Form_Bank extends Zend_Form 
{
    public function init() 
    {
	//$fieldtype,$fieldname,$table,$columnname,$cssname,$labelname,$required,$validationtype,$min,$max,$rows,$cols,$decorator,$value
	$formfield = new App_Form_Field ();
        $name = $formfield->field('Text','name','','','mand','Name',true,'','','','','',1,0);
        $status = $formfield->field('Checkbox','status','','','','Active',false,'','','','','',1,0);
        $code = $formfield->field('Text','code','','','','Code',true,'','','','','',1,0);
        $description = $formfield->field('Text','description','','','','Description',true,'','','','','',1,0);
        //hidden feilds
	$id = $formfield->field('Hidden','id','','','','',false,'','','','','',0,0);
	$createdBy = $formfield->field('Hidden','created_by','','','','',false,'','','','','',0,1);
        $createdDate = $formfield->field('Hidden','created_date','','','','',false,'','','','','',0,date("y/m/d H:i:s"));
	$this->addElements(array($name,$status,$code,$description,$id,$createdBy,$createdDate));
    }
}
