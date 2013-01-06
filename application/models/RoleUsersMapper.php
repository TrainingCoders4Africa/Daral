<?php

/**
 * Data mapper class for table role_users.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_RoleUsersMapper
{
    /**
     *
     * @var Application_Model_RoleUsers_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_RoleUsers_DbTable();
    }

    /**
     *
     * @return Application_Model_RoleUsers_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
