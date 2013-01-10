<?php

/**
 * Row definition class for table animal.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Animal_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $fk_id_farmer
 * @property string $fk_animaltype
 * @property string $photo_left
 * @property string $photo_right
 * @property string $photo_front
 */
abstract class Application_Model_Animal_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Animal_Row
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
     * @return Application_Model_Animal_Row
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
     * Set value for 'fk_animaltype' field
     *
     * @param string $FkAnimaltype
     *
     * @return Application_Model_Animal_Row
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
     * Set value for 'photo_left' field
     *
     * @param string $PhotoLeft
     *
     * @return Application_Model_Animal_Row
     */
    public function setPhotoLeft($PhotoLeft)
    {
        $this->photo_left = $PhotoLeft;
        return $this;
    }

    /**
     * Get value of 'photo_left' field
     *
     * @return string
     */
    public function getPhotoLeft()
    {
        return $this->photo_left;
    }

    /**
     * Set value for 'photo_right' field
     *
     * @param string $PhotoRight
     *
     * @return Application_Model_Animal_Row
     */
    public function setPhotoRight($PhotoRight)
    {
        $this->photo_right = $PhotoRight;
        return $this;
    }

    /**
     * Get value of 'photo_right' field
     *
     * @return string
     */
    public function getPhotoRight()
    {
        return $this->photo_right;
    }

    /**
     * Set value for 'photo_front' field
     *
     * @param string $PhotoFront
     *
     * @return Application_Model_Animal_Row
     */
    public function setPhotoFront($PhotoFront)
    {
        $this->photo_front = $PhotoFront;
        return $this;
    }

    /**
     * Get value of 'photo_front' field
     *
     * @return string
     */
    public function getPhotoFront()
    {
        return $this->photo_front;
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
