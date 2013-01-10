<?php

/**
 * Data mapper class for table animaltype.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_AnimaltypeMapper
{
    /**
     *
     * @var Application_Model_Animaltype_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Animaltype_DbTable();
    }

    /**
     *
     * @return Application_Model_Animaltype_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
