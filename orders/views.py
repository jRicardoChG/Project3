import sys
import os
import json

from django.http import HttpResponse,Http404,JsonResponse
from django.shortcuts import render
from orders.models import *
from orders.funciones import *

# Create your views here.
def index(request):
    if request.user.is_authenticated:
        context = {"username":request.user}
        return render(request,"orders/home.html",context)
    else:
        return render(request,"orders/home.html")

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
        # ltraigo todos los elementos de subtipo que tengan el id de producto deseado
        for i in range(0,len(queryPts)):
            querySubtipo[len(querySubtipo):] = subtipo.objects.filter(id_subtipo=queryPts[i]["id_subtipoPts"]).values("nom_subtipo")
        # limpio elementos repetidos y entrego datos limpios para facil acceso en frontend
        queryDistinct = deleteRepetidos(querySubtipo)
        for i in range(0,len(queryDistinct)):
            respuesta[len(respuesta):]=[queryDistinct[i]["nom_subtipo"]]
        # traigo ellemtnos de toppings si lo solicitado es una pizza
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
        if(len(vectorJson)==3):
            subfiltro = prod_tam_sub.objects.filter(id_subtipoPts__nom_subtipo=vectorJson[0],id_tamanoPts__nom_tamano=vectorJson[1]).values("id_subtipoPts")
            subtipoPizza = pizza.objects.all()
        else:
            subfiltro = prod_tam_sub.objects.filter(id_subtipoPts__nom_subtipo=vectorJson[0],id_tamanoPts__nom_tamano=vectorJson[1])
            subtipoPizza = pizza.objects.all().values
        print(subfiltro)
        print(subtipoPizza)

    return JsonResponse({"precio":"hola soy el preico correcto jajaja","toppings":"false"})
