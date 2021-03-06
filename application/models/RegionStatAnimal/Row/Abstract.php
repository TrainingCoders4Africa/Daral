<?php

/**
 * Row definition class for table regionstatanimal.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Regionstatanimal_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $fk_region_name
 * @property string $fk_animaltype
 * @property integer $total_animaltype
 */
abstract class Application_Model_Regionstatanimal_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Regionstatanimal_Row
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
     * Set value for 'fk_region_name' field
     *
     * @param string $FkRegionName
     *
     * @return Application_Model_Regionstatanimal_Row
     */
    public function setFkRegionName($FkRegionName)
    {
        $this->fk_region_name = $FkRegionName;
        return $this;
    }

    /**
     * Get value of 'fk_region_name' field
     *
     * @return string
     */
    public function getFkRegionName()
    {
        return $this->fk_region_name;
    }

    /**
     * Set value for 'fk_animaltype' field
     *
     * @param string $FkAnimaltype
     *
     * @return Application_Model_Regionstatanimal_Row
     */
    public function setFkAnimaltype($FkAnimaltype)
    {
        $this->fk_animaltype = $FkAnimaltype;
        return $this;
    }

    /**
     * Get value of 'fk_animaltype' field
     *
     * @return string
     */
    public function getFkAnimaltype()
    {
        return $this->fk_animaltype;
    }

    /**
     * Set value for 'total_animaltype' field
     *
     * @param integer $TotalAnimaltype
     *
     * @return Application_Model_Regionstatanimal_Row
     */
    public function setTotalAnimaltype($TotalAnimaltype)
    {
        $this->total_animaltype = $TotalAnimaltype;
        return $this;
    }

    /**
     * Get value of 'total_animaltype' field
     *
     * @return integer
     */
    public function getTotalAnimaltype()
    {
        return $this->total_animaltype;
    }

    /**
     * Get a row of Animaltype.
     *
     * @return Application_Model_Animaltype_Row
     */
    public function getAnimaltypeRowByFkAnimaltype()
    {
        return $this->findParentRow('Application_Model_Animaltype_DbTable', 'fk_animaltype');
    }

    /**
     * Get a row of Region.
     *
     * @return Application_Model_Region_Row
     */
    public function getRegionRowByFkRegionName()
    {
        return $this->findParentRow('Application_Model_Region_DbTable', 'fk_region_name');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->fk_region_name;
    }
}
