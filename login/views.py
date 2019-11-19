import sys
import os

from django.http import HttpResponse,Http404,HttpResponseRedirect
from django.shortcuts import render


def index(request):
    return render(request,'login/login.html')

def registro(request):
    return render(request,'login/registro.html')