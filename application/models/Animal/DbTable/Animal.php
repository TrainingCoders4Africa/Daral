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
	
	//========================================================
	
	public function archiverAnimal($animal_id)
	{
		$data = array(
	
					
				'isactive'=>'0'
	
		);
	
		$this->update($data,'animal_id=\''.$animal_id.'\'');
	}
	
	//========================================================
	 
	public function get_total_animal_type_registered($fk_id_farmer,$tag)
	{
		$id=$fk_id_farmer.$tag.'%';
		//print_r($id);break;
		$nb= "select count(*) from animal a where a.animal_id like '".$id."' ";
		$stmt = $this->_db->query($nb);
		$rows= $stmt->fetchAll(Zend_Db::FETCH_NUM);
		return $rows[0][0];
	
	}
	
  //===============================================================
  public function get_farmer_total_all_types($fk_id_farmer)
  {
  	$nb= "select count(*) from animal a where a.isactive=1 and a.fk_id_farmer='".$fk_id_farmer."' ";
  	$stmt = $this->_db->query($nb);
  	$rows= $stmt->fetchAll(Zend_Db::FETCH_NUM);
  	//print_r($rows[0][0]);break;
  	return $rows[0][0];
  }
  
  //==============================================================
  public function get_current_total_animal_type($fk_id_farmer,$fk_animaltype)
  {
  	$nb= "select count(*) from animal a where a.isactive=1 and a.fk_id_farmer='".$fk_id_farmer."'and a.fk_animaltype='".$fk_animaltype."' ";
  	$stmt = $this->_db->query($nb);
  	$rows= $stmt->fetchAll(Zend_Db::FETCH_NUM);
  	//print_r($rows[0][0]);break;
  	return $rows[0][0];
  }
  //==============================================================
  public function delete_all_farmer_animal($farmer_id)
  {
  	$sql="select animal_id from animal a where fk_id_farmer ='".$farmer_id."' and a.isactive=1";
  	$stmt = $this->_db->query($sql);
  	$animal_ids=$stmt->fetchAll(PDO::FETCH_COLUMN);
  	
  	foreach ($animal_ids as $animal_id)
  	{
  		$this->archiverAnimal($animal_id);
  	}
  	
  	
  	
  	
  }
}
	
