<?php

/**
 * Controller for table national
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class NationalController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableNational = new Application_Model_National_DbTable();
        $gridSelect = $tableNational->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
    	    
    	$this->view->assign(array('latitude'=>$latitude,'longitude'=>$longitude));
    
    }
    
    public function createAction()
    {
        $form = new Application_Form_EditNational();
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
                    
                $tableNational = new Application_Model_National_DbTable();
                $tableNational->insert($values);
                    
                $this->_helper->redirector('index');
                exit;
            }
        }
        
        $this->view->form = $form;
    }
    
    public function updateAction()
    {
        $tableNational = new Application_Model_National_DbTable();
        $form = new Application_Form_EditNational();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableNational->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('id = ?' => $id);
        
                $tableNational->update($values, $where);
                    
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
            $tableNational = new Application_Model_National_DbTable();
            $tableNational->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit;
    }
}