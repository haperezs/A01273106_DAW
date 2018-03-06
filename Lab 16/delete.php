<?php

    session_start();
    require_once("util.php");

    delete_by_id($_POST["delete"]);

    header("location: index.php");

?>
