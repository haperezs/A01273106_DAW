<?php
    session_start();

    if(isset($_SESSION["usuario"]) ) {
        include("_header.html");
        $user = $_SESSION["usuario"];

        include("_principal.html");
        include("_footer.html");

    }else if ($_POST["usuario"]=="betuki" && $_POST["pwd"]=="123" ) {
        unset($_SESSION["error"]);

        $_SESSION["usuario"] = $_POST["usuario"];
        $user = $_SESSION["usuario"];

        include("_header.html");
        include("_principal.html");
        include("_footer.html");

    }else if($_POST["usuario"]!="betuki" || $_POST["pwd"]!="123") {
        $_SESSION["error"] = "Usuario y/o contraseña incorrectos";
        header("location: index.php");
    }

?>
