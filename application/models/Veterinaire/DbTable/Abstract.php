<?php

/**
 * Definition class for table veterinaire.
 *
 * Do NOT write anything in this file, it will be removed when you regenerated.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 * @method Application_Model_Veterinaire_Row createRow(array $data, string $defaultSource = null)
 * @method Application_Model_Veterinaire_Rowset fetchAll(string|array|Zend_Db_Table_Select $where = null, string|array $order = null, int $count = null, int $offset = null)
 * @method Application_Model_Veterinaire_Row fetchRow(string|array|Zend_Db_Table_Select $where = null, string|array $order = null, int $offset = null)
 * @method Application_Model_Veterinaire_Rowset find()
 *
 */
abstract class Application_Model_Veterinaire_DbTable_Abstract extends Zend_Db_Table_Abstract
{
    /**
     * @var string
     */
    protected $_name = 'veterinaire';

    /**
     * @var array
     */
    protected $_primary = array (
  0 => 'rank_veterinaire',
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

    );

    /**
     * @var string
     */
    protected $_rowClass = 'Application_Model_Veterinaire_Row';

    /**
     * @var string
     */
    protected $_rowsetClass = 'Application_Model_Veterinaire_Rowset';

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
     * @return Application_Model_Veterinaire_Row
     */
    public function createDefaultRow()
    {
        return $this->createRow(array (
  'rank_veterinaire' => NULL,
  'id_veterinaire' => NULL,
  'adresse_veterinaire' => NULL,
  'localite_veterinaire' => NULL,
  'firstname_veterinaire' => NULL,
  'lastname_veterinaire' => NULL,
  'IsActive_veterinaire' => NULL,
  'email_veterinaire' => NULL,
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
        
        if (isset($params['rank_veterinaire']) && !empty($params['rank_veterinaire'])) {
            $select->where('rank_veterinaire = ?', $params['rank_veterinaire']);
        }

        if (isset($params['id_veterinaire']) && !empty($params['id_veterinaire'])) {
            $select->where('id_veterinaire = ?', $params['id_veterinaire']);
        }

        if (isset($params['adresse_veterinaire']) && !empty($params['adresse_veterinaire'])) {
            $select->where('adresse_veterinaire = ?', $params['adresse_veterinaire']);
        }

        if (isset($params['localite_veterinaire']) && !empty($params['localite_veterinaire'])) {
            $select->where('localite_veterinaire = ?', $params['localite_veterinaire']);
        }

        if (isset($params['firstname_veterinaire']) && !empty($params['firstname_veterinaire'])) {
            $select->where('firstname_veterinaire = ?', $params['firstname_veterinaire']);
        }

        if (isset($params['lastname_veterinaire']) && !empty($params['lastname_veterinaire'])) {
            $select->where('lastname_veterinaire = ?', $params['lastname_veterinaire']);
        }

        if (isset($params['IsActive_veterinaire']) && !empty($params['IsActive_veterinaire'])) {
            $select->where('IsActive_veterinaire = ?', $params['IsActive_veterinaire']);
        }

        if (isset($params['email_veterinaire']) && !empty($params['email_veterinaire'])) {
            $select->where('email_veterinaire = ?', $params['email_veterinaire']);
        }
        
        // _kw = keywords, _sm = search mode
        if (isset($params['_kw']) && !empty($params['_kw'])) {
            $dbAdapter = $this->getAdapter();
            $searchWheres = array();
            $keywords = $params['_kw'];
            $searchMode = isset($params['_sm']) && !empty($params['_sm']) ? $params['_sm'] : 'all';
            
            if ('all' === $searchMode || 'id_veterinaire' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('id_veterinaire LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'adresse_veterinaire' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('adresse_veterinaire LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'firstname_veterinaire' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('firstname_veterinaire LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'lastname_veterinaire' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('lastname_veterinaire LIKE ?', "%$keywords%");
            }

            if ('all' === $searchMode || 'email_veterinaire' === $searchMode) {
                $searchWheres[] = $dbAdapter->quoteInto('email_veterinaire LIKE ?', "%$keywords%");
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
