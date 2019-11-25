import sys
import os

from django.contrib.auth import authenticate,login,logout
from django.http import HttpResponse,Http404,HttpResponseRedirect, HttpRequest
from django.shortcuts import render
from django.urls import reverse

def login(request):
    if request.user.is_authenticated:
        context = {"username":request.user}
        return render(request, "orders/home.html",context)
    else:
        if request.method == "POST":
            print("hola se que enviaste un post")
        elif request.method == "GET":
            print("hola se que enviaste un get")
            return render(request,'login/login.html')
        else:
            return render(request,'login/login.html')


def registro(request):
    return render(request,'login/registro.html')


