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
	
	/**
	 * Get Db_Select for pagination by params sent from controller
	 *
	 * @param array $params
	 * @param string $sortField
	 * @param string $sortOrder
	 * @return Zend_Db_Select
	 */
	public function getDbSelectByParams($params = array(), $sortField = '', $sortOrder = '')
	{
		$select = $this->select(true);
	
		if ($sortField != '' && $sortOrder != '') {
			if ('desc' === strtolower($sortOrder)) {
				$sortOrder = 'DESC';
			} else {
				$sortOrder = 'ASC';
			}
			$select->order("$sortField $sortOrder");
		}
	
		if (isset($params['id']) && !empty($params['id'])) {
			$select->where('id = ?', $params['id']);
		}
	
		if (isset($params['name']) && !empty($params['name'])) {
			$select->where('name = ?', $params['name']);
		}
	
		if (isset($params['animal_tag']) && !empty($params['animal_tag'])) {
			$select->where('animal_tag = ?', $params['animal_tag']);
		}
		
		// _kw = keywords, _sm = search mode
		if (isset($params['_kw']) && !empty($params['_kw'])) {
			$dbAdapter = $this->getAdapter();
			$searchWheres = array();
			$keywords = $params['_kw'];
			$searchMode = isset($params['_sm']) && !empty($params['_sm']) ? $params['_sm'] : 'all';
	
			if ('all' === $searchMode || 'name' === $searchMode) {
				$searchWheres[] = $dbAdapter->quoteInto('name LIKE ?', "%$keywords%");
			}
	
			if ('all' === $searchMode || 'animal_tag' === $searchMode) {
				$searchWheres[] = $dbAdapter->quoteInto('animal_tag LIKE ?', "%$keywords%");
			}
			
			if (!empty($searchWheres)) {
				$select->where(implode(' OR ', $searchWheres));
			}
		}
	
		return $select;
	}
}