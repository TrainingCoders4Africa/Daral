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
   
    <!----------- TABLEAU DE BORD ------------>
    <div class="sidebar-nav">
        <a href="'.$dash.'" class="nav-header"><i class="icon-th-large"></i>Tableau de bord</a>
    <!------------------END------------------->
        
            
   <!--------------MON DARAL------------------>
        <a href="#mon-daral-menu" class="nav-header" data-toggle="collapse"><i class="icon-home"></i>Mon Daral<i class="icon-chevron-up" id="chevron-mon-daral" style="margin-left:8.3em"></i></a>
        <ul id="mon-daral-menu" class="nav nav-list in collapse">
        
        <script type="text/javascript">
        $("a").click(function(){
		  $(this).find("i#chevron-mon-daral").toggleClass("icon-chevron-down icon-chevron-up");
		  
		  });
        </script>
           
            <li> <a href="#eleveur-menu" class="nav-header " data-toggle="collapse" ><i class="icon-chevron-right" id="chevron-eleveurs"></i>Eleveurs</a></li>
              <ul id="eleveur-menu" class="nav nav-list collapse">
              <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-eleveurs").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$farmer.'/add">Inscrire</a></li>
               <li ><a href="'.$farmer.'">Afficher la Liste</a></li>
               <li ><a href="'.$farmer.'/recherche">Rechercher</a></li>
             </ul>
             
             <li> <a href="#cheptel-menu" class="nav-header " data-toggle="collapse" ><i class="icon-chevron-right" id="chevron-cheptel"></i>Cheptel</a></li>
              <ul id="cheptel-menu" class="nav nav-list collapse">
              <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-cheptel").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$cheptel.'/add">Ajouter des animaux</a></li>
               <li ><a href="'.$cheptel.'">Afficher le Cheptel</a></li>
               <li ><a href="'.$cheptel.'/recherche">Rechercher</a></li>
             </ul>
             
            <li ><a href="#notification-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-chevron-right" id="chevron-notifications"></i>Notifications</a></li>
             <ul id="notification-menu" class="nav nav-list collapse">
             <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-notifications").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$notification.'/create">Nouvelle Notification</a></li>
               <li><a href="'.$notification.'">Historique</a></li>
             </ul>
        
        </ul>
        
   <!---------------END------------------------>
   
   <!---------------MEDIATHEQUE---------------->
        <a href="#media-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-film"></i>Mediatheque<i class="icon-chevron-down" id="chevron-media" style="margin-left: 7.0em"></i></a>
         <ul id="media-menu" class="nav nav-list collapse">
         <script type="text/javascript">
        $("a").click(function(){
		  $(this).find("i#chevron-media").toggleClass("icon-chevron-down icon-chevron-up");
		  
		  });
        </script>
               <li ><a href="'.$media.'">Liste des videos</a></li>
               <li><a href="#">Recherche</a></li>
         </ul>
   <!----------------END----------------------->

   <!---------------STATISTIQUES--------------->
         <a href="#stat-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-filter"></i>Statistiques<i class="icon-chevron-down" id="chevron-stat" style="margin-left:7.7em"></i></a>
         <ul id="stat-menu" class="nav nav-list collapse">
         <script type="text/javascript">
        $("a").click(function(){
		  $(this).find("i#chevron-stat").toggleClass("icon-chevron-down icon-chevron-up");
		  
		  });
        </script>
               <li ><a href="'.$daral.'">Darals</a></li>
               <li><a href="#">Localites</a></li>
               <li><a href="#">Departements</a></li>
               <li><a href="#">Regions</a></li>
               <li><a href="#">Pays</a></li>
         </ul>
   <!----------------END----------------------->
   
   <!---------------CONTACTS------------------->
        <a href="#contact-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-book"></i>Contacts<i class="icon-chevron-down" id="chevron-contacts" style="margin-left:8.8em"></i></a>
         <ul id="contact-menu" class="nav nav-list collapse">
         <script type="text/javascript">
        $("a").click(function(){
		  $(this).find("i#chevron-contacts").toggleClass("icon-chevron-down icon-chevron-up");
		  
		  });
        </script>
               <li ><a href="'.$veterinaire.'">Veterinaires</a></li>
               <li><a href="#">Administrateur</a></li>
               <li><a href="#">Autres Gerants</a></li>
         </ul>
         
   <!---------------END------------------------>
    </div>
            
            	
                ';
			}
		}  

    }
	
	
}