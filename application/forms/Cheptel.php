<?php

/**
 * Form definition for table cheptel.
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */
class Application_Form_Cheptel extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $this->addElement(
        		$this->createElement('text', 'fk_id_farmer')
        		->setLabel('Identifiant Eleveur')
        		->setAttrib("maxlength", 8)
        		//->setAttrib('readonly','readonly')
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 8,"min"=> 8)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
       
        

        $this->addElement(
            $this->createElement('text', 'total_animaltype')
                ->setLabel('Nombre total')
                ->setRequired(true)
                ->addValidator(new Zend_Validate_Int())
                ->addFilter(new Zend_Filter_StringTrim())
        );
        
        
        $tableAnimaltype = new Application_Model_Animaltype_DbTable();
        $this->addElement(
        		$this->createElement('select', 'fk_animaltype')
        		->setLabel('Type d\'animal')
        		->setMultiOptions(array("" => "- - Choisir - -") + $tableAnimaltype->fetchAnimal())
        		->setRequired(true)
        );
		
        
       
       
        

        parent::init();
    }
}
