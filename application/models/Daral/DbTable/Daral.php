<?php
error_reporting(E_ALL);

/**
 * Model for table daral
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Daral_DbTable_Daral extends Zend_Db_Table_Abstract
{
	protected $_name = 'daral';
	
	
	public function getLocalite($daral_actuel)
	{
	
		
		
		$row = $this->fetchRow($this->select()->where('name=?',$daral_actuel));
		$row_arr = $row->toArray();
		$localite= $row_arr['id_localite'];
		
		
		
		
		return $localite;
	}
	
	
	
}