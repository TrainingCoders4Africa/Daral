<?php

/**
 * Form definition for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_SellAnimal extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');
        $this->setAttrib('enctype', 'multipart/form-data');



        $this->addElement(
            $this->createElement('text', 'fk_id_farmer')
                ->setLabel('Identifiant Eleveur (vendeur)')
        		->setAttrib('maxlength', 8)
                ->setRequired(true)
        ); 
        
        
        $this->addElement(
        		$this->createElement('text', 'id_buyer')
        		->setLabel('Identifiant Client (acheteur)*')
        		//->setAttrib('maxlength', 8)
        		->setRequired(true)
        );
        
        $tableAnimaltype = new Application_Model_Animaltype_DbTable();
        $this->addElement(
        		$this->createElement('select', 'fk_animaltype')
        		->setLabel('Type d\'animal')
        		->setMultiOptions(array("" => "- - Choisir - -") + $tableAnimaltype->fetchAnimal())
        		->setRequired(true)
        );
        
        
        $this->addElement(
        		$this->createElement('textarea', 'info_buyer')
        		->setLabel('Info Client')
        		->setAttrib('rows', '4')
        		->setAttrib('cols', '8')
        		->setAttrib("maxlength", 1000)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 1000)))
        );
        
        $this->addElement(
        		$this->createElement('text', 'animal_id')
        		->setLabel('Identifiant(s) Animal**')
        		->setRequired(true)
        );
       
        
        
        
       
       
        
		
       $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        parent::init();
    }
}