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
    tipo varchar(64) not null,
    subtipo varchar(64),
    tamano varchar(10) not null,
    precio decimal not null    
);

create table pizza(
    id_producto serial primary key,
    num_toppings integer not null,
    constraint fk_producto foreign key (id_producto) references producto(id_producto)
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

insert into producto (tipo,subtipo) values ('Pasta','baked Ziti Mozarella');        --1
insert into producto (tipo,subtipo) values ('Pasta','baked Ziti Meatballs');
insert into producto (tipo,subtipo) values ('Pasta','baked Ziti Chicken');

insert into producto (tipo,subtipo) values ('Salads','Garden');
insert into producto (tipo,subtipo) values ('Salads','Greek');                      --5
insert into producto (tipo,subtipo) values ('Salads','Antipasto');
insert into producto (tipo,subtipo) values ('Salads','Tuna');

insert into producto (tipo,subtipo) values ('Dinner Plates','Garden');
insert into producto (tipo,subtipo) values ('Dinner Plates','Greek');
insert into producto (tipo,subtipo) values ('Dinner Plates','Antipasto');           --10
insert into producto (tipo,subtipo) values ('Dinner Plates','Baked Ziti');
insert into producto (tipo,subtipo) values ('Dinner Plates','Ziti with metballs');
insert into producto (tipo,subtipo) values ('Dinner Plates','Ziti with Chicken');

insert into producto (tipo,subtipo) values ('Dinner Plates','Garden');
insert into producto (tipo,subtipo) values ('Dinner Plates','Greek');               --15
insert into producto (tipo,subtipo) values ('Dinner Plates','Antipasto');
insert into producto (tipo,subtipo) values ('Dinner Plates','Baked Ziti');
insert into producto (tipo,subtipo) values ('Dinner Plates','Ziti with metballs');
insert into producto (tipo,subtipo) values ('Dinner Plates','Ziti with Chicken');

insert into producto (tipo,subtipo) values ('Drink', null);                         --20

insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','small',8.35);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','small',9.50);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','small',10.50);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','small',11.70);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','small',14.75);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','large',13.75);                     --25
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','large',15.75);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','large',17.75);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','large',19.75);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','regular','large',20.95);

insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian','small',);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian','small',);                    --30
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian','small',);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian','small',);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian','small',);

insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian'.'large',);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian'.'large',);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian'.'large',);                    --35
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian'.'large',);
insert into producto (tipo,subtipo,tamano,precio) values ('Pizza','sicilian'.'large',);



