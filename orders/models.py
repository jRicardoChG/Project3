from django.db import models

# Create your models here.

class ordenes(models.Model):
    id_orden = models.AutoField(primary_key=True,auto_created=True,serialize=False,verbose_name="pk_orden")
    fecha = models.DateField(auto_now=True,auto_now_add=True,**)
    direccion = models.
    id_usuario = models.AutoField()
