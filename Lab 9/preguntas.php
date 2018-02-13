<?php
    include("_header.html");
    include("_nav.html");

    echo "<h3>Preguntas</h3><ul><li>¿Qué hace la función phpinfo()? Describe y discute 3 datos que llamen tu atención.<br>";
    echo "Muestra información sobre la configuración de PHP. Versión, módulos y opciones que compiló, etc.</li><br>";

    echo "<li>¿Qué cambios tendrías que hacer en la configuración del servidor para que pudiera ser apto en un ambiente de producción?<br>";
    echo "Cambiar el archivo php.ini para un ambiente de produccion (php.ini-production)</li><br>";

    echo "<li>¿Cómo es que si el código está en un archivo con código html que se despliega del lado del cliente, se ejecuta del lado del servidor? Explica.<br>";
    echo "Porque PHP despliega el HTML en el servidor y ya solo es necesario enviar al cliente el resultado</li></ul>";

    include("_footer.html");
?>
