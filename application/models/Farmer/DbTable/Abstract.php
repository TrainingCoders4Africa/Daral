<?php

/**
 * Definition class for table farmer.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Farmer_Row createRow(array $data, string $defaultSource = null)
 * @method Application_Model_Farmer_Rowset fetchAll(string|array|Zend_Db_Table_Select $where = null, string|array $order = null, int $count = null, int $offset = null)
 * @method Application_Model_Farmer_Row fetchRow(string|array|Zend_Db_Table_Select $where = null, string|array $order = null, int $offset = null)
 * @method Application_Model_Farmer_Rowset find()
 *
 */
abstract class Application_Model_Farmer_DbTable_Abstract extends Zend_Db_Table_Abstract
{
    /**
     * @var string
     */
    protected $_name = 'farmer';

    /**
     * @var array
     */
    protected $_primary = array (
  0 => 'rank_farmer',
);

    /**
     * @var array
     */
    protected $_dependentTables = array (
  0 => 'Application_Model_Animal_DbTable',
  1 => 'Application_Model_Cheptel_DbTable',
  2 => 'Application_Model_Notification_DbTable',
);

    /**
     * @var array
     */
    protected $_referenceMap = array(        
        'daral_actuel' => array(
            'columns' => 'daral_actuel',
            'refTableClass' => 'Application_Model_Daral_DbTable',
            'refColumns' => 'name'
        ),

        'categorie' => array(
            'columns' => 'categorie',
            'refTableClass' => 'Application_Model_Categorie_DbTable',
            'refColumns' => 'categorie_id'
        ),

        'daral_originel' => array(
            'columns' => 'daral_originel',
            'refTableClass' => 'Application_Model_Daral_DbTable',
            'refColumns' => 'name'
        )
    );

    /**
     * @var string
     */
    protected $_rowClass = 'Application_Model_Farmer_Row';

    /**
     * @var string
     */
    protected $_rowsetClass = 'Application_Model_Farmer_Rowset';

    /**
     * Get the table name
     *
     * @return string
     */
    public function getName()
    {
        return $this->_name;
    }
        
    /**
     * Create a row object with default values
     *
     * @return Application_Model_Farmer_Row
     */
    public function createDefaultRow()
    {
        return $this->createRow(array (
  'rank_farmer' => NULL,
  'id_farmer' => NULL,
  'categorie' => NULL,
  'national_id' => NULL,
  'address_farmer' => NULL,
  'registration_date' => NULL,
  'daral_originel' => NULL,
  'daral_actuel' => NULL,
  'firstname_farmer' => NULL,
  'lastname_farmer' => NULL,
  'isactive_farmer' => NULL,
  'birthdate_farmer' => NULL,
  'birthplace_farmer' => NULL,
  'id_localite' => NULL,
));
    }
        
    /**
     * Delete multiple Ids
     *
     * @param array $ids
     */
    public function deleteMultipleIds($ids = array())
    {
        if (empty($ids) || empty($this->_primary)) {
            return;
        }
        
        $this->delete($this->_primary[0] . ' IN (' . implode(',', $ids) . ')');
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
        
        if (isset($params['rank_farmer']) && !empty($params['rank_farmer'])) {
            $select->where('rank_farmer = ?', $params['rank_farmer']);
        }

        if (isset($params['id_farmer']) && !empty($params['id_farmer'])) {
            $select->where('id_farmer = ?', $params['id_farmer']);
        }

        if (isset($params['categorie']) && !empty($params['categorie'])) {
            $select->where('categorie = ?', $params['categorie']);
        }

        if (isset($params['national_id']) && !empty($params['national_id'])) {
            $select->where('national_id = ?', $params['national_id']);
        }

        if (isset($params['address_farmer']) && !empty($params['address_farmer'])) {
            $select->where('address_farmer = ?', $params['address_farmer']);
        }

        if (isset($params['registration_date']) && !empty($params['registration_date'])) {
            $select->where('registration_date = ?', $params['registration_date']);
        }

        if (isset($params['daral_originel']) && !empty($params['daral_originel'])) {
            $select->where('daral_originel = ?', $params['daral_originel']);
        }

        if (isset($params['daral_actuel']) && !empty($params['daral_actuel'])) {
            $select->where('daral_actuel = ?', $params['daral_actuel']);
        }

        if (isset($params['firstname_farmer']) && !empty($params['firstname_farmer'])) {
            $select->where('firstname_farmer = ?', $params['firstname_farmer']);
        }

        if (isset($params['lastname_farmer']) && !empty($params['lastname_farmer'])) {
            $select->where('lastname_farmer = ?', $params['lastname_farmer']);
        }

        if (isset($params['isactive_farmer']) && !empty($params['isactive_farmer'])) {
            $select->where('isactive_farmer = ?', $params['isactive_farmer']);
        }

        if (isset($params['birthdate_farmer']) && !empty($params['birthdate_farmer'])) {
            $select->where('birthdate_farmer = ?', $params['birthdate_farmer']);
        }

        if (isset($params['birthplace_farmer']) && !empty($params['birthplace_farmer'])) {
            $select->where('birthplace_farmer = ?', $params['birthplace_farmer']);
        }

        if (isset($params['id_localite']) && !empty($params['id_localite'])) {
            $select->where('id_localite = ?', $params['id_localite']);
        }
        
        // _kw = keywords, _sm = search mode
        if (isset($params['_kw']) && !empty($params['_kw'])) {
            $dbAdapter = $this->getAdapter();
            $searchWheres = array();
            $keywords = $params['_kw'];
            $searchMode = isset($params['_sm']) && !empty($params['_sm']) ? $params['_sm'] : 'all';
            
            if ('all' === $searchMode || 'id_farmer' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('id_farmer LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'national_id' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('national_id LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'address_farmer' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('address_farmer LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'daral_originel' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('daral_originel LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'daral_actuel' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('daral_actuel LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'firstname_farmer' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('firstname_farmer LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'lastname_farmer' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('lastname_farmer LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'birthplace_farmer' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('birthplace_farmer LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'id_localite' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('id_localite LIKE ?', "%$keywords%");
            }
                
            if (!empty($searchWheres)) {
                $select->where(implode(' OR ', $searchWheres));
            }
        }
            
        return $select;
    }

    /**
     * Used to fetch a rowset and build an associative array from it.
     *
     * The first column is used as key and the second column is used as corresponding value.
     *
     * @param string|array|Zend_Db_Table_Select $where  OPTIONAL An SQL WHERE clause or Zend_Db_Table_Select object.
     * @param string|array                      $order  OPTIONAL An SQL ORDER clause.
     * @param int                               $count  OPTIONAL An SQL LIMIT count.
     * @param int                               $offset OPTIONAL An SQL LIMIT offset.
     * @return array
     */
    public function fetchPairs($where = null, $order = null, $count = null, $offset = null)
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
            $return[$row[0]] = $row[1];
        }

        return $return;
    }

    /**
     * Fetch the first field's value of the first row.
     *
     * @param string|array|Zend_Db_Table_Select $where  OPTIONAL An SQL WHERE clause or Zend_Db_Table_Select object.
     * @param string|array                      $order  OPTIONAL An SQL ORDER clause.
     * @param int                               $offset OPTIONAL An SQL OFFSET value.
     * @return mixed value of the first row's first column or null if no rows found.
     */
    public function fetchOne($where = null, $order = null, $offset = null)
    {
        if (!($where instanceof Zend_Db_Table_Select)) {
            $select = $this->select();

            if ($where !== null) {
                $this->_where($select, $where);
            }

            if ($order !== null) {
                $this->_order($select, $order);
            }

            $select->limit(1, ((is_numeric($offset)) ? (int) $offset : null));

        } else {
            $select = $where->limit(1, $where->getPart(Zend_Db_Select::LIMIT_OFFSET));
        }

        $stmt = $this->_db->query($select);
        $rows = $stmt->fetchAll(Zend_Db::FETCH_NUM);

        if (count($rows) == 0) {
            return null;
        }

        return $rows[0][0];
    }

    /**
     * Fetch first column's values of all rows.
     *
     * @param string|array|Zend_Db_Table_Select $where  OPTIONAL An SQL WHERE clause or Zend_Db_Table_Select object.
     * @param string|array                      $order  OPTIONAL An SQL ORDER clause.
     * @param int                               $count  OPTIONAL An SQL LIMIT count.
     * @param int                               $offset OPTIONAL An SQL LIMIT offset.
     * @return array List of values.
     */
    public function fetchOnes($where = null, $order = null, $count = null, $offset = null)
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
            $return[] = $row[0];
        }

        return $return;
    }
}
