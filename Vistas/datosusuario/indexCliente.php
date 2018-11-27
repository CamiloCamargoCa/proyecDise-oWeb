<?php 
require('../head2.php');
$head = head();
print_r($head);

session_start();

//Validar si se está ingresando con sesión correctamente
if (!$_SESSION) {
  echo '<script language = javascript>
alert("usuario no autenticado")
self.location = "../login.php"
</script>';
}

$id = $_SESSION['ID'];
 $usu = $_SESSION['usuario']; 
 $tip = $_SESSION['tip'];

/*navegador de opcionees*/
echo"
<nav class='navbar navbar-expand-sm bg-dark navbar-dark'>
  <a class='navbar-brand' href='indexCliente.php'>
    <img src='../../img/logo.jpg' alt='Logo' style='width:40px;'>
  </a>
  <ul class='navbar-nav'>
    <li class='nav-item active'>
      <a class='nav-link' href='datoscliente.php'>Mis Datos</a>
    </li>
    <li class='nav-item'>
      <a class='nav-link' href='domicilio.php'>Pide a domicilio</a>
    </li>
    <li class='nav-item'>
      <a class='nav-link' href='orden.php'>Verifica Tu Orden</a>
    </li>
    <li class='nav-item'>
      <a class='nav-link disabled' href='terminos.php'>Terminos & Condiciones</a>
    </li>
  </ul>
</nav>";



$exibirModal = false;

if(!isset($_COOKIE["mostrarModal"]))
{

  $expirar = 60; 
  setcookie('mostrarModal', 'SI', (time() + $expirar)); 

  $exibirModal = true;
}

/* Modal para el ingreso de los usaurios*/

echo "
<div class='container'>
  <!-- The Modal -->
  <div class='modal fade' id='myModal'>
    <div class='modal-dialog'>
      <div class='modal-content'>
      
        <!-- Modal Header -->
        <div class='modal-header'>
          <h4 class='modal-title'>Antes de iniciar por favor regalanos tus datos</h4>
          <button type='button' class='close' data-dismiss='modal'>&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class='modal-body'>
        <form>
        <fieldset>

          <div class='form-group'>
            <label for='exampleInputEmail1'>Nombre</label>
            <input type='text' class='form-control' id='nombre' aria-describedby='emailHelp' placeholder='Nombre'>
          </div>

          <div class='form-group'>
            <label for='exampleInputEmail1'>Direccion</label>
            <input type='text' class='form-control' id='direccion' aria-describedby='emailHelp' placeholder='Direccion'>
          </div>

          <div class='form-group'>
            <label for='exampleInputPassword1'>Telefono</label>
            <input type='text' class='form-control' id='telefono' placeholder='Telefono'>
          </div>

          <div class='form-group'>
            <label for='exampleInputPassword1'>Identificacion</label>
            <input type='text' class='form-control' id='identificacion' placeholder='Identificacion'>
          </div>

          <button type='submit' class='btn btn-primary'>Ingresar Datos</button>
        </fieldset>
      </form>
        </div>
        
        <!-- Modal footer -->
        <div class='modal-footer'>
          <button type='button' class='btn btn-danger' data-dismiss='modal'>Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>";

echo"
    <div class='container'>
      <h2>Pide tu domiclio</h2><br><br>
      <p class='text-primary'>Somos mas eficientes y mas rapidos que rappi y domicilios.com xD</p> <br><br><br>
      <img src='../../img/comida.jpg' class='float-left' alt='Comida' width='304' height='236'> 
      <img src='../../img/essen.png' class='float-center' alt='Essen' width='304' height='236'>
      <img src='../../img/resturante.jpg' class='float-right' alt='Restaurante' width='304' height='236'> 
    </div>";


/*Mostrar el modal */


if($exibirModal === true) : 
  echo"
  <script>
  $(document).ready(function()
  {
    // id de nuestro modal
    $('#myModal').modal('show');
  });
  </script>";
   endif




?>