<?php

error_reporting(E_ALL);


/**
 * Form for table farmer
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Form_Farmer extends Zend_Form

{
	
    public function init()
    {
        $this->setMethod('post');
        
        $this->setAttrib('enctype', 'multipart/form-data');
    
      
        
         $this->addElement(
        		$this->createElement('text', 'firstname_farmer')
        		->setLabel('Prenom')
        		->setAttrib("maxlength", 30)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        $this->addElement(
        		$this->createElement('text', 'lastname_farmer')
        		->setLabel('Nom')
        		->setAttrib("maxlength", 30)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
		
        
        $this->addElement(
        		$this->createElement('text', 'national_id')
        		->setLabel('No d\'identification nationale')
        		->setAttrib("maxlength", 50)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        $this->addElement(
        		$this->createElement('text', 'address_farmer')
        		->setLabel('Adresse')
        		->setAttrib("maxlength", 100)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        $this->addElement(
        		$this->createElement('text', 'phone_farmer')
        		->setLabel('Telephone')
        		->setAttrib("maxlength", 100)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        
        $this->addElement(
            $this->createElement('text', 'birthdate_farmer')
                ->setLabel('Date de naissance')
                ->setValue(date("d/m/Y"))
        		->setAttrib("readonly", "readonly")
                ->setRequired(true)
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'birthplace_farmer')
                ->setLabel('Lieu de naissance')
                ->setAttrib("maxlength", 30)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
                ->addFilter(new Zend_Filter_StringTrim())
        );
        
        $tableCategorie = new Application_Model_Categorie_DbTable();
        $this->addElement(
        		$this->createElement('select', 'categorie')
        		->setLabel('Categorie')
        		->setMultiOptions(array("" => "- - - - - - - -  Choisir - - - - - - - -") + $tableCategorie->fetchPairs())
        		->setRequired(true)
        );
        
        $file = new Zend_Form_Element_File('photo');
        $file->setDestination(IMAGE_PATH)
        ->setRequired(false) 
        ->addValidator('Count', false, 1)
        // only JPEG, PNG, and GIFs
        ->addValidator('Extension', false, 'jpg,png');
        
        $this->addElement($file,'photo');
        
        
        
        
        
        
        
        /* $this->addElement(
        		$this->createElement('button', 'submit')
        		->setLabel('Save')
        		->setAttrib('type', 'submit')
        ); */
 
        //*********** HIDDEN ELEMENTS ************//
          $this->addElement(
        		$this->createElement('hidden', 'rank_farmer')
        
        );
        
        $this->addElement(
        		$this->createElement('hidden', 'registration_date')
        		// ->setLabel('Registration Date')
        		->setValue(date("Y-m-d"))
        		//->setRequired(true)
        		->addFilter(new Zend_Filter_StringTrim())
        );
        
        
        
        
        
        $this->addElement(
        		$this->createElement('hidden', 'isactive_farmer')
        		//->setLabel('Isactive Farmer')
        		//->setRequired(true)
        		->setValue('1')
        		//->addValidator(new Zend_Validate_Int())
        		// ->addFilter(new Zend_Filter_StringTrim())
        );  
        
        
       
        /* $this->addDisplayGroup(array('firstname_farmer','lastname_farmer','national_id','address_farmer',
        		                      'phone_farmer','birthdate_farmer','birthplace_farmer','categorie','photo','submit'),'info',
        		               array('legend'=>'Informations'));
 */        
        parent::init();
    }
}

