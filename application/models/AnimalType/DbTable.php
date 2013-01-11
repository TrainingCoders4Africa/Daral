<?php

/**
 * Definition class for table animaltype.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Animaltype_DbTable extends Application_Model_Animaltype_DbTable_Abstract
{
    // write your custom functions here
	public function fetchAnimal($where = null, $order = null, $count = null, $offset = null)
	{
		
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
			$return[$row[1]] = $row[1];
		}
	
		return $return;
	}
}