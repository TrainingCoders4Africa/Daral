<?php

/**
 * Data mapper class for table type_notification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_TypeNotificationMapper
{
    /**
     *
     * @var Application_Model_TypeNotification_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_TypeNotification_DbTable();
    }

    /**
     *
     * @return Application_Model_TypeNotification_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
