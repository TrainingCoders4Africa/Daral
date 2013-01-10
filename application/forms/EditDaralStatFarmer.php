<?php

/**
 * Form definition for table daralstatfarmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditDaralstatfarmer extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $tableDaral = new Application_Model_Daral_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_daral_name')
                ->setLabel('Fk Daral Name')
                ->setMultiOptions(array("" => "- - Select - -") + $tableDaral->fetchPairs())
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