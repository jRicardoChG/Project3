from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class ordenes(models.Model):
    id_orden = models.AutoField(primary_key=True,auto_created=True,serialize=False,verbose_name="pk_orden")
    fecha = models.DateField(auto_now=False,auto_now_add=True)
    direccion = models.CharField(max_length=150)
    status = models.CharField(max_length=50)
    id = models.ForeignKey(User,on_delete=models.CASCADE,related_name="id_dueno")

    def __str__(self):
        return str(self.id_usuario) +" "+ str(self.fecha) +" "+ str(id_orden) 

class toppings(models.Model):
    id_topping = models.AutoField(primary_key=True,auto_created=True,serialize=True)
    top_nombre = models.CharField(max_length=150)

    def __str__(self):
        return str(self.id_topping) + str(self.top_nombre)


