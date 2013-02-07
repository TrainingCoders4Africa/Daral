<?php

/**
 * Definition class for table langue.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Langue_DbTable extends Application_Model_Langue_DbTable_Abstract
{
    // write your custom functions here
	public function getLangue($id_langue)
	
    {
        $id_langue = (int)$id_langue;
					
        $row = $this->fetchRow(array('id = '.$id_langue));
        if (!$row) {
            throw new Exception("Could not find row $id_langue");
        }
        return $row->toArray();
    }
}