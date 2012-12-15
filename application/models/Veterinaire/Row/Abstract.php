<?php

/**
 * Row definition class for table veterinaire.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Veterinaire_Row setFromArray($data)
 *
 * @property integer $rank_veterinaire
 * @property string $id_veterinaire
 * @property string $adresse_veterinaire
 * @property integer $localite_veterinaire
 * @property string $firstname_veterinaire
 * @property string $lastname_veterinaire
 * @property integer $IsActive_veterinaire
 * @property string $email_veterinaire
 */
abstract class Application_Model_Veterinaire_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'rank_veterinaire' field
     *
     * @param integer $RankVeterinaire
     *
     * @return Application_Model_Veterinaire_Row
     */
    public function setRankVeterinaire($RankVeterinaire)
    {
        $this->rank_veterinaire = $RankVeterinaire;
        return $this;
    }

    /**
     * Get value of 'rank_veterinaire' field
     *
     * @return integer
     */
    public function getRankVeterinaire()
    {
        return $this->rank_veterinaire;
    }

    /**
     * Set value for 'id_veterinaire' field
     *
     * @param string $IdVeterinaire
     *
     * @return Application_Model_Veterinaire_Row
     */
    public function setIdVeterinaire($IdVeterinaire)
    {
        $this->id_veterinaire = $IdVeterinaire;
        return $this;
    }

    /**
     * Get value of 'id_veterinaire' field
     *
     * @return string
     */
    public function getIdVeterinaire()
    {
        return $this->id_veterinaire;
    }

    /**
     * Set value for 'adresse_veterinaire' field
     *
     * @param string $AdresseVeterinaire
     *
     * @return Application_Model_Veterinaire_Row
     */
    public function setAdresseVeterinaire($AdresseVeterinaire)
    {
        $this->adresse_veterinaire = $AdresseVeterinaire;
        return $this;
    }

    /**
     * Get value of 'adresse_veterinaire' field
     *
     * @return string
     */
    public function getAdresseVeterinaire()
    {
        return $this->adresse_veterinaire;
    }

    /**
     * Set value for 'localite_veterinaire' field
     *
     * @param integer $LocaliteVeterinaire
     *
     * @return Application_Model_Veterinaire_Row
     */
    public function setLocaliteVeterinaire($LocaliteVeterinaire)
    {
        $this->localite_veterinaire = $LocaliteVeterinaire;
        return $this;
    }

    /**
     * Get value of 'localite_veterinaire' field
     *
     * @return integer
     */
    public function getLocaliteVeterinaire()
    {
        return $this->localite_veterinaire;
    }

    /**
     * Set value for 'firstname_veterinaire' field
     *
     * @param string $FirstnameVeterinaire
     *
     * @return Application_Model_Veterinaire_Row
     */
    public function setFirstnameVeterinaire($FirstnameVeterinaire)
    {
        $this->firstname_veterinaire = $FirstnameVeterinaire;
        return $this;
    }

    /**
     * Get value of 'firstname_veterinaire' field
     *
     * @return string
     */
    public function getFirstnameVeterinaire()
    {
        return $this->firstname_veterinaire;
    }

    /**
     * Set value for 'lastname_veterinaire' field
     *
     * @param string $LastnameVeterinaire
     *
     * @return Application_Model_Veterinaire_Row
     */
    public function setLastnameVeterinaire($LastnameVeterinaire)
    {
        $this->lastname_veterinaire = $LastnameVeterinaire;
        return $this;
    }

    /**
     * Get value of 'lastname_veterinaire' field
     *
     * @return string
     */
    public function getLastnameVeterinaire()
    {
        return $this->lastname_veterinaire;
    }

    /**
     * Set value for 'IsActive_veterinaire' field
     *
     * @param integer $IsActiveVeterinaire
     *
     * @return Application_Model_Veterinaire_Row
     */
    public function setIsActiveVeterinaire($IsActiveVeterinaire)
    {
        $this->IsActive_veterinaire = $IsActiveVeterinaire;
        return $this;
    }

    /**
     * Get value of 'IsActive_veterinaire' field
     *
     * @return integer
     */
    public function getIsActiveVeterinaire()
    {
        return $this->IsActive_veterinaire;
    }

    /**
     * Set value for 'email_veterinaire' field
     *
     * @param string $EmailVeterinaire
     *
     * @return Application_Model_Veterinaire_Row
     */
    public function setEmailVeterinaire($EmailVeterinaire)
    {
        $this->email_veterinaire = $EmailVeterinaire;
        return $this;
    }

    /**
     * Get value of 'email_veterinaire' field
     *
     * @return string
     */
    public function getEmailVeterinaire()
    {
        return $this->email_veterinaire;
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->id_veterinaire;
    }
}
