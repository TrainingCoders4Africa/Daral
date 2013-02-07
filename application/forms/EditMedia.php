<?php

/**
 * Form definition for table media.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditMedia extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');
		$this->setAttrib('enctype', 'multipart/form-data');

        $this->addElement(
            $this->createElement('hidden', 'id_media')
                
        );

        $this->addElement(
            $this->createElement('text', 'titre')
                ->setLabel('Titre')
                ->setAttrib("maxlength", 250)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 250)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'date_insertion')
                ->setLabel('Date Insertion')
                ->setValue(date("d/m/Y"))
                ->setRequired(true)
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $tableLangue = new Application_Model_Langue_DbTable();
        $this->addElement(
            $this->createElement('select', 'langue')
                ->setLabel('Langue')
                ->setMultiOptions(array("" => "- - Choisir - -") + $tableLangue->fetchPairs())
                ->setRequired(true)
        ); 

        $tableMaladie = new Application_Model_Maladie_DbTable();
        $this->addElement(
            $this->createElement('select', 'maladie')
                ->setLabel('Maladie')
                ->setMultiOptions(array("" => "- - Choisir - -") + $tableMaladie->fetchPairs())
                ->setRequired(true)
        );
		
		$lien = new Zend_Form_Element_File('lien');
        $lien->setRequired(true)
        ->addValidator('Count', false, 1)
		->addValidator('NotEmpty');
        $this->addElement($lien,'lien'); 
		
		$description = new Zend_Form_Element_Textarea('description');
		$description->setLabel('Description:')
			->setRequired(true)
			->setAttrib('COLS', '50')
			->setAttrib('ROWS', '4');
		$this->addElement($description);

        parent::init();
    }
}