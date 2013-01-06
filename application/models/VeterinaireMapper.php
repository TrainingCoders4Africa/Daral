<?php

/**
 * Data mapper class for table veterinaire.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_VeterinaireMapper
{
    /**
     *
     * @var Application_Model_Veterinaire_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Veterinaire_DbTable();
    }

    /**
     *
     * @return Application_Model_Veterinaire_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
