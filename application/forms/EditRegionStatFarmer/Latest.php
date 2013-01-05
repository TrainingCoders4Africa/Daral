<?php

/**
 * Form definition for table region_stat_farmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditRegionStatFarmer_Latest extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');

        $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        $tableRegion = new Application_Model_Region_DbTable();
        $this->addElement(
            $this->createElement('select', 'fk_region_name')
                ->setLabel('Fk Region Name')
                ->setMultiOptions(array("" => "- - Select - -") + $tableRegion->fetchPairs())
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