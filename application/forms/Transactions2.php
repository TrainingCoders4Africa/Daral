<?php

/**
 * Form definition for table transactions.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_Transactions2 extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');
        $this->setAttrib('enctype', 'multipart/form-data');



        $this->addElement(
            $this->createElement('text', 'id_seller')
                ->setLabel('Identifiant Eleveur (vendeur)')
        		->setAttrib('maxlength', 8)
                ->setRequired(false)
        ); 
        
        
        $this->addElement(
        		$this->createElement('text', 'id_buyer')
        		->setLabel('Identifiant Client (acheteur)*')
        		//->setAttrib('maxlength', 8)
        		->setRequired(false)
        );
        
        $tableAnimaltype = new Application_Model_Animaltype_DbTable();
        $this->addElement(
        		$this->createElement('select', 'animaltype')
        		->setLabel('Type d\'animal')
        		->setMultiOptions(array("" => "- - Choisir - -") + $tableAnimaltype->fetchAnimal())
        		->setRequired(false)
        );
        
        
        
        
        $this->addElement(
        		$this->createElement('text', 'animal_id')
        		->setLabel('Identifiant(s) Animal**')
        		->setRequired(false)
        );
       
        
        
        
       
       
        
		
       $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        parent::init();
    }
}
