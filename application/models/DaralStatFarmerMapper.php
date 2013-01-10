<?php

/**
 * Data mapper class for table daralstatfarmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DaralstatfarmerMapper
{
    /**
     *
     * @var Application_Model_Daralstatfarmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Daralstatfarmer_DbTable();
    }

    /**
     *
     * @return Application_Model_Daralstatfarmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
