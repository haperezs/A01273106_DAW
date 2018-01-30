function quitar(cantidad, precio){
    let num = document.getElementById(cantidad);
    let prec = document.getElementById(precio);
    
    let precsum = document.getElementById("precio");
    let iv = document.getElementById("iva");
    
    if(num.textContent != 0){
        num.textContent--;
        
        precsum.textContent = parseInt(precsum.textContent) - parseInt(prec.textContent);
        iv.textContent = parseFloat(precsum.textContent * .16);
        
        total.textContent = parseFloat(precsum.textContent) + parseFloat(iva.textContent);
    }
}

function agregar(cantidad, precio){
    let num = document.getElementById(cantidad);
    let prec = document.getElementById(precio);

    let precsum = document.getElementById("precio");
    let iv = document.getElementById("iva");
    
    num.textContent++;
    
    precsum.textContent = parseInt(precsum.textContent) + parseInt(prec.textContent);
    iv.textContent = parseFloat(precsum.textContent * .16);
    
    total.textContent = parseFloat(precsum.textContent) + parseFloat(iva.textContent);
}

function comprar(){
    let tot = document.getElementById("total");
    let total = parseFloat(tot.textContent);
    
    alert("La cuenta es de: " + total + " pesos");
}


document.getElementById("changetext").addEventListener("mouseover", cambiar);
document.getElementById("changetext").addEventListener("mouseout", regresar);

text = document.getElementById("changetext");

function cambiar(){
    text.style.fontSize = "20px";
    text.style.color = "blue";  
}

function regresar(){
    text.style.fontSize = "16px";
    text.style.color = "black";
}

let i = 0;
let imagenrevel = "";
let imagen =
["____▒▒▒▒▒",
"—-▒▒▒▒▒▒▒▒▒",
"—–▓▓▓░░▓░",
"—▓░▓░░░▓░░░",
"—▓░▓▓░░░▓░░░",
"—▓▓░░░░▓▓▓▓",
"——░░░░░░░░",
"—-▓▓▒▓▓▓▒▓▓",
"–▓▓▓▒▓▓▓▒▓▓▓",
"▓▓▓▓▒▒▒▒▒▓▓▓▓",
"░░▓▒░▒▒▒░▒▓░░",
"░░░▒▒▒▒▒▒▒░░░",
"░░▒▒▒▒▒▒▒▒▒░░",
"—-▒▒▒ ——▒▒▒",
"–▓▓▓———-▓▓▓",
"▓▓▓▓———-▓▓▓▓"];

function print(){
    if(i<16){
        imagenrevel = imagenrevel + imagen[i] + "<br>";
        document.getElementById("printer").innerHTML = imagenrevel;
        i++;
    }
}

function activate() {
    setInterval(print, 2000);
}

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
    

