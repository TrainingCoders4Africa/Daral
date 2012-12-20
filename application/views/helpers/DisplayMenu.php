<?php
class Zend_View_Helper_DisplayMenu extends Zend_View_Helper_Abstract 
{
    public function displayMenu ()
    {
                $auth = Zend_Auth::getInstance();
				$request = Zend_Controller_Front::getInstance()->getRequest();
                $controller = $request->getControllerName();
                
                
	
		if($auth->hasIdentity()) 
		{
           
			$farmer = new Application_Model_Farmer_DbTable_Farmer();
			$user = new Application_Model_Users_DbTable_Users();
			 
			
			$daral_current = $user->getDaral(); 
			
          
          if($controller != 'index' && $controller !='auth')
		  {
		   
		   $dash=$this->view->baseUrl().'/dash';
		   $daral=$this->view->baseUrl().'/daral';
		   $farmer=$this->view->baseUrl().'/farmer';
		   $cheptel=$this->view->baseUrl().'/cheptel';
		   $notification=$this->view->baseUrl().'/notification';
		   $media=$this->view->baseUrl().'/media';			
		   $veterinaire=$this->view->baseUrl().'/veterinaire';
		   
            return '
			        <div class="navbar-inner">
			        <div class="container">
					<span class="brand" href="#">DARAL '.$daral_current.'</span>
                       <ul class="nav pull-right">
					       <li class="divider-vertical"><a href="'.$dash.'"><span>Tableau de bord</span></a></li>
	                       <li class="divider-vertical"><a href="'.$daral.'">Darals</a></li> 
	                       <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="'.$farmer.'"> Eleveur <b class="caret"></b> </a>
					          <ul class="dropdown-menu">
					            <li><a href="'.$farmer.'/add">Inscription</a></li>
					             <li><a href="'.$farmer.'">Liste des eleveurs</a></li>
					            <li><a href="#">Recherche</a></li>
					          </ul>						   
						   </li>
	                       <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="'.$cheptel.'"> Cheptel <b class="caret"></b> </a>
					          <ul class="dropdown-menu">
					            <li><a href="'.$cheptel.'/add">Enregistrement</a></li>
					            <li><a href="'.$cheptel.'">Liste</a></li>
					            <li><a href="#">Mouvements</a></li>
					            <li><a href="#">Recherche</a></li>
					          </ul>						   
						   </li>
	                       <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="'.$notification.'"> Notifications <b class="caret"></b> </a>
					          <ul class="dropdown-menu">
					            <li><a href="'.$notification.'/create">Nouvelle notification</a></li>
					            <li><a href="'.$notification.'">Historique</a></li>
					            <li><a href="#">Recherche</a></li>
					            
					          </ul>						   
						   </li>
	                       <li class="divider-vertical"><a href="'.$media.'">Mediatheque</a></li>
	                       <li class="divider-vertical"><a href="'.$veterinaire.'">Veterinaires</a></li>
	                       
						</ul>
					</div>
					</div>';
			}
		}  

    }
	
	
}