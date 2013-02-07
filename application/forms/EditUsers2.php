<?php

/**
 * Form definition for table users.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditUsers2 extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

       
        
        $this->addElement(
        		$this->createElement('text', 'prenom')
        		->setLabel('Prenom')
        		->setAttrib("maxlength", 50)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        $this->addElement(
        		$this->createElement('text', 'nom')
        		->setLabel('Nom')
        		->setAttrib("maxlength", 50)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        $this->addElement(
        		$this->createElement('text', 'username')
        		->setLabel('Username')
        		->setAttrib("maxlength", 50)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        $this->addElement(
        		$this->createElement('text', 'Telephone')
        		->setLabel('Telephone')
        		->setAttrib("maxlength", 50)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        
        $this->addElement(
        		$this->createElement('text', 'Adresse')
        		->setLabel('Adresse')
        		->setAttrib("maxlength", 50)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        
        $this->addElement(
        		$this->createElement('text', 'Email')
        		->setLabel('e-mail')
        		->setAttrib("maxlength", 50)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
        		->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'password')
                ->setLabel('Mot de passe')
                ->setAttrib("maxlength", 50)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'date_created')
                ->setLabel('Date Creation')
        		->setAttrib('readonly','readonly')
                ->setValue(date("d-m-Y H:i:s"))
                ->setRequired(true)
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $tableRoleusers = new Application_Model_Roleusers_DbTable();
        $this->addElement(
            $this->createElement('select', 'role')
                ->setLabel('Role')
                ->setMultiOptions(array("" => "- - Choisir - -") + $tableRoleusers->fetchPairs())
                ->setRequired(true)
        );

        $tableDaral = new Application_Model_Daral_DbTable();
        $this->addElement(
            $this->createElement('select', 'user_daral')
                ->setLabel('Daral Assigne')
                ->setMultiOptions(array("" => "- - Choisir - -") + $tableDaral->fetchPairs())
                ->setRequired(true)
        );

      
        parent::init();
    }
}