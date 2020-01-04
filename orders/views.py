import sys
import os
import json
import datetime

from django.http import HttpResponse,Http404,JsonResponse
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
    #Django deja modificar request.session pero no request.session["elemento interno"], por ello debo poner esta linea en la vista
    request.session.modified = True
    if request.user.is_authenticated:
        if(request.method == "POST"):
            try:
                if(request.session["carrito"]["contador"] is None):
                    print("is None")
                    request.session["carrito"]["contador"]=0
                    cont = 0
            except:
                print("falle")
                request.session["carrito"]={}
                request.session["carrito"]["contador"]=0
            cont = request.session.get("carrito")["contador"]
            print(str(cont))
            prodCarrito = request.POST.get("producto").split(",")
            request.session["carrito"][cont]=prodCarrito
            cont=cont+1
            print(str(cont))
            request.session["carrito"]["contador"]=cont
            print(request.session["carrito"])
            return JsonResponse({"respue":"Has anadido algo al carrito"})
        elif(request.method=="GET"):
            context = {"username":request.user}
            return render(request,"orders/carrito.html",context)                
    else:
        context = {"username":None}
    return render(request,"orders/home.html",context)


## Vistas retornan peticiones ajax 

def productoPedido(request):
    if request.method == "POST":
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
        return JsonResponse({"respuesta":respuesta,"toppings":addsPizzas})
    return JsonResponse({"respuesta":"No pediste nada","toppings":"false"})

def precioMostrar(request):
    if(request.POST.get("producto")):
        vectorJson = request.POST.get("producto").split(",")
        print(request.POST.get("producto"))
        if(len(vectorJson)==3):
            subfiltro = prod_tam_sub.objects.filter(id_subtipoPts__nom_subtipo=vectorJson[0],id_tamanoPts__nom_tamano=vectorJson[1],id_subtipoPtsPizza__num_toppings=vectorJson[2]).values("precio")[0]["precio"]
        else:
            subfiltro = prod_tam_sub.objects.filter(id_subtipoPts__nom_subtipo=vectorJson[0],id_tamanoPts__nom_tamano=vectorJson[1]).values("precio")[0]["precio"]
        print(subfiltro)
    return JsonResponse({"precio":subfiltro,"toppings":"false"})

