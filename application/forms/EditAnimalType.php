<?php

/**
 * Form definition for table animaltype.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditAnimaltype extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $this->addElement(
            $this->createElement('text', 'name')
                ->setLabel('Nom')
                ->setAttrib("maxlength", 30)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
        		$this->createElement('text', 'animal_tag')
        		->setLabel('Tag')
        		->setAttrib("maxlength", 30)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        

        parent::init();
    }
}