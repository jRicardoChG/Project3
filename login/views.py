#VISTAS DE LOGIN

import sys
import os

from django.contrib.auth import authenticate,login,logout
from django.http import HttpResponse,Http404,HttpResponseRedirect, HttpRequest
from django.shortcuts import render
from django.urls import reverse
from django.contrib.auth.models import User



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



def registroView(request):
    if request.method == "POST":
        nombreUsuario = request.POST["username"]
        email = request.POST["email"]
        nombre = request.POST["firstname"]
        apellido = request.POST["lastname"]
        paswd = request.POST["contrasena"]
        if(nombreUsuario and email and nombre and apellido and paswd):
            usuario = User.objects.create_user(username = nombreUsuario,email = email,password = paswd,first_name = nombre,last_name=apellido)
            context = {"mensaje":"El usuario se ha registrado correctamente, logueate!"}
            return render(request,'login/registro.html', context) 
        else:
            context = {"mensaje":"Faltan datos de registro"}
            return render(request,'login/registro.html', context) 
    return render(request,'login/registro.html')



def logoutView(request):
    logout(request)
    return render(request,"login/logout.html")


