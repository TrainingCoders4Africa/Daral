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
		   $dash= $this->view->url(array('controller'=>'dash','action'=>'index'));
		   $daral= $this->view->url(array('controller'=>'daral','action'=>'index'));
		   $farmer= $this->view->url(array('controller'=>'farmer','action'=>'index'));
		   $cheptel = $this->view->url(array('controller'=>'cheptel','action'=>'index'));
		   $notification = $this->view->url(array('controller'=>'notification','action'=>'index'));
		   $media = $this->view->url(array('controller'=>'media','action'=>'index'));
		   $veterinaire = $this->view->url(array('controller'=>'veterinaire','action'=>'index'));
		   
		   
            return '
			        <div class="navbar-inner">
			        <div class="container">
					<a class="brand" href="#">DARAL</a>
                       <ul class="nav pull-right">
					       <li class="divider-vertical"><a href="'.$dash.'"><span>Tableau de bord</span></a></li>
	                       <li class="divider-vertical"><a href="'.$daral.'">Darals</a></li> 
	                       <li class="divider-vertical"><a href="'.$farmer.'">Eleveurs</a></li>
						   <li class="divider-vertical"><a href="'.$cheptel.'">Cheptel</a></li>
	                       <li class="divider-vertical"><a href="'.$notification.'"><span>Notifications</span></a></li>
	                       <li class="divider-vertical"><a href="'.$media.'">Mediatheque</a></li>
	                       <li class="divider-vertical"><a href="'.$veterinaire.'">Veterinaires</a></li>
	                       <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" href="#"> Temoignages(test) <b class="caret"></b> </a>
					          <ul class="dropdown-menu">
					            <li><a href="#">Dompteurs</a></li>
					            <li><a href="#">Zoos</a></li>
					            <li><a href="#">Chasseurs</a></li>
					            <li class="divider"></li>
					            <li><a href="#">Autres temoignages</a></li>
					          </ul>
					        </li>
						</ul>
					</div>
					</div>
					<h3>Daral '.$daral_current.'</h3>';
			}
		}  

    }
	
	
}