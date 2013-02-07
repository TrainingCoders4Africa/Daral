<?php

/**
 * Definition class for table maladie.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Maladie_DbTable extends Application_Model_Maladie_DbTable_Abstract
{
    // write your custom functions here
	public function getMaladie($id_maladie)
	
    {
        $id_maladie = (int)$id_maladie;
					
        $row = $this->fetchRow(array('id = '.$id_maladie));
        if (!$row) {
            throw new Exception("Could not find row $id_maladie");
        }
        return $row->toArray();
    }
}