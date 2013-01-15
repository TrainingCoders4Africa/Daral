<?php

/**
 * Form definition for table users.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditUsers extends Zend_Form
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
            $this->createElement('password', 'password')
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

        $tableRoleusers = new Application_Model_Roleusers_DbTable();
        $this->addElement(
            $this->createElement('select', 'role')
                ->setLabel('Role')
                ->setMultiOptions(array("" => "- - Select - -") + $tableRoleusers->fetchPairs())
                ->setRequired(true)
        );

        $tableDaral = new Application_Model_Daral_DbTable();
        $this->addElement(
            $this->createElement('select', 'user_daral')
                ->setLabel('User Daral')
                ->setMultiOptions(array("" => "- - Select - -") + $tableDaral->fetchPairs())
                ->setRequired(true)
        );

      
        parent::init();
    }
}