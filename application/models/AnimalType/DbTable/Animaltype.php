<?php



error_reporting(E_ALL);

/**
 * Model for table animaltype
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Animaltype_DbTable_Animaltype extends Zend_Db_Table_Abstract
{
	protected $_name = 'animaltype';

	public function getAnimalTag($animal_type){
	
		$row = $this->fetchRow($this->select()->where('name=?',$animal_type));
		$row_arr = $row->toArray();
		$animal_tag= $row_arr['animal_tag'];
	
	
	
	
		return $animal_tag;
	
	
	}
	
	public function get_animal_types()
	{
	   $sql="select name from animaltype";
	   $stmt = $this->_db->query($sql);
	   $rows=$stmt->fetchAll(PDO::FETCH_COLUMN);
	   return $rows;
		
	}
}