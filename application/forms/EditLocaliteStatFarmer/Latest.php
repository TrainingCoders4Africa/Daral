<?php

/**
 * Form definition for table localitestatfarmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditLocalitestatfarmer_Latest extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $tableLocalite = new Application_Model_Localite_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_localite_name')
                ->setLabel('Fk Localite Name')
                ->setMultiOptions(array("" => "- - Select - -") + $tableLocalite->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('text', 'total_farmer')
                ->setLabel('Total Farmer')
                ->setRequired(true)
                ->addValidator(new Zend_Validate_Int())
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('button', 'submit')
                ->setLabel('Save')
                ->setAttrib('type', 'submit')
        );

        parent::init();
    }
}