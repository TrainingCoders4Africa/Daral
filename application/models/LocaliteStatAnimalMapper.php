<?php

/**
 * Data mapper class for table localite_stat_animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_LocaliteStatAnimalMapper
{
    /**
     *
     * @var Application_Model_LocaliteStatAnimal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_LocaliteStatAnimal_DbTable();
    }

    /**
     *
     * @return Application_Model_LocaliteStatAnimal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
