<?php  

include '../controladores/usuarioControlador.php';

if(isset($_REQUEST['idusuario']) && !empty($_REQUEST['idusuario'])){

    $idusuario=$_REQUEST['idusuario'];
   
    $objLogin=new usuarioControlador();
    $objLogin->eliminaUsu($idusuario);
    echo "Usuario eliminado";
}else{
    echo "Por favor registre todos los campos completos";
}

?>