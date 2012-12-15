<?php

/**
 * Data mapper class for table departement_stat_farmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DepartementStatFarmerMapper
{
    /**
     *
     * @var Application_Model_DepartementStatFarmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_DepartementStatFarmer_DbTable();
    }

    /**
     *
     * @return Application_Model_DepartementStatFarmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
