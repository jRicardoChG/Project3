import sys
import os

from django.http import HttpResponse,Http404,HttpResponseRedirect
from django.shortcuts import render


# Create your views here.
def index(request):
    if request.user.is_authenticated:
        context = {"username":request.user}
        return render(request,"orders/home.html",context)
    else:
        return render(request,"orders/home.html")
