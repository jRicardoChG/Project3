import sys
import os
import json

from django.http import HttpResponse,Http404,JsonResponse
from django.shortcuts import render


# Create your views here.
def index(request):
    if request.user.is_authenticated:
        context = {"username":request.user}
        return render(request,"orders/home.html",context)
    else:
        return render(request,"orders/home.html")

def producto(request):
    if request.method == "POST":
        producto = request.POST.get("producto")
        print(producto)
        return JsonResponse({"respuesta":"enviaste un POST"})
    return JsonResponse({"respuesta":"No pediste nada"})
