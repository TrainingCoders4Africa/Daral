<?php

/**
 * Row definition class for table localite.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Localite_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $name
 * @property string $departement
 */
abstract class Application_Model_Localite_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Localite_Row
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
     * @return Application_Model_Localite_Row
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
     * Set value for 'departement' field
     *
     * @param string $Departement
     *
     * @return Application_Model_Localite_Row
     */
    public function setDepartement($Departement)
    {
        $this->departement = $Departement;
        return $this;
    }

    /**
     * Get value of 'departement' field
     *
     * @return string
     */
    public function getDepartement()
    {
        return $this->departement;
    }

    /**
     * Set value for 'region' field
     *
     * @param string $Region
     *
     * @return Application_Model_Localite_Row
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
     * Get a row of Departement.
     *
     * @return Application_Model_Departement_Row
     */
    public function getDepartementRowByDepartement()
    {
        return $this->findParentRow('Application_Model_Departement_DbTable', 'departement');
    }

    /**
     * Get a list of rows of Daral.
     *
     * @return Application_Model_Daral_Rowset
     */
    public function getDaralRowsByIdLocalite()
    {
        return $this->findDependentRowset('Application_Model_Daral_DbTable', 'id_localite');
    }

    /**
     * Get a list of rows of Localitestatanimal.
     *
     * @return Application_Model_Localitestatanimal_Rowset
     */
    public function getLocalitestatanimalRowsByFkLocaliteName()
    {
        return $this->findDependentRowset('Application_Model_Localitestatanimal_DbTable', 'fk_localite_name');
    }

    /**
     * Get a list of rows of Localitestatfarmer.
     *
     * @return Application_Model_Localitestatfarmer_Rowset
     */
    public function getLocalitestatfarmerRowsByFkLocaliteName()
    {
        return $this->findDependentRowset('Application_Model_Localitestatfarmer_DbTable', 'fk_localite_name');
    }

    /**
     * Get a list of rows of Notification.
     *
     * @return Application_Model_Notification_Rowset
     */
    public function getNotificationRowsByIdLocalite()
    {
        return $this->findDependentRowset('Application_Model_Notification_DbTable', 'id_localite');
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
