from django.contrib import admin
from django.contrib.auth.models import User
from orders.models import *
# Register your models here.

class Prod_ordenEnlinea(admin.StackedInline):
    model = prod_orden.topping.through
    extra = 1

class toppingsAdmin(admin.ModelAdmin):
    inlines = [Prod_ordenEnlinea]

class prod_ordenAdmin(admin.ModelAdmin):
    filter_horizontal = ("topping",)


admin.site.register(producto)
admin.site.register(pizza)
admin.site.register(toppings,toppingsAdmin)
admin.site.register(ordenes)
admin.site.register(subtipo)
admin.site.register(prod_orden,prod_ordenAdmin)
admin.site.register(prod_tam_sub)
admin.site.register(tamano)












