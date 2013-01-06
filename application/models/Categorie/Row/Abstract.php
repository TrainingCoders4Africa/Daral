<?php

/**
 * Row definition class for table categorie.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Categorie_Row setFromArray($data)
 *
 * @property integer $id
 * @property integer $categorie_id
 * @property integer $max_animal
 */
abstract class Application_Model_Categorie_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Categorie_Row
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
     * Set value for 'categorie_id' field
     *
     * @param integer $CategorieId
     *
     * @return Application_Model_Categorie_Row
     */
    public function setCategorieId($CategorieId)
    {
        $this->categorie_id = $CategorieId;
        return $this;
    }

    /**
     * Get value of 'categorie_id' field
     *
     * @return integer
     */
    public function getCategorieId()
    {
        return $this->categorie_id;
    }

    /**
     * Set value for 'max_animal' field
     *
     * @param integer $MaxAnimal
     *
     * @return Application_Model_Categorie_Row
     */
    public function setMaxAnimal($MaxAnimal)
    {
        $this->max_animal = $MaxAnimal;
        return $this;
    }

    /**
     * Get value of 'max_animal' field
     *
     * @return integer
     */
    public function getMaxAnimal()
    {
        return $this->max_animal;
    }

    /**
     * Get a list of rows of Farmer.
     *
     * @return Application_Model_Farmer_Rowset
     */
    public function getFarmerRowsByCategorie()
    {
        return $this->findDependentRowset('Application_Model_Farmer_DbTable', 'categorie');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->id;
    }
}
