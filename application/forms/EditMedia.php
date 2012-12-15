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

        $tableLangue = new Application_Model_Langue_DbTable();
        $this->addElement(
            $this->createElement('select', 'langue')
                ->setLabel('Langue')
                ->setMultiOptions(array("" => "- - Select - -") + $tableLangue->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('text', 'date_insertion')
                ->setLabel('Date Insertion')
                ->setValue(date("Y-m-d"))
                ->setRequired(true)
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'lien')
                ->setLabel('Lien')
                ->setAttrib("maxlength", 250)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 250)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $tableMaladie = new Application_Model_Maladie_DbTable();
        $this->addElement(
            $this->createElement('select', 'maladie')
                ->setLabel('Maladie')
                ->setMultiOptions(array("" => "- - Select - -") + $tableMaladie->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('button', 'submit')
                ->setLabel('Save')
                ->setAttrib('type', 'submit')
        );

        parent::init();
    }
}