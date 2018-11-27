<?php 
include 'conexionbd.php';

class usuarioProducto{

    private $id;
    private $nombre;
    private $precio;
    private $descripcion;
    

    function insertarProducto($nombre,$precio,$descripcion){
        $objBaseDatos= new Conexion();
        $this->nombre = $nombre;
        $this->precio = $precio;
        $this->descripcion = $descripcion;
        $res=$objBaseDatos->prepare("call pa_producto('','$this->nombre','$this->precio','$this->descripcion','nuevo')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function listarProducto(){
        $objBaseDatos= new Conexion();
        $res=$objBaseDatos->prepare("call pa_producto('','','','','listar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function editarProducto($nombre,$precio,$descripcion,$id){
        $objBaseDatos= new Conexion();
        $this->id = $id;
        $this->nombre = $nombre;
        $this->precio = $precio;
        $this->descripcion = $descripcion;
        $res=$objBaseDatos->prepare("call pa_producto('$this->id','$this->nombre','$this->precio','$this->descripcion','editar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function eliminarProducto($id){
        $objBaseDatos= new Conexion();
        $this->id = $id;
        
        $res=$objBaseDatos->prepare("call pa_producto('$this->id','','','','eliminar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

}


?>