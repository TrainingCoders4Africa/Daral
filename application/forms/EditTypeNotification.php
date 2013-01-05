<?php

/**
 * Form definition for table type_notification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditTypeNotification extends Zend_Form
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
                ->setAttrib("maxlength", 160)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 160)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        parent::init();
    }
}