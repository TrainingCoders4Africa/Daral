<?php

/**
 * Data mapper class for table maladie.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_MaladieMapper
{
    /**
     *
     * @var Application_Model_Maladie_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Maladie_DbTable();
    }

    /**
     *
     * @return Application_Model_Maladie_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
