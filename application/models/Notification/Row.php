<?php

/**
 * Row definition class for table notification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Model_Notification_Row extends Application_Model_Notification_Row_Abstract
{
    // write your custom functions here
    
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
