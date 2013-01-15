<?php

class DashController extends Zend_Controller_Action
{

	public function init()
	{
		/* Initialize action controller here */
		 
	}

	public function indexAction()
	{
		$this->getFrontController()->getRequest()->setParams($_GET);

		// zsf = zodeken sort field, zso = zodeken sort order
		$sortField = $this->_getParam('_sf', '');
		$sortOrder = $this->_getParam('_so', '');
		$pageNumber = $this->_getParam('page', 1);

		$tableFarmer = new Application_Model_Farmer_DbTable();
		$gridSelect = $tableFarmer->getDbSelectByParams(array('isactive_farmer'=>'1'), $sortField, $sortOrder);
		$paginator = Zend_Paginator::factory($gridSelect);
		$paginator->setItemCountPerPage(10)
		->setCurrentPageNumber(1);

		 


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


}

