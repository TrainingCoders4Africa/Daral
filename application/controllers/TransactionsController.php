<?php

/**
 * Controller for table animal
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class TransactionsController extends Zend_Controller_Action
{
	
	protected $_redirector = null;
	
	
	
	public function init()
	{
		$this->_redirector = $this->_helper->getHelper('Redirector');
	}
	
	
	//**************** INDEX *****************************//
	
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', 'transaction_date');
        $sortOrder = $this->_getParam('_so', 'desc');
        $pageNumber = $this->_getParam('page', 1);
        $tableTransactions = new Application_Model_Transactions_DbTable();
        $gridSelect = $tableTransactions->getDbSelectByParams($this->_getAllParams(), $sortField, $sortOrder);
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
    
    
    
    
    
    
    //****************** RECHERCHE****************************//

    public function rechercheAction()
    {
    	$form = new Application_Form_Transactions2();
    	$this->view->form = $form;
    	$this->getFrontController()->getRequest()->setParams($_GET);
    	
    	// zsf = zodeken sort field, zso = zodeken sort order
    	$sortField = $this->_getParam('_sf', 'transaction_date');
    	$sortOrder = $this->_getParam('_so', 'desc');
    	$pageNumber = $this->_getParam('page', 1);
    	$tableAnimal = new Application_Model_Animal_DbTable();
    	$tableAnimaltype = new Application_Model_Animaltype_DbTable_Animaltype();
    	$tableTransactions = new Application_Model_Transactions_DbTable();
    	$params = array();
    	
    	if (isset($_POST['id_seller']) && !empty($_POST['id_seller'])) {
    		$params['id_seller'] = $_POST['id_seller'];
    		
    		
    	}
    	
    	if (isset($_POST['id_buyer']) && !empty($_POST['id_buyer'])) {
    		$params['id_buyer'] = $_POST['id_buyer'];
    	}
    	
    	if (isset($_POST['animaltype']) && !empty($_POST['animaltype'])) {
    		$params['animaltype'] = $_POST['animaltype'];
    	}
    	
    	
    	if (isset($_POST['animal_id']) && !empty($_POST['animal_id'])) {
    		
    		$id_animal= $_POST['animal_id'];
    		$params['animal_id']= $tableAnimal->generateAnimalRank($id_animal);
    	}
    	
    	
    	
    	
    	$gridSelect = $tableTransactions->getDbSelectByParams($params, $sortField, $sortOrder);
    	$paginator = Zend_Paginator::factory($gridSelect);
    	$paginator->setItemCountPerPage(30)
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
    
    
    
    
    
    
    
    
    public function newAction()
    {
    	$tableAnimal = new Application_Model_Animal_DbTable();
    	$form = new Application_Form_Transactions();
    	$tableFarmer = new Application_Model_Farmer_DbTable_Farmer();
    	$tableTransactions = new Application_Model_Transactions_DbTable();
    	if ($this->_request->isPost()) {
    		 
    		$formData = $this->getRequest()->getPost();
    		 
    		if ($form->isValid($formData)) {
    	       
    			$id_seller = $form->getValue('id_seller');
    			$id_buyer = $form->getValue('id_buyer');
    			$animaltype= $form->getValue('animaltype');
    			$info_buyer = $form->getValue('info_buyer');
    			$animal_ids = explode(";",$form->getValue('animal_id'));
    		    $nb_animals=count($animal_ids);//used to check against farmer category
    		    $transaction_date=date("d.m.y");
    			//print_r($count_ids);break;
    			
    			// !!!!check infos !!!!!
    			$error_log ='none;';
    			$error_log.=$tableFarmer->check_seller($id_seller);
				$error_log.=$tableFarmer->check_buyer($id_buyer,$nb_animals,$animaltype);
				$error_log.=$tableAnimal->check_animals($animal_ids, $animaltype,$id_seller);
				
				//print_r($error_log." @error_log");break;
				
			  if($error_log=='none;')	
			  	    			
			  {   
			  	$elements_facture='';
			  	$elements_facture.=$transaction_date."~";
			    $elements_facture.=$id_seller."~";
			    $elements_facture.=$id_buyer."~";
			    $elements_facture.=$info_buyer."~";
			    
			  	foreach ($animal_ids as $animal_id)
			  	  {
			  	    
    				//note: FIX PROBLEM WITH ANIMAL ID: what if  is it sold back in a Daral??
    				$res=$tableAnimal->sellAnimal($animal_id,$animaltype,$id_seller,$id_buyer);
    				
    				
    				
    				//record the transaction in "transactions" table
    				$transaction_data = array(
    						'id_seller'=>$id_seller,
    						'id_buyer'=>$id_buyer,
    						'info_buyer'=>$info_buyer,
    						'animaltype'=>$animaltype,
    						'animal_id'=>$res['animal_id'],
    						 
    				);
    				
    				$tableTransactions->insert($transaction_data);
    				//!!! redirect to success message success message !!!
    				$elements_facture.=$res['animal_id']."~";
    				
    			   }
    			   $session = new Zend_Session_Namespace('elements_facture'); //variable used to send values to the displaysuccessAction()
    			   $session->elements_facture = $elements_facture;
    			   
    			   $this->_helper->redirector('displaysuccess','transactions');
			  }
    		  else 
    		  {
    		  	$session = new Zend_Session_Namespace('error_log'); //variable used to send values to the displayerrorAction()
    		  	$session->error_log=$error_log;
    		  	$this->_helper->redirector('displayerror','transactions');
    		  		
    		  }
    			
    		}
    	 else {
    		 
    		$form->populate($formData);
    		 
    	     }
    	}
    	$this->view->form = $form;
    	
    }
    
    
    
    //=================================
    
    public function displayerrorAction()
    {
    	//$this->view->error_list = $this->_getParam('error_log');
    	$session = new Zend_Session_Namespace('error_log');
    	 
    	
    	$error_log = $session->error_log;
    	$this->view->assign("error_list",$error_log);
    }
    
    
    //=================================
    public function displaysuccessAction()
    {
    	
    	$session = new Zend_Session_Namespace('elements_facture');
    	
    	 
    	$elements_facture = $session->elements_facture;
    	$this->view->assign("elements_facture",$elements_facture);
    }
    
    public function printfactureAction()
    {
    	$this->_helper->layout->setLayout('layout2');
    	
    	$session = new Zend_Session_Namespace('elements_facture');
    	 
    	$elements_facture = $session->elements_facture;
    	$this->view->assign("elements_facture",$elements_facture);
    }
    
    
    
}
