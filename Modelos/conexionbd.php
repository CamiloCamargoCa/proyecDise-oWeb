<?php 
class Conexion extends PDO{


    public function __construct(){
    
    
        try{
            parent::__construct('mysql:host=localhost;dbname=essen','root','');
            parent::setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
            } catch(Exeption $ex){
                echo "Error con la base de datos : ".$ex->getMessage();
            }
        
        }
    }




?>