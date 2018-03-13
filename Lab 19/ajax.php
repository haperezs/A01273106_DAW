<?php
    $pattern=strtolower($_GET['pattern']);

    $words=array("Amealco de Bonfil", "Arroyo Seco", "Cadereyta de Montes", "Colón", "Corregidora", "El Marqués", "Ezequiel Montes", "Huimilpan", "Jalpan de Serra", "Landa de Matamoros", "Pedro Escobedo", "Peñamiller", "Pinal de Amoles", "Querétaro", "San Joaquín", "San Juan del Río", "Tequisquiapan", "Tolimán", "Abasolo", "Acámbaro", "Apaseo el Alto", "Apaseo el Grande", "Atarjea", "Celaya", "Comonfort", "Coroneo", "Cortazar", "Cuerámaro", "Doctor Mora", "Dolores Hidalgo", "Guanajuato", "Huanímaro", "Irapuato", "Jaral del Progreso", "Jerécuaro", "León", "Manuel Doblado", "Moroleón", "Ocampo", "Pénjamo", "Pueblo Nuevo", "Purísima del Rincón", "Romita", "Salamanca", "Salvatierra", "San Diego de la Unión", "San Felipe", "San Francisco del Rincón", "San José Iturbide", "San Luis de la Paz", "San Miguel de Allende", "Santa Catarina", "Santa Cruz de Juventino Rosas", "Santiago Maravatío", "Silao de la Victoria", "Tarandacuao", "Tarimoro", "Tierra Blanca", "Uriangato", "Valle de Santiago", "Victoria", "Villagrán", "Xichú", "Yuriria");

    $response="";

    $size=0;

    for($i=0; $i<count($words); $i++)
    {
       $pos=stripos(strtolower($words[$i]),$pattern);
       if(!($pos===false))
       {
         $size++;
         $word=$words[$i];
         $response.="<option value=\"$word\">$word</option>";
       }
    }
    if($size>0)
      echo "<select id=\"list\" size=$size onclick=\"selectValue()\">$response</select>";
?>
