<?php

/**
 * Controller for table localite
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class LocaliteController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableLocalite = new Application_Model_Localite_DbTable();
        $gridSelect = $tableLocalite->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
    
    public function chooseAction(){ //displays list of localite in order to choose from to get statistics
    	$this->getFrontController()->getRequest()->setParams($_GET);
    	 
    	// zsf = zodeken sort field, zso = zodeken sort order
    	$sortField = $this->_getParam('_sf', '');
    	$sortOrder = $this->_getParam('_so', '');
    	$pageNumber = $this->_getParam('page', 1);
    	 
    	 
    	$tableLocalite = new Application_Model_Localite_DbTable();
    	$gridSelect = $tableLocalite->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
    	$localite = $this->_getParam('name');
    	$departement= $this->_getParam('departement');
    	$this->view->assign(array('latitude'=>$latitude,'longitude'=>$longitude,'localite'=>$localite,'departement'=>$departement));
    	 
    }
    
    public function createAction()
    {
        $form = new Application_Form_EditLocalite();
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();

                $id_departement = $this->_getParam('departement');
                $tableDepartement = new Application_Model_Departement_DbTable();
                $row_departement = $tableDepartement->find($id_departement)->current();
                $values['departement'] = $row_departement->getName();
                
                $tableLocalite = new Application_Model_Localite_DbTable();
                $tableLocalite->insert($values);
                    
                $this->_helper->redirector('index');
                exit;
            }
        }
        
        $this->view->form = $form;
    }
    
    public function updateAction()
    {
        $tableLocalite = new Application_Model_Localite_DbTable();
        $form = new Application_Form_EditLocalite();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableLocalite->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('id = ?' => $id);
        
                $tableLocalite->update($values, $where);
                    
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
            $tableLocalite = new Application_Model_Localite_DbTable();
            $tableLocalite->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit;
    }
}