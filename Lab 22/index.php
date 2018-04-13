<?php
    require_once "util.php";

    session_start();

    include("_header.html");
    include("_lateral.html");

    $result = getProveedores();

    if(mysqli_num_rows($result) > 0){
        echo '<div class="card"><div class="card-header" data-background-color="grey">
        <h4 class="title">Proveedores</h4><p class="category">Lista de Proveedores</p></div>
        <div class="card-content table-responsive"><table class="table table-hover"><thead class="text-primary">
        <th>Nombre</th><th>Empresa</th><th>Ciudad</th><th>Dirección</th><th>RFC</th><th>Teléfono</th><th>Correo</th><th></th></thead><tbody>';
        while($row = mysqli_fetch_assoc($result)){
            echo '<tr>';
            echo '<td>' . $row["nombre"] . '</td>';
            echo '<td>' . $row["empresa"] . '</td>';
            echo '<td>' . $row["ciudad"] . '</td>';
            echo '<td>' . $row["direccion"] . '</td>';
            echo '<td>' . $row["rfc"] . '</td>';
            echo '<td>' . $row["telefono"] . '</td>';
            echo '<td>' . $row["email"] . '</td>';
            echo '<td class="td-actions">
                    <form action="edit.php" method="POST">
                        <button rel="tooltip" title="Editar" class="btn btn-primary btn-simple btn-xs" type="submit" name="edit" value="'.$row["rfc"].'"><i class="material-icons">edit</i>
                    </button>
                    </form>
                    <form action="delete.php" method="POST">
                        <button rel="tooltip" title="Eliminar" class="btn btn-danger btn-simple btn-xs" type="submit" name="del" value="'.$row["rfc"].'"><i class="material-icons">close</i>
                        </button>
                    </form>
                  </td>';
            echo '</tr>';
        }
        echo '</tbody></table></div></div>';
    }

    include("_proveedores.html");
    include("_footer.html");

?>
