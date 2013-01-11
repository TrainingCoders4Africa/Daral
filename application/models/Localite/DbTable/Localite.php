<?php
error_reporting(E_ALL);

/**
 * Model for table localite
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Localite_DbTable_Localite extends Zend_Db_Table_Abstract
{
	protected $_name = 'localite';


	public function getDepartement($localite)
	{



		$row = $this->fetchRow($this->select()->where('name=?',$localite));
		$row_arr = $row->toArray();
		$departement= $row_arr['departement'];




		return $departement;
	}



}