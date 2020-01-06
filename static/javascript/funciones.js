calcularPrecio();

function eliminarElemento(producto)
{
    var prodCarro = producto.parentNode.parentNode.parentNode.children[0].children["fechaCar"].innerHTML;
    peticion(prodCarro,"eliminar");
}

function calcularPrecio()
{
    var precioTotal = 0;
    var prodsCarrito = document.querySelectorAll("#precioProdCar");
    var cantCarrito = document.querySelectorAll("#cantidadSel");
    for (let i=0;i<cantCarrito.length;i++)
    {
        valor = prodsCarrito[i].innerHTML.split(" ")[2];
        cant = cantCarrito[i].value;
        console.log(valor +" "+ cant);
        precioTotal = precioTotal + Number(valor)*cant;
    }
    document.querySelector("#precioTotal").innerHTML = precioTotal.toFixed(2);
}
function carLessCantidad(boton)
{
    var numeroCantidad = boton.parentNode.children["cantidadSel"];
    numeroCantidad.value -=1;
    if(numeroCantidad.value <=1)
        numeroCantidad.value =1;
    calcularPrecio();
}
function carMoreCantidad(boton)
{
    var numeroCantidad = boton.parentNode.children["cantidadSel"];
    numeroCantidad.value = Number(numeroCantidad.value) +1 ;
    calcularPrecio();
}