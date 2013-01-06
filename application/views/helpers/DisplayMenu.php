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
			<div class="navbar-inner" >
                <ul class="nav pull-right">
                    
                    
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon-user"></i>'.$this->view->loggedInAs().'
                            <i class="icon-caret-down"></i>
                        </a>

                        <ul class="dropdown-menu">
                            <li><a tabindex="-1" href="#">My Account</a></li>
                            <li class="divider"></li>
                            <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
                            <li class="divider visible-phone"></li>
                            <li><a tabindex="-1" href="sign-in.html">Logout</a></li>
                        </ul>
                    </li>
                    
                </ul>
                <span class="brand" href="#">DARAL '.$daral_current.'</span>
        </div>
    </div>
   
    <div class="sidebar-nav">
        <a href="'.$dash.'" class="nav-header"><i class="icon-th-large"></i>Tableau de bord</a>
        
            
        
        <a href="#mon-daral-menu" class="nav-header" data-toggle="collapse"><i class="icon-home"></i>Mon Daral</a>
        <ul id="mon-daral-menu" class="nav nav-list collapse">
           
            <li> <a href="#eleveur-menu" class="nav-header " data-toggle="collapse" >Eleveurs</a></li>
              <ul id="eleveur-menu" class="nav nav-list collapse">
               <li ><a href="'.$farmer.'">Liste</a></li>
               <li ><a href="'.$farmer.'/add">Inscription</a></li>
               <li ><a href="#">Recherche</a></li>
             </ul>
             
            <li ><a href="#notification-menu" class="nav-header collapsed" data-toggle="collapse">Notifications</a></li>
             <ul id="notification-menu" class="nav nav-list collapse">
               <li ><a href="'.$notification.'/create">Nouvelle Notification</a></li>
               <li><a href="'.$notification.'">Historique</a></li>
             </ul>
        
        </ul>
        <a href="#media-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-film"></i>Mediatheque</a>
         <ul id="media-menu" class="nav nav-list collapse">
               <li ><a href="'.$media.'">Liste des videos</a></li>
               <li><a href="#">Recherche</a></li>
         </ul>
		
         <a href="#stat-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-filter"></i>Statistiques</a>
         <ul id="stat-menu" class="nav nav-list collapse">
               <li ><a href="#">Darals</a></li>
               <li><a href="#">Localites</a></li>
               <li><a href="#">Departements</a></li>
               <li><a href="#">Regions</a></li>
               <li><a href="#">Pays</a></li>
         </ul>
        <a href="#contact-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-book"></i>Contacts</a>
         <ul id="contact-menu" class="nav nav-list collapse">
               <li ><a href="'.$veterinaire.'">Veterinaires</a></li>
               <li><a href="#">Administrateur</a></li>
               <li><a href="#">Autres Gerants</a></li>
         </ul>
    </div>
            
            	
                ';
			}
		}  

    }
	
	
}