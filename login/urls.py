from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="indexlogin"),
    path("registro/",views.registro, name="registro")
]
