
var xhr = new XMLHttpRequest();
var parser = new DOMParser();
var menu = document.querySelector("#menu");
var formElemento = document.querySelector("#formSubtipo");
var pedirProd = document.querySelector("#pedirProd");
var topps = document.querySelector("#toppings");
var banderaCreado = false;
var askNumTop1 = "</div><div class='flexFatherCol global'><label class='fontBold global'>Cuantos Toppings deseas?</label><input type='number' name='num_Toppings' id='num_Toppings' min='1' max='3' placeholder='#'/></div><div id='selTopFather'>";
var askNumTop


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

function crearEventosRadios()
{       
    var divSubTipo = document.querySelector("#subtipo");
    divSubTipo.addEventListener("change",function(){
        var prod1=document.querySelector("#Producto1");
        var lprod1 = document.querySelector("#labProd1");
        var prod3=document.querySelector("#Producto3");
        var lprod3 = document.querySelector("#labProd3");
        if(prod1.checked || prod3.checked || lprod1.checked || prod3.checked)
        {
            askNumTop.setAttribute("max",5);
            askNumTop.value = 5;
            askNumTop.dispatchEvent(eventoCambio);
        }
        else
        {
            askNumTop.setAttribute("max",3);
            askNumTop.value = 3;
            askNumTop.dispatchEvent(eventoCambio);
        }
    })
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
        rad.id = "Producto"+cont;
        labl.setAttribute("for","Producto"+cont);
        labl.innerHTML = valor;
        labl.id = "labProd"+cont;
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
        topps.innerHTML = askNumTop1;
        topps.parentNode.innerHTML += "<hr class='hr global'>";
        askNumTop = document.querySelector("#num_Toppings");
        if(askNumTop)
        {
            crearEventosRadios();
        }
        if(!banderaCreado)
        {
            eventoCambio = new Event("change");
            askNumTop.addEventListener("change",function(){
                console.log("hola cambiaste");
                document.querySelector("#selTopFather").innerHTML = "";
                banderaCreado = true;
                if(askNumTop.value=="")
                    askNumTop.value = 1;
                for(let i=0;i<askNumTop.value;i++)
                {
                    console.log("appden de "+(i+1)+" hijos");
                    var seltopps = document.createElement("div");
                    seltopps.innerHTML = "<select class='global form-control' id='selToppings"+(i+1)+"'><option value='hola'>Hola</option></select>";
                    document.querySelector("#selTopFather").appendChild(seltopps);
                }  
            });
        }
    }
    
}




