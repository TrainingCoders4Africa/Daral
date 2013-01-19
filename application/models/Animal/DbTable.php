<?php

/**
 * Definition class for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Animal_DbTable extends Application_Model_Animal_DbTable_Abstract
{
    // write your custom functions here
	public function updatephotoleft($animal_id,$photo_left)
	{
		
		$data = array(
	
			
				'photo_left'=>$photo_left,
				
		);
		
		$this->update($data,'animal_id=\''.$animal_id.'\'');
	}
	
	
	
	
	public function updatephotoright($animal_id,$photo_right)
	{
		$data = array(
	
				
				'photo_right'=>$photo_right,
	
		);
	
		$this->update($data,'animal_id=\''.$animal_id.'\'');
	}
	
	
	
	
	public function updatephotofront($animal_id,$photo_front)
	{
		$data = array(
	
			
				'photo_front'=>$photo_front,
	
		);
	
		$this->update($data,'animal_id=\''.$animal_id.'\'');
	}
	
	
	public function updatecomment($animal_id,$comment)
	{
		$data = array(
	
					
				'comment'=>$comment
	
		);
	
		$this->update($data,'animal_id=\''.$animal_id.'\'');
	}
	
	public function getAnimal($animal_id)
	
	{
		//print_r($animal_id);break;
	
		$isactive = '1';
	    $stmt = $this->_db->query("select * from animal where animal_id='".$animal_id.'\' and isactive=1');
	    $row = $stmt->fetchAll(Zend_Db::FETCH_NUM);
		
		if (!$row) {
			throw new Exception("Could not find row $animal_id");
				
		}
		return $row;
		
	
	
	
	}
}