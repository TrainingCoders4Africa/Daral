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
			$tableUsers = new Application_Model_Users_DbTable();
			
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
		   $animaltype=$this->view->baseUrl().'/animaltype';
		   $animal=$this->view->baseUrl().'/animal';
		   $typenotification=$this->view->baseUrl().'/typenotification';
		   $users=$this->view->baseUrl().'/users';
		   $daral=$this->view->baseUrl().'/daral';
		   $localite=$this->view->baseUrl().'/localite';
		   $departement=$this->view->baseUrl().'/departement';
		   $region=$this->view->baseUrl().'/region';
		   $national=$this->view->baseUrl().'/national';
		   $maladie=$this->view->baseUrl().'/maladie';
		   $langue=$this->view->baseUrl().'/langue';
		   $transactions=$this->view->baseUrl().'/transactions';
		   
            $html = '
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
    <!------------------END------------------->';
        
            if ($tableUsers->isAdmin())
            {
            	$html.='
            			<!---------------CONSOLE ADMIN---------------->
        <a href="#admin-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-cog"></i>Administration<i class="icon-chevron-down" id="chevron-admin" style="margin-left: 6.5em"></i></a>
         <ul id="admin-menu" class="nav nav-list collapse">
         <script type="text/javascript">
        $("a").click(function(){
		  $(this).find("i#chevron-admin").toggleClass("icon-chevron-down icon-chevron-up");
		  
		  });
        </script>
               
            <li> <a href="#daral-menu" class="nav-header " data-toggle="collapse" ><i class="icon-chevron-right" id="chevron-daral"></i>Gestion daral</a></li>
              <ul id="daral-menu" class="nav nav-list collapse">
              <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-daral").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$daral.'">Liste</a></li>
               <li ><a href="'.$daral.'/create">Ajouter</a></li>
             </ul>

               		<li> <a href="#users-menu" class="nav-header " data-toggle="collapse" ><i class="icon-chevron-right" id="chevron-users"></i>Gestion Utilisateurs</a></li>
              <ul id="users-menu" class="nav nav-list collapse">
              <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-users").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$users.'">Liste</a></li>
               <li ><a href="'.$users.'/create">Ajouter</a></li>
             </ul>
               		
            <li> <a href="#animal-menu" class="nav-header " data-toggle="collapse" ><i class="icon-chevron-right" id="chevron-animal"></i>Type Animal</a></li>
              <ul id="animal-menu" class="nav nav-list collapse">
              <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-animal").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$animaltype.'">Liste</a></li>
               <li ><a href="'.$animaltype.'/create">Ajouter</a></li>
             </ul>
             
            <li ><a href="#type-notification-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-chevron-right" id="chevron-type-notification"></i>Type Notification</a></li>
             <ul id="type-notification-menu" class="nav nav-list collapse">
             <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-type-notification").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$typenotification.'">Liste</a></li>
               <li><a href="'.$typenotification.'/create">Ajouter</a></li>
             </ul>
               		
              <li> <a href="#localite-menu" class="nav-header " data-toggle="collapse" ><i class="icon-chevron-right" id="chevron-localite"></i>Localite</a></li>
              <ul id="localite-menu" class="nav nav-list collapse">
              <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-localite").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$localite.'">Liste</a></li>
               <li ><a href="'.$localite.'/create">Ajouter</a></li>
             </ul>
               		
               		 <li> <a href="#maladie-menu" class="nav-header " data-toggle="collapse" ><i class="icon-chevron-right" id="chevron-maladie"></i>Maladie</a></li>
              <ul id="maladie-menu" class="nav nav-list collapse">
              <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-maladie").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$maladie.'">Liste</a></li>
               <li ><a href="'.$maladie.'/create">Ajouter</a></li>
             </ul>
               		
               		 <li> <a href="#langue-menu" class="nav-header " data-toggle="collapse" ><i class="icon-chevron-right" id="chevron-langue"></i>Langue</a></li>
              <ul id="langue-menu" class="nav nav-list collapse">
              <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-langue").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$langue.'">Liste</a></li>
               <li ><a href="'.$langue.'/create">Ajouter</a></li>
             </ul>
               		
         </ul>
   <!----------------END----------------------->';
            }	
            	
   $html.='<!--------------MON DARAL------------------>
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
               <li ><a href="'.$animal.'/recherche">Rechercher</a></li>
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
             
             <li ><a href="#transaction-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-chevron-right" id="chevron-transactions"></i>Transactions</a></li>
             <ul id="transaction-menu" class="nav nav-list collapse">
             <script type="text/javascript">
              $("a").click(function(){
		      $(this).find("i#chevron-transactions").toggleClass("icon-chevron-right icon-chevron-down");
		  
		      });
              </script>
               <li ><a href="'.$transactions.'/new">Nouvelle</a></li>
               <li><a href="'.$transactions.'/index">Historique</a></li>
                <li><a href="'.$transactions.'/recherche">Rechercher</a></li>
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
               <li ><a href="'.$daral.'/choose">Darals</a></li>
               <li><a href="'.$localite.'/choose">Localites</a></li>
               <li><a href="'.$departement.'/choose">Departements</a></li>
               <li><a href="'.$region.'/choose">Regions</a></li>
               <li><a href="'.$national.'/displaystat">Pays</a></li> 
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
               <li><a href="'.$users.'/admin">Administrateur</a></li>
               <li><a href="'.$users.'/gerant">Autres Gerants</a></li>
         </ul>
         
   <!---------------END------------------------>
    </div>
            
            	
                ';
            return $html;
			}
		}  

    }
	
	
}
