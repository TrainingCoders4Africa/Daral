<?php
error_reporting(E_ALL);

/**
 * Model for table farmer
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Farmer_DbTable_Farmer extends Zend_Db_Table_Abstract
{
	protected $_name = 'farmer';
	
	
	
	//**************************************************************************************//
	//************* FUNCTION FOR ADDING FARMER INTO DATABASE *******************************//
	
	public function addFarmer($id_farmer,$categorie,$national_id,$address_farmer,$phone_farmer,$registration_date,$daral_originel,$daral_actuel,
			$firstname_farmer,$lastname_farmer,$isactive_farmer,$birthdate_farmer,$birthplace_farmer,$id_localite,$departement,$region)
	{
		$data = array(
				'id_farmer' => $id_farmer,
				'categorie'=> $categorie,
				'national_id'=>$national_id,
				'address_farmer'=>$address_farmer,
				'phone_farmer'=>$phone_farmer,
				'registration_date'=>$registration_date,
				'daral_originel'=>$daral_originel,
				'daral_actuel'=>$daral_actuel,
				'firstname_farmer'=>$firstname_farmer,
				'lastname_farmer'=>$lastname_farmer,
				'isactive_farmer'=>$isactive_farmer,
				'birthdate_farmer'=>$birthdate_farmer,
				'birthplace_farmer'=>$birthplace_farmer,
				'id_localite'=>$id_localite,
				'departement'=>$departement,
				'region'=>$region,
		);
		$this->insert($data);
	}
	
	//****************************************************************************************//
	//**************************** UPDATE FARMER INFO AND SAVE TO DATABASE *******************//
	
	public function updateFarmer($id_farmer,$firstname_farmer,$lastname_farmer,$phone_farmer,$birthdate_farmer,$birthplace_farmer,
    					             $address_farmer,$categorie,$national_id,$daral_actuel,$id_localite,$departement,$region)
	{
		 $data = array(
				
		 		'categorie'=>$categorie,
		 		'national_id'=>$national_id,
		 		'address_farmer'=>$address_farmer,
				'firstname_farmer'=>$firstname_farmer,
				'lastname_farmer'=>$lastname_farmer,
				'phone_farmer'=>$phone_farmer,
				'birthdate_farmer'=>$birthdate_farmer,
				'birthplace_farmer'=>$birthplace_farmer,
				'daral_actuel'=>$daral_actuel,
				'id_localite'=>$id_localite,
		 		'departement'=>$departement,
		 		'region'=>$region,
		); 
		
		$this->update($data, 'id_farmer = '.$id_farmer); 
	}
	
	
	
	//**************************************************************************************//
	//************* FUNCTION FOR SETTING FARMER INACTIVE ***********************************//
	
	public function archiveFarmer($id_farmer) //a farmer is not delete, it is just "archived"
	{
		$data = array(
				'isactive_farmer' => '0'
		);
		$this->update($data, 'id_farmer = '.$id_farmer);
	}
	
	
	//*********************************************************************//
	//*************** GETS ALL DATA ON FARMER THROUGH ID *******************//
	
	public function getFarmer($id_farmer)
	
	{
	
		$IsActive_farmer = '1';
			
		$row = $this->fetchRow(array('id_farmer = '.$id_farmer,'isactive_farmer = '.$IsActive_farmer));
		if (!$row) {
			throw new Exception("Could not find row $id_farmer");
			
		}
		//return $row->toArray();
		$data=$row->toArray();
		$new_birthdate_format=implode('/',array_reverse(explode('-',$data['birthdate_farmer'])));
		$data['birthdate_farmer']=$new_birthdate_format;
		
		$new_registration_date_format=implode('/',array_reverse(explode('-',$data['registration_date'])));
		$data['registration_date']=$new_registration_date_format;
		//print_r($data);break;
		return $data;
		
		
		
	}
	
	//*********************************************************************//
	//*************** GETS FARMER CATEGORIE THROUGH ID *******************//
	
	public function getCategorie($id_farmer)
	
	{
	
		$IsActive_farmer = '1';
			
		$row = $this->fetchRow(array('id_farmer =?'=>$id_farmer,'isactive_farmer = ?'=>$IsActive_farmer));
		if (!$row) {
			throw new Exception("Could not find row $id_farmer");
		}
		$row_arr= $row->toArray();
		return $row_arr['categorie'];
	
	}
	
	
	
	//*********************************************************************//
	//********************* Checks if farmer is active  *******************//
	
	public function exist_farmer($id_farmer)
	
	{
	
		$IsActive_farmer = '1';
			
		$row = $this->fetchRow(array('id_farmer = '.$id_farmer,'isactive_farmer = '.$IsActive_farmer));
		if (!$row) {
			return false;
		}
		else { return true;}
	
	}
	
	
	
	//*************************************************************************************************//
	//*************** DETERMINES THE RANK OF A FARMER WITHIN HIS REGISTRATION DARAL *******************//
	
	
	public function getFarmerRank($daral_originel)
	{
		
		
		$select= $this->select()->from($this)->where("daral_originel=?",$daral_originel);
		$rows= $this->getAdapter()->query($select)->rowCount();
		$numRows = (int) $rows;
		$rank_int= $numRows+1;//the rank of the farmer being registered is the total number of rows plus one
		$rank_string;
		$rank_string = (string) $rank_int;
		
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
	
	
	
	//*************************************************************************************************//
	//*************************** DETERMINES THE CLIENT OS  *******************************************//
	public function getOS()
	{
		
		if(stripos($_SERVER['HTTP_USER_AGENT'],'win')==true) return "WINDOWS";
		else return "UNIX";
	}
	
	
	//*********************************************************************************//
	//********** DETERMINES IF A PICTURE IS IN PNG OR JPEG FORMAT *********************//
	
	public 	function is_png($filename)
	{
	
		$file_ext = substr(strrchr($filename,'.'),1,5);
	
		if ($file_ext == 'png') return true;
		else                    return false;
	
	}
	
	
	
	//****************************************************************************************************************//
	//*********** CREATES THE IMAGE OF THE "DARAL ID CARD" USING THE FARMER'S PICTURE AND INFO ***********************//
	
	public function createCard($filename,$lastname_farmer,$firstname_farmer,$id_farmer)
	{
		$Op_Syst=$this->getOS();
		
		  if($Op_Syst=='WINDOWS')
		  {
		  	if($this->is_png($filename))
		  	{
		  		$source=imagecreatefrompng($filename);
		  	
		  	}
		  	else
		  	{
		  		$source=imagecreatefromjpeg($filename);
		  	
		  	}
		  	
		  	
		  	
		  	$destination=imagecreatefrompng(IMAGE_PATH."/daral_id.png");
		  	$source_width=imagesx($source);
		  	$source_height=imagesy($source);
		  	
		  	$nom=$lastname_farmer;
		  	$prenom=$firstname_farmer;
		  	$id=$id_farmer;
		  	
		  	
		  	$noir = imagecolorallocate($destination, 0, 0, 0);
		  	$path=IMAGE_PATH."\\".$id.".png";
		  }
		 else
		 {
				if($this->is_png($filename))
					{
						$source=imagecreatefrompng($filename);
						
					}
				else
					{
						$source=imagecreatefromjpeg($filename);
						
					}
				
					$namePhoto = substr(strrchr($filename,"/"),1,20);
				
					$destination=imagecreatefrompng(IMAGE_PATH."/daral_id.png");
					$source_width=imagesx($source);
					$source_height=imagesy($source);
				
					$nom=$lastname_farmer;
					$prenom=$firstname_farmer;
					$id=$id_farmer;
					 
				
					$noir = imagecolorallocate($destination, 0, 0, 0);
				    $path=IMAGE_PATH."/".$id.".png";
				}
		imagestring($destination,3,137,67,"NOM: ".$nom,$noir);
		imagestring($destination,3,137,87,"PRENOM: ".$prenom,$noir);
		imagestring($destination,3,137,107,"IDENTIFIANT: ".$id,$noir);
		//imagestring($destination,3,137,127,"src: ".$namePhoto,$noir); // for debugging
	
		imagecopymerge($destination, $source,
				18,14, 0, 0, $source_width, $source_height, 100);
	
		imagepng($destination,$path);
	
		return $path;
	}
	
	//*****************************************************************************************//
	//********************** RESIZE PICTURE TO 90X120 PIXELS **********************************//
	
	public function resize_picture($filename)
	{
		
		$Op_Syst=$this->getOS();
		
			if($Op_Syst=='WINDOWS')
			{
				if($this->is_png($filename))
				{
					$source=imagecreatefrompng($filename);
				}
				else
				{
					$source=imagecreatefromjpeg($filename);
				}
				$destination = imagecreatetruecolor(90, 120); // an empty 90x120 image is created
					
				$width_source = imagesx($source);
				$heigth_source = imagesy($source);
				$width_destination = imagesx($destination);
				$heigth_destination = imagesy($destination);
					
				imagecopyresampled($destination, $source, 0, 0, 0, 0, $width_destination, $heigth_destination, $width_source, $heigth_source);
					
					
				$namePhoto = substr(strrchr($filename,"\\"),1,20);
				$generated_file_path=IMAGE_PATH."\mini_".$namePhoto;
				
			}
			
			else 
			{
				if($this->is_png($filename))
				{
					$source=imagecreatefrompng($filename);
				}
				else
				{
					$source=imagecreatefromjpeg($filename);
				}
				$destination = imagecreatetruecolor(90, 120); // an empty 90x120 image is created
			
				$width_source = imagesx($source);
				$heigth_source = imagesy($source);
				$width_destination = imagesx($destination);
				$heigth_destination = imagesy($destination);
			
				imagecopyresampled($destination, $source, 0, 0, 0, 0, $width_destination, $heigth_destination, $width_source, $heigth_source);
			
			
				$namePhoto = substr(strrchr($filename,"/"),1,20);
				$generated_file_path=IMAGE_PATH."/mini_".$namePhoto;
			}
				if($this->is_png($filename))
				{
					imagepng($destination,$generated_file_path);
				}
				else
				{imagejpeg($destination,$generated_file_path);
				}
				return $generated_file_path;
	}
	
	
}