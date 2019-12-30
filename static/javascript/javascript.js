var xhr = new XMLHttpRequest();
var parser = new DOMParser();
var menu = document.querySelector("#menu");
var formElemento = document.querySelector("#formSubtipo");
var pedirProd = document.querySelector("#pedirProd");
var topps = document.querySelector("#toppings");

xhr.onreadystatechange = function(){
    if(xhr.readyState == 4)
    {
        respuesta = JSON.parse(xhr.responseText); 
        console.log(respuesta);
        llenarSubtipo(respuesta);
    }
}

window.onload = function (){
    var todo = document.querySelectorAll("*");
    for (tag of todo)
    {
        if(tag.classList["global"]==undefined)
        {
            tag.classList.add("global");
        }
    }
};

window.addEventListener("DOMInsertedNode", function(){
    var todo = document.querySelectorAll("*");
    for (tag of todo)
    {
        if(tag.classList["global"]==undefined)
        {
            tag.classList.add("global");
        }
    }
});

function poblarMenu(producto)
{
    peticion(producto);
    menu.classList.add("ocultar");
    for(hijo of pedirProd.children)
    {
        if(hijo.classList.contains("ocultar"))
        {
            hijo.classList.remove("ocultar");
        }
    }
}

function peticion(elemento)
{
    xhr.open("POST","/pinnochio/menu",true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    // xhr.setRequestHeader('X-CSRF-TOKEN',document.getElementsByName('csrfmiddlewaretoken')[0].value);
    xhr.send("csrfmiddlewaretoken="+document.getElementsByName('csrfmiddlewaretoken')[0].value+"&producto="+elemento.innerHTML);
}

function llenarSubtipo(respuesta)
{
    var cont = 0;
    for(valor of respuesta["respuesta"])
    {
        var divP = document.createElement("div");
        var rad = document.createElement("input");
        var labl = document.createElement("label");
        rad.type = "radio";
        rad.name = "ProdSeleccionado";
        rad.id = "Hola"+cont;
        labl.setAttribute("for","Hola"+cont);
        labl.innerHTML = valor;
        rad.value = valor;
        divP.classList.add("flexFatherLeftRow","global","width100");
        rad.classList.add("flexItem","global");
        labl.classList.add("global","textLeftMargin");
        divP.appendChild(rad);
        divP.appendChild(labl);
        formElemento.appendChild(divP);
        cont++;
    }
    if(respuesta["toppings"]!="false")
    {
        var askNumTop1 = "<div class='flexFatherCol global'><label class='fontBold global'>Cuantos Toppings deseas?</label><input type='number' name='num_Toppings' id='num_Toppings' min='1' max='3' placeholder='1'/></div>";
        topps.innerHTML = askNumTop1;
        topps.parentNode.innerHTML += "<hr class='hr global'>";
        askNumTop = document.querySelector("#num_Toppings");
    }
    
}


document.addEventListener("change",function(){
    if(askNumTop)
    {
        askNumTop.addEventListener("change",function(){
            for(i=0;i<askNumTop.value;i++)
            {
            var topps = document.querySelector("#toppings");
            var seltopps = "<div class='global'><select class='global form-control' id='selToppings"+i+"'><option value='hola'>Hola</option></select></div>";
            topps.innerHTML += seltopps;
            }  
        });
    }
})

