<?php 
include 'conexionbd.php';

class usuarioModelo{

    private $id;
    private $usuario;
    private $password;
    private $tipousuario;
    

    function insertarUsuario($usuario,$password,$tipousuario){
        $objBaseDatos= new Conexion();
        $this->usuario = $usuario;
        $this->password = $password;
        $this->tipousuario = $tipousuario;
        $res=$objBaseDatos->prepare("call pa_usuario('','$this->usuario','$this->password','$this->tipousuario','nuevo')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function listarUsuario(){
        $objBaseDatos= new Conexion();
        $res=$objBaseDatos->prepare("call pa_usuario('','','','','listar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function editarUsuario($usuario,$password,$tipousuario,$id){
        $objBaseDatos= new Conexion();
        $this->id = $id;
        $this->usuario = $usuario;
        $this->password = $password;
        $this->tipousuario = $tipousuario;
        $res=$objBaseDatos->prepare("call pa_usuario('$this->id','$this->usuario','$this->password','$this->tipousuario','editar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function eliminarUsuario($id){
        $objBaseDatos= new Conexion();
        $this->id = $id;
        
        $res=$objBaseDatos->prepare("call pa_usuario('$this->id','','','','eliminar')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }

    function loginUsuario($usuario,$password){
        $objBaseDatos= new Conexion();
        $this->usuario = $usuario;
        $this->password = $password;
        $res=$objBaseDatos->prepare("call pa_usuario('','$this->usuario','$this->password','','login')");
        $res->execute();
        return $res;
        $res->closeCursor(); // this is not even required
        $res = null; // doing this is mandatory for connection to get closed
        $objBaseDatos=null;
    }





}


?>