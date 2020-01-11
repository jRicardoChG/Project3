# funciones para las vistas

import sys
import os
import json
import datetime

from django.http import HttpResponse,Http404,JsonResponse,HttpResponseRedirect
from django.shortcuts import render
from orders.models import *


def deleteRepetidos(vector):
    temp = vector
    resultado = []
    longi = len(temp)
    i = 0
    while len(temp)>0:
        longi = len(temp)
        valor = temp[0]
        resultado[len(resultado):]=[valor]
        while valor in temp:
            temp.remove(valor)
    return resultado


def CrearProductoCarrito(request):
    producto = request.POST.get("producto").split(",")
    print(producto)
    longitudProd = len(producto)
    addToppings = []
    if(longitudProd==4):
        userActual = User.objects.filter(id=request.user.id)[0]
        productoCarrito = carritoCompras(id_dueno=userActual,subtipo_prod_car=producto[0],tamano_prod_car=producto[1],precio_prod_car=float(producto[2]),toppings_prod_car="Null")
        productoCarrito.save()
    elif(longitudProd>4):
        for i in range(4,longitudProd):
            addToppings[len(addToppings):] = [producto[i]]
        addToppings = ",".join(addToppings)
        print(addToppings) 
        userActual = User.objects.filter(id=request.user.id)[0]
        productoCarrito = carritoCompras(id_dueno=userActual,subtipo_prod_car=producto[0],tamano_prod_car=producto[1],precio_prod_car=float(producto[2]),toppings_prod_car=addToppings)
        productoCarrito.save()
    return True


def productosYToppings(request):
    querySubtipo = []
    respuesta = []
    queryTopps = []
    addsPizzas = []
    productoSel = request.POST.get("producto")
    # obtengo id del producto sleeccionado
    productoModelo = producto.objects.filter(tipo = productoSel).values("id_producto")[0]["id_producto"]
    # obtendo los id subtipo usando el id_productopts, par ahcer la query en subtipo para msotrar al usuario solo subitpos
    queryPts = prod_tam_sub.objects.filter(id_productoPts=productoModelo).values("id_subtipoPts")
    # traigo todos los elementos de subtipo que tengan el id de producto deseado
    for i in range(0,len(queryPts)):
        querySubtipo[len(querySubtipo):] = subtipo.objects.filter(id_subtipo=queryPts[i]["id_subtipoPts"]).values("nom_subtipo")
    # limpio elementos repetidos y entrego datos limpios para facil acceso en frontend
    queryDistinct = deleteRepetidos(querySubtipo)
    for i in range(0,len(queryDistinct)):
        respuesta[len(respuesta):]=[queryDistinct[i]["nom_subtipo"]]
    # traigo elementos de toppings si lo solicitado es una pizza
    if(productoSel=="Pizzas"):
        queryTopps = toppings.objects.all().values("topp_nombre")
        for valor in queryTopps:
            addsPizzas[len(addsPizzas):] = [valor["topp_nombre"]]
    else:
        addsPizzas = "false"   
    return [respuesta,addsPizzas]


def precioProducto(request):
    vectorJson = request.POST.get("producto").split(",")
    print(vectorJson)
    if(len(vectorJson)==3):
        subfiltro = prod_tam_sub.objects.filter(id_subtipoPts__nom_subtipo=vectorJson[0],id_tamanoPts__nom_tamano=vectorJson[1],id_subtipoPtsPizza__num_toppings=vectorJson[2]).values("precio")[0]["precio"]
    else:
        subfiltro = prod_tam_sub.objects.filter(id_subtipoPts__nom_subtipo=vectorJson[0],id_tamanoPts__nom_tamano=vectorJson[1]).values("precio")[0]["precio"]
    return subfiltro    

def traerProdsCarrito(request):
    objetosCarrito = carritoCompras.objects.filter(id_dueno=request.user.id)
    arrayObjsCarrito = []
    elemento = {}
    for valor in objetosCarrito:
        elemento = {}
        elemento["fecha"]=valor.fecha_prod_car.strftime("%Y-%m-%d %H:%M:%S")
        print(elemento["fecha"])
        elemento["subtipo"]=valor.subtipo_prod_car
        elemento["tamano"]=valor.tamano_prod_car
        elemento["precio"]=valor.precio_prod_car
        if(valor.toppings_prod_car!="Null"):
            elemento["toppings"]=[]
            for i in valor.toppings_prod_car.split(","):
                elemento["toppings"][len(elemento["toppings"]):]=[i]
        else:
            elemento["toppings"] = ["Null"]
        arrayObjsCarrito[len(arrayObjsCarrito):]=[elemento]
    return arrayObjsCarrito



def crearOrdenNueva(request,user):
    datos = json.loads(request.POST.get("producto"))
    NuevaOrden = ordenes(direccion=datos["direccion"],status="Pedido confirmado",id_dueno=user)
    NuevaOrden.save()
    return NuevaOrden


# hago la queri para conocer el id de pts
# con los datos empiezo a crear los productos

def crearProdsOrden(request,user,productos):
    dictProductosPTS = {}
    for i in range(0,len(productos)-1):
        prodPTS = prod_tam_sub.objects.filter(id_subtipoPts__nom_subtipo=productos[str(i)]["subtipo"])
    return 