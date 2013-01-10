<?php

/**
 * Row definition class for table typenotification.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Typenotification_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $libelle
 * @property string $description
 */
abstract class Application_Model_Typenotification_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Typenotification_Row
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
     * Set value for 'libelle' field
     *
     * @param string $Libelle
     *
     * @return Application_Model_Typenotification_Row
     */
    public function setLibelle($Libelle)
    {
        $this->libelle = $Libelle;
        return $this;
    }

    /**
     * Get value of 'libelle' field
     *
     * @return string
     */
    public function getLibelle()
    {
        return $this->libelle;
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
     * Get a list of rows of Notification.
     *
     * @return Application_Model_Notification_Rowset
     */
    public function getNotificationRowsByType()
    {
        return $this->findDependentRowset('Application_Model_Notification_DbTable', 'type');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->libelle;
    }
}
