<?php

/**
 * Data mapper class for table daral_stat_farmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DaralStatFarmerMapper
{
    /**
     *
     * @var Application_Model_DaralStatFarmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_DaralStatFarmer_DbTable();
    }

    /**
     *
     * @return Application_Model_DaralStatFarmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
