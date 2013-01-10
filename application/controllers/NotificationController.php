<?php
/**
 * Controller for table notification
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class NotificationController extends Zend_Controller_Action
{
	public function indexAction()
	{
		$this->getFrontController()->getRequest()->setParams($_GET);

		// zsf = zodeken sort field, zso = zodeken sort order
		$sortField = $this->_getParam('_sf', '');
		$sortOrder = $this->_getParam('_so', '');
		$pageNumber = $this->_getParam('page', 1);

		$tableNotification = new Application_Model_Notification_DbTable();
		$gridSelect = $tableNotification->getDbSelectByParams(array('disabled'=>'0'), $sortField, $sortOrder);
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
		$form = new Application_Form_EditNotification();

		if ($this->_request->isPost()) {
			if ($form->isValid($this->_request->getPost())) {
				$values = $form->getValues();

				$tableNotification = new Application_Model_Notification_DbTable();
				$tableNotification->insert($values);

				$this->_helper->redirector('index');
				exit;
			}
		}

		$this->view->form = $form;
	}

	public function updateAction()
	{
		$tableNotification = new Application_Model_Notification_DbTable();
		$form = new Application_Form_EditNotification();
		$id = (int) $this->_getParam('id', 0);

		$row = $tableNotification->find($id)->current();

		if (!$row) {
			$this->_helper->redirector('index');
			exit;
		}

		if ($this->_request->isPost()) {
			if ($form->isValid($this->_request->getPost())) {
				$values = $form->getValues();

				$where = array('id = ?' => $id);

				$tableNotification->update($values, $where);

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
			$tableNotification = new Application_Model_Notification_DbTable();
			$tableNotification->archiveNotification($ids);
		}

		$this->_helper->redirector('index');
		exit;
	}

	/**
	 * send a sms via clickatell
	 *
	 * @param unknown_type $in_phoneNumber : phone number
	 * @param unknown_type $in_msg : content message
	 */
	function sendSmsMessage($in_phoneNumber, $in_msg)
	{
		//http://api.clickatell.com/http/sendmsg?user=sadasow&password=cogb0e25&api_id=3376817&to=221775312740&text=Message

		//en local via frontlinesms
		//$url = '/send/sms/'.urlencode(utf8_encode($in_phoneNumber)).'/'.urlencode(utf8_encode($in_msg));
		//$results = file('http://localhost:8011'.$url);

		//via clickatell
		$url = urlencode(utf8_encode($in_phoneNumber)).'&text='.urlencode(utf8_encode($in_msg));
		$results = file('http://api.clickatell.com/http/sendmsg?user=sadasow&password=cogb0e25&api_id=3376817&to='.$url);


	}

	public function sendsmsAction()
	{
		$this->getFrontController()->getRequest()->setParams($_GET);

				$farmerModel = new Application_Model_Farmer_DbTable();

				//on recupere l'objet localite contenant les informations sur la localite
				$id_localite = $this->_getParam('id_localite');
				$tableLocalite = new Application_Model_Localite_DbTable();
				$row_localite = $tableLocalite->find($id_localite)->current();

				//on recupere l'objet type de notification  contenant les informations sur le type de notification
				$type_notification = $this->_getParam('type');
				$tableNotification = new Application_Model_Typenotification_DbTable();
				$row_typeNotification = $tableNotification->find($type_notification)->current();

				//on recupere l'objet Eleveur  contenant les informations sur l'eleveur
				////recupere tous les eleveurs dont la localite est egale a celle saisie par l'utilisateur
				$id_farmer = $this->_getParam('id_farmer');
				$row_farmer = $farmerModel->getFarmerById($id_farmer);
				$farmers = $farmerModel->fetchAll("IsActive_farmer = '1' AND id_localite='".$row_localite->getName()."'");

					
				$message = '';
				//notification de type info on envoi le libelle du type de notfication
				if(stristr($row_typeNotification->getLibelle(), 'vol') === 'vol')
				{
					//notification de type vol on envoi les informations sur l'eleveur
					$message = "l'eleveur ".$row_farmer->getFirstnameFarmer()." ".$row_farmer->getLastnameFarmer().
					" a ete victime d'un ". $row_typeNotification->getLibelle()." avec le numero suivant : ".$row_farmer->getIdFarmer();
				}
				else
				{
					$message = $row_typeNotification->getLibelle();
				}

				//on parcourt la liste des eleveurs de cette localite et on leur envoi le message
				foreach($farmers as $farmer)
				{
					$this->sendSmsMessage($farmer->phone_farmer, $message);
				}

				$this->_helper->redirector('index');
				exit;
	}
}