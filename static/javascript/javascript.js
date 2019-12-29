var xhr = new XMLHttpRequest();
var menu = document.querySelector("#menu");
var formElemento = document.querySelector("#formSubtipo");
var pedirProd = document.querySelector("#pedirProd");

xhr.onreadystatechange = function(){
    if(xhr.readyState == 4)
    {
        var respuesta = JSON.parse(xhr.responseText); 
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
        var raya = document.createElement("hr");
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

}