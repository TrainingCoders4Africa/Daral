<?php

/**
 * Data mapper class for table localitestatfarmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_LocalitestatfarmerMapper
{
    /**
     *
     * @var Application_Model_Localitestatfarmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Localitestatfarmer_DbTable();
    }

    /**
     *
     * @return Application_Model_Localitestatfarmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
