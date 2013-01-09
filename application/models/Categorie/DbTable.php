<?php

/**
 * Definition class for table categorie.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Categorie_DbTable extends Application_Model_Categorie_DbTable_Abstract
{
    // write your custom functions here
	protected $_name = 'categorie';
	
	
	//*********** GIVE MORE INFOS ABOUT CATEGORIES ********
	
	public function displayCategories($where = null, $order = null, $count = null, $offset = null){
		$return = array();
		
		if (!($where instanceof Zend_Db_Table_Select)) {
			$select = $this->select();
		
			if ($where !== null) {
				$this->_where($select, $where);
			}
		
			if ($order !== null) {
				$this->_order($select, $order);
			}
		
			if ($count !== null || $offset !== null) {
				$select->limit($count, $offset);
			}
		
		} else {
			$select = $where;
		}
		
		$stmt = $this->_db->query($select);
		$rows = $stmt->fetchAll(Zend_Db::FETCH_NUM);
		
		if (count($rows) == 0) {
			return array();
		}
		
		foreach ($rows as $row)
		{
			$return[$row[0]] = "Categorie ".$row[1]." : 0 a ".$row[2]." betes";
		}
		
		return $return;
		
		
	}
}