<?php

class Application_Model_DbTable_Connection extends Zend_Db_Table_Abstract
{

    protected $_name = 'connexion';
	
	public function addConnection($user,$ip)
	{
		$data = array(
				'user' => $user,
				'ip'=>$ip,
		);
		$this->insert($data);
	}
	
	public function deleteConnection($user) 
	{
		$this->delete('user ='.$user);
	}
}

