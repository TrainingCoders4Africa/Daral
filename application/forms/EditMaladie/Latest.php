<?php

/**
 * Form definition for table maladie.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditMaladie_Latest extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $this->addElement(
            $this->createElement('text', 'libelle')
                ->setLabel('Libelle')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'symptomes')
                ->setLabel('Symptomes')
                ->setAttrib("maxlength", 1000)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 1000)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'type')
                ->setLabel('Type')
                ->setAttrib("maxlength", 20)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 20)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'vaccin')
                ->setLabel('Vaccin')
                ->setAttrib("maxlength", 1000)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 1000)))
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