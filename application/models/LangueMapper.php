<?php

/**
 * Data mapper class for table langue.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_LangueMapper
{
    /**
     *
     * @var Application_Model_Langue_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Langue_DbTable();
    }

    /**
     *
     * @return Application_Model_Langue_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
