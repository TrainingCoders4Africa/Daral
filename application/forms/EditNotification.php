<?php

/**
 * Form definition for table notification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditNotification extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );
        
        $tableUsers = new Application_Model_Users_DbTable();
        $this->addElement(
        		$this->createElement('hidden', 'id_user')
        		->setValue($tableUsers->getUserConnected())
        );
        

        $tableLocalite = new Application_Model_Localite_DbTable();
        $this->addElement(
            $this->createElement('select', 'id_localite')
                ->setLabel('Localite')
                ->setMultiOptions(array("" => "- - Select - -") + $tableLocalite->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
            $this->createElement('text', 'date')
                ->setLabel('Date')
                ->setValue(date("Y-m-d"))
                ->setRequired(true)
                ->addFilter(new Zend_Filter_StringTrim())
        );

        $tableTypenotification = new Application_Model_Typenotification_DbTable();
        $this->addElement(
            $this->createElement('select', 'type')
                ->setLabel('Type')->setMultiOptions(array("" => "- - Select - -") + $tableTypenotification->fetchPairs())
                ->setRequired(true)
        );

        $this->addElement(
        		$this->createElement('textarea', 'description')
        		->setLabel('Description')
        		->setAttrib('rows', '4')
        		->setAttrib('cols', '8')
        		->setAttrib("maxlength", 1000)
        		->setRequired(true)
        		->addValidator(new Zend_Validate_StringLength(array("max" => 1000)))
        );
        

        parent::init();
    }
}