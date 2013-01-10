<?php

/**
 * Data mapper class for table regionstatanimal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_RegionstatanimalMapper
{
    /**
     *
     * @var Application_Model_Regionstatanimal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Regionstatanimal_DbTable();
    }

    /**
     *
     * @return Application_Model_Regionstatanimal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
