<?php 
include '../../controladores/datosusuControlador.php';

if(isset($_POST['id']) && !empty($_POST['id'])){

$id=$_POST['id'];
$objLogin=new datosusuarioControlador();
$objLogin->listarUsu($id);
echo "dato insertado con exito";
}else{
echo "Por favor registre todos los campos completos";
}
?>