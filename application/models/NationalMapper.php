<?php

/**
 * Data mapper class for table national.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_NationalMapper
{
    /**
     *
     * @var Application_Model_National_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_National_DbTable();
    }

    /**
     *
     * @return Application_Model_National_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
