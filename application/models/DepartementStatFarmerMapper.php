<?php

/**
 * Data mapper class for table departementstatfarmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DepartementstatfarmerMapper
{
    /**
     *
     * @var Application_Model_Departementstatfarmer_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Departementstatfarmer_DbTable();
    }

    /**
     *
     * @return Application_Model_Departementstatfarmer_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
