<?php


class AuthController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
       $form = new Application_Form_Login();
	   $this->view->form=$form;
	   $request=$this->getRequest();
	   
	   if($request->isPost()){
	    if($form->isValid($request->getPost())){
			if($this->_process($form->getValues()))
			{
				//recuperation des infos de lutilisateur
				$auth = Zend_Auth::getInstance();
				$ip = $_SERVER['REMOTE_ADDR'];
				$user = $auth->getIdentity()->id;
				//verifier si l'ordinateur ou le user n'a pas deja une cnx en cours
				$tableCnx = new Application_Model_DbTable_Connection();
				$cnx = $tableCnx->fetchRow("user=$user");
				if(!$cnx)
				{
					//insertion dans la table des personnes actuelment connect�es
					$tableCnx->addConnection($user,$ip);
					
					//We are authenticated, redirect me to Dashboard page
					//$this->_helper->redirector->gotoSimple('index','index');		
					$this->_helper->redirector->gotoSimple('index','dash');
				}
				else
				{
					echo "<b style='color:red;'> Vous etes deja connecte! Nouvelle refusee...</b>";
				}
			}
			
			else{
			  echo "<b style='color:red;'> Nom d'utilisateur ou mot de passe incorrect!! Essayez a nouveau </b>";
			}
		}
	   }
    }

	protected function _process($values)
    {
        // Get our authentication adapter and check credentials
        $adapter = $this->_getAuthAdapter();
        $adapter->setIdentity($values['username']);
        $adapter->setCredential($values['password']);

        $auth = Zend_Auth::getInstance();
        $result = $auth->authenticate($adapter);
        if ($result->isValid()) {
            $user = $adapter->getResultRowObject();
            $auth->getStorage()->write($user);
            return true;
        }
        return false;
    }

    protected function _getAuthAdapter()
    {
        $dbAdapter = Zend_Db_Table::getDefaultAdapter();
        $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);

        $authAdapter->setTableName('users')
                    ->setIdentityColumn('username')
                    ->setCredentialColumn('password');
                

        return $authAdapter;
    }

    public function logoutAction()
    {
		$auth = Zend_Auth::getInstance();
		$user = $auth->getIdentity()->id;
		//suppression de la table des personnes actuelment connect�es
		$tableCnx = new Application_Model_DbTable_Connection();
		$tableCnx->deleteConnection($user);
		
        Zend_Auth::getInstance()->clearIdentity();
        $this->_helper->redirector->gotoSimple('index','index'); // back to login page
    }
}

?>