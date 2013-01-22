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

	public function addCheptel($fk_id_farmer,$fk_animaltype,$total_animaltype_to_add)
	{
	   $tableFarmer = new Application_Model_Farmer_DbTable_Farmer();
	   $tableCategorie= new Application_Model_Categorie_DbTable_Categorie();
	   $tableAnimal = new Application_Model_Animal_DbTable_Animal();
	   $tableAnimaltype = new Application_Model_Animaltype_DbTable_Animaltype();
	    
	  
    
	   if($tableFarmer->exist_farmer($fk_id_farmer)) //check if farmer is active
	        {   
	        	$categorie = $tableFarmer->getCategorie($fk_id_farmer);
	        	$max_animal= $tableCategorie->getMaxAnimal($categorie);
	        	
	        	$row = $this->fetchRow($this->select()->where('fk_id_farmer=?',$fk_id_farmer)->where('fk_animaltype=?',$fk_animaltype));
	             if($row) //farmer already has an entry in the table for this Animaltype
	             	
				   { 
				         $current_total_all_types=$this->getFarmerTotal($fk_id_farmer);//current total for ALL animal types
				         $new_total_all_types=$current_total_all_types+$total_animaltype_to_add;//new total for ALL animal types
				            
				             	if ($new_total_all_types<= $max_animal)
				             	{
				             	        //table "cheptel" is updated
				             		    $row_arr = $row->toArray();
				             		    $current_total_animal_type=$row_arr['total_animaltype'];//current total for Animaltype
				             		    
				             		    $new_total_animal_type=$current_total_animal_type+$total_animaltype_to_add;//new total for Animaltype
						             	$this->update(array('total_animaltype'=>$new_total_animal_type),
						             			      array('fk_id_farmer=?'=>$fk_id_farmer,'fk_animaltype=?'=>$fk_animaltype));
						           
						             	
						             	//first new animal type rank
						             	$rank=$current_total_animal_type+1; 
						             	
						             	//new animals are inserted
						             	for($i=0;$i<$total_animaltype_to_add;$i++)
						             	{	
					
						             		//determine the rank of the animal to be added in "animal" table in the form 0001 to 9999
						             		
						             		$new_animaltype_rank = $this->generateAnimalRank($rank);
						             		
						             		$tag= $tableAnimaltype->getAnimalTag($fk_animaltype);
						             		
						             		
						             		$animal_id=$fk_id_farmer.$tag.$new_animaltype_rank;
						             		
						             	    $tableAnimal->addAnimal($fk_id_farmer,$fk_animaltype,$animal_id); 
						             	    
						             	    $rank++;//we increment for the next animal 
						             	}
				                 
				             		   return 1; // update and insertion ok
				             	}
				             	
				             	else{ 
				             		   return -1;//no insertion: maximum exceeded 
				             	    }
				             	
				             
				             	
				   }

	             else //farmer has no previous entry in the table for this animal type
	             { 
	             	$current_total_all_types=$this->getFarmerTotal($fk_id_farmer);//current total for ALL Animaltypes
	             	$new_total_all_types=$current_total_all_types+$total_animaltype_to_add;//new total for ALL Animaltypes
				             	 
				             	if ($new_total_all_types<= $max_animal)
				             	{
				             	    //a new entry is created in "cheptel"
				             	    $isactive=1;
				             		$data = array(
				             				 'fk_id_farmer'=>$fk_id_farmer,
				             				 'fk_animaltype'=>$fk_animaltype,
				             				 'total_animaltype'=>$total_animaltype_to_add,
				             				 'isactive'=>$isactive,
				             				
				             				);
				             		
				             		$this->insert($data);
				             		
				             		//first new animal type rank
				             		$rank=1;
				             		
				             		//new animals are inserted
				             		for($i=0;$i<$total_animaltype_to_add;$i++)
				             		{
				             			//determine the rank of the animal to be added in "animal" table in the form  0001 to 9999
				             			 
				             			$new_animaltype_rank = $this->generateAnimalRank($rank);
				             			 
				             			$tag= $tableAnimaltype->getAnimalTag($fk_animaltype);
				             			//$tag="C";
				             			 
				             			$animal_id=$fk_id_farmer.$tag.$new_animaltype_rank;
				             			 
				             			$tableAnimal->addAnimal($fk_id_farmer,$fk_animaltype,$animal_id);
				             			
				             			$rank++;//we increment for the next animal
				             		}
				             	
				             		return 1; // insertion ok
				             	}
				             	 
				             	else
				             	{
				             		return -1;//no insertion: maximum exceeded
				             	}
	             	
	             	
	        	
	             }
	             
	             
	             
	       }
	   
	   else 
	        {
	        	return 0;//no such farmer in data base
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
			  		 $total+=$row['total_animaltype'];
			  	}
			    
			    return $total;
	  	}
	  	
	  	else 
	  	{
	  		    return 0;
	  	}
	  }
	  
	  //*************************************************
	  //**********  GET FARMER TOTAL ANIMAL TYPE ********************
	  
	  public function getFarmerTotalAnimalType($id_farmer,$animaltype)
	  {
	  	$tableFarmer= new Application_Model_Farmer_DbTable_Farmer();
	  	if($tableFarmer->exist_farmer($id_farmer))
	  	{
	  		$rows=$this->fetchAll(array('fk_id_farmer=?'=>$id_farmer,'fk_animaltype=?'=>$animaltype));
	  
	  		$rows_arr = $rows->toArray();
	  
	  		
	  		// print_r($rows_arr[0]['total_animaltype']);break;
	  		return $rows_arr[0]['total_animaltype'];
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
	  public function updateCheptel($id_farmer,$animaltype,$new_total)
	  {
	  	$data = array(
	  
	  				
	  			'total_animaltype'=>$new_total
	  
	  	);
	  
	  	$this->update($data,'fk_id_farmer=\''.$id_farmer.'\'and fk_animaltype=\''.$animaltype.'\'');
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
	  
	  	if (isset($params['fk_animaltype']) && !empty($params['fk_animaltype'])) {
	  		$select->where('fk_animaltype = ?', $params['fk_animaltype']);
	  	}
	  
	  	if (isset($params['total_animaltype']) && !empty($params['total_animaltype'])) {
	  		$select->where('total_animaltype = ?', $params['total_animaltype']);
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
	  
	  		if ('all' === $searchMode || 'fk_animaltype' === $searchMode) {
	  			$searchWheres[] = $dbAdapter->quoteInto('fk_animaltype LIKE ?', "%$keywords%");
	  		}
	  
	  		if (!empty($searchWheres)) {
	  			$select->where(implode(' OR ', $searchWheres));
	  		}
	  	}
	  
	  	return $select;
	  }  

	  
	  
	  	    
	  
}





