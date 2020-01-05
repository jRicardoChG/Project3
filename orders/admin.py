from django.contrib import admin
from django.contrib.auth.models import User
from orders.models import *
# Register your models here.

#----------------------------------------------
# class Prod_ordenEnlinea(admin.StackedInline):
#     model = prod_orden.topping.through
#     extra = 1

# class toppingsAdmin(admin.ModelAdmin):
#     inlines = [Prod_ordenEnlinea]

# class prod_ordenAdmin(admin.ModelAdmin):
#     filter_horizontal = ("topping",)

#----------------------------------------------
class prod_ordenModelAdmin(admin.StackedInline):
    model = prod_orden
    extra = 1

class ordenesAdmin(admin.ModelAdmin):
    inlines = [prod_ordenModelAdmin,]
    list_display = ('fecha','id_dueno','direccion','status')
#----------------------------------------------

admin.site.register(producto)
admin.site.register(pizza)
# admin.site.register(toppings,toppingsAdmin)
admin.site.register(ordenes,ordenesAdmin)
admin.site.register(subtipo)
admin.site.register(prod_orden)
admin.site.register(prod_tam_sub)
admin.site.register(tamano)
admin.site.register(toppings)
admin.site.register(carritoCompras)












