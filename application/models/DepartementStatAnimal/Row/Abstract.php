<?php

/**
 * Row definition class for table departement_stat_animal.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_DepartementStatAnimal_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $fk_departement_name
 * @property string $fk_animal_type
 * @property integer $total_animal_type
 */
abstract class Application_Model_DepartementStatAnimal_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_DepartementStatAnimal_Row
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
     * Set value for 'fk_departement_name' field
     *
     * @param string $FkDepartementName
     *
     * @return Application_Model_DepartementStatAnimal_Row
     */
    public function setFkDepartementName($FkDepartementName)
    {
        $this->fk_departement_name = $FkDepartementName;
        return $this;
    }

    /**
     * Get value of 'fk_departement_name' field
     *
     * @return string
     */
    public function getFkDepartementName()
    {
        return $this->fk_departement_name;
    }

    /**
     * Set value for 'fk_animal_type' field
     *
     * @param string $FkAnimalType
     *
     * @return Application_Model_DepartementStatAnimal_Row
     */
    public function setFkAnimalType($FkAnimalType)
    {
        $this->fk_animal_type = $FkAnimalType;
        return $this;
    }

    /**
     * Get value of 'fk_animal_type' field
     *
     * @return string
     */
    public function getFkAnimalType()
    {
        return $this->fk_animal_type;
    }

    /**
     * Set value for 'total_animal_type' field
     *
     * @param integer $TotalAnimalType
     *
     * @return Application_Model_DepartementStatAnimal_Row
     */
    public function setTotalAnimalType($TotalAnimalType)
    {
        $this->total_animal_type = $TotalAnimalType;
        return $this;
    }

    /**
     * Get value of 'total_animal_type' field
     *
     * @return integer
     */
    public function getTotalAnimalType()
    {
        return $this->total_animal_type;
    }

    /**
     * Get a row of AnimalType.
     *
     * @return Application_Model_AnimalType_Row
     */
    public function getAnimalTypeRowByFkAnimalType()
    {
        return $this->findParentRow('Application_Model_AnimalType_DbTable', 'fk_animal_type');
    }

    /**
     * Get a row of Departement.
     *
     * @return Application_Model_Departement_Row
     */
    public function getDepartementRowByFkDepartementName()
    {
        return $this->findParentRow('Application_Model_Departement_DbTable', 'fk_departement_name');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->fk_departement_name;
    }
}
