<?php

/**
 * Form definition for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditAnimalphotoleft extends Zend_Form
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
        
       
        $photo_left = new Zend_Form_Element_File('photo_left');
        $photo_left->setDestination(IMAGE_PATH)
        ->setRequired(true)
        ->addValidator('Count', false, 1)
        // only JPEG, PNG, and GIFs
        ->addValidator('Extension', false, 'jpg,png');
        
        $this->addElement($photo_left,'photo_left');
        
        
        
       
        
       
        
        
        
        
        
        
       /*
        
        $this->addElement(
            $this->createElement('text', 'photo_left')
                ->setLabel('VUE GAUCHE')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'photo_right')
                ->setLabel('VUE DROITE')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'photo_front')
                ->setLabel('VUE FACE')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        */
		
       $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        parent::init();
    }
}