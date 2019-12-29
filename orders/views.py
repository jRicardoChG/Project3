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
        productoSel = request.POST.get("producto")
        # obtengo id del producto sleeccionado
        productoModelo = producto.objects.filter(tipo = productoSel).values("id_producto")[0]["id_producto"]
        # obtendo los id subtipo usando el id_productopts, par ahcer la query en subtipo para msotrar al usuario solo subitpos
        queryPts = prod_tam_sub.objects.filter(id_productoPts=productoModelo).values("id_subtipoPts")
        
        for i in range(0,len(queryPts)):
            querySubtipo[len(querySubtipo):] = subtipo.objects.filter(id_subtipo=queryPts[i]["id_subtipoPts"]).values("nom_subtipo")
        queryDistinct = deleteRepetidos(querySubtipo)

        for i in range(0,len(queryDistinct)):
            respuesta[len(respuesta):]=[queryDistinct[i]["nom_subtipo"]]
        return JsonResponse({"respuesta":respuesta})
    return JsonResponse({"respuesta":"No pediste nada"})
