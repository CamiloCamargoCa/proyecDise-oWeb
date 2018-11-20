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
        $objBaseDatos=null;
    }

    function listarUsuario(){
        $objBaseDatos= new Conexion();
        $res=$objBaseDatos->prepare("call pa_usuario('','','','','listar')");
        $res->execute();
        return $res;
        $objBaseDatos=null;
    }





}


?>