var respuesta = document.getElementById("respuesta")

function ejercicio1() {
    var numero = prompt("Ingresa un número", "42");
    var texto = ("<table><tr><th>Número</th><th>Cuadrado</th><th>Cubo</th></tr>")
    
    for(var i = 1; i<=numero ; i++){
        var cuadro = i*i;
        var cubo = i*i*i;
        texto = texto + "<tr><td>" + i + "</td><td>" + cuadro + "</td><td>" + cubo + "</td></tr>"; 
    }
    texto = texto + "</table>";
    
    document.write(texto);
}

function ejercicio2(){
    var horaIni = new Date();
    var segundoIni = horaIni.getSeconds();
    
    var num = Math.floor(Math.random() * 10) + 1;
    var num2 = Math.floor(Math.random() * 10) + 1;
    
    var numero = prompt(num + " + " + num2, "42");
    
    var horaFin = new Date();
    var segundoFin = horaFin.getSeconds();
    
    var res = ("Incorrecto<br>");
    if(numero == (num + num2)){
        res = ("Correcto<br>");
    }
    
    var tiempo = segundoFin - segundoIni;
    
    res = res + "Tiempo: " + tiempo + " segundos.";
    
    respuesta.innerHTML = res;
}

function contador(numeros){
    var largo = numeros.length;
    var cero = 0;
    var pos = 0;
    var neg = 0;
   
    for(var i = 0; i<largo; i++){
        if(numeros[i] > 0){
            pos++;
        }else if(numeros[i] < 0){
            neg++;
        }else if(numeros[i] == 0){
            cero++;
        }
    }
    
    var res = (numeros + "<br><br>Positivos: " + pos + "<br>Negativos: " + neg + "<br>Ceros: " + cero + "");
    
    respuesta.innerHTML = res;
}


function promedios(numeros){
    var res = "Promedios";
    var largo = numeros.length;
    
    for(var i = 0; i<largo; i++){
        res = res + "<br><br> Conjunto: " + (i+1);
        var suma = 0;
        var largoCon = numeros[i].length;
        
        for(var j = 0; j<largoCon; j++){
            suma = suma + numeros[i][j];
            res = res + "<br>" + numeros[i][j];
        }
        
        var prom = suma / largoCon;
        res = res + "<br>Promedio: " + prom;
    }
    
    respuesta.innerHTML = res;
}

function inverso(){
    var num = prompt("Ingresa un número", "42");
    var res = 0;
    
    do{
        res = (res*10) + (num%10);
        num = Math.floor(num/10);
    }while(num > 0)

    respuesta.innerHTML = res;
}

function ejercicio6(){    
    var num = prompt("Ingresa un número (No tan grande)", "42");
    
    var f1 = 1;
    var f2 = 0;
    var temp = 0;
    
    var res = "Primeros " + num + " números de la Secuencia de Fibonacci: <br><br>";
    
    for(var i = 0; i <= num; i++){
        res = res + " " + f2;
        temp = f2;
        f2 = (f1+f2);
        f1 = temp;
    }
    
    respuesta.innerHTML = res;
}

