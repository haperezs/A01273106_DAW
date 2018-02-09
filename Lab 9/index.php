<?php
    include("_header.html");
    include("_nav.html");

    function promedio($arr){
        $largo = count($arr);
        $sum = 0;
        
        for($i = 0; $i < $largo ; $i++){
            $sum += $arr[$i];
        }
        
        $promedio = $sum/$largo;
        return $promedio; 
    }

    function mediana($arr){
        $largo = count($arr);
        $aux = 0;
        
        sort($arr);
        
        if($largo % 2 == 0){
            $mediana = ([$arr[$largo/2], $arr[($largo/2)-1]])/2;
        }else{
            $mediana = $arr[$largo/2];
        }
        
        return $mediana;
    }

    function menorMayor($arr){
        sort($arr);
        $largo = count($arr);
        
        for($i = 0 ; $i < $largo ; $i++){
            echo "<li>" . $arr[$i] . "</li>";
        }
    }

    function mayorMenor($arr){
        rsort($arr);
        $largo = count($arr);
        
        for($i = 0 ; $i < $largo ; $i++){
            echo "<li>" . $arr[$i] . "</li>";
        }
    }
    
    function lista($arr){
        echo "<ul><li>Promedio: " . promedio($arr) . "</li>";
        echo "<li>Mediana:" . mediana($arr) . "</li>";
        
        echo "<li>Menor a mayor: </li>";
        menorMayor($arr);
        
        echo "<li>Mayor a menor: </li>";
        mayorMenor($arr);
        
        echo "</ul>";
    }

    function potencias($num){
        echo "<table><tr><th>Número</th><th>Cuadrado</th><th>Cubo</th></tr>";
        
        for($i = 1; $i <= $num ; $i++){
            echo "<tr><td>" . $i . "</td><td>" . pow($i, 2) . "</td><td>" . pow($i, 3) . "</td></tr>";
        }
        echo "</table>";
    }

    function imprimeArray($arr){
        $largo = count($arr);
        
        echo "[";
        for($i = 0 ; $i < $largo ; $i++){
            echo $arr[$i] . " ";
        }
        echo "]";
    }



    
    $arr1 = array(3, 2, 1, 1, 2, 3, 5, 4, 6);
    $arr2 = array(7, 3, 1, 7, 9);

    echo "<h3>Función 1</h3>" . "Arreglo 1:<br>";
    imprimeArray($arr1);
    echo "<br>Promedio: " . promedio($arr1) . "<br><br>";

    echo "Arreglo 2: <br>";
    imprimeArray($arr2);
    echo "<br>Promedio: " . promedio($arr2) . "<br>";
    

    echo "<h3>Función 2</h3>" . "Arreglo 1:<br>";
    imprimeArray($arr1);
    echo "<br>Mediana: " . mediana($arr1) . "<br><br>";

    echo "Arreglo 2: <br>";
    imprimeArray($arr2);
    echo "<br>Mediana: " . mediana($arr2) . "<br>";


    echo "<h3>Función 3</h3>" . "Arreglo 1:<br>";
    imprimeArray($arr1);
    echo "<br>" . lista($arr1) . "<br><br>";

    echo "Arreglo 2: <br>";
    imprimeArray($arr2);
    echo "<br>" . lista($arr2) . "<br>";


    echo "<h3>Función 4</h3>" . "Num 5:<br>";
    echo potencias(5) . "<br><br>";

    echo "Num 7: <br>";
    echo potencias(7) . "<br>";

    include("_footer.html");
?>
