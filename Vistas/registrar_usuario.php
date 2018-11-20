<?php 

include '../controladores/usuarioControlador.php';

if(isset($_POST['usuario']) && !empty($_POST['usuario']) &&
	isset($_POST['password']) && !empty($_POST['password']) &&
	isset($_POST['tipousuario']) && !empty($_POST['tipousuario'])){

    $usuario=$_POST['usuario'];
    $password=$_POST['password'];
    $tipousuario=$_POST['tipousuario'];
    $objLogin=new usuarioControlador();
    $objLogin->ingresarUsu($usuario,$password,$tipousuario);
    echo "dato insertado con exito";
}else{
    echo "Por favor registre todos los campos completos";
}





?>
