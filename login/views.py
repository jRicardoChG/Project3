import sys
import os

from django.contrib.auth import authenticate,login,logout
from django.http import HttpResponse,Http404,HttpResponseRedirect, HttpRequest
from django.shortcuts import render
from django.urls import reverse
from orders.views import index 

def loginView(request):
    if request.user.is_authenticated:
        context = {"username":request.user}
        return HttpResponseRedirect("../pinnochio/")
    else:
        if request.method == "POST":
            print("hola se que enviaste un post")
            nombreUsuario = request.POST["username"]
            contrasena = request.POST["contrasena"]
            usu = authenticate(request,username=nombreUsuario,password=contrasena)
            print("hoal esto es authenticate: " + str(usu))
            if usu is None:
                context = {"noExiste":"El usuario no esta registrado"}
                return render(request,"login/login.html",context)
            else:
                context = {"username":usu}
                login(request,usu)
                return HttpResponseRedirect("../pinnochio")
        elif request.method == "GET":
            print("hola se que enviaste un get")
            return render(request,'login/login.html')
        else:
            return render(request,'login/login.html')

def registro(request):
    return render(request,'login/registro.html')


