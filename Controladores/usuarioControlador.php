<?php 
include '../Modelos/usuarioModelo.php';

class usuarioControlador {

    function ingresarUsu($usuario,$password,$tipousuario){
        $objModelo=new usuarioModelo();
        $res=$objModelo->insertarUsuario($usuario,$password,$tipousuario);  
    }

    function listarUsu(){
        $objModelo=new usuarioModelo();
        $res=$objModelo->listarUsuario();
        $datos=$res->fetchAll();
        foreach ($res as $row) {
        $datos[]=$row;
        }
        echo(json_encode($datos)); 
	}



}

?>