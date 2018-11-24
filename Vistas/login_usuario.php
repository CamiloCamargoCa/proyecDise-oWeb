<?php 

include '../controladores/usuarioControlador.php';

if(isset($_POST['usuario']) && !empty($_POST['usuario']) &&
	isset($_POST['password']) && !empty($_POST['password'])){

    $usuario=$_POST['usuario'];
    $password=$_POST['password'];
    $objLogin=new usuarioControlador();
    $objLogin->validarUsu($usuario,$password);
    
}





?>
