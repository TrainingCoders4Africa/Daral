<?php

/**
 * Row definition class for table departementstatanimal.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Departementstatanimal_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $fk_departement_name
 * @property string $fk_animaltype
 * @property integer $total_animaltype
 */
abstract class Application_Model_Departementstatanimal_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Departementstatanimal_Row
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
     * @return Application_Model_Departementstatanimal_Row
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
     * Set value for 'fk_animaltype' field
     *
     * @param string $FkAnimaltype
     *
     * @return Application_Model_Departementstatanimal_Row
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
     * Set value for 'total_animaltype' field
     *
     * @param integer $TotalAnimaltype
     *
     * @return Application_Model_Departementstatanimal_Row
     */
    public function setTotalAnimaltype($TotalAnimaltype)
    {
        $this->total_animaltype = $TotalAnimaltype;
        return $this;
    }

    /**
     * Get value of 'total_animaltype' field
     *
     * @return integer
     */
    public function getTotalAnimaltype()
    {
        return $this->total_animaltype;
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
