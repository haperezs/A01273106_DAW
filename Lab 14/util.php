<?php

    function connectDB(){
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "labs";

        $con = mysqli_connect($servername, $username, $password, $dbname);

        if(!$con){
            die("Connection failed: " . mysqli_connect_error());
        }

        return $con;
    }

    function closeDB($mysql){
        mysqli_close($mysql);
    }

    function getProveedores(){
        $con = connectDB();
        $sql = "SELECT * FROM proveedor";

        $result = mysqli_query($con, $sql);

        closeDB($con);

        return $result;
    }

?>
