<?php

/**
 * Row definition class for table maladie.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Maladie_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $libelle
 * @property string $symptomes
 * @property string $type
 * @property string $vaccin
 */
abstract class Application_Model_Maladie_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Maladie_Row
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
     * @return Application_Model_Maladie_Row
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
     * Set value for 'symptomes' field
     *
     * @param string $Symptomes
     *
     * @return Application_Model_Maladie_Row
     */
    public function setSymptomes($Symptomes)
    {
        $this->symptomes = $Symptomes;
        return $this;
    }

    /**
     * Get value of 'symptomes' field
     *
     * @return string
     */
    public function getSymptomes()
    {
        return $this->symptomes;
    }

    /**
     * Set value for 'type' field
     *
     * @param string $Type
     *
     * @return Application_Model_Maladie_Row
     */
    public function setType($Type)
    {
        $this->type = $Type;
        return $this;
    }

    /**
     * Get value of 'type' field
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set value for 'vaccin' field
     *
     * @param string $Vaccin
     *
     * @return Application_Model_Maladie_Row
     */
    public function setVaccin($Vaccin)
    {
        $this->vaccin = $Vaccin;
        return $this;
    }

    /**
     * Get value of 'vaccin' field
     *
     * @return string
     */
    public function getVaccin()
    {
        return $this->vaccin;
    }

    /**
     * Get a list of rows of Media.
     *
     * @return Application_Model_Media_Rowset
     */
    public function getMediaRowsByMaladie()
    {
        return $this->findDependentRowset('Application_Model_Media_DbTable', 'maladie');
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
