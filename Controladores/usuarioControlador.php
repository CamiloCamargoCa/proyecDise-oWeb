<?php 
include '../Modelos/usuarioModelo.php';

class usuarioControlador {

    function ingresarUsu($usuario,$password,$tipousuario){
        $objModelo=new usuarioModelo();
        $res=$objModelo->insertarUsuario($usuario,$password,$tipousuario);
        
        
	}

}

?>