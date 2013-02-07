<?php

/**
 * Controller for table media
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
require_once 'Zend/Loader.php';
Zend_Loader::loadClass('Zend_Gdata_YouTube');
Zend_Loader::loadClass('Zend_Gdata_AuthSub');

class MediaController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        
        $tableMedia = new Application_Model_Media_DbTable();
        $gridSelect = $tableMedia->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
        $form = new Application_Form_EditMedia();
		
		$this->view->form = $form;
    }
	
	public function readAction()
    {
        $idVideo = $this->_getParam('idVideo');
		$this->view->assign("idVideo",$idVideo);
    }
	
	public function searchAction()
    {
        //$type = $this->_getParam('_sm');
		$search = $this->_getParam('_kw');
		/* $tableMedia = new Application_Model_Media_DbTable();
		if($type == 'all')
		{
			$videoFeed = $tableMedia->searchAll($search);
		}
		if($type == 'langue' || $type == 'maladie')
		{
			$videoFeed = $tableMedia->searchTags($search);
		}
		 */
		$this->view->assign("search",$search);
		//$this->view->assign("videoFeed",$videoFeed);
    }

}