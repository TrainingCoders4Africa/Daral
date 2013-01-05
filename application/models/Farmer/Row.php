<?php

/**
 * Row definition class for table farmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_Farmer_Row extends Application_Model_Farmer_Row_Abstract
{
    // write your custom functions here
   /**
     * Get the label that has been auto-detected by Zodeken
     *
     * @return string
     */
    public function getZodekenAutoLabel()
    {
        return $this->firstname_farmer.' '.$this->lastname_farmer;;
    }
}
