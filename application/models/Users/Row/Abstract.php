<?php

/**
 * Row definition class for table users.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Users_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $username
 * @property string $password
 * @property string $date_created
 * @property string $role
 * @property string $user_daral
 */
abstract class Application_Model_Users_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Users_Row
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
     * Set value for 'username' field
     *
     * @param string $Username
     *
     * @return Application_Model_Users_Row
     */
    public function setUsername($Username)
    {
        $this->username = $Username;
        return $this;
    }

    /**
     * Get value of 'username' field
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Set value for 'password' field
     *
     * @param string $Password
     *
     * @return Application_Model_Users_Row
     */
    public function setPassword($Password)
    {
        $this->password = $Password;
        return $this;
    }

    /**
     * Get value of 'password' field
     *
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * Set value for 'date_created' field
     *
     * @param string $DateCreated
     *
     * @return Application_Model_Users_Row
     */
    public function setDateCreated($DateCreated)
    {
        $this->date_created = $DateCreated;
        return $this;
    }

    /**
     * Get value of 'date_created' field
     *
     * @return string
     */
    public function getDateCreated()
    {
        return $this->date_created;
    }

    /**
     * Set value for 'role' field
     *
     * @param string $Role
     *
     * @return Application_Model_Users_Row
     */
    public function setRole($Role)
    {
        $this->role = $Role;
        return $this;
    }

    /**
     * Get value of 'role' field
     *
     * @return string
     */
    public function getRole()
    {
        return $this->role;
    }

    /**
     * Set value for 'user_daral' field
     *
     * @param string $UserDaral
     *
     * @return Application_Model_Users_Row
     */
    public function setUserDaral($UserDaral)
    {
        $this->user_daral = $UserDaral;
        return $this;
    }

    /**
     * Get value of 'user_daral' field
     *
     * @return string
     */
    public function getUserDaral()
    {
        return $this->user_daral;
    }

    /**
     * Get a row of Daral.
     *
     * @return Application_Model_Daral_Row
     */
    public function getDaralRowByUserDaral()
    {
        return $this->findParentRow('Application_Model_Daral_DbTable', 'user_daral');
    }

    /**
     * Get a row of Roleusers.
     *
     * @return Application_Model_Roleusers_Row
     */
    public function getRoleusersRowByRole()
    {
        return $this->findParentRow('Application_Model_Roleusers_DbTable', 'role');
    }

    /**
     * Get a list of rows of Notification.
     *
     * @return Application_Model_Notification_Rowset
     */
    public function getNotificationRowsByIdUser()
    {
        return $this->findDependentRowset('Application_Model_Notification_DbTable', 'id_user');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->username;
    }
}
