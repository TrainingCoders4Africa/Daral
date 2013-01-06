<?php

/**
 * Definition class for table notification.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 */
class Application_Model_Notification_DbTable extends Application_Model_Notification_DbTable_Abstract
{
    // write your custom functions here
//**************************************************************************************//
	//************* FUNCTION FOR SETTING NOTIFICATION INACTIVE ***********************************//
	
	public function archiveNotification($id_notification) //a notification is not delete, it is just "archived"
	{
		$data = array(
				'disabled' => '1'
		);
		$this->update($data, 'id = '.$id_notification[0]);
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

        if (isset($params['id_farmer']) && !empty($params['id_farmer'])) {
            $select->where('id_farmer = ?', $params['id_farmer']);
        }

        if (isset($params['id_localite']) && !empty($params['id_localite'])) {
            $select->where('id_localite = ?', $params['id_localite']);
        }

        if (isset($params['date']) && !empty($params['date'])) {
            $select->where('date = ?', $params['date']);
        }

        if (isset($params['type']) && !empty($params['type'])) {
            $select->where('type = ?', $params['type']);
        }

        if (isset($params['id_user']) && !empty($params['id_user'])) {
            $select->where('id_user = ?', $params['id_user']);
        }
        
        if (isset($params['disabled']) && !empty($params['disabled'])) {
            $select->where('disabled = ?', $params['disabled']);
        }
        
        //on remonte les notifications dont le champ archived = 0
        $select->where('disabled = ?', 0);
        
        
        // _kw = keywords, _sm = search mode
        if (isset($params['_kw']) && !empty($params['_kw'])) {
            $dbAdapter = $this->getAdapter();
            $searchWheres = array();
            $keywords = $params['_kw'];
            $searchMode = isset($params['_sm']) && !empty($params['_sm']) ? $params['_sm'] : 'all';
            
            if ('all' === $searchMode || 'id_farmer' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('id_farmer LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'id_localite' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('id_localite LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'type' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('type LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'id_user' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('id_user LIKE ?', "%$keywords%");
            }
                
            if (!empty($searchWheres)) {
                $select->where(implode(' OR ', $searchWheres));
            }
        }
            
        return $select;
    }
}