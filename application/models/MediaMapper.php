<?php

/**
 * Data mapper class for table media.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_MediaMapper
{
    /**
     *
     * @var Application_Model_Media_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Media_DbTable();
    }

    /**
     *
     * @return Application_Model_Media_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
