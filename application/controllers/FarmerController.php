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
	protected $_redirector = null;
	
	public function init()
	{
		$this->_redirector = $this->_helper->getHelper('Redirector');
	}

	//**************************************************************************************************//
	//									       INDEX
	//**************************************************************************************************//
	
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

    
    //**************************************************************************************************//
    //									       ADD
    //**************************************************************************************************//
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
    			
    			//**** put date into SQL Format 
    			$date=implode('-',array_reverse(explode('/',$birthdate_farmer)));
    			$birthdate_farmer=$date;
    			//*********
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
    		                                                 //a farmer is never really deleted so we have a history of all the number
    		                                                 // already attributed 
    		    
    		    
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
    			$session->id_farmer=$id_farmer;

    			    		 
    			$this->_helper->redirector('displaycard','farmer');
    		    }

    		    
    		    else
    		    {//The form was not valid or the photo was not successfully uploaded
    		   	 $form->populate($formData);
    		    }  
    	   }
    	   
    	   $this->view->form = $form;
    }
    
    
    
    //**************************************************************************************************//
    //									       DISPLAY CARD
    //**************************************************************************************************//
    
    public function displaycardAction()
    {
    
    	$session = new Zend_Session_Namespace('session');
    
    	
    	$path = $session->photo_path;
    	$firstname= $session->firstname_farmer;
    	$lastname=$session->lastname_farmer;
    	$id_farmer=$session->id_farmer;
    	
    
    	$this->view->assign("IDCard_path",$path);
    	$this->view->assign("firstname",$firstname);
    	$this->view->assign("lastname",$lastname);
    	$this->view->assign("id_farmer",$id_farmer); 
    }
    
    
    
    //**************************************************************************************************//
    //									       EDIT 
    //**************************************************************************************************//
    
  
    public function editAction()
    {
    	$form = new Application_Form_EditFarmer();
    	$this->view->form = $form;
    
    	if ($this->getRequest()->isPost()) {
    		$formData = $this->getRequest()->getPost();
    		if ($form->isValid($formData)&& $form->photo->receive()) {
    			 
    			$id_farmer = $form->getValue('id_farmer');
    			$firstname_farmer = $form->getValue('firstname_farmer');
    			$lastname_farmer = $form->getValue('lastname_farmer');
    			$phone_farmer = $form->getValue('phone_farmer');
    			$birthdate_farmer = $form->getValue('birthdate_farmer');
    			//**** put date into SQL Format
    			$date=implode('-',array_reverse(explode('/',$birthdate_farmer)));
    			$birthdate_farmer=$date;
    			//*********
    			$birthplace_farmer = $form->getValue('birthplace_farmer');
    			$address_farmer = $form->getValue('address_farmer');
    			$categorie = $form->getValue('categorie');
    			$national_id = $form->getValue('national_id');
    			$daral_actuel = $form->getValue('daral_actuel');
    
    				
    			 
    			$farmer = new Application_Model_Farmer_DbTable_Farmer();
    			$tableDaral = new Application_Model_Daral_DbTable_Daral();
    			 
    			$id_localite = $tableDaral->getLocalite($daral_actuel);
    			 
    			 
    			
    			$farmer->updateFarmer($id_farmer,$firstname_farmer,$lastname_farmer,$phone_farmer,$birthdate_farmer,$birthplace_farmer,
    				$address_farmer,$categorie,$national_id,$daral_actuel,$id_localite); 
    	
    		 
    			// ID CARD GENERATION
    			$filename = $form->photo->getFileName();
    			$filename= $farmer->resize_picture($filename);
    			$path=$farmer->createCard($filename,$lastname_farmer,$firstname_farmer,$id_farmer);//path to the ID Card
    			
    		
    			$this->_redirector->gotoUrl('/farmer/displayfarmer/id/'.$id_farmer);
    		  //$this->_helper->redirector('index','farmer');
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
    
    //**************************************************************************************************//
    //									       DISPLAY FARMER
    //**************************************************************************************************//
    
    public function displayfarmerAction()
    
    
    {
    	
    	//$this->_helper->layout->setLayout('layout2');
      $id_farmer = $this->_getParam('id');
      $this->view->assign(array('id'=>$id_farmer));
      
    }
    
    //**************************************************************************************************//
    //									       DELETE
    //**************************************************************************************************//
    
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
    
    //**************************************************************************************************//
    //									       SEARCH
    //**************************************************************************************************//
    
    
    public function rechercheAction(){
    
    	$form = new Application_Form_EditFarmer2();
    	$this->view->form = $form;
    	$this->getFrontController()->getRequest()->setParams($_GET);
    
    	// zsf = zodeken sort field, zso = zodeken sort order
    	$sortField = $this->_getParam('_sf', '');
    	$sortOrder = $this->_getParam('_so', '');
    	$pageNumber = $this->_getParam('page', 1);
    	//$isactive= $this->_getParam('isactive_farmer','1');
    
    	$params = array();
    	$params['isactive_farmer']= '1' ;
    	 
    	 
    	if (isset($_POST['rank_farmer']) && !empty($_POST['rank_farmer'])) {
    		$params['rank_farmer'] = $_POST['rank_farmer'];
    	}
    	 
    	if (isset($_POST['id_farmer']) && !empty($_POST['id_farmer'])) {
    		$params['id_farmer'] = $_POST['id_farmer'];
    	}
    	 
    	if (isset($_POST['categorie']) && !empty($_POST['categorie'])) {
    		$params['categorie'] = $_POST['categorie'];
    	}
    	 
    	if (isset($_POST['national_id']) && !empty($_POST['national_id'])) {
    		$params['national_id'] = $_POST['national_id'];
    	}
    	 
    	if (isset($_POST['address_farmer']) && !empty($_POST['address_farmer'])) {
    		$params['address_farmer'] = $_POST['address_farmer'];
    	}
    	 
    	if (isset($_POST['registration_date']) && !empty($_POST['registration_date'])) {
    		$params['registration_date'] = $_POST['registration_date'];
    	}
    	 
    	if (isset($_POST['daral_originel']) && !empty($_POST['daral_originel'])) {
    		$params['daral_originel'] = $_POST['daral_originel'];
    	}
    	 
    	if (isset($_POST['daral_actuel']) && !empty($_POST['daral_actuel'])) {
    		$params['daral_actuel'] = $_POST['daral_actuel'];
    	}
    	 
    	if (isset($_POST['firstname_farmer']) && !empty($_POST['firstname_farmer'])) {
    		$params['firstname_farmer'] = $_POST['firstname_farmer'];
    	}
    	 
    	if (isset($_POST['lastname_farmer']) && !empty($_POST['lastname_farmer'])) {
    		$params['lastname_farmer'] = $_POST['lastname_farmer'];
    	}
    	 
    	if (isset($_POST['isactive_farmer']) && !empty($_POST['isactive_farmer'])) {
    		$params['isactive_farmer'] = $_POST['isactive_farmer'];
    	}
    	 
    	if (isset($_POST['birthdate_farmer']) && !empty($_POST['birthdate_farmer'])) {
    		$params['birthdate_farmer'] = $_POST['birthdate_farmer'];
    	}
    	 
    	if (isset($_POST['birthplace_farmer']) && !empty($_POST['birthplace_farmer'])) {
    		$params['birthplace_farmer'] = $_POST['birthplace_farmer'];
    	}
    	 
    	if (isset($_POST['id_localite']) && !empty($_POST['id_localite'])) {
    		$params['id_localite'] = $_POST['id_localite'];
    	}
    	 
    	$tableFarmer = new Application_Model_Farmer_DbTable();
    	$gridSelect = $tableFarmer->getDbSelectByParams($params, $sortField, $sortOrder);
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
}

/* public function createAction()
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
} */
    

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