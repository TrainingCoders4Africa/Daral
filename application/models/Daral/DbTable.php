<?php

/**
 * Definition class for table daral.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Daral_DbTable extends Application_Model_Daral_DbTable_Abstract
{    
	//write custom functions here
	public function getDashStats()
	{
		$return = array();
	
	
	
		$nbFarmer  = "select count(*) from farmer where isactive_farmer = 1";
		$nbCheptel = "select count(*) from animal";
		$nbNotific = "select count(*) from notification";
		$nbNotifVol="select count(*) from notification n,typenotification t where n.type=t.id and t.libelle like '%vol%'";
		$LastNotifVol="select n.description,n.id_localite from notification n order by n.id desc limit 1";
		
		
		$stmt0 = $this->_db->query($nbFarmer);
		$rows0 = $stmt0->fetchAll(Zend_Db::FETCH_NUM);
		if (count($rows0) == 0) {
			return 0;
		}
		foreach ($rows0 as $row)
		{
			$return[0] = $row[0];
			
		}
	
		$stmt1 = $this->_db->query($nbCheptel);
		$rows1 = $stmt1->fetchAll(Zend_Db::FETCH_NUM);
		if (count($rows1) == 0) {
			return 0;
		}
		foreach ($rows1 as $row)
		{
			$return[1] = $row[0];
		}
		
		$stmt2 = $this->_db->query($nbNotific);
		$rows2 = $stmt2->fetchAll(Zend_Db::FETCH_NUM);
		if (count($rows2) == 0) {
			return 0;
		}
		foreach ($rows2 as $row)
		{
			$return[2] = $row[0];
		}
		
		$stmt3 = $this->_db->query($nbNotifVol);
		$rows3 = $stmt3->fetchAll(Zend_Db::FETCH_NUM);
		if (count($rows3) == 0) {
			return 0;
		}
		foreach ($rows3 as $row)
		{
			$return[3] = $row[0];
		}
	
		$stmt4 = $this->_db->query($LastNotifVol);
		$rows4 = $stmt4->fetchAll(Zend_Db::FETCH_NUM);
		if (count($rows4) == 0) {
			return 0;
		}
		foreach ($rows4 as $row)
		{
			$return[4] = $row[0];
			$return[5] = $row[1];
		}
	
		return $return; 
	}
	
	
	
	public function getLastFarmers()
	{
	  $return=array();
	  $lastFarmers="select * from farmer order by rank_farmer desc limit 5 ";
	  
	  $stmt = $this->_db->query($lastFarmers);
	  $rows = $stmt->fetchAll(Zend_Db::FETCH_NUM);
	  if (count($rows) == 0) {
	  	return array();
	  }
	  
	  return $rows;
	    
	}
	
	public function getLastNotifications()
	{
		$return=array();
		$lastNotifications="select * from notification order by id desc limit 3 ";
		 
		$stmt = $this->_db->query($lastNotifications);
		$rows = $stmt->fetchAll(Zend_Db::FETCH_NUM);
		if (count($rows) == 0) {
			return array();
		}
		 
		return $rows;
		 
	}
	
	public function getLastDarals()
	{
		$return=array();
		$lastDarals="select * from daral order by id desc limit 3 ";
			
		$stmt = $this->_db->query($lastDarals);
		$rows = $stmt->fetchAll(Zend_Db::FETCH_NUM);
		if (count($rows) == 0) {
			return array();
		}
			
		return $rows;
			
	}
	
	
}
	
