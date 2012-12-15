<?php

/**
 * Form definition for table farmer.
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */
class Application_Form_EditFarmer extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'rank_farmer')
                
        );

        $this->addElement(
            $this->createElement('text', 'id_farmer')
                ->setLabel('Identifiant')
        		->setAttribs(array('maxlenght'=>'30'))
                ->setRequired(false)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
                ->addFilter(new Zend_Filter_StringTrim())
        );
		
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
        $tableCategorie = new Application_Model_Categorie_DbTable();
        
        $this->addElement(
            $this->createElement('select', 'categorie')
                ->setLabel('Categorie choisie')
                ->setMultiOptions(array("" => "- - Select - -") + $tableCategorie->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('text', 'national_id')
                ->setLabel('Numero d\'identification nationale')
                ->setAttrib("maxlength", 50)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
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
            $this->createElement('text', 'address_farmer')
                ->setLabel('Adresse')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

       

        $tableDaral = new Application_Model_Daral_DbTable();
        
        
        $this->addElement(
            $this->createElement('select', 'daral_actuel')
                ->setLabel('Daral Actuel')
                ->setMultiOptions(array("" => "- - Select - -") + $tableDaral->fetchDaral()) //fetchDaral : to get the proper "value" to be sent
                ->setRequired(true)
        );

        

       

        $this->addElement(
            $this->createElement('text', 'birthdate_farmer')
                ->setLabel('Date de naissance')
                ->setValue(date("Y-m-d"))
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


        $this->addElement(
            $this->createElement('button', 'submit')
                ->setLabel('Enregistrer')
                ->setAttrib('type', 'submit')
        );

        parent::init();
    }
}