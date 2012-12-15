<?php

/**
 * Row definition class for table daral.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Daral_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $id_localite
 * @property string $name
 */
abstract class Application_Model_Daral_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Daral_Row
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
     * Set value for 'id_localite' field
     *
     * @param string $IdLocalite
     *
     * @return Application_Model_Daral_Row
     */
    public function setIdLocalite($IdLocalite)
    {
        $this->id_localite = $IdLocalite;
        return $this;
    }

    /**
     * Get value of 'id_localite' field
     *
     * @return string
     */
    public function getIdLocalite()
    {
        return $this->id_localite;
    }

    /**
     * Set value for 'name' field
     *
     * @param string $Name
     *
     * @return Application_Model_Daral_Row
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
     * Get a row of Localite.
     *
     * @return Application_Model_Localite_Row
     */
    public function getLocaliteRowByIdLocalite()
    {
        return $this->findParentRow('Application_Model_Localite_DbTable', 'id_localite');
    }

    /**
     * Get a list of rows of DaralStatAnimal.
     *
     * @return Application_Model_DaralStatAnimal_Rowset
     */
    public function getDaralStatAnimalRowsByFkDaralName()
    {
        return $this->findDependentRowset('Application_Model_DaralStatAnimal_DbTable', 'fk_daral_name');
    }

    /**
     * Get a list of rows of DaralStatFarmer.
     *
     * @return Application_Model_DaralStatFarmer_Rowset
     */
    public function getDaralStatFarmerRowsByFkDaralName()
    {
        return $this->findDependentRowset('Application_Model_DaralStatFarmer_DbTable', 'fk_daral_name');
    }

    /**
     * Get a list of rows of Farmer.
     *
     * @return Application_Model_Farmer_Rowset
     */
    public function getFarmerRowsByDaralActuel()
    {
        return $this->findDependentRowset('Application_Model_Farmer_DbTable', 'daral_actuel');
    }

    /**
     * Get a list of rows of Farmer.
     *
     * @return Application_Model_Farmer_Rowset
     */
    public function getFarmerRowsByDaralOriginel()
    {
        return $this->findDependentRowset('Application_Model_Farmer_DbTable', 'daral_originel');
    }

    /**
     * Get a list of rows of Users.
     *
     * @return Application_Model_Users_Rowset
     */
    public function getUsersRowsByUserDaral()
    {
        return $this->findDependentRowset('Application_Model_Users_DbTable', 'user_daral');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->id_localite;
    }
}
