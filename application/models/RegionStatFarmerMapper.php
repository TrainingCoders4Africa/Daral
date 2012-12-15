<?php

/**
 * Data mapper class for table region_stat_farmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_RegionStatFarmerMapper
{
    /**
     *
     * @var Application_Model_RegionStatFarmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_RegionStatFarmer_DbTable();
    }

    /**
     *
     * @return Application_Model_RegionStatFarmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
