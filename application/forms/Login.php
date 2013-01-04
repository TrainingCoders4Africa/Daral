<?php

class Application_Form_Login extends Zend_Form
{

    public function init()
    {
        $this->setName("login");
        $this->setMethod('post');
             
        
		$username = new Zend_Form_Element_Text('username');
		$username->setLabel('Identifiant: ')
				 ->setRequired(true)
				 ->addFilter('StripTags')
				 ->addFilter('StringTrim')
				 ->addValidator('NotEmpty');
				 
				 
		$password = new Zend_Form_Element_Password('password');
		$password->setLabel('Mot de passe: ')
				 ->setRequired(true)
				 ->addFilter('StripTags')
				 ->addFilter('StringTrim')
				 ->addValidator('NotEmpty');
				 
				 
				 
		//$submit= new Zend_Form_Element_Submit('connexion');
		//$submit->setAttrib('id','submitbutton');
		
		
		//$this->addElements(array($username,$password,$submit));
		$this->addElements(array($username,$password));
		
		//$this->addDisplayGroup(array('username','password','connexion'),'login',array('legend'=>'Connexion'));
    }

    
	
	
	
	
}


