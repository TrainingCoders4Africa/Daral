<?php

/**
 * Row definition class for table farmer.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Farmer_Row setFromArray($data)
 *
 * @property integer $rank_farmer
 * @property string $id_farmer
 * @property integer $categorie
 * @property string $national_id
 * @property string $address_farmer
 * @property string $registration_date
 * @property string $daral_originel
 * @property string $daral_actuel
 * @property string $firstname_farmer
 * @property string $lastname_farmer
 * @property integer $isactive_farmer
 * @property string $birthdate_farmer
 * @property string $birthplace_farmer
 * @property string $id_localite
 */
abstract class Application_Model_Farmer_Row_Abstract extends Zend_Db_Table_Row_Abstract
{
    /**
     * Set value for 'rank_farmer' field
     *
     * @param integer $RankFarmer
     *
     * @return Application_Model_Farmer_Row
     */
    public function setRankFarmer($RankFarmer)
    {
        $this->rank_farmer = $RankFarmer;
        return $this;
    }

    /**
     * Get value of 'rank_farmer' field
     *
     * @return integer
     */
    public function getRankFarmer()
    {
        return $this->rank_farmer;
    }

    /**
     * Set value for 'id_farmer' field
     *
     * @param string $IdFarmer
     *
     * @return Application_Model_Farmer_Row
     */
    public function setIdFarmer($IdFarmer)
    {
        $this->id_farmer = $IdFarmer;
        return $this;
    }

    /**
     * Get value of 'id_farmer' field
     *
     * @return string
     */
    public function getIdFarmer()
    {
        return $this->id_farmer;
    }

    /**
     * Set value for 'categorie' field
     *
     * @param integer $Categorie
     *
     * @return Application_Model_Farmer_Row
     */
    public function setCategorie($Categorie)
    {
        $this->categorie = $Categorie;
        return $this;
    }

    /**
     * Get value of 'categorie' field
     *
     * @return integer
     */
    public function getCategorie()
    {
        return $this->categorie;
    }

    /**
     * Set value for 'national_id' field
     *
     * @param string $NationalId
     *
     * @return Application_Model_Farmer_Row
     */
    public function setNationalId($NationalId)
    {
        $this->national_id = $NationalId;
        return $this;
    }

    /**
     * Get value of 'national_id' field
     *
     * @return string
     */
    public function getNationalId()
    {
        return $this->national_id;
    }

    /**
     * Set value for 'address_farmer' field
     *
     * @param string $AddressFarmer
     *
     * @return Application_Model_Farmer_Row
     */
    public function setAddressFarmer($AddressFarmer)
    {
        $this->address_farmer = $AddressFarmer;
        return $this;
    }

    /**
     * Get value of 'address_farmer' field
     *
     * @return string
     */
    public function getAddressFarmer()
    {
        return $this->address_farmer;
    }

    /**
     * Set value for 'registration_date' field
     *
     * @param string $RegistrationDate
     *
     * @return Application_Model_Farmer_Row
     */
    public function setRegistrationDate($RegistrationDate)
    {
        $this->registration_date = $RegistrationDate;
        return $this;
    }

    /**
     * Get value of 'registration_date' field
     *
     * @return string
     */
    public function getRegistrationDate()
    {
        return $this->registration_date;
    }

    /**
     * Set value for 'daral_originel' field
     *
     * @param string $DaralOriginel
     *
     * @return Application_Model_Farmer_Row
     */
    public function setDaralOriginel($DaralOriginel)
    {
        $this->daral_originel = $DaralOriginel;
        return $this;
    }

    /**
     * Get value of 'daral_originel' field
     *
     * @return string
     */
    public function getDaralOriginel()
    {
        return $this->daral_originel;
    }

    /**
     * Set value for 'daral_actuel' field
     *
     * @param string $DaralActuel
     *
     * @return Application_Model_Farmer_Row
     */
    public function setDaralActuel($DaralActuel)
    {
        $this->daral_actuel = $DaralActuel;
        return $this;
    }

    /**
     * Get value of 'daral_actuel' field
     *
     * @return string
     */
    public function getDaralActuel()
    {
        return $this->daral_actuel;
    }

    /**
     * Set value for 'firstname_farmer' field
     *
     * @param string $FirstnameFarmer
     *
     * @return Application_Model_Farmer_Row
     */
    public function setFirstnameFarmer($FirstnameFarmer)
    {
        $this->firstname_farmer = $FirstnameFarmer;
        return $this;
    }

    /**
     * Get value of 'firstname_farmer' field
     *
     * @return string
     */
    public function getFirstnameFarmer()
    {
        return $this->firstname_farmer;
    }

    /**
     * Set value for 'lastname_farmer' field
     *
     * @param string $LastnameFarmer
     *
     * @return Application_Model_Farmer_Row
     */
    public function setLastnameFarmer($LastnameFarmer)
    {
        $this->lastname_farmer = $LastnameFarmer;
        return $this;
    }

    /**
     * Get value of 'lastname_farmer' field
     *
     * @return string
     */
    public function getLastnameFarmer()
    {
        return $this->lastname_farmer;
    }

    /**
     * Set value for 'isactive_farmer' field
     *
     * @param integer $IsactiveFarmer
     *
     * @return Application_Model_Farmer_Row
     */
    public function setIsactiveFarmer($IsactiveFarmer)
    {
        $this->isactive_farmer = $IsactiveFarmer;
        return $this;
    }

    /**
     * Get value of 'isactive_farmer' field
     *
     * @return integer
     */
    public function getIsactiveFarmer()
    {
        return $this->isactive_farmer;
    }

    /**
     * Set value for 'birthdate_farmer' field
     *
     * @param string $BirthdateFarmer
     *
     * @return Application_Model_Farmer_Row
     */
    public function setBirthdateFarmer($BirthdateFarmer)
    {
        $this->birthdate_farmer = $BirthdateFarmer;
        return $this;
    }

    /**
     * Get value of 'birthdate_farmer' field
     *
     * @return string
     */
    public function getBirthdateFarmer()
    {
        return $this->birthdate_farmer;
    }

    /**
     * Set value for 'birthplace_farmer' field
     *
     * @param string $BirthplaceFarmer
     *
     * @return Application_Model_Farmer_Row
     */
    public function setBirthplaceFarmer($BirthplaceFarmer)
    {
        $this->birthplace_farmer = $BirthplaceFarmer;
        return $this;
    }

    /**
     * Get value of 'birthplace_farmer' field
     *
     * @return string
     */
    public function getBirthplaceFarmer()
    {
        return $this->birthplace_farmer;
    }

    /**
     * Set value for 'id_localite' field
     *
     * @param string $IdLocalite
     *
     * @return Application_Model_Farmer_Row
     */
    public function setIdLocalite($IdLocalite)
    {
        $this->id_localite = $IdLocalite;
        return $this;
    }

    /**
     * Get value of 'id_localite' field
     *
     * @return string
     */
    public function getIdLocalite()
    {
        return $this->id_localite;
    }

    /**
     * Get a row of Daral.
     *
     * @return Application_Model_Daral_Row
     */
    public function getDaralRowByDaralActuel()
    {
        return $this->findParentRow('Application_Model_Daral_DbTable', 'daral_actuel');
    }

    /**
     * Get a row of Categorie.
     *
     * @return Application_Model_Categorie_Row
     */
    public function getCategorieRowByCategorie()
    {
        return $this->findParentRow('Application_Model_Categorie_DbTable', 'categorie');
    }

    /**
     * Get a row of Daral.
     *
     * @return Application_Model_Daral_Row
     */
    public function getDaralRowByDaralOriginel()
    {
        return $this->findParentRow('Application_Model_Daral_DbTable', 'daral_originel');
    }

    /**
     * Get a list of rows of Animal.
     *
     * @return Application_Model_Animal_Rowset
     */
    public function getAnimalRowsByFkIdFarmer()
    {
        return $this->findDependentRowset('Application_Model_Animal_DbTable', 'fk_id_farmer');
    }

    /**
     * Get a list of rows of Cheptel.
     *
     * @return Application_Model_Cheptel_Rowset
     */
    public function getCheptelRowsByFkIdFarmer()
    {
        return $this->findDependentRowset('Application_Model_Cheptel_DbTable', 'fk_id_farmer');
    }

    /**
     * Get a list of rows of Notification.
     *
     * @return Application_Model_Notification_Rowset
     */
    public function getNotificationRowsByIdFarmer()
    {
        return $this->findDependentRowset('Application_Model_Notification_DbTable', 'id_farmer');
    }
    
    /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->id_farmer;
    }
}
