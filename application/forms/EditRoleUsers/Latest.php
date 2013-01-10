<?php

/**
 * Form definition for table roleusers.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditRoleusers_Latest extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $this->addElement(
            $this->createElement('text', 'description')
                ->setLabel('Description')
                ->setAttrib("maxlength", 20)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 20)))
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