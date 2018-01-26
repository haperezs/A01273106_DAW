let respuesta = document.getElementById("respuesta")

function ejercicio1() {
    let numero = prompt("Ingresa un número", "42");
    let texto = ("<table><tr><th>Número</th><th>Cuadrado</th><th>Cubo</th></tr>")
    
    for(let i = 1; i<=numero ; i++){
        let cuadro = i*i;
        let cubo = i*i*i;
        texto = texto + "<tr><td>" + i + "</td><td>" + cuadro + "</td><td>" + cubo + "</td></tr>"; 
    }
    texto = texto + "</table>";
    
    document.write(texto);
}

function ejercicio2(){
    let horaIni = new Date();
    let segundoIni = horaIni.getSeconds();
    
    let num = Math.floor(Math.random() * 10) + 1;
    let num2 = Math.floor(Math.random() * 10) + 1;
    
    let numero = prompt(num + " + " + num2, "42");
    
    let horaFin = new Date();
    let segundoFin = horaFin.getSeconds();
    
    let res = ("Incorrecto<br>");
    if(numero == (num + num2)){
        res = ("Correcto<br>");
    }
    
    let tiempo = segundoFin - segundoIni;
    
    res = res + "Tiempo: " + tiempo + " segundos.";
    
    respuesta.innerHTML = res;
}

function contador(numeros){
    let largo = numeros.length;
    let cero = 0;
    let pos = 0;
    let neg = 0;
   
    for(let i = 0; i<largo; i++){
        if(numeros[i] > 0){
            pos++;
        }else if(numeros[i] < 0){
            neg++;
        }else if(numeros[i] == 0){
            cero++;
        }
    }
    
    let res = (numeros + "<br><br>Positivos: " + pos + "<br>Negativos: " + neg + "<br>Ceros: " + cero + "");
    
    respuesta.innerHTML = res;
}


function promedios(numeros){
    let res = "Promedios";
    let largo = numeros.length;
    
    for(let i = 0; i<largo; i++){
        res = res + "<br><br> Conjunto: " + (i+1);
        let suma = 0;
        let largoCon = numeros[i].length;
        
        for(let j = 0; j<largoCon; j++){
            suma = suma + numeros[i][j];
            res = res + "<br>" + numeros[i][j];
        }
        
        let prom = suma / largoCon;
        res = res + "<br>Promedio: " + prom;
    }
    
    respuesta.innerHTML = res;
}

function inverso(){
    let num = prompt("Ingresa un número", "42");
    let res = 0;
    
    do{
        res = (res*10) + (num%10);
        num = Math.floor(num/10);
    }while(num > 0)

    respuesta.innerHTML = res;
}

function ejercicio6(){    
    let num = prompt("Ingresa un número (No tan grande)", "42");
    
    let f1 = 1;
    let f2 = 0;
    let temp = 0;
    
    let res = "Primeros " + num + " números de la Secuencia de Fibonacci: <br><br>";
    
    for(let i = 0; i <= num; i++){
        res = res + " " + f2;
        temp = f2;
        f2 = (f1+f2);
        f1 = temp;
    }
    
    respuesta.innerHTML = res;
}

