var xhr = new XMLHttpRequest();
var menu = document.querySelector("#menu");


xhr.onreadystatechange = function(){
    if(xhr.readyState == 4)
    {
        respuesta = xhr.responseText; 
        console.log(respuesta["respuesta"]);
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
    var elemento = producto.value;
    menu.innerHTML = "";
}

function peticion(elemento)
{
    xhr.open("POST","/pinnochio/menu",true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.setRequestHeader('X-CSRF-TOKEN',document.getElementsByName('csrfmiddlewaretoken').value);
    xhr.send("csrfmiddlewaretoken="+document.getElementsByName('csrfmiddlewaretoken').value,"producto="+elemento.innerHTML.toString());;
}