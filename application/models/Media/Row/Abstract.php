<?php

/**
 * Row definition class for table media.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Media_Row setFromArray($data)
 *
 * @property integer $id_media
 * @property string $titre
 * @property string $langue
 * @property string $date_insertion
 * @property string $lien
 * @property string $maladie
 */
abstract class Application_Model_Media_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'id_media' field
     *
     * @param integer $IdMedia
     *
     * @return Application_Model_Media_Row
     */
    public function setIdMedia($IdMedia)
    {
        $this->id_media = $IdMedia;
        return $this;
    }

    /**
     * Get value of 'id_media' field
     *
     * @return integer
     */
    public function getIdMedia()
    {
        return $this->id_media;
    }

    /**
     * Set value for 'titre' field
     *
     * @param string $Titre
     *
     * @return Application_Model_Media_Row
     */
    public function setTitre($Titre)
    {
        $this->titre = $Titre;
        return $this;
    }

    /**
     * Get value of 'titre' field
     *
     * @return string
     */
    public function getTitre()
    {
        return $this->titre;
    }

    /**
     * Set value for 'langue' field
     *
     * @param string $Langue
     *
     * @return Application_Model_Media_Row
     */
    public function setLangue($Langue)
    {
        $this->langue = $Langue;
        return $this;
    }

    /**
     * Get value of 'langue' field
     *
     * @return string
     */
    public function getLangue()
    {
        return $this->langue;
    }

    /**
     * Set value for 'date_insertion' field
     *
     * @param string $DateInsertion
     *
     * @return Application_Model_Media_Row
     */
    public function setDateInsertion($DateInsertion)
    {
        $this->date_insertion = $DateInsertion;
        return $this;
    }

    /**
     * Get value of 'date_insertion' field
     *
     * @return string
     */
    public function getDateInsertion()
    {
        return $this->date_insertion;
    }

    /**
     * Set value for 'lien' field
     *
     * @param string $Lien
     *
     * @return Application_Model_Media_Row
     */
    public function setLien($Lien)
    {
        $this->lien = $Lien;
        return $this;
    }

    /**
     * Get value of 'lien' field
     *
     * @return string
     */
    public function getLien()
    {
        return $this->lien;
    }

    /**
     * Set value for 'maladie' field
     *
     * @param string $Maladie
     *
     * @return Application_Model_Media_Row
     */
    public function setMaladie($Maladie)
    {
        $this->maladie = $Maladie;
        return $this;
    }

    /**
     * Get value of 'maladie' field
     *
     * @return string
     */
    public function getMaladie()
    {
        return $this->maladie;
    }

    /**
     * Get a row of Maladie.
     *
     * @return Application_Model_Maladie_Row
     */
    public function getMaladieRowByMaladie()
    {
        return $this->findParentRow('Application_Model_Maladie_DbTable', 'maladie');
    }

    /**
     * Get a row of Langue.
     *
     * @return Application_Model_Langue_Row
     */
    public function getLangueRowByLangue()
    {
        return $this->findParentRow('Application_Model_Langue_DbTable', 'langue');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->titre;
    }
}
