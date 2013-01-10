<?php

/**
 * Data mapper class for table daralstatanimal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DaralstatanimalMapper
{
    /**
     *
     * @var Application_Model_Daralstatanimal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Daralstatanimal_DbTable();
    }

    /**
     *
     * @return Application_Model_Daralstatanimal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
