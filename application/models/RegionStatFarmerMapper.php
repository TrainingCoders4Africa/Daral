<?php

/**
 * Data mapper class for table regionstatfarmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_RegionstatfarmerMapper
{
    /**
     *
     * @var Application_Model_Regionstatfarmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Regionstatfarmer_DbTable();
    }

    /**
     *
     * @return Application_Model_Regionstatfarmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
