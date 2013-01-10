<?php

/**
 * Form definition for table notification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditNotification_Latest extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $tableFarmer = new Application_Model_Farmer_DbTable();
        $this->addElement(
            $this->createElement('select', 'id_farmer')
                ->setLabel('Id Farmer')
                ->setMultiOptions(array("" => "- - Select - -") + $tableFarmer->fetchPairs())
                ->setRequired(true)
        );

        $tableLocalite = new Application_Model_Localite_DbTable();
        $this->addElement(
            $this->createElement('select', 'id_localite')
                ->setLabel('Id Localite')
                ->setMultiOptions(array("" => "- - Select - -") + $tableLocalite->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('text', 'date')
                ->setLabel('Date')
                ->setValue(date("Y-m-d H:i:s"))
                ->setRequired(true)
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $tableTypenotification = new Application_Model_Typenotification_DbTable();
        $this->addElement(
            $this->createElement('select', 'type')
                ->setLabel('Type')
                ->setMultiOptions(array("" => "- - Select - -") + $tableTypenotification->fetchPairs())
                ->setRequired(true)
        );

        $tableUsers = new Application_Model_Users_DbTable();
        $this->addElement(
            $this->createElement('select', 'id_user')
                ->setLabel('Id User')
                ->setMultiOptions(array("" => "- - Select - -") + $tableUsers->fetchPairs())
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