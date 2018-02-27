<?php
    session_start();

    if(isset($_SESSION["usuario"]) ) {
        include("_header.html");
        include("_subir_imagen.html");
        include("_footer.html");

    }else{
        header("location: index.php");
    }
?>
