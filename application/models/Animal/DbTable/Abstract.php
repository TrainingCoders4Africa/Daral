<?php

/**
 * Definition class for table animal.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Animal_Row createRow(array $data, string $defaultSource = null)
 * @method Application_Model_Animal_Rowset fetchAll(string|array|Zend_Db_Table_Select $where = null, string|array $order = null, int $count = null, int $offset = null)
 * @method Application_Model_Animal_Row fetchRow(string|array|Zend_Db_Table_Select $where = null, string|array $order = null, int $offset = null)
 * @method Application_Model_Animal_Rowset find()
 *
 */
abstract class Application_Model_Animal_DbTable_Abstract extends Zend_Db_Table_Abstract
{
    /**
     * @var string
     */
    protected $_name = 'animal';

    /**
     * @var array
     */
    protected $_primary = array (
  0 => 'id',
);

    /**
     * @var array
     */
    protected $_dependentTables = array (
);

    /**
     * @var array
     */
    protected $_referenceMap = array(        
        'fk_animal_type' => array(
            'columns' => 'fk_animal_type',
            'refTableClass' => 'Application_Model_AnimalType_DbTable',
            'refColumns' => 'name'
        ),

        'fk_id_farmer' => array(
            'columns' => 'fk_id_farmer',
            'refTableClass' => 'Application_Model_Farmer_DbTable',
            'refColumns' => 'id_farmer'
        )
    );

    /**
     * @var string
     */
    protected $_rowClass = 'Application_Model_Animal_Row';

    /**
     * @var string
     */
    protected $_rowsetClass = 'Application_Model_Animal_Rowset';

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
     * @return Application_Model_Animal_Row
     */
    public function createDefaultRow()
    {
        return $this->createRow(array (
  'id' => NULL,
  'fk_id_farmer' => NULL,
  'fk_animal_type' => NULL,
  'photo_left' => NULL,
  'photo_right' => NULL,
  'photo_front' => NULL,
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
        
        if (isset($params['id']) && !empty($params['id'])) {
            $select->where('id = ?', $params['id']);
        }

        if (isset($params['fk_id_farmer']) && !empty($params['fk_id_farmer'])) {
            $select->where('fk_id_farmer = ?', $params['fk_id_farmer']);
        }

        if (isset($params['fk_animal_type']) && !empty($params['fk_animal_type'])) {
            $select->where('fk_animal_type = ?', $params['fk_animal_type']);
        }

        if (isset($params['photo_left']) && !empty($params['photo_left'])) {
            $select->where('photo_left = ?', $params['photo_left']);
        }

        if (isset($params['photo_right']) && !empty($params['photo_right'])) {
            $select->where('photo_right = ?', $params['photo_right']);
        }

        if (isset($params['photo_front']) && !empty($params['photo_front'])) {
            $select->where('photo_front = ?', $params['photo_front']);
        }
        
        // _kw = keywords, _sm = search mode
        if (isset($params['_kw']) && !empty($params['_kw'])) {
            $dbAdapter = $this->getAdapter();
            $searchWheres = array();
            $keywords = $params['_kw'];
            $searchMode = isset($params['_sm']) && !empty($params['_sm']) ? $params['_sm'] : 'all';
            
            if ('all' === $searchMode || 'fk_id_farmer' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('fk_id_farmer LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'fk_animal_type' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('fk_animal_type LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'photo_left' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('photo_left LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'photo_right' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('photo_right LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'photo_front' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('photo_front LIKE ?', "%$keywords%");
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
