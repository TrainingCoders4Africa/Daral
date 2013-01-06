<?php

/**
 * Data mapper class for table farmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_FarmerMapper
{
    /**
     *
     * @var Application_Model_Farmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Farmer_DbTable();
    }

    /**
     *
     * @return Application_Model_Farmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
