<?php

/**
 * Form definition for table departementstatanimal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditDepartementstatanimal extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $tableDepartement = new Application_Model_Departement_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_departement_name')
                ->setLabel('Fk Departement Name')
                ->setMultiOptions(array("" => "- - Select - -") + $tableDepartement->fetchPairs())
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
            $this->createElement('text', 'total_animaltype')
                ->setLabel('Total Animaltype')
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