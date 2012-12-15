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
	
	public function addAnimal($id_farmer,$animal_type)
	{
		$data= array(
				'fk_id_farmer'=>$id_farmer,
				'fk_animal_type'=>$animal_type,
				'photo_left'=>"VUE GAUCHE",
				'photo_right'=>"VUE DROITE",
				'photo_front'=>"VUE FACE",
				
				);
		
		$this->insert($data);
		
	}
	
}