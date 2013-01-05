<?php

/**
 * Data mapper class for table daral.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DaralMapper
{
    /**
     *
     * @var Application_Model_Daral_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Daral_DbTable();
    }

    /**
     *
     * @return Application_Model_Daral_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
