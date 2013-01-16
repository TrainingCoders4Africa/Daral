<?php

/**
 * Controller for table region
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class RegionController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableRegion = new Application_Model_Region_DbTable();
        $gridSelect = $tableRegion->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
    
    
    
    public function chooseAction(){ //displays list of regions in order to choose from to get statistics
    	$this->getFrontController()->getRequest()->setParams($_GET);
    
    	// zsf = zodeken sort field, zso = zodeken sort order
    	$sortField = $this->_getParam('_sf', '');
    	$sortOrder = $this->_getParam('_so', '');
    	$pageNumber = $this->_getParam('page', 1);
    
    
    	$tableRegion = new Application_Model_Region_DbTable();
    	$gridSelect = $tableRegion->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
    
    
    public function displaystatAction(){
    	$latitude='37.7831';
    	$longitude='-122.4039';
    	//$this->_helper->layout->setLayout('layout2');
    	$region= $this->_getParam('region');
    
    	$this->view->assign(array('latitude'=>$latitude,'longitude'=>$longitude,'region'=>$region));
    
    }
    
    
    
    public function createAction()
    {
        $form = new Application_Form_EditRegion();
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
                    
                $tableRegion = new Application_Model_Region_DbTable();
                $tableRegion->insert($values);
                    
                $this->_helper->redirector('index');
                exit;
            }
        }
        
        $this->view->form = $form;
    }
    
    public function updateAction()
    {
        $tableRegion = new Application_Model_Region_DbTable();
        $form = new Application_Form_EditRegion();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableRegion->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('id = ?' => $id);
        
                $tableRegion->update($values, $where);
                    
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
            $tableRegion = new Application_Model_Region_DbTable();
            $tableRegion->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit;
    }
}