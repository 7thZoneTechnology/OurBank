<?php
class Loans_Form_Loan extends Zend_Form {
    public function init() {

        $formfield = new App_Form_Field();
        $table='ourbank_productsofferdetails';
        $fieldname1='offerproductname';
        $fieldname2='offerproductshortname';
        $offerproductupdate_id = new Zend_Form_Element_Hidden('offerproductupdate_id');

        $product_id = $formfield->field('Select','product_id','','','mand','',true,'','','','','','','');
        $offerproductname = $formfield->field('Text','offerproductname',$table,$fieldname1,'mand','',true,'','','','','','','');

        $offerproductshortname = $formfield->field('Text','offerproductshortname',$table,$fieldname2,'mand','',true,'','','','','','','');
        $offerproductshortname->addValidator('StringLength', false, array(1, 3));

        $offerproduct_description= new Zend_Form_Element_Textarea('offerproduct_description', array('rows' => 3,'cols' => 20,));
        $offerproduct_description->setAttrib('class', '');
        $offerproduct_description->setRequired(true)
                                ->addValidators(array(array('NotEmpty')));

        $begindate = $formfield->field('Text','begindate','','','mand','',true,'','','','','','','');
        $closedate = $formfield->field('Text','closedate','','','mand','',true,'','','','','','','');
        $applicableto = $formfield->field('Select','applicableto','','','mand','',true,'','','','','','','');
        $glsubcode_id = $formfield->field('Select','glsubcode_id','','','mand','',true,'','','','','','','');
        $interesttype = $formfield->field('Select','interesttype_id','','','mand','',true,'','','','','','','');

        $minmumloanamount = $formfield->field('Text','minmumloanamount','','','mand','',true,'','','','','','','');
        $minmumloanamount->addValidators(array(array('stringLength', false, array(3,10))));
        $minmumloanamount->addValidators(array(array('Float')));

        $maximunloanamount = $formfield->field('Text','maximunloanamount','','','mand','',true,'','','','','','','');
        $maximunloanamount->addValidators(array(array('stringLength', false, array(3,10))));
        $maximunloanamount->addValidators(array(array('Float')));

        $minimumfrequency = $formfield->field('Text','minimumfrequency','','','mand','',true,'','','','','','','');
        $minimumfrequency->addValidators(array(array('stringLength', false, array(3,5))));
        $minimumfrequency->addValidators(array(array('Float')));
        
        $maximumfrequency = $formfield->field('Text','maximumfrequency','','','mand','',true,'','','','','','','');
        $maximumfrequency->addValidators(array(array('stringLength', false, array(3,5))));
        $maximumfrequency->addValidators(array(array('Digits')));

        $graceperiodnumber = $formfield->field('Text','graceperiodnumber','','','mand','',true,'','','','','','','');
        $graceperiodnumber->addValidators(array(array('stringLength', false, array(1,1))));
        $graceperiodnumber->addValidators(array(array('Digits')));

        $penal_Interest = $formfield->field('Text','penal_Interest','','','mand','',true,'','','','','','','');
        $penal_Interest->addValidators(array(array('Float')));

        $submit = $formfield->field('Submit','Submit','','','','','','','','','','','','');

        $this->addElements(array($offerproductname,$offerproductshortname,
                                        $offerproduct_description,$offerproductupdate_id,
                                        $begindate,$closedate,
                                        $applicableto,$minmumloanamount,
                                        $maximunloanamount,$minimumfrequency,
                                        $maximumfrequency,$graceperiodnumber,$product_id,$submit,$penal_Interest,$glsubcode_id,$interesttype));
    }
}
