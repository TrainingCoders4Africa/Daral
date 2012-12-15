<?php

error_reporting(E_ALL);
/**
 * Definition class for table farmer.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Farmer_DbTable extends Application_Model_Farmer_DbTable_Abstract
{
	protected $_name = 'farmer';
	
	
	//*********************************************************************//
	//*************** GET ALL DATA ON FARMER THROUGH ID *******************//
	public function getFarmer($id_farmer)
	
	{
		$id_farmer = (int)$id_farmer;
		$IsActive_farmer = '1';
			
		$row = $this->fetchRow(array('id_farmer = '.$id_farmer,'IsActive_farmer = '.$IsActive_farmer));
		if (!$row) {
			throw new Exception("Could not find row $id_farmer");
		}
		return $row->toArray();
	}
	
	
	
	
	
	//***************************************************************************//
	//***************** ADD FARMER TO DATABASE **********************************//
	public function addFarmer($id_farmer, $daral_number,$firstname_farmer,$lastname_farmer,
			$phone_farmer,$IsActive_farmer,$birthdate_farmer,$birthplace_farmer,$id_localite)
	{
		$data = array(
				'id_farmer' => $id_farmer,
				'daral_number' => $daral_number,
				'firstname_farmer'=>$firstname_farmer,
				'lastname_farmer'=>$lastname_farmer,
				'phone_farmer'=>$phone_farmer,
				'IsActive_farmer'=>$IsActive_farmer,
				'birthdate_farmer'=>$birthdate_farmer,
				'birthplace_farmer'=>$birthplace_farmer,
				'id_localite'=>$id_localite,
		);
		$this->insert($data);
	}
	
	
	
	
	
	//****************************************************************************************//
	//**************************** UPDATE FARMER INFO AND SAVE TO DATABASE ******************//
	public function updateFarmer ($id_farmer, $daral_number,$firstname_farmer,$lastname_farmer,
			$phone_farmer,$IsActive_farmer,$birthdate_farmer,$birthplace_farmer)
	{
		$data = array(
				'daral_number' => $daral_number,
				'firstname_farmer'=>$firstname_farmer,
				'lastname_farmer'=>$lastname_farmer,
				'phone_farmer'=>$phone_farmer,
				'IsActive_farmer'=>$IsActive_farmer,
				'birthdate_farmer'=>$birthdate_farmer,
				'birthplace_farmer'=>$birthplace_farmer,
				'id_localite'=>$id_localite,
		);
		$this->update($data, 'id_farmer = '. (int)$id_farmer);
	}
	
	
	
	//**************************************************************************************//
	//******************* DELETE **************************//
	public function deleteFarmer($id_farmer) //not used so far
	{
		$this->delete('id_farmer =' . (int)$id_farmer);
	}
	
	
	//**************************************************************************************//
	//************* FUNCTION FOR SETTING FARMER INACTIVE ***********************************//
	public function archiveFarmer($id_farmer) //a farmer is not delete, it is just "archived"
	{
		$data = array(
				'IsActive_farmer' => '0'
		);
		$this->update($data, 'id_farmer = '. (int)$id_farmer);
	}
	
	
	//************************************************************************************//
	//***************** FUNCTION TO GENERATE FARMERS ID NUMBER **************************//
	public function generateId($daral_number,$rank)
	{
	
		return $daral_number."D".$rank;
	
	}
	
	
	//**********************************************************************************************************//
	//********* FINDS THE RANK THAT WILL BE ATTRIBUTED TO A FARMER THROUGH A COUNT OF THE ROWS IN THE TABLE ****//
	
	
	public function getFarmerRank($daral_actuel) //!!!!!!!!!!!!!    ONLY WORKS LOCALLY WITH A MYSQL DATABASE !!!!!!!!
	{
		$db = new Zend_Db_Adapter_Pdo_Mysql(array(
				'host'     => '127.0.0.1',
				'username' => 'root',
				'password' => 'root',//for the mac
				'dbname'   => 'daral'));
		$query = $db->select()->from('farmer','count(*)')->where("daral_actuel=".$daral_actuel);
		$numRows = $db->fetchOne($query);
		$rank_int= $numRows+1;//the rank of the farmer being registered is the total number of rows plus one
		return $rank_int; 
	}
	
	//**********************************************************************************************************//
	//*************************** FINDS THE "localite" ASSOCIATED WITH A FARMER *********************************//
	
	
	public function getLocalite($daral_number) //!!!!!!!!!!!!!    ONLY WORKS LOCALLY WITH A MYSQL DATABASE !!!!!!!!
	{
		$db = new Zend_Db_Adapter_Pdo_Mysql(array(
				'host'     => '127.0.0.1',
				'username' => 'root',
				'password' => 'root',//for the mac
				'dbname'   => 'daral'));
		$query = $db->select()->from('daral','id_localite')->where("name=".$daral_number);
		$id_localite = $db->fetchOne($query);
		return $id_localite;
	}
	
	//**********************************************************************************************************//
	//*************************** FINDS THE "daral_number" ASSOCIATED WITH the current user *********************************//
	
	
	public function getDaralNumber() //!!!!!!!!!!!!!    ONLY WORKS LOCALLY WITH A MYSQL DATABASE !!!!!!!!
	{
		$db = new Zend_Db_Adapter_Pdo_Mysql(array(
				'host'     => '127.0.0.1',
				'username' => 'root',
				'password' => 'root',//for the mac
				'dbname'   => 'daral'));
		$query = $db->select()->from('users','id_localite')->where("username=".$daral_number);
		$id_localite = $db->fetchOne($query);
		return $id_localite;
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
	
		 
		if($this->is_png($filename))
		{
		 $source=imagecreatefrompng($filename);
		 $info="used png func";
		}
		else
		{
		 $source=imagecreatefromjpeg($filename);
		 $info="used jpg func";
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

		if($this->is_png($filename))
		{ imagepng($destination,$generated_file_path);}
		else 
		{imagejpeg($destination,$generated_file_path);}
		return $generated_file_path;
	}
	
}