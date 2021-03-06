<?php

/**
 * Form definition for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditAnimal_Latest extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $tableFarmer = new Application_Model_Farmer_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_id_farmer')
                ->setLabel('Fk Id Farmer')
                ->setMultiOptions(array("" => "- - Select - -") + $tableFarmer->fetchPairs())
                ->setRequired(true)
        );

        $tableAnimaltype = new Application_Model_Animaltype_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_animaltype')
                ->setLabel('Fk Animaltype')
                ->setMultiOptions(array("" => "- - Select - -") + $tableAnimaltype->fetchPairs())
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

        parent::init();
    }
}