<?php

/**
 * Data mapper class for table localite_stat_farmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_LocaliteStatFarmerMapper
{
    /**
     *
     * @var Application_Model_LocaliteStatFarmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_LocaliteStatFarmer_DbTable();
    }

    /**
     *
     * @return Application_Model_LocaliteStatFarmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
