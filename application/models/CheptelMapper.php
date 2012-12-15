<?php

/**
 * Data mapper class for table cheptel.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_CheptelMapper
{
    /**
     *
     * @var Application_Model_Cheptel_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Cheptel_DbTable();
    }

    /**
     *
     * @return Application_Model_Cheptel_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
