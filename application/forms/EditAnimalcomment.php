<?php

/**
 * Form definition for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditAnimalcomment extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');
        $this->setAttrib('enctype', 'multipart/form-data');



        $tableFarmer = new Application_Model_Farmer_DbTable();
        $this->addElement(
            $this->createElement('text', 'fk_id_farmer')
                ->setLabel('Identifiant Eleveur')
        		->setAttrib('readonly', 'readonly')
                //->setMultiOptions(array("" => "- - Select - -") + $tableFarmer->fetchPairs())
                ->setRequired(true)
        ); 
        
       
        $this->addElement(
        		$this->createElement('text', 'comment')
        		->setLabel('Signes particuliers: ')
        		->setAttrib("maxlength", 1000)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 1000)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
       
        
        
        
        
     
       $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        parent::init();
    }
}