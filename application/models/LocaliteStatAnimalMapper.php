<?php

/**
 * Data mapper class for table localitestatanimal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_LocalitestatanimalMapper
{
    /**
     *
     * @var Application_Model_Localitestatanimal_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Localitestatanimal_DbTable();
    }

    /**
     *
     * @return Application_Model_Localitestatanimal_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
