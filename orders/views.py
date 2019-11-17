import sys
import os

from django.http import HttpResponse,Http404,HttpResponseRedirect
from django.shortcuts import render


# Create your views here.
def index(request):
    return render(request,"orders/home.html")
