<?php

/**
 * Data mapper class for table notification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_NotificationMapper
{
    /**
     *
     * @var Application_Model_Notification_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Notification_DbTable();
    }

    /**
     *
     * @return Application_Model_Notification_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
