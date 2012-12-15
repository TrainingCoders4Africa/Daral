<?php

/**
 * Data mapper class for table daral_stat_animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_DaralStatAnimalMapper
{
    /**
     *
     * @var Application_Model_DaralStatAnimal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_DaralStatAnimal_DbTable();
    }

    /**
     *
     * @return Application_Model_DaralStatAnimal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
