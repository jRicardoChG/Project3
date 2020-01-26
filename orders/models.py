from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class ordenes(models.Model):
    id_orden = models.AutoField(primary_key=True,auto_created=True,serialize=False,verbose_name="pk_orden")
    fecha = models.DateTimeField(auto_now=False,auto_now_add=True)
    direccion = models.CharField(max_length=150)
    status = models.CharField(max_length=50)
    id_dueno = models.ForeignKey(User,on_delete=models.CASCADE,related_name="id_dueno")

    # def __str__(self):
    #     return str(self.fecha) +" "+ str(self.status) + " " + str(self.id_dueno)

class toppings(models.Model):
    id_topping = models.AutoField(primary_key=True,auto_created=True,serialize=True)
    topp_nombre = models.CharField(max_length=150)

    def __str__(self):
        return str(self.topp_nombre)

class producto(models.Model):
    id_producto = models.AutoField(primary_key=True,auto_created=True,serialize=True)
    tipo = models.CharField(max_length=200)

    def __str__(self):
        return str(self.tipo)

class subtipo(models.Model):
    id_subtipo = models.AutoField(primary_key=True,auto_created=True,serialize=True)
    nom_subtipo = models.CharField(max_length=200)

    def __str__(self):
        return str(self.nom_subtipo)

class pizza(models.Model):
    id_subtipo = models.ForeignKey(subtipo,on_delete=models.CASCADE,related_name="id_subtipoPizza")
    num_toppings = models.IntegerField()
    id_pizza = models.AutoField(primary_key=True,auto_created=True,serialize=True)

    def __str__(self):
        return str(self.id_subtipo) + " #TOPPINGS: " + str(self.num_toppings)

class tamano(models.Model):
    id_tamano = models.AutoField(primary_key=True,auto_created=True,serialize=True)
    nom_tamano = models.CharField(max_length=100)

    def __str__(self):
        return str(self.nom_tamano)

class prod_tam_sub(models.Model):
    id_pts = models.AutoField(primary_key=True,auto_created=True,serialize=True)
    id_subtipoPts = models.ForeignKey(subtipo,on_delete=models.CASCADE,related_name="id_subtipoPts")
    id_subtipoPtsPizza = models.ForeignKey(pizza,on_delete=models.CASCADE,related_name="id_subtipoPtsPizza",null=True,blank=True)
    id_productoPts = models.ForeignKey(producto,on_delete=models.CASCADE,related_name="id_productoPts")
    id_tamanoPts = models.ForeignKey(tamano,on_delete=models.CASCADE,related_name="id_tamanoPts",null=True,blank=True)
    precio = models.DecimalField(max_digits=10,decimal_places=2)

    def __str__(self):
        return str(self.id_subtipoPts) +" "+ str(self.id_productoPts) + " " + str(self.id_tamanoPts) + " " + str(self.precio)

class prod_orden(models.Model):
    id_prod_creado = models.AutoField(primary_key=True,auto_created=True,serialize=True)    
    cantidad = models.IntegerField(null=False)
    id_ordenIn = models.ForeignKey(ordenes,on_delete=models.CASCADE,related_name="id_ordenIn")
    id_ptsWho = models.ForeignKey(prod_tam_sub,on_delete=models.CASCADE,related_name="id_ptsWho")
    toppings = models.CharField(max_length=200,null=True,blank=True)

    def __str__(self):
        return  " CANT_ORDENADA: "+ str(self.cantidad) + " producto: " + str(self.id_ptsWho) + " datos dueno: " + str(self.id_ordenIn)


class carritoCompras(models.Model):
    id_prod_car = models.AutoField(primary_key=True,auto_created=True,serialize=True)
    id_dueno = models.ForeignKey(User,on_delete=models.CASCADE,related_name="id_dueno_prod_carrito",null=False)
    subtipo_prod_car = models.CharField(max_length=200,null=False)
    tamano_prod_car = models.CharField(max_length=100,null=False)
    precio_prod_car = models.DecimalField(max_digits=10,decimal_places=2,null=False)
    toppings_prod_car = models.CharField(max_length=200,null=True)
    fecha_prod_car = models.DateTimeField(auto_now=False,auto_now_add=True)
    
    def __str__(self):
        return "dueno: " +str(self.id_dueno) + " ,prod: " +str(self.subtipo_prod_car) + str(self.tamano_prod_car) + str(self.precio_prod_car) + " ,toppings: " + str(self.toppings_prod_car)
