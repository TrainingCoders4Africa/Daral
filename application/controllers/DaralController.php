<?php

/**
 * Controller for table daral
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class DaralController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableDaral = new Application_Model_Daral_DbTable();
        $gridSelect = $tableDaral->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
    
    
    public function displayAction(){
    	$latitude='37.7831';
    	$longitude='-122.4039';
    	//$this->_helper->layout->setLayout('layout2');
    	$this->view->assign(array('latitude'=>$latitude,'longitude'=>$longitude));
    	
    }
    
    
    
    
    
    
    
    
    
    public function createAction()
    {
        $form = new Application_Form_EditDaral();
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();

                $id_localite = $this->_getParam('id_localite');
                $tableLocalite = new Application_Model_Localite_DbTable();
                $row_localite = $tableLocalite->find($id_localite)->current();
                $values['id_localite'] = $row_localite->getName();
                
                $tableDaral = new Application_Model_Daral_DbTable();
                $tableDaral->insert($values);
                    
                $this->_helper->redirector('index');
                exit;
            }
        }
        
        $this->view->form = $form;
    }
    
    public function updateAction()
    {
        $tableDaral = new Application_Model_Daral_DbTable();
        $form = new Application_Form_EditDaral();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableDaral->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('id = ?' => $id);
        
                $tableDaral->update($values, $where);
                    
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
            $tableDaral = new Application_Model_Daral_DbTable();
            $tableDaral->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit;
    }
}