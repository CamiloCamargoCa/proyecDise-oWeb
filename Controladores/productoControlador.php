<?php 
include '../Modelos/usuarioModelo.php';

class productoControlador {

    function ingresarPro($nombre,$precio,$descripcion){
        $objModelo=new productoModelo();
        $res=$objModelo->insertarproducto($nombre,$precio,$descripcion);  
    }

    function listarPro(){
        $objModelo=new productoModelo();
        $res=$objModelo->listarproducto();
        $datos=$res->fetchAll();
        foreach ($res as $row) {
        $datos[]=$row;
        }
        echo(json_encode($datos)); 
	}

    function modificarPro($nombre,$precio,$descripcion,$id){
        $objModelo=new productoModelo();
        $res=$objModelo->editarproducto($nombre,$precio,$descripcion,$id);  
    }

    function eliminaPro($id){
        $objModelo=new productoModelo();
        $res=$objModelo->eliminarproducto($id);  
    }

}

?>