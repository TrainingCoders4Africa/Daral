<?php

/**
 * Row definition class for table departement_stat_farmer.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_DepartementStatFarmer_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $fk_departement_name
 * @property integer $total_farmer
 */
abstract class Application_Model_DepartementStatFarmer_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_DepartementStatFarmer_Row
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
     * @return Application_Model_DepartementStatFarmer_Row
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
     * Set value for 'total_farmer' field
     *
     * @param integer $TotalFarmer
     *
     * @return Application_Model_DepartementStatFarmer_Row
     */
    public function setTotalFarmer($TotalFarmer)
    {
        $this->total_farmer = $TotalFarmer;
        return $this;
    }

    /**
     * Get value of 'total_farmer' field
     *
     * @return integer
     */
    public function getTotalFarmer()
    {
        return $this->total_farmer;
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
