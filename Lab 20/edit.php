<?php
    require_once "util.php";

    session_start();

    include("_header.html");
    include("_lateral.html");

    $result = getProveedorId($_POST["edit"]);

    if(mysqli_num_rows($result) > 0){
        while($row = mysqli_fetch_assoc($result)){

            $nombre = $row["nombre"];
            $empresa = $row["empresa"];
            $ciudad = $row["ciudad"];
            $direccion = $row["direccion"];
            $rfc = $row["rfc"];
            $telefono = $row["telefono"];
            $email = $row["email"];

        }
    }

    include("_editarProveedor.html");

    include("_footer.html");

 ?>
