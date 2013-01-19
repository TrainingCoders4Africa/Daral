
<?php

/**
 * Form definition for table animal.
 *
 * @package Daral
 * @author Zodeken
 * @version $Id$
 *
 */
class Application_Form_EditAnimalphotofront extends Zend_Form
{
    public function init()
    {
        $this->setMethod('post');
        $this->setAttrib('enctype', 'multipart/form-data');



        $tableFarmer = new Application_Model_Farmer_DbTable();
        $this->addElement(
            $this->createElement('text', 'fk_id_farmer')
                ->setLabel('Identifiant Eleveur')
        		->setAttrib('readonly', 'readonly')
                //->setMultiOptions(array("" => "- - Select - -") + $tableFarmer->fetchPairs())
                ->setRequired(true)
        ); 
        
       
        $photo_front = new Zend_Form_Element_File('photo_front');
        $photo_front->setDestination(IMAGE_PATH)
        ->setRequired(true)
        ->addValidator('Count', false, 1)
        // only JPEG, PNG, and GIFs
        ->addValidator('Extension', false, 'jpg,png');
        
        $this->addElement($photo_front,'photo_front');
        
        
		
       $this->addElement(
            $this->createElement('hidden', 'id')
                
        );

        parent::init();
    }
}
