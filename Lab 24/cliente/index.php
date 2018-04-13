<?php
    $url = "https://daw-haperezs.c9users.io/web-service/public/compa"; //Route to the REST web service
    $c = curl_init($url);
    $response = curl_exec($c);
    curl_close($c);
    //var_dump($response);

    $url = "https://daw-haperezs.c9users.io/web-service/public/preguntas"; //Route to the REST web service
    $c = curl_init($url);
    $response = curl_exec($c);
    curl_close($c);
?>