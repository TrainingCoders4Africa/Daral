<?php

/**
 * Data mapper class for table departement_stat_animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DepartementStatAnimalMapper
{
    /**
     *
     * @var Application_Model_DepartementStatAnimal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_DepartementStatAnimal_DbTable();
    }

    /**
     *
     * @return Application_Model_DepartementStatAnimal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
