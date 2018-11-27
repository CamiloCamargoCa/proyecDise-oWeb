<?php 

include '../../controladores/productoControlador.php';

if(isset($_POST['nombre']) && !empty($_POST['nombre']) &&
	isset($_POST['precio']) && !empty($_POST['precio']) &&
	isset($_POST['descripcion']) && !empty($_POST['descripcion']) &&
	isset($_POST['idproducto']) && !empty($_POST['idproducto'])){

    $idproducto=$_POST['idproducto'];
    $nombre=$_POST['nombre'];
    $precio=$_POST['precio'];
    $descripcion=$_POST['descripcion'];
    $objLogin=new productoControlador();
    $objLogin->modificarPro($nombre,$precio,$descripcion,$idproducto);
    echo "producto modificado con exito";
}else{
    echo "Por favor registre todos los campos completos";
}





?>
