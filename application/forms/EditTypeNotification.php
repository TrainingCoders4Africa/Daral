<?php

/**
 * Form definition for table typenotification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditTypenotification extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );
        
        $this->addElement(
        		$this->createElement('text', 'libelle')
        		->setLabel('Libelle')
        		->setAttrib("maxlength", 30)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        $this->addElement(
        		$this->createElement('textarea', 'description')
        		->setLabel('Description')
        		->setAttrib('rows', '4')
        		->setAttrib('cols', '8')
        		->setAttrib("maxlength", 1000)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 1000)))
        );
        

        

        parent::init();
    }
}