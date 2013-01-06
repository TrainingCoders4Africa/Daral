<?php

/**
 * Controller for table region_stat_farmer
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class RegionStatFarmerController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableRegionStatFarmer = new Application_Model_RegionStatFarmer_DbTable();
        $gridSelect = $tableRegionStatFarmer->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
        $paginator = Zend_Paginator::factory($gridSelect);
        $paginator->setItemCountPerPage(20)
            ->setCurrentPageNumber($pageNumber);
            
        $this->view->assign(array(
            'paginator' => $paginator,
            'sortField' => $sortField,
            'sortOrder' => $sortOrder,
            'pageNumber' => $pageNumber,
        ));
        
        foreach ($this->_getAllParams() as $paramName => $paramValue)
        {
            // prepend 'param' to avoid error of setting private/protected members
            $this->view->assign('param' . $paramName, $paramValue);
        }
    }
    
    public function createAction()
    {
        $form = new Application_Form_EditRegionStatFarmer();
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
                    
                $tableRegionStatFarmer = new Application_Model_RegionStatFarmer_DbTable();
                $tableRegionStatFarmer->insert($values);
                    
                $this->_helper->redirector('index');
                exit;
            }
        }
        
        $this->view->form = $form;
    }
    
    public function updateAction()
    {
        $tableRegionStatFarmer = new Application_Model_RegionStatFarmer_DbTable();
        $form = new Application_Form_EditRegionStatFarmer();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableRegionStatFarmer->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('id = ?' => $id);
        
                $tableRegionStatFarmer->update($values, $where);
                    
                $this->_helper->redirector('index');
                exit;
            }
        } else {
            
            $form->populate($row->toArray());
        }
        
        $this->view->form = $form;
        $this->view->row = $row;
    }
    
    public function deleteAction()
    {
        $ids = $this->_getParam('del_id', array());
        
        if (!is_array($ids)) {
            $ids = array($ids);
        }
        
        if (!empty($ids)) {
            $tableRegionStatFarmer = new Application_Model_RegionStatFarmer_DbTable();
            $tableRegionStatFarmer->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit;
    }
}