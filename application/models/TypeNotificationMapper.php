<?php

/**
 * Data mapper class for table type_notification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_TypenotificationMapper
{
    /**
     *
     * @var Application_Model_Typenotification_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Typenotification_DbTable();
    }

    /**
     *
     * @return Application_Model_Typenotification_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
