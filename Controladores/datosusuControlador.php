<?php 
include '../Modelos/datosusuarioModelo.php';
class datosusuarioControlador{
    function ingresardatosUsu($nombre,$direccion,$telefono,$identificacion,$usuario){
        $objModelo=new datosusuario();
        $res=$objModelo->insertardatosusu($nombre,$direccion,$telefono,$identificacion,$usuario);  
    }

    function listarUsu($id){
        $objModelo=new datosusuario();
        $res=$objModelo->listardatosusu();
        $datos=$res->fetchAll();
        foreach ($res as $row) {
        $datos[]=$row;
        }
        echo(json_encode($datos)); 
	}

    function modificarUsu($id,$nombre,$direccion,$telefono,$identificacion,$usuario){
        $objModelo=new datosusuario();
        $res=$objModelo->editardatosusu($id,$nombre,$direccion,$telefono,$identificacion,$usuario);  
    }

    function eliminaUsu($id){
        $objModelo=new datosusuario();
        $res=$objModelo->eliminardatosusu($id);  
    }
}

?>