<?php

/**
 * Form definition for table cheptel.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditCheptel extends Zend_Form
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
                ->setLabel('Identifiant eleveur')
                ->setMultiOptions(array("" => "- - Choisir - -") + $tableFarmer->fetchPairs())
                ->setRequired(true)
        );  
		
        
        
        $tableAnimaltype = new Application_Model_Animaltype_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_animaltype')
                ->setLabel('Type d\'animal')
                ->setMultiOptions(array("" => "- - Choisir - -") + $tableAnimaltype->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('text', 'total_animaltype')
                ->setLabel('Nombre total')
                ->setRequired(true)
                ->addValidator(new Zend_Validate_Int())
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('button', 'submit')
                ->setLabel('Enregistrer')
                ->setAttrib('type', 'submit')
        );

        parent::init();
    }
}