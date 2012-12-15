<?php
error_reporting(E_ALL);

/**
 * Model for table users
 *
 * @package Daral
 * @author Mansour
 * @version $Id$
 *
 */

class Application_Model_Users_DbTable_Users extends Zend_Db_Table_Abstract
{
	protected $_name = 'users';
	
	public function getDaral()
	{
		//find out who is connected
		$auth = Zend_Auth::getInstance();
		$username = $auth->getIdentity()->username;
		
		//find out the corresponding daral number
		
		$row = $this->fetchRow($this->select()->where('username=?',$username));
	    $row_arr = $row->toArray();
	    $daral= $row_arr['user_daral'];
	
	
	
		return $daral;
	}
	
	
}