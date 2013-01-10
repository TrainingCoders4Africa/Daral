<?php

/**
 * Row definition class for table animaltype.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Animaltype_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $name
 */
abstract class Application_Model_Animaltype_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Animaltype_Row
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
     * @return Application_Model_Animaltype_Row
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
     * Get a list of rows of Animal.
     *
     * @return Application_Model_Animal_Rowset
     */
    public function getAnimalRowsByFkAnimaltype()
    {
        return $this->findDependentRowset('Application_Model_Animal_DbTable', 'fk_animaltype');
    }

    /**
     * Get a list of rows of Cheptel.
     *
     * @return Application_Model_Cheptel_Rowset
     */
    public function getCheptelRowsByFkAnimaltype()
    {
        return $this->findDependentRowset('Application_Model_Cheptel_DbTable', 'fk_animaltype');
    }

    /**
     * Get a list of rows of Daralstatanimal.
     *
     * @return Application_Model_Daralstatanimal_Rowset
     */
    public function getDaralstatanimalRowsByFkAnimaltype()
    {
        return $this->findDependentRowset('Application_Model_Daralstatanimal_DbTable', 'fk_animaltype');
    }

    /**
     * Get a list of rows of Departementstatanimal.
     *
     * @return Application_Model_Departementstatanimal_Rowset
     */
    public function getDepartementstatanimalRowsByFkAnimaltype()
    {
        return $this->findDependentRowset('Application_Model_Departementstatanimal_DbTable', 'fk_animaltype');
    }

    /**
     * Get a list of rows of Localitestatanimal.
     *
     * @return Application_Model_Localitestatanimal_Rowset
     */
    public function getLocalitestatanimalRowsByFkAnimaltype()
    {
        return $this->findDependentRowset('Application_Model_Localitestatanimal_DbTable', 'fk_animaltype');
    }

    /**
     * Get a list of rows of National.
     *
     * @return Application_Model_National_Rowset
     */
    public function getNationalRowsByFkAnimaltype()
    {
        return $this->findDependentRowset('Application_Model_National_DbTable', 'fk_animaltype');
    }

    /**
     * Get a list of rows of Regionstatanimal.
     *
     * @return Application_Model_Regionstatanimal_Rowset
     */
    public function getRegionstatanimalRowsByFkAnimaltype()
    {
        return $this->findDependentRowset('Application_Model_Regionstatanimal_DbTable', 'fk_animaltype');
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
