<?php

/**
 * Row definition class for table region.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Region_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $name
 */
abstract class Application_Model_Region_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Region_Row
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
     * @return Application_Model_Region_Row
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
     * Get a list of rows of Departement.
     *
     * @return Application_Model_Departement_Rowset
     */
    public function getDepartementRowsByRegion()
    {
        return $this->findDependentRowset('Application_Model_Departement_DbTable', 'region');
    }

    /**
     * Get a list of rows of Localite.
     *
     * @return Application_Model_Localite_Rowset
     */
    public function getLocaliteRowsByRegion()
    {
        return $this->findDependentRowset('Application_Model_Localite_DbTable', 'region');
    }

    /**
     * Get a list of rows of RegionStatAnimal.
     *
     * @return Application_Model_RegionStatAnimal_Rowset
     */
    public function getRegionStatAnimalRowsByFkRegionName()
    {
        return $this->findDependentRowset('Application_Model_RegionStatAnimal_DbTable', 'fk_region_name');
    }

    /**
     * Get a list of rows of RegionStatFarmer.
     *
     * @return Application_Model_RegionStatFarmer_Rowset
     */
    public function getRegionStatFarmerRowsByFkRegionName()
    {
        return $this->findDependentRowset('Application_Model_RegionStatFarmer_DbTable', 'fk_region_name');
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
