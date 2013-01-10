<?php

/**
 * Row definition class for table roleusers.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Roleusers_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $description
 */
abstract class Application_Model_Roleusers_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Roleusers_Row
     */
    public function setId($Id)
    {
        $this->id = $Id;
        return $this;
    }

    /**
     * Get value of 'id' field
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set value for 'description' field
     *
     * @param string $Description
     *
     * @return Application_Model_Roleusers_Row
     */
    public function setDescription($Description)
    {
        $this->description = $Description;
        return $this;
    }

    /**
     * Get value of 'description' field
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Get a list of rows of Users.
     *
     * @return Application_Model_Users_Rowset
     */
    public function getUsersRowsByRole()
    {
        return $this->findDependentRowset('Application_Model_Users_DbTable', 'role');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->description;
    }
}
