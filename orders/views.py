# vistas ORDERS
import sys
import os
import json
import datetime

from django.http import HttpResponse,Http404,JsonResponse,HttpResponseRedirect
from django.shortcuts import render
from orders.models import *
from orders.funciones import *

# Vistas que retornan template

def index(request):
    if request.user.is_authenticated:
        context = {"username":request.user}
        return render(request,"orders/home.html",context)
    else:
        context = {"username":None}
        return render(request,"orders/home.html",context)


def carritoView(request):
    if request.user.is_authenticated:
        if(request.method=="POST"):
            CrearProductoCarrito(request)
            return JsonResponse({"carritoRespuestaPost":"OK"})
        # si se realiza un get u otro metodo la vista retorna lo siguiente
        elif(request.method=="GET"): 
            arrayObjsCarrito = traerProdsCarrito(request)
            print(arrayObjsCarrito)
            context = {"username":request.user,"prodCarrito":arrayObjsCarrito}
            return render(request,"orders/carrito.html",context)
    else:
        # si no esta autenticado no debe mostrar carrito de compra
        context = {"username":None}
        return render(request,"orders/home.html",context)


## Vistas que solo retornan peticiones ajax 

def productoPedido(request):
    if request.method == "POST":
        print(request.POST)
        respuesta = productosYToppings(request)[0]
        addsPizzas = productosYToppings(request)[1]
        return JsonResponse({"respuesta":respuesta,"toppings":addsPizzas})
    return JsonResponse({"error":"error"})

def precioMostrar(request):
    if(request.POST.get("producto")):
        subfiltro = precioProducto(request)
        return JsonResponse({"precio":subfiltro,"toppings":"false"})
    return JsonResponse({"error":"error"})

def eliminarView(request):
    if request.method=="POST":
        userActual = request.user.id
        fechaProdEliminar = request.POST.get("producto")
        prodEliminar = carritoCompras.objects.filter(id_dueno=userActual,fecha_prod_car__icontains=fechaProdEliminar)
        if(prodEliminar):
            prodEliminar.delete()
    return JsonResponse({"eliminado":"true"})

def comprashechasView(request):
    if request.user.is_authenticated:
        usuarioActual = User.objects.filter(id=request.user.id)[0]
        comprashechas = consultarOrdenes(usuarioActual)
        print(comprashechas)
        context = {"username":request.user, "comprashechas":comprashechas}
        return render(request,"orders/comprashechas.html",context)
    else:
        context = {"username":None}
        return render(request,"orders/comprashechas.html",context)

## proceso, debo crar una orden de compra al precionar el boton, 
## con sa orden creo producto asociados a la misma
## se debe leer la data que llega de fronent
## borrar carrito de compra, datos en db asociados al usuario
## configurar boton en fron para que cambie de pagina


def comprarView(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            # crear orden de compra nueva 
            usuarioActual = User.objects.filter(id = request.user.id)[0]
            NuevaOrden = crearOrdenNueva(request,usuarioActual)
            productos = json.loads(request.POST.get("producto"))
            # crear prodstos orden
            crearProdsOrden(request,productos,NuevaOrden,usuarioActual)
            #print(productos)
            borrarCarritoCompra(usuarioActual)
            return JsonResponse({"ordenCreada":"OK"})
        else:
            return render(request,"orders/home.html")
    else:
        return render(request,"orders/home.html")
        