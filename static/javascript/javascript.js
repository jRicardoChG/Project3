var eventoCambio = new Event("change");
var xhr = new XMLHttpRequest();
var parser = new DOMParser();
var menu = document.querySelector("#menu");
var formElemento = document.querySelector("#formSubtipo");
var pedirProd = document.querySelector("#pedirProd");
var topps = document.querySelector("#toppings");
var banderaCreado = false;
var askNumTop1 = "</div><div class='flexFatherCol global'><label class='fontBold global'>Cuantos Toppings deseas?</label><input type='number' name='num_Toppings' id='num_Toppings' min='0' max='3' placeholder='#'/></div><div id='selTopFather'>";
var separador = document.createElement("hr");
separador.classList.add("hr","global");

function cargarPrecio()
{
        var subprodSel = document.querySelector("input[name=ProdSeleccionado]:checked").value;
        var tamSel = document.querySelector("input[name=tamano]:checked").value;
        if(document.querySelector("#num_Toppings"))
        {
            var numTopSel = document.querySelector("#num_Toppings").value;
            peticion(subprodSel+","+tamSel+","+numTopSel,"precio");
        }
        else
        {
            peticion(subprodSel+","+tamSel,"precio");
        }
}

xhr.onreadystatechange = function(){
    if(xhr.readyState == 4)
    {
        respuesta = JSON.parse(xhr.responseText); 
        console.log(respuesta);
        if(respuesta["respuesta"])
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
    peticion(producto,"menu");
    menu.classList.add("ocultar");
    for(hijo of pedirProd.children)
    {
        if(hijo.classList.contains("ocultar"))
        {
            hijo.classList.remove("ocultar");
        }
    }
}

function peticion(elemento,ruta)
{
    xhr.open("POST","/pinnochio/"+ruta,true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    // xhr.setRequestHeader('X-CSRF-TOKEN',document.getElementsByName('csrfmiddlewaretoken')[0].value);
    if(typeof elemento === "string")
        xhr.send("csrfmiddlewaretoken="+document.getElementsByName('csrfmiddlewaretoken')[0].value+"&producto="+elemento);
    else
        xhr.send("csrfmiddlewaretoken="+document.getElementsByName('csrfmiddlewaretoken')[0].value+"&producto="+elemento.innerHTML);
}

function crearEventosRadios()
{       
    var divSubTipo = document.querySelector("#subtipo");
    divSubTipo.addEventListener("change",function(){
        var tiposPizzas = document.querySelectorAll("input[name=ProdSeleccionado]");
        var sicSpec = null;
        var regSpec = null;
        for(valor of tiposPizzas)
        {
            if(valor.value.includes("special") && valor.value.includes("sicilian"))
                sicSpec = valor;
            if(valor.value.includes("special") && valor.value.includes("regular"))
                regSpec = valor;
        }
        var lsicSpec = sicSpec.nextElementSibling;
        var lregSpec = regSpec.nextElementSibling;

        if(sicSpec.checked || regSpec.checked || lsicSpec.checked || lregSpec.checked)
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
        if(cont==0)
        {
            rad.setAttribute("checked","true");
        }
        divP.appendChild(rad);
        divP.appendChild(labl);
        formElemento.appendChild(divP);
        cont++;
    }
    if(respuesta["toppings"]!="false")
    { 
        document.querySelector("#pedirProd").insertBefore(separador,document.querySelector("#precio"));
        topps.innerHTML = askNumTop1;
        // topps.parentNode.innerHTML += "<hr class='hr global'>";
        askNumTop = document.querySelector("#num_Toppings");
        if(askNumTop)
        {
            crearEventosRadios();
        }
        if(!banderaCreado)
        {
            var tiposPizzas = document.querySelectorAll("input[name=ProdSeleccionado]");
            var sicSpec = null;
            var regSpec = null;
            var regPizza = null;
            var sicPizza = null;
            for(valor of tiposPizzas)
            {
                if(valor.value.includes("special") && valor.value.includes("sicilian"))
                    sicSpec = valor;
                if(valor.value.includes("special") && valor.value.includes("regular"))
                    regSpec = valor;
                if(!valor.value.includes("special") && valor.value.includes("Siciliana"))
                    sicPizza = valor;
                if(!valor.value.includes("special") && valor.value.includes("regular"))
                    regPizza = valor;
            }
            askNumTop.addEventListener("change",function(){
                if(askNumTop.value==4)
                {
                    askNumTop.value=3;
                    if(sicSpec.checked)
                    {
                        sicPizza.checked=true;
                    }
                    else
                    {
                        regPizza.checked=true;
                    }
                }
                document.querySelector("#selTopFather").innerHTML = "";
                banderaCreado = true;
                if(askNumTop.value=="")
                    askNumTop.value = 0;
                for(let i=0;i<askNumTop.value;i++)
                {
                    var seltopps = document.createElement("div");
                    seltopps.innerHTML = "<select class='global form-control' id='selToppings"+(i+1)+"'></select>";
                    for(valor of respuesta["toppings"])
                    {
                        var opciontop = document.createElement("option");
                        opciontop.innerHTML = valor;
                        seltopps.children[0].appendChild(opciontop);
                    }
                    document.querySelector("#selTopFather").appendChild(seltopps);
                }
            });
            askNumTop.dispatchEvent(eventoCambio);
        }
    }
    pedirProd.addEventListener("change",cargarPrecio);
    pedirProd.dispatchEvent(eventoCambio);
}




