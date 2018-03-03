<?php
    require_once "util.php";

    session_start();

    include("_header.html");
    include("_lateral.html");

    $result = getProveedores();

    if(mysqli_num_rows($result) > 0){
        echo '<div class="card"><div class="card-header" data-background-color="grey">';
        echo '<h4 class="title">Proveedores</h4><p class="category">Lista de Proveedores</p></div>';
        echo '<div class="card-content table-responsive"><table class="table table-hover"><thead class="text-primary">';
        echo '<th>Nombre</th><th>Empresa</th><th>Ciudad</th><th>Dirección</th><th>RFC</th><th>Teléfono</th><th>Correo</th></thead><tbody>';
        while($row = mysqli_fetch_assoc($result)){
            echo '<tr>';
            echo '<td>' . $row["nombre"] . '</td>';
            echo '<td>' . $row["empresa"] . '</td>';
            echo '<td>' . $row["ciudad"] . '</td>';
            echo '<td>' . $row["direccion"] . '</td>';
            echo '<td>' . $row["rfc"] . '</td>';
            echo '<td>' . $row["telefono"] . '</td>';
            echo '<td>' . $row["email"] . '</td>';
            echo '</tr>';
        }
        echo '</tbody></table></div>';
    }

    include("_proveedores.html");
    include("_footer.html");

?>
