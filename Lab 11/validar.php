<?php
  $currentPage = "0";
  $msg = "0";

  include("_header.html");
  include("_lateral.html");

  if(isset($_POST["nombre"]) && isset($_POST["encargado"]) && isset($_POST["direccion"]) && isset($_POST["telefono"]) && isset($_POST["ciudad"]) && isset($_POST["estado"]) && isset($_POST["pais"]) && isset($_POST["zip"])){

    if($_POST["ciudad"] =="celaya"){
      if($_POST["estado"] != "guanajuato"){
        $msg = "La ciudad de Celaya no se encuentra en el estado seleccionado";
      }
    }

    if($_POST["ciudad"] =="leon"){
      if($_POST["estado"] != "guanajuato"){
        $msg = "La ciudad de Leon no se encuentra en el estado seleccionado";
      }
    }

    if($_POST["ciudad"] =="queretaro"){
      if($_POST["estado"] != "queretaro"){
        $msg = "La ciudad de Querétaro no se encuentra en el estado seleccionado";
      }
    }

    if(is_numeric($_POST["zip"]) != true){
        $msg = "Código postal no válido. Solo se permiten caractéres numéricos ";
    }

    if(strlen($_POST["zip"]) != 5){
        $msg = "Código postal no válido. Digitos faltantes";
    }

    if(is_numeric($_POST["telefono"]) != true){
        $msg = "Número de teléfono no válido. Solo se permiten caractéres numéricos ";
    }

    if(strlen($_POST["telefono"]) != 10){
        $msg = "Número de teléfono no válido. Digitos faltantes";
    }
    
  }else{
    $msg = "Error. Campos incompletos";
  }

  if($msg == "0"){
    header("Location: exito.php");
  }

  include("_resultado.html");
  include("_footer.html");

?>
