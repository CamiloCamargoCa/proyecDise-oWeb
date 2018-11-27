<?php 


include '../../controladores/productoControlador.php';

if(isset($_POST['nombre']) && !empty($_POST['nombre']) &&
	isset($_POST['precio']) && !empty($_POST['precio']) &&
	isset($_POST['descripcion']) && !empty($_POST['descripcion'])){

    $nombre=$_POST['nombre'];
    $precio=$_POST['precio'];
    $descripcion=$_POST['descripcion'];
    $objLogin=new productoControlador();
    $objLogin->ingresarPro($nombre,$precio,$descripcion);
    echo "dato insertado con exito";
}else{
    echo "Por favor registre todos los campos completos";
}





?>
