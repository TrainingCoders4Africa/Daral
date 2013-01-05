<?php

/**
 * Form definition for table cheptel.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditCheptel_Latest extends Zend_Form
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

        $tableAnimalType = new Application_Model_AnimalType_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_animal_type')
                ->setLabel('Fk Animal Type')
                ->setMultiOptions(array("" => "- - Select - -") + $tableAnimalType->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('text', 'total_animal_type')
                ->setLabel('Total Animal Type')
                ->setRequired(true)
                ->addValidator(new Zend_Validate_Int())
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