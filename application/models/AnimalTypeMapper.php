<?php

/**
 * Data mapper class for table animal_type.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_AnimalTypeMapper
{
    /**
     *
     * @var Application_Model_AnimalType_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_AnimalType_DbTable();
    }

    /**
     *
     * @return Application_Model_AnimalType_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
