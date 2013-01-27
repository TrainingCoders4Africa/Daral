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
	
	
	//   **********************************************************************
	//   ************************** SELL ANIMAL *******************************
	//   **********************************************************************
	
    public function sellAnimal($animal_id,$animaltype,$id_seller,$id_buyer)
	{
		
		$total_animaltype_to_add = 1;// animals are processed one at a time
		
		$tableFarmer = new Application_Model_Farmer_DbTable_Farmer();
		$tableCheptel = new Application_Model_Cheptel_DbTable_Cheptel();
		$tableCategorie= new Application_Model_Categorie_DbTable_Categorie();
		$tableAnimal = new Application_Model_Animal_DbTable_Animal();
		$tableAnimaltype = new Application_Model_Animaltype_DbTable_Animaltype();
		
		if($tableFarmer->exist_farmer($id_buyer)) //check if buyer is an active farmer 
		{
			
			
			
			
			$categorie = $tableFarmer->getCategorie($id_buyer);
			$max_animal= $tableCategorie->getMaxAnimal($categorie);
		
			$row_b = $tableCheptel->fetchRow($tableCheptel->select()->where('fk_id_farmer=?',$id_buyer)->where('fk_animaltype=?',$animaltype));
			$row_s = $tableCheptel->fetchRow($tableCheptel->select()->where('fk_id_farmer=?',$id_seller)->where('fk_animaltype=?',$animaltype));
				
			
			if($row_b) //buyer already has an entry in the table for this Animaltype
				 
			{
				
				$current_total_all_types=$tableAnimal->get_farmer_total_all_types($id_buyer);//current total for ALL animal types
				$new_total_all_types=$current_total_all_types+$total_animaltype_to_add;//new total for ALL animal types
		
				if ($new_total_all_types<= $max_animal)
				{
					//table "cheptel" is updated
					  
					//we increment for the buyer
					$current_total_animal_type_b=$tableAnimal->get_current_total_animal_type($id_buyer,$animaltype);//current total for Animaltype
					$new_total_animal_type_b=$current_total_animal_type_b + $total_animaltype_to_add;//new total for Animaltype
					$tableCheptel->update(array('total_animaltype'=>$new_total_animal_type_b),
							array('fk_id_farmer=?'=>$id_buyer,'fk_animaltype=?'=>$animaltype));
						
					//we decrement for the seller
					$current_total_animal_type_s=$tableAnimal->get_current_total_animal_type($id_seller,$animaltype);//current total for Animaltype
					$new_total_animal_type_s=$current_total_animal_type_s - $total_animaltype_to_add;//new total for Animaltype
					
				    $tableCheptel->update(array('total_animaltype'=>$new_total_animal_type_s),
					 array('fk_id_farmer=?'=>$id_seller,'fk_animaltype=?'=>$animaltype));
						
					
					//we change the ownership
					$animal_id=$this->generateAnimalRank($animal_id);//get the id in the form 0001 to 9999
					
				  if(strlen($animal_id)==4)
				  {
					$tag= $tableAnimaltype->getAnimalTag($animaltype);
				
					$animal_id=$this->get_animal_full_id($tag,$animal_id,$id_seller);//get the full animal ID
				
		 			$this->update(array('fk_id_farmer'=>$id_buyer),array('animal_id=?'=>$animal_id));
					 
					return array('res_code'=>'1','animal_id'=>$animal_id); // update and insertion ok
					 }
					 
					 elseif ($animal_id==13)//full animal ID
					 {
					 	$this->update(array('fk_id_farmer'=>$id_buyer),array('animal_id=?'=>$animal_id));
					 	
					 	return array('res_code'=>'1','animal_id'=>$animal_id); // update and insertion ok
					 }
					 else 
					 {
					 	return array('res_code'=>'-2','animal_id'=>$animal_id);// animal_id too long
					 }
				    }
		
				   else
				   {
					return array('res_code'=>'-1','animal_id'=>$animal_id);//no insertion: maximum exceeded
				   }
		
					 
		
					}
		
			  else //farmer has no previous entry in the table for this animal type
			 {
						
						
					$current_total_all_types=$tableAnimal->get_farmer_total_all_types($id_buyer);//current total for ALL Animaltypes
					$new_total_all_types=$current_total_all_types+$total_animaltype_to_add;//new total for ALL Animaltypes
						if ($new_total_all_types<= $max_animal)
						{
						//a new entry is created in "cheptel" for the buyer
						$isactive=1;
						$data = array(
						'fk_id_farmer'=>$id_buyer,
						'fk_animaltype'=>$animaltype,
						'total_animaltype'=>$total_animaltype_to_add,
							'isactive'=>$isactive,
							 
							);
							$tableCheptel->insert($data);
							 
							//we decrement for the seller
							$row_arr_s = $row_s->toArray();
							$current_total_animal_type_s=$tableAnimal->get_current_total_animal_type($id_seller,$animaltype);//current total for Animaltype
							$new_total_animal_type_s=$current_total_animal_type_s - $total_animaltype_to_add;//new total for Animaltype
								
							$tableCheptel->update(array('total_animaltype'=>$new_total_animal_type_s),
									array('fk_id_farmer=?'=>$id_seller,'fk_animaltype=?'=>$animaltype));
							
								
							//we change the animal's ownership
							 	
							$animal_id=$this->generateAnimalRank($animal_id);//get the id in the form 0001 to 9999
							if(strlen($animal_id)==4)
							{
							$tag= $tableAnimaltype->getAnimalTag($animaltype);
							$animal_id=$this->get_animal_full_id($tag,$animal_id,$id_seller);//get the full animal ID
							
								
							
							$this->update(array('fk_id_farmer'=>$id_buyer),array('animal_id=?'=>$animal_id));
								
						
		
							return array('res_code'=>'1','animal_id'=>$animal_id); // insertion ok
							 }
							 
							 elseif (strlen($animal_id)==13)//full animal ID
							 {
							 	$this->update(array('fk_id_farmer'=>$id_buyer),array('animal_id=?'=>$animal_id));
							 	
							 	return array('res_code'=>'1','animal_id'=>$animal_id); // insertion ok
							 }
							 else 
							 {
							 		
							 	return array('res_code'=>'-2','animal_id'=>$animal_id);//"animal_id incorret, (normally should never happen here, just to be safe)
							 }
							}
							 
							else
							{
							return array('res_code'=>'-1','animal_id'=>$animal_id);//no insertion: maximum exceeded
							}
							 
							 
		
				}
		
		
		
	}
		
	else //buyer is 'particulier: ID=00000000' or 'distributeur: ID=99999999' 
	{
		
		$row_s = $tableCheptel->fetchRow($tableCheptel->select()->where('fk_id_farmer=?',$id_seller)->where('fk_animaltype=?',$animaltype));
		//we decrement for the seller
		$row_arr_s = $row_s->toArray();
		$current_total_animal_type_s=$tableAnimal->get_current_total_animal_type($id_seller,$animaltype);//current total for Animaltype
		$new_total_animal_type_s=$current_total_animal_type_s - $total_animaltype_to_add;//new total for Animaltype
		
		$tableCheptel->update(array('total_animaltype'=>$new_total_animal_type_s),
				array('fk_id_farmer=?'=>$id_seller,'fk_animaltype=?'=>$animaltype));
			
		
		//we change the animal's ownership and status to 'inactive'
			
		$animal_id=$this->generateAnimalRank($animal_id);//get the id in the form 0001 to 9999
		if(strlen($animal_id)==4)
		{
			$tag= $tableAnimaltype->getAnimalTag($animaltype);
			$animal_id=$this->get_animal_full_id($tag,$animal_id,$id_seller);//get the full animal ID
				
				
			$this->update(array('fk_id_farmer'=>$id_buyer,'isactive'=>0),array('animal_id=?'=>$animal_id));
		
				
		
			return array('res_code'=>'1','animal_id'=>$animal_id); // insertion ok
		}
		
		elseif (strlen($animal_id)==13)//full animal ID
		{
				
			$this->update(array('fk_id_farmer'=>$id_buyer,'isactive'=>0),array('animal_id=?'=>$animal_id));
			
			return array('res_code'=>'1','animal_id'=>$animal_id); // insertion ok
		}
		else
		{
			return array('res_code'=>'-2','animal_id'=>$animal_id);//"animal_id incorret, (normally should never happen here, just to be safe)
		}
	   
    }
							 
}
		
		
	//  *******************************************************************************
	//  *******************************  END ******************************************
	//  *******************************************************************************	

   public function check_animals($animal_ids,$animaltype,$id_seller)
   {
   	
     $tableAnimaltype = new Application_Model_Animaltype_DbTable_Animaltype();
   	 $errors='';
   	 
   	 
   	 foreach ($animal_ids as $animal_id)//we check each ID for validity
   	 {
   	 	$original_id=$animal_id;//we want to keep the id as entered by the user
   	 	
   	 	if(strlen($animal_id) > 4 && strlen($animal_id)!=13) { $errors.="L' ID ".$original_id." ne correspond a aucune bete;";}
   	 	else
   	 	{   
   	 		    
   	 		    if(strlen($animal_id)<= 4)
   	 		    {
   	 		       $animal_id=$this->generateAnimalRank($animal_id);//get the id in the form 0001 to 9999
   	 			   $tag= $tableAnimaltype->getAnimalTag($animaltype);
   	 			   $short_id= (string) $animal_id;
   	 			   
   	 			   
   	 			   $count = $this->count_animals_with_same_short_id($short_id,$id_seller,$animaltype);
   	 			   
   	 			   switch ($count)
   	 			   {
   	 			   	case  0: $errors.="L' ID ".$original_id." ne correspond a aucune bete pour cet eleveur;";break;
   	 			   	case -1: $errors.="L' ID ".$original_id." correspond a plusieurs betes pour cet eleveur,
   	 			   	                          precisez en donnant l'identifiant complet(ex 10010001B0001);"; break;
   	 			   }
   	 			   
   	 		
   	    	 	}
   	 		
   	 		    elseif (strlen($animal_id)==13)//full animal ID
   	 		    {
   	 		    	if(!$this->exist_animal($animal_id,$id_seller))
   	 		    	 {
   	 		    		$errors.="L' ID ".$original_id." ne correspond a aucune bete pour cet eleveur;";
   	 		    	 }
   	 		    	
   	 	     	}
   	 		
   	 	}
   	    	 
   	 }
   	 
   	 return $errors;
   }
		
	
   //**********************************************************************************//
   //********************* Checks if animal exists and  is active  *******************//
   
   public function exist_animal($animal_id,$id_seller)
   
   {
   
   	$isactive = '1';
   		
   	$row = $this->fetchRow(array('fk_id_farmer = ?'=>$id_seller,'animal_id = ?'=>$animal_id,'isactive=?'=>$isactive));
   	if (!$row) {
   		return false;
   	}
   	else { return true;
   	}
   
   }
   
   //************************************************************************************//
   //***********************                               ******************************//
   
   public function count_animals_with_same_short_id($short_id,$id_seller,$animaltype)
   {
   	$short_id = "%".$short_id;
   	$nb= "select count(*) from animal a where a.fk_id_farmer=".$id_seller." 
   	       and a.fk_animaltype='".$animaltype."' and a.animal_id like '".$short_id."' ";
   	$stmt = $this->_db->query($nb);
   	$rows= $stmt->fetchAll(Zend_Db::FETCH_NUM);
   	if($rows[0][0] == 0){return 0 ;}
   	elseif($rows[0][0]==1) {return 1;}
   	else {return -1;}
   	
   }
   
   //************************************************************************************//
   //***********************     GET FULL ANIMAL ID       ******************************//
   public function  get_animal_full_id($tag,$animal_id,$id_seller)
   {
   	$short_id="%".$tag.$animal_id;
   	$sql="select animal_id from animal a where fk_id_farmer ='".$id_seller."' and a.isactive=1 and animal_id like '".$short_id."' ";
   	$stmt = $this->_db->query($sql);
    $row = $stmt->fetch();
    $full_animal_id=$row['animal_id'];
   	//print_r($full_animal_id);break;
   	return $full_animal_id;
   }
   
   
	//===================================================
	 
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