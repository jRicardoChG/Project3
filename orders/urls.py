from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("menu",views.productoPedido, name="pedirProducto"),
    path("precio",views.precioMostrar,name="precioMostrar"),
    path("carrito",views.carrito,name="carrito")
]
