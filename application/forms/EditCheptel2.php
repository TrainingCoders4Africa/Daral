<?php

/**
 * Form definition for table cheptel.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditCheptel2 extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

         $tableFarmer = new Application_Model_Farmer_DbTable();
        $this->addElement(
            $this->createElement('text', 'fk_id_farmer')
                ->setLabel('Identifiant eleveur')
                ->setRequired(false)
        );  
		
        
        
        $tableAnimaltype = new Application_Model_Animaltype_DbTable();
        $this->addElement(
            $this->createElement('text', 'fk_animaltype')
                ->setLabel('Type d\'animal')
                ->setRequired(false)
        );

        

       
        parent::init();
    }
}