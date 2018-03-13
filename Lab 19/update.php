<?php

    session_start();
    require_once("util.php");

    update($_POST["rfc"], $_POST["nombre"], $_POST["empresa"], $_POST["telefono"], $_POST["direccion"], $_POST["ciudad"], $_POST["correo"], $proveedor);

    header("location: index.php");

?>
