<?php

/**
 * Form definition for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditAnimal2 extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');
        $this->setAttrib('enctype', 'multipart/form-data');



        $this->addElement(
            $this->createElement('text', 'fk_id_farmer')
                ->setLabel('Identifiant Eleveur')
        		->setAttrib('maxlength', 8)
                ->setRequired(false)
        ); 
        
        $this->addElement(
        		$this->createElement('text', 'animal_id')
        		->setLabel('Identifiant Animal')
        		->setAttrib("maxlength", 4)
        		->setRequired(false)
        );
        
        
        $tableAnimaltype = new Application_Model_Animaltype_DbTable();
        $this->addElement(
        		$this->createElement('select', 'fk_animaltype')
        		->setLabel('Type d\'animal')
        		->setMultiOptions(array("" => "- - Choisir - -") + $tableAnimaltype->fetchAnimal())
        		->setRequired(false)
        );
        
       
       
        
		
       $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        parent::init();
    }
}