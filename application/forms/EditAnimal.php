<?php

/**
 * Form definition for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditAnimal extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');



        $tableFarmer = new Application_Model_Farmer_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_id_farmer')
                ->setLabel('Fk Id Farmer')
                ->setMultiOptions(array("" => "- - Select - -") + $tableFarmer->fetchPairs())
                ->setRequired(true)
        ); 
        
       
        $tableAnimalType = new Application_Model_AnimalType_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_animal_type')
                ->setLabel('Fk Animal Type')
                ->setMultiOptions(array("" => "- - Select - -") + $tableAnimalType->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('text', 'photo_left')
                ->setLabel('Photo Left')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'photo_right')
                ->setLabel('Photo Right')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'photo_front')
                ->setLabel('Photo Front')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('button', 'submit')
                ->setLabel('Save')
                ->setAttrib('type', 'submit')
        );
		
       $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        parent::init();
    }
}