<?php

/**
 * Row definition class for table notification.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Notification_Row setFromArray($data)
 *
 * @property integer $id
 * @property integer $id_localite
 * @property string $date
 * @property integer $type
 * @property integer $id_user
 * @property integer $disabled
 * @property string $description
 */
abstract class Application_Model_Notification_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Notification_Row
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
     * Set value for 'id_farmer' field
     *
     * @param string $IdFarmer
     *
     * @return Application_Model_Notification_Row
     */
    public function setIdFarmer($IdFarmer)
    {
        $this->id_farmer = $IdFarmer;
        return $this;
    }

    /**
     * Get value of 'id_farmer' field
     *
     * @return string
     */
    public function getIdFarmer()
    {
        return $this->id_farmer;
    }

    /**
     * Set value for 'id_localite' field
     *
     * @param integer $IdLocalite
     *
     * @return Application_Model_Notification_Row
     */
    public function setIdLocalite($IdLocalite)
    {
        $this->id_localite = $IdLocalite;
        return $this;
    }

    /**
     * Get value of 'id_localite' field
     *
     * @return integer
     */
    public function getIdLocalite()
    {
        return $this->id_localite;
    }

    /**
     * Set value for 'date' field
     *
     * @param string $Date
     *
     * @return Application_Model_Notification_Row
     */
    public function setDate($Date)
    {
        $this->date = $Date;
        return $this;
    }

    /**
     * Get value of 'date' field
     *
     * @return string
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set value for 'type' field
     *
     * @param integer $Type
     *
     * @return Application_Model_Notification_Row
     */
    public function setType($Type)
    {
        $this->type = $Type;
        return $this;
    }

    /**
     * Get value of 'type' field
     *
     * @return integer
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set value for 'id_user' field
     *
     * @param integer $IdUser
     *
     * @return Application_Model_Notification_Row
     */
    public function setIdUser($IdUser)
    {
        $this->id_user = $IdUser;
        return $this;
    }

    /**
     * Get value of 'id_user' field
     *
     * @return integer
     */
    public function getIdUser()
    {
        return $this->id_user;
    }

    /**
     * Set value for 'disabled' field
     *
     * @param integer $Disabled
     *
     * @return Application_Model_Notification_Row
     */
    public function setDisabled($Disabled)
    {
        $this->disabled = $Disabled;
        return $this;
    }

    /**
     * Get value of 'disabled' field
     *
     * @return integer
     */
    public function getDisabled()
    {
        return $this->disabled;
    }

    /**
     * Get a row of Farmer.
     *
     * @return Application_Model_Farmer_Row
     */
    public function getFarmerRowByIdFarmer()
    {
        return $this->findParentRow('Application_Model_Farmer_DbTable', 'id_farmer');
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
     * Get a row of Typenotification.
     *
     * @return Application_Model_Typenotification_Row
     */
    public function getTypenotificationRowByType()
    {
        return $this->findParentRow('Application_Model_Typenotification_DbTable', 'type');
    }

    /**
     * Get a row of Users.
     *
     * @return Application_Model_Users_Row
     */
    public function getUsersRowByIdUser()
    {
        return $this->findParentRow('Application_Model_Users_DbTable', 'id_user');
    }
    
    /**
     * Set value for 'description' field
     *
     * @param string $Description
     *
     * @return Application_Model_Typenotification_Row
     */
    public function setDescription($Description)
    {
    	$this->description = $Description;
    	return $this;
    }
    
    /**
     * Get value of 'description' field
     *
     * @return string
     */
    public function getDescription()
    {
    	return $this->description;
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->id_farmer;
    }
}
