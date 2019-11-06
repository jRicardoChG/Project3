-- 

create table usuarios (
    id_usuario SERIAL primary key,
    nombre varchar(64) not null,
    apellido varchar(64) not null,
    email varchar(64) not null,
    contrasena varchar(64) not null 
);

create table ordenes(
    id_orden SERIAL primary key,
    id_usuario SERIAL not null,
    fecha datetime not null,
    direccion varchar(64) not null,
    constraint fk_usuario foreign key (id_usuario) references usuarios(id_usuario)
);

create table producto(
    id_producto SERIAL primary key,
    tipo varchar(64) not null
);

create table subtipo(
    id_subtipo SERIAL primary key,
    nombre varchar(128) not null
);

create table tamano(
    id_tamano SERIAL primary key,
    nombre varchar(32) not null
);

create table producto_tamano_subtipo(
    id_subtipo serial,
    id_tamano serial,
    id_producto serial not null,
    precio decimal not null,
    constraint fk_subtipo foreign key (id_subtipo) references subtipo(id_subtipo),
    constraint fk_tamano foreign key (id_tamano) references tamano(id_tamano),
    constraint fk_producto foreign key (id_producto) references producto(id_producto)
);

create table pizza(
    id_subtipo serial primary key,
    num_toppings integer not null,
    constraint fk_producto foreign key (id_subtipo) references subtipo(id_subtipo)
); 

create table toppings(
    id_topping SERIAL primary key,
    nombre varchar(64) not null
);

create table prodorden(
    id_productocreado SERIAL primary key,
    id_producto SERIAL not null,
    id_tamano SERIAL,
    id_orden serial not null,
    id_subtipo SERIAL not null,
    cantidad integer not null,
    constraint fk_creado foreign key (id_producto) references producto(id_producto),
    constraint fk_tamano foreign key (id_tamano) references tamano(id_tamano),
    constraint fk_subtipo foreign key (id_subtipo) references subtipo(id_subtipo),
    constraint fk_orden foreign key (id_orden) references ordenes(id_orden)
);

create table prodorden_topping(
    id_productocreado SERIAL not null,
    id_topping SERIAL not null,
    constraint fk_productoCreado foreign key (id_productoCreado) references prodorden(id_productocreado),
    constraint fk_topping foreign key (id_topping) references toppings(id_topping) 
);

-- insertando datos para probar estado de la informacion

insert into usuarios (nombre,apellido,email,contrasena) values ('ricardo','chavez','r@gmail.com','12345');
insert into usuarios (nombre,apellido,email,contrasena) values ('zavec','droahcir','z@gmail.com','12345');

insert into toppings (nombre) values ('Pepperoni');
insert into toppings (nombre) values ('Sausage');
insert into toppings (nombre) values ('Ham');
insert into toppings (nombre) values ('Spinach');
insert into toppings (nombre) values ('pineapple');
insert into toppings (nombre) values ('eggplant');

insert into producto (tipo) values ('Pasta');        --1
insert into producto (tipo) values ('Salads');
insert into producto (tipo) values ('Pizza');
insert into producto (tipo) values ('Dinner Plates');
insert into producto (tipo) values ('Drinks');

insert into subtipo (nombre) values ('Regular 0 toppings');
insert into subtipo (nombre) values ('Sicilian 0 toppings');
insert into subtipo (nombre) values ('Regular 1 toppings');
insert into subtipo (nombre) values ('Sicilian 1 toppings');
insert into subtipo (nombre) values ('Regular 2 toppings');
insert into subtipo (nombre) values ('Sicilian 2 toppings');
insert into subtipo (nombre) values ('Regular 3 toppings');
insert into subtipo (nombre) values ('Sicilian 3 toppings');

insert into subtipo (nombre) values ('Regular');
insert into subtipo (nombre) values ('Cheese');
insert into subtipo (nombre) values ('italian');
insert into subtipo (nombre) values ('Ham + Cheese');
insert into subtipo (nombre) values ('Meatball');
insert into subtipo (nombre) values ('Tuna');
insert into subtipo (nombre) values ('Turkey + Cheese');
insert into subtipo (nombre) values ('Chicken Parmigiana');
insert into subtipo (nombre) values ('Roast Beef');
insert into subtipo (nombre) values ('Eggplant Parmigiana');
insert into subtipo (nombre) values ('Steak');
insert into subtipo (nombre) values ('Steak + Cheese');
insert into subtipo (nombre) values ('Steak + Mushrooms');

insert into tamano (nombre) values ('small');
insert into tamano (nombre) values ('large');
insert into tamano (nombre) values ('pizza slice');
insert into tamano (nombre) values ('drink can');
insert into tamano (nombre) values ('drink tap');
insert into tamano (nombre) values ('drink bottle');

insert into ordenes (id_usuario,fecha,direccion) values (1,now(),'muy lejos');
insert into ordenes (id_usuario,fecha,direccion) values (2,now(),'muy lejos');
insert into ordenes (id_usuario,fecha,direccion) values (1,now(),'muy lejos');

insert into pizza (num_toppings,id_subtipo) values (0,15);
insert into pizza (num_toppings,id_subtipo) values (0,16);
insert into pizza (num_toppings,id_subtipo) values (1,17);
insert into pizza (num_toppings,id_subtipo) values (1,18);
insert into pizza (num_toppings,id_subtipo) values (2,19);
insert into pizza (num_toppings,id_subtipo) values (2,20);
insert into pizza (num_toppings,id_subtipo) values (3,21);
insert into pizza (num_toppings,id_subtipo) values (3,22);

insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,15,1,8.35);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,17,1,9.50);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,19,1,10.50);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,21,1,11.70);

insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,15,2,13.75);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,17,2,15.75);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,19,2,17.75);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,21,2,19.75);

insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,16,1,16.75);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,18,1,18.75);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,20,1,19.75);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,22,1,20.75);

insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,16,2,26.50);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,18,2,28.50);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,20,2,30.50);
insert into producto_tamano_subtipo (id_producto,id_subtipo,id_tamano,precio) values (3,22,2,31.50);

insert into prodorden (id_orden,id_producto,id_subtipo,id_tamano,cantidad) values (1,3,17,1,1);
insert into prodorden (id_orden,id_producto,id_subtipo,id_tamano,cantidad) values (1,3,19,2,2);

insert into prodorden_topping (id_topping,id_productocreado) values (1,2);
insert into prodorden_topping (id_topping,id_productocreado) values (2,2);
insert into prodorden_topping (id_topping,id_productocreado) values (3,2);


-- querys
select producto.tipo,tamano.nombre,subtipo.nombre,producto_tamano_subtipo.precio, pizza.num_toppings from producto_tamano_subtipo join tamano on producto_tamano_subtipo.id_tamano=tamano.id_tamano join producto on producto_tamano_subtipo.id_producto=producto.id_producto join subtipo on producto_tamano_subtipo.id_subtipo=subtipo.id_subtipo join pizza on producto_tamano_subtipo.id_subtipo=pizza.id_subtipo order by pizza.num_toppings asc; 


select producto.tipo,prodorden_topping.id_topping,prodorden.id_orden,prodorden.id_subtipo,prodorden.id_tamano from prodorden join producto on producto.id_producto=prodorden.id_producto join prodorden_topping on prodorden.id_productoCreado = prodorden_topping.id_productoCreado order by prodorden.id_tamano asc;


