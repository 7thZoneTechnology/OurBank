<?php
class settings_Form_Dropdown extends  ZendX_JQuery_Form 
{
    public function init() 
    {
        $text_value = new Zend_Form_Element_Text('textvalue');
        $text_value->setAttrib('class', 'txt_put');
        $text_value->addValidators(array(array('NotEmpty')))
                    ->setRequired(true);

$name = new Zend_Form_Element_Text('name');
        $name->setAttrib('class', 'txt_put');
        $name->addValidators(array(array('NotEmpty')))
                    ->setRequired(true);


        $table_name = new Zend_Form_Element_Hidden('table_name');
        $id = new Zend_Form_Element_Hidden('id');
        $attr = new Zend_Form_Element_Hidden('attr');

        $submit=new Zend_Form_Element_Submit('Add');

        $this->addElements(array($text_value,$table_name,$id,$attr,$name,$submit));
    }
}