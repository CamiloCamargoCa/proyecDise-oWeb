<?php 

include '../controladores/usuarioControlador.php';

if(isset($_REQUEST['usuario']) && !empty($_REQUEST['usuario']) &&
	isset($_REQUEST['password']) && !empty($_REQUEST['password'])){

    $usuario=$_REQUEST['usuario'];
    $password=$_REQUEST['password'];
    $objLogin=new usuarioControlador();
    $objLogin->validarUsu($usuario,$password);
    
}





?>
