<?php

/**
 * Definition class for table users.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Users_DbTable extends Application_Model_Users_DbTable_Abstract
{
    public function isAdmin() {
		//find out who is connected
		$auth = Zend_Auth::getInstance();
		$username = $auth->getIdentity()->username;
		
		//find out the corresponding role user
		
		$row = $this->fetchRow($this->select()->where('username=?',$username));
	    $row_arr = $row->toArray();
	    $role= $row_arr['role'];
	    if (stristr($role, 'admin') === 'admin')
	    {
	    	return TRUE;
	    }	
	
		return FALSE;
    }
    
    public function getUserConnected()
    {
    	//find out who is connected
    	$auth = Zend_Auth::getInstance();
    	$username = $auth->getIdentity()->username;
    
    	//find out the corresponding daral number
    
    	$row = $this->fetchRow($this->select()->where('username=?',$username));
    	$row_arr = $row->toArray();
    	$daral= $row_arr['id'];    
    	return $daral;
    }
    
}