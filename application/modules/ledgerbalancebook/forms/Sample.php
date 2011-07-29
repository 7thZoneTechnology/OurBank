<?php
class Reports_Form_Sample extends Zend_Form {
   public function __construct($option=null)
   {
       parent::__construct($option);
       $this->setMethod('post');

            $this->setDecorators(array(
                'FormElements',
                array('HtmlTag',array('tag'=>'table','id' => 'hor-minimalist-b')),
                'Form'
            ));

       $username=$this->CreateElement('text','username')
                       ->setLabel('User Name:');
       $username->setDecorators(array(
               'ViewHelper',
               'Description',
               'Errors',
               array(array('data'=>'HtmlTag'), array('tag' => 'td')),
               array('Label', array('tag' => 'td')),
               array(array('row'=>'HtmlTag'),array('tag'=>'tr', 'openOnly'=>true))
       ));

  

       $password=$this->CreateElement('text','password')
                           ->setLabel('Password');
       $password->setDecorators(array(
                'ViewHelper',
               'Description',
               'Errors',
               array(array('data'=>'HtmlTag'), array('tag' => 'td')),
               array('Label', array('tag' => 'td')),
       ));

  

       $submit=$this->CreateElement('submit','submit')
                   ->setLabel('Login');
       $submit->setDecorators(array(
               'ViewHelper',
               'Description',
               'Errors', array(array('data'=>'HtmlTag'), array('tag' => 'td',
               'colspan'=>'8','align'=>'center')),
               array(array('row'=>'HtmlTag'),array('tag'=>'tr', 'closeOnly'=>true))
       ));

  

       $this->addElements(array(
               $username,
              $password,
              $submit));

  

       $this->setDecorators(array(
               'FormElements',
               array(array('data'=>'HtmlTag'),array('tag'=>'table')),
               'Form'));
   }
}