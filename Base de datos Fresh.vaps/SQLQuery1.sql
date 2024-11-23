
create database Fresh_vaps;
use Fresh_vaps;

create table cliente (
    id_cliente varchar(50),
    nombre_cliente varchar(100) not null,
    telefono int,
    constraint pk_cliente primary key (id_cliente)
);

create table vaporizadores (
    id_vape varchar(50),
    marca varchar(50) not null,
    modelo varchar(50) not null,
    puff varchar(50),
    precio int not null,
    cant_inv int not null,
    constraint pk_vaporizadores primary key (id_vape)
);

create table venta (
    id_venta varchar(50),
    fecha_ven date not null,
    cant_ven int not null,
    total int not null,
    id_cliente varchar(50),
    id_vape varchar(50),
    constraint pk_venta primary key (id_venta),
    constraint fk_venta_cliente foreign key (id_cliente) references cliente(id_cliente),
    constraint fk_venta_vape foreign key (id_vape) references vaporizadores(id_vape)
);

create table deuda (
    id_deuda varchar(50),
    monto int not null,
    fecha_generada date not null,
    fecha_fin date,
    id_cliente varchar(50),
    constraint pk_deuda primary key (id_deuda),
    constraint fk_deuda_cliente foreign key (id_cliente) references cliente(id_cliente)
);

insert into cliente (id_cliente,nombre_cliente,telefono ) values 
	('C001','Julian Mandon',31590372),
	('C002','Juan Camacho',32199878),
	('C003','Sepulveda',30224535),
	('C004','Duque',31433593);

insert into vaporizadores (id_vape, marca, modelo, puff, precio, cant_inv) values
	('V001','Kuz','Kuz9000','9000',25.000,2),
	('V002','Mtrx','Mtrx25000','25000',40.000,1),
	('V003','Mtrx','Mtrx12000','12000',35.000,2),
	('V004','Bot it','Bot it 9000','9000',30.000,3);

insert into venta (id_venta, fecha_ven, cant_ven, total, id_cliente, id_vape) values
	('VE004', '2024-11-15', 1, 25000, 'C001', 'V001'),
	('VE005', '2024-11-16', 2, 80000, 'C002', 'V002'),
	('VE006', '2024-11-17', 1, 35000, 'C003', 'V003'),
	('VE007', '2024-11-18', 1, 30000, 'C004', 'V004');

insert into deuda (id_deuda, monto, fecha_generada, fecha_fin, id_cliente) values
	('D004', 25000, '2024-11-15', null, 'C001'),
	('D005', 40000, '2024-11-16', null, 'C002'),
	('D006', 35000, '2024-11-17', null, 'C003');


select marca,modelo,precio,cant_inv from vaporizadores join venta on vaporizadores.id_vape = venta.id_vape where vaporizadores.cant_inv - venta.cant_ven > 0;