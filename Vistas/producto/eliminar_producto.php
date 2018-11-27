<?php  

include '../../controladores/productoControlador.php';

if(isset($_REQUEST['idproducto']) && !empty($_REQUEST['idproducto'])){

    $idproducto=$_REQUEST['idproducto'];
   
    $objLogin=new productoControlador();
    $objLogin->eliminaPro($idproducto);
    echo "producto eliminado";
}else{
    echo "error al eliminar producto";
}

?>