<?php

/**
 * Data mapper class for table region.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_RegionMapper
{
    /**
     *
     * @var Application_Model_Region_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Region_DbTable();
    }

    /**
     *
     * @return Application_Model_Region_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
