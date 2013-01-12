<?php
error_reporting(E_ALL);

/**
 * Model for table animal
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Animal_DbTable_Animal extends Zend_Db_Table_Abstract
{
	protected $_name = 'animal';
	
	public function addAnimal($id_farmer,$animaltype,$animal_id)
	{
		$data= array(
				'fk_id_farmer'=>$id_farmer,
				'fk_animaltype'=>$animaltype,
				'animal_id'=>$animal_id,
				'photo_left'=>"no_photo.png",
				'photo_right'=>"no_photo.png",
				'photo_front'=>"no_photo.png",
				
				);
		
		$this->insert($data);
		
	}
	
	
}
	
