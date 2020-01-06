/*
 variables globales
*/
var global = {
    eventoCambio : new Event("change"),
    xhr : new XMLHttpRequest(),
    menu : document.querySelector("#menu"),
    formElemento : document.querySelector("#formSubtipo"),
    pedirProd : document.querySelector("#pedirProd"),
    topps : document.querySelector("#toppings"),
    banderaCreado : false,
    askNumTop1 : "<div class='flexFatherCol global'>"+"<label class='fontBold global'>Cuantos Toppings deseas?</label>"+"<input class='global form-control' type='number' name='num_Toppings' id='num_Toppings' min='0' max='3' placeholder='#'/>"+"</div>"+"<div id='selTopFather'></div>",
    separador : document.createElement("hr"),    
}

global.separador.classList.add("hr","global");

/*
 cuando llega una peticion ajax del servidor
 pueblo los radio buttons de los productos si estan correctos
 y si tengo precio el precio tambien
*/
global.xhr.onreadystatechange = function(){
    if(global.xhr.readyState == 4)
    {
        respuesta = JSON.parse(global.xhr.responseText); 
        if(respuesta["respuesta"])
            llenarSubtipo(respuesta);
        if(respuesta["precio"])
            document.querySelector("#precioParcial").innerHTML = "$ "+respuesta["precio"];
        if(respuesta["carritoRespuestaPost"]==="OK")
        {
            var protocolo = window.location.protocol;
            window.location.href = protocolo;
        }
        if(respuesta["eliminado"]=="true")
        {
            var protocolo = window.location.protocol;
            window.location.href = protocolo;
        }
    }
}

/*
 cuando la pagina cargue completamente añado la clase
 global a todos los elementos
*/

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

/*
 cada vez que un nodo nuevo sea insertado le añado la clase global
*/
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

/*  
    Cuando el usuario elija un producto y este logueado
    envio los datos para crear elemento del carrito
    se activa con un onclick html
*/
function enviarDatosCarrito()
{
    var subprodSel = document.querySelector("input[name=ProdSeleccionado]:checked").value;
    var tamSel = document.querySelector("input[name=tamano]:checked").value;
    var precSel = document.querySelector("#precioParcial").innerHTML.split(" ").filter((x) => x!="$").join();
    var toppingsSel = [];
    if(document.querySelector("#num_Toppings"))
    {
        num_tops = document.querySelector("#num_Toppings").value;
        if(num_tops=="0")
        {
            peticion(subprodSel+","+tamSel+","+precSel+","+0,"carrito");
        }
        else
        {
            selects = document.querySelectorAll("select");
            for(valor of selects)
            {
                toppingsSel.push(valor.value);
            }
            peticion(subprodSel+","+tamSel+","+precSel+","+num_tops+","+toppingsSel,"carrito");
        }
    }
    else
    {
        peticion(subprodSel+","+tamSel+","+precSel+","+0,"carrito");
    }
}
/*
 en esta funcion configuro el comportamiento de la seccion tamano
 segun los productos
*/
function modDivTamano(flag)
{
    if(flag=="unico")
    {
        global.pedirProd.children["tamano"].children[1].classList.add("ocultar");
        global.pedirProd.children["tamano"].children[2].classList.add("ocultar");
        global.pedirProd.children["tamano"].children[3].classList.remove("ocultar");
        document.querySelector("#unico").checked = true;
    }
    if(flag=="drinks")
    {
        global.pedirProd.children["tamano"].children[1].classList.add("ocultar");
        global.pedirProd.children["tamano"].children[2].classList.add("ocultar");
        global.pedirProd.children["tamano"].children[4].classList.remove("ocultar");
        global.pedirProd.children["tamano"].children[5].classList.remove("ocultar");
        global.pedirProd.children["tamano"].children[6].classList.remove("ocultar");
        global.pedirProd.children["tamano"].children[6].classList.remove("ocultar");
        document.querySelector("#bottleDrink").checked = true;
    }
    if(flag=="peqGra")
    {
        global.pedirProd.children["tamano"].children[1].classList.remove("ocultar");
        global.pedirProd.children["tamano"].children[2].classList.remove("ocultar");
        global.pedirProd.children["tamano"].children[3].classList.add("ocultar");
        var eleChecked = document.querySelector("input[name='tamano']:checked")
        if(eleChecked.value =="unico")
        {
            document.querySelector("#peque").checked = true;
        }
    }
}

/*
 segun el producto le doy una forma a al seccion tamano
 y realizo la peticion para tener precio del producto en tiempo real
*/
function cargarPrecio()
{
    if(document.querySelector("input[value='Sub sausage peppers with onions']") && document.querySelector("input[value='Sub sausage peppers with onions']:checked"))
    {
        modDivTamano("unico")
    }
    else if(document.querySelector("input[value='Sub sausage peppers with onions']") && !document.querySelector("input[value='Sub sausage peppers with onions']:checked"))
    {
        modDivTamano("peqGra");
    }

    /* Tomar datos definitivos para consultar precio */
    var subprodSel = document.querySelector("input[name=ProdSeleccionado]:checked").value;
    var tamSel = document.querySelector("input[name=tamano]:checked").value;
    if(document.querySelector("#num_Toppings"))
    {
        var numTopSel = document.querySelector("#num_Toppings").value;
        peticion(encodeURI(subprodSel)+","+encodeURI(tamSel)+","+encodeURI(numTopSel),"precio");
    }
    else
    {
        peticion(encodeURI(subprodSel)+","+encodeURI(tamSel),"precio");
    }

}

/*
    esta funcion es activada desde el html con un "onclick" sobre los producto,
    lo uqe hace es limpiar el body de la pagina 
    y activar la peticion para llenar el body con los preductos seleccionados
    ademas pongo logica de tamano segun producto
*/
function poblarMenu(producto)
{
    peticion(producto,"menu");
    global.menu.classList.add("ocultar");
    var innerProd = producto.innerHTML;
    for(hijo of global.pedirProd.children)
    {
        if(hijo.classList.contains("ocultar"))
        {
            hijo.classList.remove("ocultar");
        }
        if(innerProd=="Pastas" || innerProd=="Salads" || innerProd=="Addons")
        {
            modDivTamano("unico");
        }
        if(innerProd=="Sodas")
        {
            modDivTamano("drinks");
        }
    }
}


/* funcion general para realizar peticiones al servidor con un post */

function peticion(elemento,ruta)
{
    global.xhr.open("POST","/pinnochio/"+ruta,true);
    global.xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    var token = document.getElementsByName("csrfmiddlewaretoken")[0].value;
    if(typeof elemento === "string")

        global.xhr.send("csrfmiddlewaretoken="+token+"&producto="+elemento);
    else
        global.xhr.send("csrfmiddlewaretoken="+token+"&producto="+elemento.innerHTML);
}

/*
 funcion para establecer el comportamiento especial
 que tienen las pizzas, segun sus toppings
*/
function behavePizzas()
{
    var tiposPizzas = document.querySelectorAll("input[name=ProdSeleccionado]");
    var sicSpec = null;
    var regSpec = null;
    var regPizza = null;
    var sicPizza = null;
    var lsicSpec = null;
    var lregSpec = null;

    for(valor of tiposPizzas)
    {
        if(valor.value.includes("special") && valor.value.includes("sicilian"))
            sicSpec = valor;
        if(valor.value.includes("special") && valor.value.includes("regular"))
            regSpec = valor;
    }
    for(valor of tiposPizzas)
    {
        if(!valor.value.includes("special") && valor.value.includes("Siciliana"))
            sicPizza = valor;
        if(!valor.value.includes("special") && valor.value.includes("regular"))
            regPizza = valor;
    }

    lsicSpec = sicSpec.nextElementSibling;
    lregSpec = regSpec.nextElementSibling;

    return [tiposPizzas,sicSpec,regSpec,lsicSpec,lregSpec,regPizza,sicPizza];
}

/*
 funcion main que usa la funcion behavepizzas
 para dar la logica a los radio button
 que pertenezcan a prodcutos tipo pizza
*/
function crearEventosRadios()
{
        var divSubTipo = document.querySelector("#subtipo");
        divSubTipo.addEventListener("change",function(){
            var tiposPizzas = behavePizzas()[0];
            var sicSpec = behavePizzas()[1];
            var regSpec = behavePizzas()[2];
            var lsicSpec = behavePizzas()[3];
            var lregSpec = behavePizzas()[4];

            if(sicSpec.checked || regSpec.checked || lsicSpec.checked || lregSpec.checked)
            {
                askNumTop.setAttribute("max",5);
                askNumTop.value = 5;
                askNumTop.dispatchEvent(global.eventoCambio);
            }
            else
            {
                askNumTop.setAttribute("max",3);
                askNumTop.value = 3;
                askNumTop.dispatchEvent(global.eventoCambio);
            }
        });  
}

/*
    En esta funcion evitamos que el usuario 
    ingrese numeros no permitidos
*/ 

function noMayoraCinco(regSpec,sicSpec,regPizza,sicPizza)
{
    if(askNumTop.value==4)
    {
        askNumTop.value=3;
        askNumTop.setAttribute("max",3);
        if(sicSpec.checked)
        {
            sicPizza.checked=true;
        }
        else
        {
            regPizza.checked=true;
        }
    }
    if(askNumTop.value>=5)
    {
        askNumTop.value=5;
        askNumTop.setAttribute("max",5);
        if(sicPizza.checked)
        {
            sicSpec.checked=true;
        }
        else
        {
            regSpec.checked=true;
        }
    }
    if(sicSpec.checked || regSpec.checked)
    {
        if(askNumTop.value!=5)
            askNumTop.value = 5;
    }
                
}
/*
 en esta funcion pongo todos los radios buttons
 de los sbutipos de productos que corresponde alo solicitado,
 si son pizzas o sub existen ciertos comportamientos especiales,
 aca se definen, aca se crean los div de numero de toppings
*/
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
        global.formElemento.appendChild(divP);
        cont++;
    }
    if(respuesta["toppings"]!="false")
    { 
        document.querySelector("#pedirProd").insertBefore(global.separador,document.querySelector("#precio"));
        global.topps.innerHTML = global.askNumTop1;
        askNumTop = document.querySelector("#num_Toppings");
        if(askNumTop)
        {
            crearEventosRadios();
        }
        if(!global.banderaCreado)
        {
            var sicSpec = behavePizzas()[1];
            var regSpec = behavePizzas()[2];
            var regPizza = behavePizzas()[5];
            var sicPizza = behavePizzas()[6];

            askNumTop.addEventListener("change",function(){
                noMayoraCinco(regSpec,sicSpec,regPizza,sicPizza);
                document.querySelector("#selTopFather").innerHTML = "";
                global.banderaCreado = true;
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
            askNumTop.dispatchEvent(global.eventoCambio);
        }
    }
    global.pedirProd.addEventListener("change",cargarPrecio);
    global.pedirProd.dispatchEvent(global.eventoCambio);
}




