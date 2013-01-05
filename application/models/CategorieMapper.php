<?php

/**
 * Data mapper class for table categorie.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_CategorieMapper
{
    /**
     *
     * @var Application_Model_Categorie_DbTable
     */
    protected $_dbTable;

    public function __construct()
    {
        $this->_dbTable = new Application_Model_Categorie_DbTable();
    }

    /**
     *
     * @return Application_Model_Categorie_DbTable
     */
    public function getDbTabe()
    {
        return $this->_dbTable;
    }
}
