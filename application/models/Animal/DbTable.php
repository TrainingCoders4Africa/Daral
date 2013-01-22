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
	
	public function archiverAnimal($animal_id)
	{
		$data = array(
	
					
				'isactive'=>'0'
	
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
	
	public function setStatusToStolen($id){
		$data = array(
		
					
				'isstolen'=>'1'
		
		);
		
		$this->update($data,'animal_id=\''.$id.'\'');
		
	}
	
	
	public function setStatusToFound($id){
		$data = array(
	
					
				'isstolen'=>'0'
	
		);
	
		$this->update($data,'animal_id=\''.$id.'\'');
	
	}
	
	
	public function updateAnimalInfo($animal_id,$id_buyer)
	{
		$data = array(
		
					
				'fk_id_farmer'=>$id_buyer
		
		);
		
		$this->update($data,'animal_id=\''.$animal_id.'\'');
		
	}
	
	//=================
	 
	public function generateAnimalRank($rank){
	
		$rank_string = (string) $rank;
	
		//The value returned must be exactly 4 characters long
		switch (strlen($rank_string))
		{
			case 1: return "000".$rank_string;break;
			case 2: return "00".$rank_string;break;
			case 3: return "0".$rank_string;break;
			case 4: return $rank_string;break;
			default: return $rank_string;break;
		}
	
	}
	/**
	 * Get Db_Select for pagination by params sent from controller
	 *
	 * @param array $params
	 * @param string $sortField
	 * @param string $sortOrder
	 * @return Zend_Db_Select
	 */
	public function getDbSelectByParams($params = array(), $sortField = '', $sortOrder = '')
	{
		$select = $this->select(true);
	
		if ($sortField != '' && $sortOrder != '') {
			if ('desc' === strtolower($sortOrder)) {
				$sortOrder = 'DESC';
			} else {
				$sortOrder = 'ASC';
			}
			$select->order("$sortField $sortOrder");
		}
	
		
	
		if (isset($params['fk_id_farmer']) && !empty($params['fk_id_farmer'])) {
			$select->where('fk_id_farmer = ?', $params['fk_id_farmer']);
		}
	
		if (isset($params['fk_animaltype']) && !empty($params['fk_animaltype'])) {
			$select->where('fk_animaltype = ?', $params['fk_animaltype']);
		}
	
		
		if (isset($params['isactive']) && !empty($params['isactive'])) {
			$select->where('isactive = ?', $params['isactive']);
		}
		
		
		if (isset($params['isstolen']) && !empty($params['isstolen'])) {
			$select->where('isstolen = ?', $params['isstolen']);
		}
	
		// _kw = keywords, _sm = search mode
		if (isset($params['animal_id']) && !empty($params['animal_id'])) {
			$dbAdapter = $this->getAdapter();
			$searchWheres = array();
			$keywords = $params['animal_id'];
			$searchMode = isset($params['_sm']) && !empty($params['_sm']) ? $params['_sm'] : 'all';
		
			
			if ('all' === $searchMode || 'animal_id' === $searchMode) {
				$searchWheres[] = $dbAdapter->quoteInto('animal_id LIKE ?', "%$keywords");
			}
			
		
			if (!empty($searchWheres)) {
				$select->where(implode(' OR ', $searchWheres));
			}
		}
		
	
		return $select;
	}
}