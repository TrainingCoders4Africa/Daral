<?php

/**
 * Controller for table departement_stat_animal
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class DepartementStatAnimalController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableDepartementStatAnimal = new Application_Model_DepartementStatAnimal_DbTable();
        $gridSelect = $tableDepartementStatAnimal->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
        $form = new Application_Form_EditDepartementStatAnimal();
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
                    
                $tableDepartementStatAnimal = new Application_Model_DepartementStatAnimal_DbTable();
                $tableDepartementStatAnimal->insert($values);
                    
                $this->_helper->redirector('index');
                exit;
            }
        }
        
        $this->view->form = $form;
    }
    
    public function updateAction()
    {
        $tableDepartementStatAnimal = new Application_Model_DepartementStatAnimal_DbTable();
        $form = new Application_Form_EditDepartementStatAnimal();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableDepartementStatAnimal->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('id = ?' => $id);
        
                $tableDepartementStatAnimal->update($values, $where);
                    
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
            $tableDepartementStatAnimal = new Application_Model_DepartementStatAnimal_DbTable();
            $tableDepartementStatAnimal->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit;
    }
}