<?php

/**
 * Row definition class for table departement.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Departement_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $name
 * @property string $region
 */
abstract class Application_Model_Departement_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Departement_Row
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
     * Set value for 'name' field
     *
     * @param string $Name
     *
     * @return Application_Model_Departement_Row
     */
    public function setName($Name)
    {
        $this->name = $Name;
        return $this;
    }

    /**
     * Get value of 'name' field
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set value for 'region' field
     *
     * @param string $Region
     *
     * @return Application_Model_Departement_Row
     */
    public function setRegion($Region)
    {
        $this->region = $Region;
        return $this;
    }

    /**
     * Get value of 'region' field
     *
     * @return string
     */
    public function getRegion()
    {
        return $this->region;
    }

    /**
     * Get a row of Region.
     *
     * @return Application_Model_Region_Row
     */
    public function getRegionRowByRegion()
    {
        return $this->findParentRow('Application_Model_Region_DbTable', 'region');
    }

    /**
     * Get a list of rows of Departementstatanimal.
     *
     * @return Application_Model_Departementstatanimal_Rowset
     */
    public function getDepartementstatanimalRowsByFkDepartementName()
    {
        return $this->findDependentRowset('Application_Model_Departementstatanimal_DbTable', 'fk_departement_name');
    }

    /**
     * Get a list of rows of Departementstatfarmer.
     *
     * @return Application_Model_Departementstatfarmer_Rowset
     */
    public function getDepartementstatfarmerRowsByFkDepartementName()
    {
        return $this->findDependentRowset('Application_Model_Departementstatfarmer_DbTable', 'fk_departement_name');
    }

    /**
     * Get a list of rows of Localite.
     *
     * @return Application_Model_Localite_Rowset
     */
    public function getLocaliteRowsByDepartement()
    {
        return $this->findDependentRowset('Application_Model_Localite_DbTable', 'departement');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->name;
    }
}
