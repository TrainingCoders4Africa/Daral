<?php

/**
 * Definition class for table national.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_National_DbTable extends Application_Model_National_DbTable_Abstract
{
    // write your custom functions here
	public function getNationalStats()
	{
		$return = array();
	
	
	
		$nbFarmer  = "select count(*) from farmer where isactive_farmer = 1";
		$nbCheptel = "select count(*) from animal where isactive = 1";
		$nbNotific = "select count(*) from notification";
		$nbNotifVol="select count(*) from notification n,typenotification t where n.type=t.id and t.libelle like '%vol%'";
		//$LastNotifVol="select n.description,n.id_localite from notification n order by n.id desc limit 1";
	
	
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
	  /*
		$stmt4 = $this->_db->query($LastNotifVol);
		$rows4 = $stmt4->fetchAll(Zend_Db::FETCH_NUM);
		if (count($rows4) == 0) {
			return 0;
		}
		foreach ($rows4 as $row)
		{
			$return[4] = $row[0];
			$return[5] = $row[1];
		}*/
	
		return $return;
	}
	
	public function get_national_animaltype_total($animal_type)
	{
	
		$sql="select count(*) from animal a where a.isactive = 1 and a.fk_animaltype='".$animal_type."' ";	
		$stmt = $this->_db->query($sql);
		$rows= $stmt->fetchAll(Zend_Db::FETCH_NUM);
		return $rows[0][0];
	
	}
	
}