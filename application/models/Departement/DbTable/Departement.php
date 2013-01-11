<?php
error_reporting(E_ALL);

/**
 * Model for table departement
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Departement_DbTable_Departement extends Zend_Db_Table_Abstract
{
	protected $_name = 'departement';


	public function getRegion($departement)
	{



		$row = $this->fetchRow($this->select()->where('name=?',$departement));
		$row_arr = $row->toArray();
		$region= $row_arr['region'];




		return $region;
	}



}