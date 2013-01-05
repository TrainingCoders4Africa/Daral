<?php

/**
 * Row definition class for table langue.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Langue_Row setFromArray($data)
 *
 * @property integer $id
 * @property string $libelle
 * @property string $pays
 */
abstract class Application_Model_Langue_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id' field
     *
     * @param integer $Id
     *
     * @return Application_Model_Langue_Row
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
     * @return Application_Model_Langue_Row
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
     * Set value for 'pays' field
     *
     * @param string $Pays
     *
     * @return Application_Model_Langue_Row
     */
    public function setPays($Pays)
    {
        $this->pays = $Pays;
        return $this;
    }

    /**
     * Get value of 'pays' field
     *
     * @return string
     */
    public function getPays()
    {
        return $this->pays;
    }

    /**
     * Get a list of rows of Media.
     *
     * @return Application_Model_Media_Rowset
     */
    public function getMediaRowsByLangue()
    {
        return $this->findDependentRowset('Application_Model_Media_DbTable', 'langue');
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
