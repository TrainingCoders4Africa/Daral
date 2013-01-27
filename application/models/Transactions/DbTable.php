<?php

class Application_Model_Transactions_DbTable extends Zend_Db_Table_Abstract
{

    protected $_name = 'transactions';
    
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
    	 
    	if (isset($params['id_seller']) && !empty($params['id_seller'])) {
    		$select->where('id_seller = ?', $params['id_seller']);
    	}
    	 
    	if (isset($params['id_buyer']) && !empty($params['id_buyer'])) {
    		$select->where('id_buyer = ?', $params['id_buyer']);
    	}
    	 
    	if (isset($params['animaltype']) && !empty($params['animaltype'])) {
    		$select->where('animaltype = ?', $params['animaltype']);
    	}
    
    	if (isset($params['animal_id']) && !empty($params['animal_id'])) {
    		$select->where('animal_id = ?', $params['animal_id']);
    	}
    	 
    	// _kw = keywords, _sm = search mode
    	if (isset($params['_kw']) && !empty($params['_kw'])) {
    		$dbAdapter = $this->getAdapter();
    		$searchWheres = array();
    		$keywords = $params['_kw'];
    		$searchMode = isset($params['_sm']) && !empty($params['_sm']) ? $params['_sm'] : 'all';
    		 
    		if ('all' === $searchMode || 'animal_id' === $searchMode) {
    			$searchWheres[] = $dbAdapter->quoteInto('animal_id LIKE ?', "%$keywords%");
    		}
    		 
    		
    		 
    		if (!empty($searchWheres)) {
    			$select->where(implode(' OR ', $searchWheres));
    		}
    	}
    	 
    	return $select;
    }
	
	
}


