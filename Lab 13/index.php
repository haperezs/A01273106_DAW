<?php
    session_start();

    if(isset($_SESSION["usuario"]) ) {
        header("location: inView.php");
    } else {
        include("_header.html");
        include("_iniciar.html");
        include("_footer.html");
    }

?>
