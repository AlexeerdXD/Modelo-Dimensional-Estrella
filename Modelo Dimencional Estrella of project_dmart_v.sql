create database project_dmart_v; -- creando la base de datos project_damart_v
use project_dmart_v; -- selecionando la base de datos projrct_dmart_v

# selecionando la base de datos proyectolaravel
use proyectolaravel; 
show tables; -- consultando que tablas tiene y cuandos tablas tiene el db proyectolaravel
describe productos; -- describiento la tabla productos que campos y que tipo de tado recibe cada campo
describe detalle_compras;
describe categorias;

# creando la tabla DIMProducto si es  que no existe
create table if not exists DimProducto(
id int unsigned not null auto_increment, -- este campo va ser auto incremen y no va hacertar valores nulos
cod_producto varchar(50)  null, -- este campo es de tipo varchar y no va hacepta valores nulos
nom_producto varchar(100) not null, -- este campo es de tipo varchar y no va hacepta valores nulos
prec_compra decimal(11,2) not null,
prec_venta decimal(11,2) not  null,
cat_prod varchar(50) not null,
primary key(id)
);


# creanto la tabla DimTiempo si es que no existe
create table if  not exists DimTiempo(
id int unsigned not null auto_increment,
fecha date null,
nom_dia_semana varchar(12) null,
cod_mes varchar(2) null,
nom_mes varchar(12) null,
cod_trim varchar(1) null,
nom_trim varchar(20) null,
anio varchar(4) null,
primary key(id)
);

describe clientes;

# creando la tabla DimCliente si es que no existe
create table if not exists DimCliente (
id int unsigned not null auto_increment,
nom_cliente varchar(100) not null,
direccion varchar(70) null,
primary key(id)
);

describe users;

# creando la tabla DimVendedor si es que no existe
create table if not exists DimVendedor(
id int unsigned not null auto_increment,
nom_vendedor varchar(100) not null,
primary key(id)
);

describe detalle_ventas;
describe ventas;
# creando la tabla FactVenta si es que no exsiste
create table if not exists FactVenta (
DimTiempo_id int unsigned not null,
DimProducto_id int unsigned not null,
DimCli_id int unsigned not null,
DimVend_id int unsigned not null,
Ventas decimal(11,2) null,
Can_Unidades decimal(11,2) null,
Costos decimal(11,2) null,
Descuentos decimal(11,2) null,
can_dia_venta varchar(12) null,
can_mes_venta varchar(12) null,
can_anio_venta varchar(4) null,
Can_clientes int null,
 foreign key(DimTiempo_id) references DimTiempo(id)
 on update cascade on delete cascade,
 foreign key(DimProducto_id) references DimProducto(id)
 on update cascade on delete cascade,
 foreign key(DimCli_id) references DimCliente(id)
 on update cascade on delete cascade,
 foreign key(DimVend_id) references DimVendedor(id)
 on update cascade on delete cascade,
 primary key(DimTiempo_id, DimProducto_id, DimCli_id, DimVend_id ) 
 );










