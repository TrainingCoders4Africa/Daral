<?php

/**
 * Form definition for table users.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditUsers_Latest extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $this->addElement(
            $this->createElement('text', 'username')
                ->setLabel('Username')
                ->setAttrib("maxlength", 50)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'password')
                ->setLabel('Password')
                ->setAttrib("maxlength", 50)
                ->setRequired(true)
                ->addValidator(new Zend_Validate_StringLength(array("max" => 50)))
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $this->addElement(
            $this->createElement('text', 'date_created')
                ->setLabel('Date Created')
                ->setValue(date("Y-m-d H:i:s"))
                ->setRequired(true)
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $tableRoleUsers = new Application_Model_RoleUsers_DbTable();
        $this->addElement(
            $this->createElement('select', 'role')
                ->setLabel('Role')
                ->setMultiOptions(array("" => "- - Select - -") + $tableRoleUsers->fetchPairs())
                ->setRequired(true)
        );

        $tableDaral = new Application_Model_Daral_DbTable();
        $this->addElement(
            $this->createElement('select', 'user_daral')
                ->setLabel('User Daral')
                ->setMultiOptions(array("" => "- - Select - -") + $tableDaral->fetchPairs())
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