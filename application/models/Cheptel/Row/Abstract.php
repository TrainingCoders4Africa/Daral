<?php

/**
 * Row definition class for table cheptel.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Cheptel_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $fk_id_farmer
 * @property string $fk_animal_type
 * @property integer $total_animal_type
 */
abstract class Application_Model_Cheptel_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Cheptel_Row
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
     * Set value for 'fk_id_farmer' field
     *
     * @param string $FkIdFarmer
     *
     * @return Application_Model_Cheptel_Row
     */
    public function setFkIdFarmer($FkIdFarmer)
    {
        $this->fk_id_farmer = $FkIdFarmer;
        return $this;
    }

    /**
     * Get value of 'fk_id_farmer' field
     *
     * @return string
     */
    public function getFkIdFarmer()
    {
        return $this->fk_id_farmer;
    }

    /**
     * Set value for 'fk_animal_type' field
     *
     * @param string $FkAnimalType
     *
     * @return Application_Model_Cheptel_Row
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
     * @return Application_Model_Cheptel_Row
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
     * Get a row of Farmer.
     *
     * @return Application_Model_Farmer_Row
     */
    public function getFarmerRowByFkIdFarmer()
    {
        return $this->findParentRow('Application_Model_Farmer_DbTable', 'fk_id_farmer');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->fk_id_farmer;
    }
}
