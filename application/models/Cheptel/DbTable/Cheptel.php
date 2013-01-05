<?php
error_reporting(E_ALL);

/**
 * Model for table cheptel
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Cheptel_DbTable_Cheptel extends Zend_Db_Table_Abstract
{
	protected $_name = 'cheptel';
	
//*********************************************************************
//*************************** ADD CHEPTEL******************************

	public function addCheptel($fk_id_farmer,$fk_animal_type,$total_animal_type)
	{
	   $tableFarmer = new Application_Model_Farmer_DbTable_Farmer();
	   $tableCategorie= new Application_Model_Categorie_DbTable_Categorie();
	   $tableAnimal = new Application_Model_Animal_DbTable_Animal();
	    
	  
    
	   if($tableFarmer->exist_farmer($fk_id_farmer)) //check if farmer is active
	        {   
	        	$categorie = $tableFarmer->getCategorie($fk_id_farmer);
	        	$max_animal= $tableCategorie->getMaxAnimal($categorie);
	        	
	        	$row = $this->fetchRow($this->select()->where('fk_id_farmer=?',$fk_id_farmer)->where('fk_animal_type=?',$fk_animal_type));
	             if($row) //farmer already has an entry in the table for this animal type
	             	
				   { 
				         $total=$this->getFarmerTotal($fk_id_farmer);//current total for ALL animal types
				         $total+=$total_animal_type;//new total for ALL animal types
				            
				             	if ($total<= $max_animal)
				             	{
				             	        //table "cheptel" is updated
				             		    $row_arr = $row->toArray();
				             		    $total_animal=$row_arr['total_animal_type'];//current total for animal type
				             		    $total_animal+=$total_animal_type;//new total for animal type
						             	$this->update(array('total_animal_type'=>$total_animal),
						             			      array('fk_id_farmer=?'=>$fk_id_farmer,'fk_animal_type=?'=>$fk_animal_type));
						             	
						             	//new animals are inserted
						             	for($i=0;$i<$total_animal_type;$i++)
						             	{	
						             	  $tableAnimal->addAnimal($fk_id_farmer,$fk_animal_type); 
						             	}
				                 
				             		   return '0=update and insertion ok'; // update and insertion ok
				             	}
				             	
				             	else{ 
				             		   return '1=no insertion: maximum exceeded';//no insertion: maximum exceeded 
				             	    }
				             	
				             
				             	
				   }

	             else //farmer has no previous entry in the table for this animal type
	             { 
	             	$total=$this->getFarmerTotal($fk_id_farmer);//current total for ALL animal types
	             	$total+=$total_animal_type;//new total for ALL animal types
				             	 
				             	if ($total<= $max_animal)
				             	{
				             	    //a new entry is created in "cheptel"
				             	    $isactive=1;
				             		$data = array(
				             				 'fk_id_farmer'=>$fk_id_farmer,
				             				 'fk_animal_type'=>$fk_animal_type,
				             				 'total_animal_type'=>$total_animal_type,
				             				 'isactive'=>$isactive,
				             				
				             				);
				             		
				             		$this->insert($data);
				             		
				             		//new animals are inserted
				             		for($i=0;$i<$total_animal_type;$i++)
				             		{
				             		$tableAnimal->addAnimal($fk_id_farmer,$fk_animal_type);
				             		}
				             	
				             		return '0=insertion ok'; // insertion ok
				             	}
				             	 
				             	else
				             	{
				             		return '1=non insertion maximum exceeded';//no insertion: maximum exceeded
				             	}
	             	
	             	
	        	
	             }
	             
	             
	             
	       }
	   
	   else 
	        {
	        	return '3=no such farmer in data base';//no such farmer in data base
	        }
	        
	   } 
	   
	  
	   
//************************************************* 
//**********  GET FARMER TOTAL ********************
	   
	  public function getFarmerTotal($id_farmer)
	  {
	  	$tableFarmer= new Application_Model_Farmer_DbTable_Farmer();
	  	if($tableFarmer->exist_farmer($id_farmer))
	  	{		
	  	     	$rows=$this->fetchAll(array('fk_id_farmer=?'=>$id_farmer));
	  		  	
			  	$rows_arr = $rows->toArray();
			  	
			  	$total=0;
			  	foreach ($rows_arr as $row)
			  	{
			  		 $total+=$row['total_animal_type'];
			  	}
			    
			    return $total;
	  	}
	  	
	  	else 
	  	{
	  		    return 0;
	  	}
	  }
 //*************************************************
 //**********  GET FARMER CHEPTEL ********************
	  
	  public function getFarmerCheptel($id_farmer)
	  {
	  	$tableFarmer= new Application_Model_Farmer_DbTable_Farmer();
	  	if($tableFarmer->exist_farmer($id_farmer))
	  	{
	  		$rows=$this->fetchAll(array('fk_id_farmer=?'=>$id_farmer));
	  
	  		$rows_arr = $rows->toArray();
	  
	  		
	  		 
	  		return $rows_arr;
	  	}
	  
	  	else
	  	{
	  		return null;
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
	  
	  	if (isset($params['id']) && !empty($params['id'])) {
	  		$select->where('id = ?', $params['id']);
	  	}
	  
	  	if (isset($params['fk_id_farmer']) && !empty($params['fk_id_farmer'])) {
	  		$select->where('fk_id_farmer = ?', $params['fk_id_farmer']);
	  	}
	  
	  	if (isset($params['fk_animal_type']) && !empty($params['fk_animal_type'])) {
	  		$select->where('fk_animal_type = ?', $params['fk_animal_type']);
	  	}
	  
	  	if (isset($params['total_animal_type']) && !empty($params['total_animal_type'])) {
	  		$select->where('total_animal_type = ?', $params['total_animal_type']);
	  	}
	  	
	  	if (isset($params['isactive']) && !empty($params['isactive'])) {
	  		$select->where('isactive = ?', $params['isactive']);
	  	}
	  
	  	// _kw = keywords, _sm = search mode
	  	if (isset($params['_kw']) && !empty($params['_kw'])) {
	  		$dbAdapter = $this->getAdapter();
	  		$searchWheres = array();
	  		$keywords = $params['_kw'];
	  		$searchMode = isset($params['_sm']) && !empty($params['_sm']) ? $params['_sm'] : 'all';
	  
	  		if ('all' === $searchMode || 'fk_id_farmer' === $searchMode) {
	  			$searchWheres[] = $dbAdapter->quoteInto('fk_id_farmer LIKE ?', "%$keywords%");
	  		}
	  
	  		if ('all' === $searchMode || 'fk_animal_type' === $searchMode) {
	  			$searchWheres[] = $dbAdapter->quoteInto('fk_animal_type LIKE ?', "%$keywords%");
	  		}
	  
	  		if (!empty($searchWheres)) {
	  			$select->where(implode(' OR ', $searchWheres));
	  		}
	  	}
	  
	  	return $select;
	  }  
    
}





