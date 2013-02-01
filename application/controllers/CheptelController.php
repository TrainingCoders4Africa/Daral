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
	
	protected $_redirector = null;
	
	public function init()
	{
		$this->_redirector = $this->_helper->getHelper('Redirector');
	}
	
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
	
	
		//-----------------------  test add ---------------------
	
		$session = new Zend_Session_Namespace('session'); //variable used to send values to the index view for test
		$fk_id_farmer=$session->fk_id_farmer;
		$fk_animaltype=$session->fk_animaltype;
		$total_animaltype=$session->totalanimaltype;
		$message=$session->message;
	
		//-------------------------------------------------------
	
		$this->view->assign(array(
				'paginator' => $paginator,
				'sortField' => $sortField,
				'sortOrder' => $sortOrder,
				'pageNumber' => $pageNumber,
				'fk_id_farmer'=>$fk_id_farmer,
				'fk_id_animal'=>$fk_animaltype,
				'total_animal'=>$total_animaltype,
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
		
		$form = new Application_Form_EditCheptel2();
		$this->view->form = $form;
		$this->getFrontController()->getRequest()->setParams($_GET);
		
		// zsf = zodeken sort field, zso = zodeken sort order
		$sortField = $this->_getParam('_sf', '');
		$sortOrder = $this->_getParam('_so', '');
		$pageNumber = $this->_getParam('page', 1);
		//$isactive= $this->_getParam('isactive_farmer','1');
		
		$params = array();
		$params['isactive']= '1' ;
		
		
		if (isset($_POST['fk_id_farmer']) && !empty($_POST['fk_id_farmer'])) {
			$params['fk_id_farmer'] = $_POST['fk_id_farmer'];
		}
		
		if (isset($_POST['fk_animaltype']) && !empty($_POST['fk_animaltype'])) {
			$params['fk_animaltype'] = $_POST['fk_animaltype'];
		}
		
		
		
		
		
		$tableCheptel = new Application_Model_Cheptel_DbTable_Cheptel();
		$gridSelect = $tableCheptel->getDbSelectByParams($params, $sortField, $sortOrder);
		$paginator = Zend_Paginator::factory($gridSelect);
		$paginator->setItemCountPerPage(5)
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
	
	

	//************************************************************************************
	//                                  ADD
	//************************************************************************************
	
	public function addAction()
	{
		$form = new Application_Form_Cheptel();
	     
	
	
		if ($this->getRequest()->isPost())
		{ // the user has clicked on the submit button "Ajouter"
			$formData = $this->getRequest()->getPost();
			if ($form->isValid($formData)  )
			{
				
				
				$fk_id_farmer = $form->getValue('fk_id_farmer');
				$fk_animaltype = $form->getValue('fk_animaltype');
				$total_animaltype = $form->getValue('total_animaltype');
				 
				$session = new Zend_Session_Namespace('session'); //variable used to send values to the index view for test
				
					
				 
				$cheptel = new Application_Model_Cheptel_DbTable_Cheptel();
				try{
					$result=$cheptel->addCheptel($fk_id_farmer,$fk_animaltype,$total_animaltype);
					$ids=$result['ids'];
					switch ($result['res'])
					{
						case  1: $this->_redirector->gotoUrl('/cheptel/success/ids/'.$ids.'/total/'.$total_animaltype);break;
						case  0: $this->_redirector->gotoUrl('/cheptel/errorfarmer');
						case -1: $this->_redirector->gotoUrl('/cheptel/errormax');
 					}
				} catch (Exception $e)
				{
					die('Erreur: '.$e->getMessage());
				}
				
				$session->message=$result;
				
				
				$this->_helper->redirector('index','cheptel');
			}
	
	
			else
			{//The form was not valid 
				
					
					$form->populate($formData);
				    $this->view->form = $form;
				
				
			}
		}
		
		else
		
		{
			
		     $id_farmer = $this->_getParam('id');
		      
		      if(isset($id_farmer))
		
             	    {    
	    	              $form->populate(array('fk_id_farmer'=>$id_farmer)); 
	    	              $this->view->form = $form; 
		            }
	         else 
		      {
		           $this->view->form = $form;
		
		       }
	
		}
	
    }

    public function errorfarmerAction()
    {
    	
    }
    
    public function errormaxAction()
    {
    	
    	
    }
    
    public function successAction()
    {
    	$ids = $this->_getParam('ids');
    	$total= $this->_getParam('total');
    	$this->view->assign(array('ids'=>$ids,'total'=>$total));
    	 
    }
    
    public function printidsAction()
    {
    	$this->_helper->layout->setLayout('layout2');
    	$ids = $this->_getParam('animal_ids');
    	$total= $this->_getParam('total');
    	$this->view->assign(array('ids'=>$ids,'total'=>$total));
    }
}
//############################################################################################################################################

/*	public function createAction()
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
	}*/
	
//#################################################################################################################################################	
