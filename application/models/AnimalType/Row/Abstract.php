<?php

/**
 * Row definition class for table animal_type.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_AnimalType_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $name
 */
abstract class Application_Model_AnimalType_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_AnimalType_Row
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
     * @return Application_Model_AnimalType_Row
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
     * Get a list of rows of Animal.
     *
     * @return Application_Model_Animal_Rowset
     */
    public function getAnimalRowsByFkAnimalType()
    {
        return $this->findDependentRowset('Application_Model_Animal_DbTable', 'fk_animal_type');
    }

    /**
     * Get a list of rows of Cheptel.
     *
     * @return Application_Model_Cheptel_Rowset
     */
    public function getCheptelRowsByFkAnimalType()
    {
        return $this->findDependentRowset('Application_Model_Cheptel_DbTable', 'fk_animal_type');
    }

    /**
     * Get a list of rows of DaralStatAnimal.
     *
     * @return Application_Model_DaralStatAnimal_Rowset
     */
    public function getDaralStatAnimalRowsByFkAnimalType()
    {
        return $this->findDependentRowset('Application_Model_DaralStatAnimal_DbTable', 'fk_animal_type');
    }

    /**
     * Get a list of rows of DepartementStatAnimal.
     *
     * @return Application_Model_DepartementStatAnimal_Rowset
     */
    public function getDepartementStatAnimalRowsByFkAnimalType()
    {
        return $this->findDependentRowset('Application_Model_DepartementStatAnimal_DbTable', 'fk_animal_type');
    }

    /**
     * Get a list of rows of LocaliteStatAnimal.
     *
     * @return Application_Model_LocaliteStatAnimal_Rowset
     */
    public function getLocaliteStatAnimalRowsByFkAnimalType()
    {
        return $this->findDependentRowset('Application_Model_LocaliteStatAnimal_DbTable', 'fk_animal_type');
    }

    /**
     * Get a list of rows of National.
     *
     * @return Application_Model_National_Rowset
     */
    public function getNationalRowsByFkAnimalType()
    {
        return $this->findDependentRowset('Application_Model_National_DbTable', 'fk_animal_type');
    }

    /**
     * Get a list of rows of RegionStatAnimal.
     *
     * @return Application_Model_RegionStatAnimal_Rowset
     */
    public function getRegionStatAnimalRowsByFkAnimalType()
    {
        return $this->findDependentRowset('Application_Model_RegionStatAnimal_DbTable', 'fk_animal_type');
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
