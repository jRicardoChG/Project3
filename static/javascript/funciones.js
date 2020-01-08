calcularPrecio();

function eliminarElemento(producto)
{
    var prodCarro = producto.parentNode.parentNode.parentNode.children[0].children["fechaCar"].innerHTML;
    peticion(prodCarro,"eliminar","string");
    return 0;
}

function calcularPrecio()
{
    if(document.querySelector("#precioProdCar"))
    {
        var precioTotal = 0;
        var prodsCarrito = document.querySelectorAll("#precioProdCar");
        var cantCarrito = document.querySelectorAll("#cantidadSel");
        for (let i=0;i<cantCarrito.length;i++)
        {
            valor = prodsCarrito[i].innerHTML.split(" ")[2];
            cant = cantCarrito[i].value;
            precioTotal = precioTotal + Number(valor)*cant;
        }
        document.querySelector("#precioTotal").innerHTML = "$ " + precioTotal.toFixed(2);
    } 
    return 0;
}
function carLessCantidad(boton)
{
    var numeroCantidad = boton.parentNode.children["cantidadSel"];
    numeroCantidad.value -=1;
    if(numeroCantidad.value <=1)
        numeroCantidad.value =1;
    calcularPrecio();
    return 0;
}
function carMoreCantidad(boton)
{
    var numeroCantidad = boton.parentNode.children["cantidadSel"];
    numeroCantidad.value = Number(numeroCantidad.value) +1 ;
    calcularPrecio();
    return 0;
}

function realizarCompra()
{
    var prods = document.querySelectorAll("#elementoCarrito");
    compra = {}
    cont = 0
    for(elemento of prods)
    {
        let producto = {}
        producto["fecha"] = elemento.children["prodCarParams"].children["fechaCar"].innerHTML
        producto["subtipo"] = elemento.children["prodCarParams"].children["subtipoCar"].innerHTML
        producto["tamano"] = elemento.children["prodCarParams"].children["tamanoCar"].innerHTML
        if(elemento.children["prodCarParams"].children["listToppsCar"])
        {
            let topsSel = []
            let listToppsCar = elemento.children["prodCarParams"].children["listToppsCar"]
            for(lista of listToppsCar.children)
                topsSel.push(lista.innerHTML);
            producto["toppings"] = topsSel;
        }
        producto["precio"] = elemento.children["prodCarParams"].children["precioProdCar"].innerHTML
        producto["cantidad"] = elemento.children["cantidadCar"].children["divCantCar"].children["cantidadSel"].value
        compra[cont]=producto;   
        cont++;
    }
        peticion(compra,"comprar","json");
    return 0;
}


