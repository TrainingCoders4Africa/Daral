<?php

/**
 * Form definition for table localite.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditLocalite_Latest extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $this->addElement(
            $this->createElement('text', 'name')
                ->setLabel('Name')
                ->setAttrib("maxlength", 50)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $tableDepartement = new Application_Model_Departement_DbTable();
        $this->addElement(
            $this->createElement('select', 'departement')
                ->setLabel('Departement')
                ->setMultiOptions(array("" => "- - Select - -") + $tableDepartement->fetchPairs())
                ->setRequired(true)
        );

        $tableRegion = new Application_Model_Region_DbTable();
        $this->addElement(
            $this->createElement('select', 'region')
                ->setLabel('Region')
                ->setMultiOptions(array("" => "- - Select - -") + $tableRegion->fetchPairs())
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