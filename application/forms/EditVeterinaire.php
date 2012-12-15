<?php

/**
 * Form definition for table veterinaire.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditVeterinaire extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'rank_veterinaire')
                
        );

        $this->addElement(
            $this->createElement('text', 'id_veterinaire')
                ->setLabel('Id Veterinaire')
                ->setAttrib("maxlength", 30)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'adresse_veterinaire')
                ->setLabel('Adresse Veterinaire')
                ->setAttrib("maxlength", 100)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 100)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'localite_veterinaire')
                ->setLabel('Localite Veterinaire')
                ->setRequired(true)
                ->addValidator(new Zend_Validate_Int())
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'firstname_veterinaire')
                ->setLabel('Firstname Veterinaire')
                ->setAttrib("maxlength", 30)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'lastname_veterinaire')
                ->setLabel('Lastname Veterinaire')
                ->setAttrib("maxlength", 30)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'IsActive_veterinaire')
                ->setLabel('IsActive Veterinaire')
                ->setRequired(true)
                ->addValidator(new Zend_Validate_Int())
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'email_veterinaire')
                ->setLabel('Email Veterinaire')
                ->setAttrib("maxlength", 30)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 30)))
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