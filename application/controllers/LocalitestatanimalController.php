<?php

/**
 * Controller for table localitestatanimal
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class LocalitestatanimalController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableLocalitestatanimal = new Application_Model_Localitestatanimal_DbTable();
        $gridSelect = $tableLocalitestatanimal->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
        $form = new Application_Form_EditLocalitestatanimal();
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
                    
                $tableLocalitestatanimal = new Application_Model_Localitestatanimal_DbTable();
                $tableLocalitestatanimal->insert($values);
                    
                $this->_helper->redirector('index');
                exit;
            }
        }
        
        $this->view->form = $form;
    }
    
    public function updateAction()
    {
        $tableLocalitestatanimal = new Application_Model_Localitestatanimal_DbTable();
        $form = new Application_Form_EditLocalitestatanimal();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableLocalitestatanimal->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('id = ?' => $id);
        
                $tableLocalitestatanimal->update($values, $where);
                    
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
            $tableLocalitestatanimal = new Application_Model_Localitestatanimal_DbTable();
            $tableLocalitestatanimal->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit;
    }
}