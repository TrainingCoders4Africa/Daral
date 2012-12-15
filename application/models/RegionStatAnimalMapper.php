<?php

/**
 * Data mapper class for table region_stat_animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_RegionStatAnimalMapper
{
    /**
     *
     * @var Application_Model_RegionStatAnimal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_RegionStatAnimal_DbTable();
    }

    /**
     *
     * @return Application_Model_RegionStatAnimal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
