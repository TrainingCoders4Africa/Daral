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
        $fk_id_farmer = $this->_getParam('fk_id_farmer','');
       // print_r($fk_id_farmer);break;
        $fk_animal_type = $this->_getParam('fk_animaltype','');
        $tableAnimal = new Application_Model_Animal_DbTable();
        $gridSelect = $tableAnimal->getDbSelectByParams(array('fk_id_farmer'=>$fk_id_farmer,'fk_animaltype'=>$fk_animal_type,'isactive'=>'1'), $sortField, $sortOrder);
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
    
    
    //****************** DISPLAY ANIMAL PHOTO***************************
    
    public function displayanimalAction()
    {
    	$photo = $this->_getParam('photo');
    	$this->view->assign(array('photo'=>$photo));
    	
    }
    
    
    
    
    
    
    

    public function rechercheAction()
    {
    	$this->getFrontController()->getRequest()->setParams($_GET);
    
    	// zsf = zodeken sort field, zso = zodeken sort order
    	$sortField = $this->_getParam('_sf', '');
    	$sortOrder = $this->_getParam('_so', '');
    	$pageNumber = $this->_getParam('page', 1);
    	
    
    	$tableAnimal = new Application_Model_Animal_DbTable();
    	$gridSelect = $tableAnimal->getDbSelectByParams(array(), $sortField, $sortOrder);
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
    
    
    
    
    
    
    public function updatephotoleftAction()
    {
        $tableAnimal = new Application_Model_Animal_DbTable();
        $form = new Application_Form_EditAnimalphotoleft();
        $animal_id =  $this->_getParam('id', 0);
        
        $row = $tableAnimal->getAnimal($animal_id);
        if (!$row) {
        	$this->_helper->redirector('index');
        	exit;
        }
       
        $fk_id_farmer=$row[0][2];//dependencies on the order of elements in the tables!!!
       
        $fk_animaltype=$row[0][3];//same dependencies here too 
        
        
            
        if ($this->_request->isPost()) {
        	
        	$formData = $this->getRequest()->getPost();
        	
        	if ($form->isValid($formData)&& $form->photo_left->receive()) {
        		
        		$photo_left=$form->getValue('photo_left');
        		
        		$tableAnimal->updatephotoleft($animal_id, $photo_left);
        		
        		$this->_redirector->gotoUrl('/animal/index/fk_id_farmer/'.$fk_id_farmer.'/fk_animaltype/'.$fk_animaltype);
            }
        } else {
            
            $form->populate(array('fk_id_farmer'=>$fk_id_farmer));
            
        }
        
        $this->view->form = $form;
        $this->view->animal_id = $animal_id;
        $this->view->animal_type = $fk_animaltype;
    }
    
    
    
    
    public function updatephotorightAction()
    {
    	$tableAnimal = new Application_Model_Animal_DbTable();
        $form = new Application_Form_EditAnimalphotoright();
        $animal_id =  $this->_getParam('id', 0);
        
        $row = $tableAnimal->getAnimal($animal_id);
        if (!$row) {
        	$this->_helper->redirector('index');
        	exit;
        }
       
        $fk_id_farmer=$row[0][2];//dependencies on the order of elements in the tables!!!
       
        $fk_animaltype=$row[0][3];//same dependencies here too 
        
        
            
        if ($this->_request->isPost()) {
        	
        	$formData = $this->getRequest()->getPost();
        	
        	if ($form->isValid($formData)&& $form->photo_right->receive()) {
        		
        		$photo_right=$form->getValue('photo_right');
        		
        		$tableAnimal->updatephotoright($animal_id, $photo_right);
        		
        		$this->_redirector->gotoUrl('/animal/index/fk_id_farmer/'.$fk_id_farmer.'/fk_animaltype/'.$fk_animaltype);
            }
        } else {
            
            $form->populate(array('fk_id_farmer'=>$fk_id_farmer));
            
        }
        
        $this->view->form = $form;
        $this->view->animal_id = $animal_id;
        $this->view->animal_type = $fk_animaltype;
    	
    }
    
    public function updatephotofrontAction()
    {
    	$tableAnimal = new Application_Model_Animal_DbTable();
    	$form = new Application_Form_EditAnimalphotofront();
    	$animal_id =  $this->_getParam('id', 0);
    	
    	$row = $tableAnimal->getAnimal($animal_id);
    	if (!$row) {
    		$this->_helper->redirector('index');
    		exit;
    	}
    	 
    	$fk_id_farmer=$row[0][2];//dependencies on the order of elements in the tables!!!
    	 
    	$fk_animaltype=$row[0][3];//same dependencies here too
    	
    	
    	
    	if ($this->_request->isPost()) {
    		 
    		$formData = $this->getRequest()->getPost();
    		 
    		if ($form->isValid($formData)&& $form->photo_front->receive()) {
    	
    			$photo_front=$form->getValue('photo_front');
    	
    			$tableAnimal->updatephotofront($animal_id, $photo_front);
    	
    			$this->_redirector->gotoUrl('/animal/index/fk_id_farmer/'.$fk_id_farmer.'/fk_animaltype/'.$fk_animaltype);
    		}
    	} else {
    	
    		$form->populate(array('fk_id_farmer'=>$fk_id_farmer));
    	
    	}
    	
    	$this->view->form = $form;
    	$this->view->animal_id = $animal_id;
    	$this->view->animal_type = $fk_animaltype;
    	 
    }
    
    public function updatecommentAction()
    {
    	$tableAnimal = new Application_Model_Animal_DbTable();
    	$form = new Application_Form_EditAnimalcomment();
    	$animal_id =  $this->_getParam('id', 0);
    	 
    	$row = $tableAnimal->getAnimal($animal_id);
    	if (!$row) {
    		$this->_helper->redirector('index');
    		exit;
    	}
    
    	$fk_id_farmer=$row[0][2];//dependencies on the order of elements in the tables!!!
    
    	$fk_animaltype=$row[0][3];//same dependencies here too
    	$comment=$row[0][8];//same dependencies here too
    	 
    	 
    	 
    	if ($this->_request->isPost()) {
    		 
    		$formData = $this->getRequest()->getPost();
    		 
    		if ($form->isValid($formData)) {
    			 
    			$comment=$form->getValue('comment');
    			 
    			$tableAnimal->updatecomment($animal_id, $comment);
    			 
    			$this->_redirector->gotoUrl('/animal/index/fk_id_farmer/'.$fk_id_farmer.'/fk_animaltype/'.$fk_animaltype);
    		}
    	} else {
    		 
    		$form->populate(array('fk_id_farmer'=>$fk_id_farmer,'comment'=>$comment));
    		 
    	}
    	 
    	$this->view->form = $form;
    	$this->view->animal_id = $animal_id;
    	$this->view->animal_type = $fk_animaltype;
    
    }
    
    
    
    public function deleteAction()
    {
        /* $ids = $this->_getParam('del_id', array());
        
        if (!is_array($ids)) {
            $ids = array($ids);
        }
        
        if (!empty($ids)) {
            $tableAnimal = new Application_Model_Animal_DbTable();
            $tableAnimal->deleteMultipleIds($ids);
        }
        
        $this->_helper->redirector('index');
        exit; */
    }
}