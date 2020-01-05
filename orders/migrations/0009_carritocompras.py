# Generated by Django 2.2.5 on 2020-01-05 00:24

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('orders', '0008_prod_orden_toppings'),
    ]

    operations = [
        migrations.CreateModel(
            name='carritoCompras',
            fields=[
                ('id_prod_car', models.AutoField(auto_created=True, primary_key=True, serialize=False)),
                ('subtipo_prod_car', models.CharField(max_length=200)),
                ('tamano_prod_car', models.CharField(max_length=100)),
                ('precio_prod_car', models.IntegerField()),
                ('toppings_prod_car', models.CharField(max_length=200, null=True)),
                ('id_dueno', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='id_dueno_prod_carrito', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]