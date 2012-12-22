<?php

/**
 * Controller for table cheptel
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class CheptelController extends Zend_Controller_Action
{
	public function indexAction()
	{
		$this->getFrontController()->getRequest()->setParams($_GET);
	
		// zsf = zodeken sort field, zso = zodeken sort order
		$sortField = $this->_getParam('_sf', '');
		$sortOrder = $this->_getParam('_so', '');
		$pageNumber = $this->_getParam('page', 1);
	
		$tableCheptel = new Application_Model_Cheptel_DbTable_Cheptel();
		$gridSelect = $tableCheptel->getDbSelectByParams(array('isactive'=>'1'), $sortField, $sortOrder);
		$paginator = Zend_Paginator::factory($gridSelect);
		$paginator->setItemCountPerPage(20)
		->setCurrentPageNumber($pageNumber);
	
	
		//****test add****
	
		$session = new Zend_Session_Namespace('session'); //variable used to send values to the index view for test
		$fk_id_farmer=$session->fk_id_farmer;
		$fk_animal_type=$session->fk_animal_type;
		$total_animal_type=$session->total_animal_type;
		$message=$session->message;
	
		//********
	
		$this->view->assign(array(
				'paginator' => $paginator,
				'sortField' => $sortField,
				'sortOrder' => $sortOrder,
				'pageNumber' => $pageNumber,
				'fk_id_farmer'=>$fk_id_farmer,
				'fk_id_animal'=>$fk_animal_type,
				'total_animal'=>$total_animal_type,
				'message'=>$message,
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

		$tableCheptel = new Application_Model_Cheptel_DbTable_Cheptel();
		$gridSelect = $tableCheptel->getDbSelectByParams(array(), $sortField, $sortOrder);
		$paginator = Zend_Paginator::factory($gridSelect);
		$paginator->setItemCountPerPage(20)
		->setCurrentPageNumber($pageNumber);


		//****test add****

		$session = new Zend_Session_Namespace('session'); //variable used to send values to the index view for test
		$fk_id_farmer=$session->fk_id_farmer;
		$fk_animal_type=$session->fk_animal_type;
		$total_animal_type=$session->total_animal_type;
		$message=$session->message;

		//********

		$this->view->assign(array(
            'paginator' => $paginator,
            'sortField' => $sortField,
            'sortOrder' => $sortOrder,
            'pageNumber' => $pageNumber,
        		'fk_id_farmer'=>$fk_id_farmer,
        		'fk_id_animal'=>$fk_animal_type,
        		'total_animal'=>$total_animal_type,
        		'message'=>$message,
		));

		foreach ($this->_getAllParams() as $paramName => $paramValue)
		{
			// prepend 'param' to avoid error of setting private/protected members
			$this->view->assign('param' . $paramName, $paramValue);
		}
	}

	//*****************************************
	//   ADD
	
	public function addAction()
	{
		$form = new Application_Form_Cheptel();
	
	
	
		if ($this->getRequest()->isPost())
		{ // the user has clicked on the submit button "Ajouter"
			$formData = $this->getRequest()->getPost();
			if ($form->isValid($formData)  )
			{
				$fk_id_farmer = $form->getValue('fk_id_farmer');
				$fk_animal_type = $form->getValue('fk_animal_type');
				$total_animal_type = $form->getValue('total_animal_type');
				 
				$session = new Zend_Session_Namespace('session'); //variable used to send values to the index view for test
				//$session->fk_id_farmer=$fk_id_farmer;
				//$session->fk_animal_type=$fk_animal_type;
				//$session->total_animal_type=$total_animal_type;
					
				 
				$cheptel = new Application_Model_Cheptel_DbTable_Cheptel();
				try{
					$result=$cheptel->addCheptel($fk_id_farmer,$fk_animal_type,$total_animal_type);
				} catch (Exception $e)
				{
					die('Erreur: '.$e->getMessage());
				}
				//$message = $cheptel->addCheptel($fk_id_farmer,$fk_animal_type,$total_animal_type);
				$session->message=$result;
	
				$this->_helper->redirector('index','cheptel');
			}
	
	
			else
			{//The form was not valid or the photo was not successfully uploaded
				$form->populate($formData);
			}
		}
	
		$this->view->form = $form;
	}
	
	


	public function createAction()
	{
		$form = new Application_Form_EditCheptel();

		if ($this->_request->isPost()) {
			if ($form->isValid($this->_request->getPost())) {
				$values = $form->getValues();

				$tableCheptel = new Application_Model_Cheptel_DbTable();
				$tableCheptel->insert($values);

				$this->_helper->redirector('index');
				exit;
			}
		}

		$this->view->form = $form;
	}

	public function updateAction()
	{
		$tableCheptel = new Application_Model_Cheptel_DbTable();
		$form = new Application_Form_EditCheptel();
		$id = (int) $this->_getParam('id', 0);

		$row = $tableCheptel->find($id)->current();

		if (!$row) {
			$this->_helper->redirector('index');
			exit;
		}

		if ($this->_request->isPost()) {
			if ($form->isValid($this->_request->getPost())) {
				$values = $form->getValues();

				$where = array('id = ?' => $id);

				$tableCheptel->update($values, $where);

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
			//$tableCheptel = new Application_Model_Cheptel_DbTable();
			// $tableCheptel->deleteMultipleIds($ids);
		}

		$this->_helper->redirector('index');
		exit;
	}
}