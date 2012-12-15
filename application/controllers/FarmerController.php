<?php

error_reporting(E_ALL);
/**
 * Controller for table farmer
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class FarmerController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $this->getFrontController()->getRequest()->setParams($_GET);
        
        // zsf = zodeken sort field, zso = zodeken sort order
        $sortField = $this->_getParam('_sf', '');
        $sortOrder = $this->_getParam('_so', '');
        $pageNumber = $this->_getParam('page', 1);
        //$isactive= $this->_getParam('isactive_farmer','1');
        
        $tableFarmer = new Application_Model_Farmer_DbTable();
        $gridSelect = $tableFarmer->getDbSelectByParams(array('isactive_farmer'=>'1'), $sortField, $sortOrder);
        $paginator = Zend_Paginator::factory($gridSelect);
        $paginator->setItemCountPerPage(10)
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

    
    //*****************************************
    //   ADD
    
    public function addAction()
    {
        $form = new Application_Form_Farmer();
       
    	    	
     
    	if ($this->getRequest()->isPost()) 
    	{ // the user has clicked on the submit button "Ajouter"
    		$formData = $this->getRequest()->getPost();
    		if ($form->isValid($formData) && $form->photo->receive() ) 
    		{ 
    				
    			$firstname_farmer=$form->getValue('firstname_farmer');
    			$lastname_farmer = $form->getValue('lastname_farmer');
    			$national_id = $form->getValue('national_id');
    			$address_farmer = $form->getValue('address_farmer');
    			$phone_farmer = $form->getValue('phone_farmer');
    			$birthdate_farmer = $form->getValue('birthdate_farmer');
    			$birthplace_farmer = $form->getValue('birthplace_farmer');
    			$categorie = $form->getValue('categorie');
    			$registration_date= $form->getValue('registration_date');
    			$isactive_farmer = $form->getValue('isactive_farmer');//already set to '1' */
    			
    			
    			$farmer = new Application_Model_Farmer_DbTable_Farmer();
    			$user = new Application_Model_Users_DbTable_Users();
    			
    			$daral_number = $user->getDaral();
    			$daral_originel = $daral_number;
    			$daral_actuel = $daral_originel;
    			
    			
    		    $rank=$farmer->getFarmerRank($daral_originel);//use "daral_originel" to avoid assigning twice or more the same ID, 
    		                                                 //a farmer is never really deleted so we have a history of all the number already attributed 
    		    
    		    
    		    $id_farmer=$daral_originel.$rank;
    		    $tableDaral = new Application_Model_Daral_DbTable_Daral();
    		    
    			 
    			$id_localite = $tableDaral->getLocalite($daral_actuel);
    			
    			
    			$farmer->addFarmer($id_farmer,$categorie,$national_id,$address_farmer,$phone_farmer,$registration_date,$daral_originel,$daral_actuel,
			          $firstname_farmer,$lastname_farmer,$isactive_farmer,$birthdate_farmer,$birthplace_farmer,$id_localite);
    			
    			
    			// ID CARD GENERATION
    			$filename = $form->photo->getFileName();
    			$filename= $farmer->resize_picture($filename);
    			$path=$farmer->createCard($filename,$lastname_farmer,$firstname_farmer,$id_farmer);//path to the ID Card
    			
    			$session = new Zend_Session_Namespace('session'); //variable used to send values to the displaycardAction()
    			$session->photo_path = $path;// to be used by the displaycardAction()
    			$session->firstname_farmer=$firstname_farmer;
    			$session->lastname_farmer=$lastname_farmer;

    			    		 
    			$this->_helper->redirector('displaycard','farmer');
    		    }

    		    
    		    else
    		    {//The form was not valid or the photo was not successfully uploaded
    		    $form->populate($formData);
    		    }  
    	   }
    	   
    	   $this->view->form = $form;
    }
    
    public function displaycardAction()
    {
    
    	$session = new Zend_Session_Namespace('session');
    
    	//Display the value at the resulting view
    	$path = $session->photo_path;
    	$firstname= $session->firstname_farmer;
    	$lastname=$session->lastname_farmer;
    	
    
    	$this->view->assign("IDCard_path",$path);
    	$this->view->assign("firstname",$firstname);
    	$this->view->assign("lastname",$lastname);
    	 
    }
    
    
    
    
    
    
    //****************************************
    
    
    /* public function updateAction()
    {
        $tableFarmer = new Application_Model_Farmer_DbTable();
        //$form = new Application_Form_EditFarmer();
        $form = new Application_Form_Farmer();
        $id = (int) $this->_getParam('id', 0);
        
        $row = $tableFarmer->find($id)->current();

        if (!$row) {
            $this->_helper->redirector('index');
            exit;
        }
            
        if ($this->_request->isPost()) {
            if ($form->isValid($this->_request->getPost())) {
                $values = $form->getValues();
        
                $where = array('rank_farmer = ?' => $id);
        
                $tableFarmer->update($values, $where);
                    
                $this->_helper->redirector('index');
                exit;
            }
        } else {
            
            $form->populate($row->toArray());
        }
        
        $this->view->form = $form;
        $this->view->row = $row;
    } */
    public function editAction()
    {
    	$form = new Application_Form_EditFarmer();
    	$this->view->form = $form;
    
    	 if ($this->getRequest()->isPost()) { 
    		$formData = $this->getRequest()->getPost();
    		if ($form->isValid($formData)) {
    			
    			$id_farmer = $form->getValue('id_farmer');
    			$firstname_farmer = $form->getValue('firstname_farmer');
    			$lastname_farmer = $form->getValue('lastname_farmer');
    			$phone_farmer = $form->getValue('phone_farmer');
    			$birthdate_farmer = $form->getValue('birthdate_farmer');
    			$birthplace_farmer = $form->getValue('birthplace_farmer');
    			$address_farmer = $form->getValue('address_farmer');
    			$categorie = $form->getValue('categorie');
    			$national_id = $form->getValue('national_id');
    			$daral_actuel = $form->getValue('daral_actuel');
    		    
    		   
    			
    			$farmer = new Application_Model_Farmer_DbTable_Farmer();
    			$tableDaral = new Application_Model_Daral_DbTable_Daral();
    			
    			$id_localite = $tableDaral->getLocalite($daral_actuel);
    			
    			
    			//$farmer->updateFarmer($id_farmer,$firstname_farmer,$lastname_farmer,$phone_farmer,$birthdate_farmer,$birthplace_farmer,
    					//$address_farmer,$categorie,$national_id,$daral_actuel,$id_localite);
    			$farmer->updateFarmer($id_farmer,$firstname_farmer,$lastname_farmer,$phone_farmer,$birthdate_farmer,$birthplace_farmer,
    					             $address_farmer,$categorie,$national_id,$daral_actuel,$id_localite);
    			$this->_helper->redirector('index','farmer');
    		} 
    		
    	    else {
    	    	$id_farmer = $this->_getParam('id');
    	    	
    	    	$farmer = new Application_Model_Farmer_DbTable_Farmer();
    	    	$form->populate($farmer->getFarmer($id_farmer));
    			$form->populate($formData);
    		}
    	}
    	else {
    		    $id_farmer = $this->_getParam('id');
    		
    			$farmer = new Application_Model_Farmer_DbTable_Farmer();
    			$form->populate($farmer->getFarmer($id_farmer));
    			
    	}
    
    }
    public function createAction()
    {
    	$form = new Application_Form_EditFarmer();
    
    	if ($this->_request->isPost()) {
    		if ($form->isValid($this->_request->getPost())) {
    			$values = $form->getValues();
    
    			$tableFarmer = new Application_Model_Farmer_DbTable();
    			$tableFarmer->insert($values);
    
    			$this->_helper->redirector('index');
    			exit;
    		}
    	}
    
    	$this->view->form = $form;
    }
    
    public function deleteAction()
    {
        $ids = $this->_getParam('del_id', array());
        
        if (!is_array($ids)) {
            $ids = array($ids);
        }
        
        if (!empty($ids)) {
            
        	$farmer = new Application_Model_Farmer_DbTable_Farmer();
        	$tableCheptel = new Application_Model_Cheptel_DbTable_Cheptel();
            foreach ($ids as $id)
            {
            	$farmer->archiveFarmer($id);
            	$tableCheptel->update(array('isactive'=>'0'),array('fk_id_farmer=?'=>$id) );
            	
            	
            }
          
        
        $this->_helper->redirector('index');
        exit;
       }
    }
}