<?php

/**
 * Data mapper class for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_AnimalMapper
{
    /**
     *
     * @var Application_Model_Animal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Animal_DbTable();
    }

    /**
     *
     * @return Application_Model_Animal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
