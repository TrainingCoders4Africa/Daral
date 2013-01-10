<?php

/**
 * Row definition class for table localitestatfarmer.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Localitestatfarmer_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $fk_localite_name
 * @property integer $total_farmer
 */
abstract class Application_Model_Localitestatfarmer_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Localitestatfarmer_Row
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
     * Set value for 'fk_localite_name' field
     *
     * @param string $FkLocaliteName
     *
     * @return Application_Model_Localitestatfarmer_Row
     */
    public function setFkLocaliteName($FkLocaliteName)
    {
        $this->fk_localite_name = $FkLocaliteName;
        return $this;
    }

    /**
     * Get value of 'fk_localite_name' field
     *
     * @return string
     */
    public function getFkLocaliteName()
    {
        return $this->fk_localite_name;
    }

    /**
     * Set value for 'total_farmer' field
     *
     * @param integer $TotalFarmer
     *
     * @return Application_Model_Localitestatfarmer_Row
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
     * Get a row of Localite.
     *
     * @return Application_Model_Localite_Row
     */
    public function getLocaliteRowByFkLocaliteName()
    {
        return $this->findParentRow('Application_Model_Localite_DbTable', 'fk_localite_name');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->fk_localite_name;
    }
}
