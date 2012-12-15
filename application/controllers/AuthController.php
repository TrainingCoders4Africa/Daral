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
			if($this->_process($form->getValues())){
			//We are authenticated, redirect me to Dashboard page
			//$this->_helper->redirector->gotoSimple('index','index');		
			$this->_helper->redirector->gotoSimple('index','dash');
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
        Zend_Auth::getInstance()->clearIdentity();
        $this->_helper->redirector->gotoSimple('index','index'); // back to login page
    }
}

?>