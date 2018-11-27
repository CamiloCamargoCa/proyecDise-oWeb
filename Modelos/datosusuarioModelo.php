<?php 
include 'conexionbd.php';
class datosusuario{
    private $id;
    private $nombre;
    private $direccion;
    private $telefono;
    private $identificacion;
    private $usuario;

    function insertardatosusu($nombre,$direccion,$telefono,$identificacion,$usuario){
        $objBaseDatos= new Conexion();
        $this->nombre = $nombre;
        $this->direccion = $direccion;
        $this->telefono = $telefono;
        $this->identificacion = $identificacion;
        $this->usuario = $usuario;
        $res=$objBaseDatos->prepare("call pa_datos_usu('','$this->usuario','$this->direccion','$this->telefono','$this->identificacion','$this->usuario,'nuevo')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;

    }

    function editardatosusu($id,$nombre,$direccion,$telefono,$identificacion,$usuario){
        $objBaseDatos= new Conexion();
        $this->id = $id;
        $this->nombre = $nombre;
        $this->direccion = $direccion;
        $this->telefono = $telefono;
        $this->identificacion = $identificacion;
        $this->usuario = $usuario;
        $res=$objBaseDatos->prepare("call pa_datos_usu('$this->id','$this->nombre','$this->direccion','$this->telefono','$this->identificacion','$this->usuario','editar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function eliminardatosusu($id){
        $objBaseDatos= new Conexion();
        $this->id = $id;
        
        $res=$objBaseDatos->prepare("call pa_datos_usu('$this->id','','','','','','eliminar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function listardatosusu($id){
        $objBaseDatos= new Conexion();
        $this->id = $id;
        $res=$objBaseDatos->prepare("call pa_datos_usuario('$this->id','','','','','','listar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }
}



?>