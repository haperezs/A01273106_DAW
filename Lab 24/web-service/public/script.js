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
    

