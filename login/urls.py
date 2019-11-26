from django.urls import path

from . import views

urlpatterns = [
    path("", views.loginView, name="indexlogin"),
    path("registro/",views.registroView, name="registro"),
    path("logout/",views.logoutView, name="logoutView")
]
