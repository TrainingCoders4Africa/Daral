<?php

/**
 * Data mapper class for table roleusers.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_RoleusersMapper
{
    /**
     *
     * @var Application_Model_Roleusers_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Roleusers_DbTable();
    }

    /**
     *
     * @return Application_Model_Roleusers_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
