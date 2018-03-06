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

    function insertProveedores($rfc, $nombre, $empresa, $telefono, $direccion, $ciudad, $email){
        $con = connectDB();

        $query = "INSERT INTO proveedor (rfc, nombre, empresa, telefono, direccion, ciudad, email) VALUES (?,?,?,?,?,?,?)";

        if(!($statement = $con->prepare($query))) {
            die("Preparation failed: (" . $con->errno . ") " . $con->error);
        }

        if(!$statement->bind_param("sssssss", $rfc, $nombre, $empresa, $telefono, $direccion, $ciudad, $email)){
            die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error);
        }

        if(!$statement->execute()) {
            die("Execution failed: (" . $statement->errno . ") " . $statement->error);
        }

        mysqli_free_result($results);
        closeDB($con);
    }

    function delete_by_id($id){
        $con = connectDB();

        $sql = 'DELETE FROM proveedor WHERE idProveedor = "' . $id . '"';

        $result = mysqli_query($con, $sql);

        closeDB($con);

        return $result;
    }

?>
