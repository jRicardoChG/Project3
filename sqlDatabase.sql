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
    fecha date not null,
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

create table productoCreado(
    id_productoCreado SERIAL primary key,
    id_producto SERIAL not null,
    constraint fk_creado foreign key (id_producto) references producto(id_producto)
);

create table productoCreado_topping(
    id_productoCreado SERIAL not null,
    id_topping SERIAL not null,
    constraint fk_productoCreado foreign key (id_productoCreado) references productoCreado(id_productoCreado),
    constraint fk_topping foreign key (id_topping) references toppings(id_topping) 
);

create table producto_orden(
    id_productoCreado SERIAL not null,
    id_orden SERIAL not null,
    cantidad integer not null,
    constraint fk_orden foreign key (id_orden) references ordenes(id_orden),
    constraint fk_productoCreado foreign key (id_productoCreado) references productoCreado(id_productoCreado)
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

-- querys
select producto.tipo,tamano.nombre,subtipo.nombre,producto_tamano_subtipo.precio, pizza.num_toppings from producto_tamano_subtipo join tamano on producto_tamano_subtipo.id_tamano=tamano.id_tamano join producto on producto_tamano_subtipo.id_producto=producto.id_producto join subtipo on producto_tamano_subtipo.id_subtipo=subtipo.id_subtipo join pizza on producto_tamano_subtipo.id_subtipo=pizza.id_subtipo order by pizza.num_toppings asc; 