<?php

/**
 * Controller for table animal
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class AnimalController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableAnimal = new Application_Model_Animal_DbTable();
        $gridSelect = $tableAnimal->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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

    public function rechercheAction()
    {
    	$this->getFrontController()->getRequest()->setParams($_GET);
    
    	// zsf = zodeken sort field, zso = zodeken sort order
    	$sortField = $this->_getParam('_sf', '');
    	$sortOrder = $this->_getParam('_so', '');
    	$pageNumber = $this->_getParam('page', 1);
    
    	$tableAnimal = new Application_Model_Animal_DbTable();
    	$gridSelect = $tableAnimal->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
        $form = new Application_Form_EditAnimal();
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
                    
                $tableAnimal = new Application_Model_Animal_DbTable();
                $tableAnimal->insert($values);
                    
                $this->_helper->redirector('index');
                exit;
            }
        }
        
        $this->view->form = $form;
    }
    
    public function updateAction()
    {
        $tableAnimal = new Application_Model_Animal_DbTable();
        $form = new Application_Form_EditAnimal();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableAnimal->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('id = ?' => $id);
        
                $tableAnimal->update($values, $where);
                    
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
            $tableAnimal = new Application_Model_Animal_DbTable();
            $tableAnimal->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit;
    }
}