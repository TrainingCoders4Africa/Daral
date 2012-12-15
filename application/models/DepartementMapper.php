<?php

/**
 * Data mapper class for table departement.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DepartementMapper
{
    /**
     *
     * @var Application_Model_Departement_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Departement_DbTable();
    }

    /**
     *
     * @return Application_Model_Departement_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
