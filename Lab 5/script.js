function checkpwd(){
    let pwd1 = document.getElementById("password").value;
    let pwd2 = document.getElementById("passwordV").value;
    
    if(pwd1 == pwd2){
        alert("Validación exitosa");
    }else{
        alert("Las contraseñas no coinciden");
    }
}

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

function registrar(){
    let user = document.getElementById("user").value;
    let mail = document.getElementById("mail").value;
    let pwd1 = document.getElementById("password").value;
    let pwd2 = document.getElementById("passwordV").value;
    
         
    if(!user || !mail || !pwd1 || !pwd2){
         alert("Favor de llenar todos los campos");
    }else{
        if(pwd1 == pwd2){
            alert("Registro exitoso");

        }else{
            alert("Las contraseñas no coinciden");
        }
    }
}

