<?php
error_reporting(E_ALL);

/**
 * Model for table categorie
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Categorie_DbTable_Categorie extends Zend_Db_Table_Abstract
{
	protected $_name = 'categorie';
	
	//*********************************************************************//
	//*************** GETS MAX ANIMAL FOR A GIVEN CATEGORIE  *******************//
	public function getMaxAnimal($categorie)
	
	{
	
	
			
		$row = $this->fetchRow(array('categorie_id = ?'=>$categorie));
		if (!$row) {
			throw new Exception("Could not find row $categorie");
		}
		$row_arr= $row->toArray();
		return $row_arr['max_animal'];
	
	}
	
	
	
}
	