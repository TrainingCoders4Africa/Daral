<?php

/**
 * Data mapper class for table localite.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_LocaliteMapper
{
    /**
     *
     * @var Application_Model_Localite_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Localite_DbTable();
    }

    /**
     *
     * @return Application_Model_Localite_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
