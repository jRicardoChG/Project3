from django.urls import path

from . import views

urlpatterns = [
    path("", views.login, name="indexlogin"),
    path("registro/",views.registro, name="registro")
]
