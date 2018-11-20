<?php 

include '../controladores/usuarioControlador.php';

if(isset($_POST['usuario']) && !empty($_POST['usuario']) &&
	isset($_POST['password']) && !empty($_POST['password']) &&
	isset($_POST['tipousuario']) && !empty($_POST['tipousuario']) &&
	isset($_POST['idusuario']) && !empty($_POST['idusuario'])){

    $idusuario=$_POST['idusuario'];
    $usuario=$_POST['usuario'];
    $password=$_POST['password'];
    $tipousuario=$_POST['tipousuario'];
    $objLogin=new usuarioControlador();
    $objLogin->modificarUsu($usuario,$password,$tipousuario,$idusuario);
    echo "usuario modificado con exito";
}else{
    echo "Por favor registre todos los campos completos";
}





?>
