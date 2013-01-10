<?php

/**
 * Data mapper class for table departementstatanimal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DepartementstatanimalMapper
{
    /**
     *
     * @var Application_Model_Departementstatanimal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Departementstatanimal_DbTable();
    }

    /**
     *
     * @return Application_Model_Departementstatanimal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
