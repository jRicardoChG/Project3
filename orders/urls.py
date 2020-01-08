from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("menu",views.productoPedido, name="pedirProducto"),
    path("precio",views.precioMostrar,name="precioMostrar"),
    path("carrito",views.carritoView,name="carrito"),
    path("eliminar",views.eliminarView,name="eliminarView"),
    path("comprashechas",views.comprashechasView,name="comprashechas"),
    path("comprar",views.comprarView,name="comprar")
]
