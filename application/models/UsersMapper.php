<?php

/**
 * Data mapper class for table users.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_UsersMapper
{
    /**
     *
     * @var Application_Model_Users_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Users_DbTable();
    }

    /**
     *
     * @return Application_Model_Users_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
