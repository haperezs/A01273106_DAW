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

    function getProveedorId($rfc){
        $con = connectDB();
        $sql = 'SELECT * FROM proveedor WHERE rfc = "' . $rfc . '"';

        $result = mysqli_query($con, $sql);

        closeDB($con);

        return $result;
    }

    function insertProveedores($rfc, $nombre, $empresa, $telefono, $direccion, $ciudad, $email){
        $con = connectDB();

        $query = "CALL nuevoProveedor ('".$rfc."', '".$nombre."', '".$empresa."', '".$telefono."', '".$direccion."', '".$ciudad."', '".$email."');";

        mysqli_query($con, $query);

        closeDB($con);
    }

    function delete_by_id($rfc){
        $con = connectDB();

        $sql = 'DELETE FROM proveedor WHERE rfc = "' . $rfc . '"';

        $result = mysqli_query($con, $sql);

        closeDB($con);

        return $result;
    }

    function update($rfc, $nombre, $empresa, $telefono, $direccion, $ciudad, $email){
        $con = connectDB();

        $sql = 'UPDATE proveedor SET nombre="'.$nombre.'", empresa="'.$empresa.'", telefono="'.$telefono.'", direccion="'.$direccion.'", ciudad="'.$ciudad.'", email="'.$email.'" WHERE rfc = "' . $rfc . '"';

        $result = mysqli_query($con, $sql);

        closeDB($con);

        return $result;
    }
?>
