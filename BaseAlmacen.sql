create database LosAlmacenes
go

use LosAlmacenes

create table ALMACENES
(
Codigo int identity (10,5),
Lugar nvarchar (100),
Capacidad int,
primary key (Codigo)
)


create table CAJAS
(
NumReferencia char (5),
Contenido nvarchar (100),
Valor int,
Almacen int,
primary key (NumReferencia),
foreign key (Almacen)references ALMACENES(Codigo)
)

if object_id ('LosAlmacenes') is not null
  drop table ALMACENES;

insert into ALMACENES (Lugar, Capacidad) values ('Buenos Aires',15);
insert into ALMACENES (Lugar, Capacidad) values ('Cordoba',25);
insert into ALMACENES (Lugar, Capacidad) values ('Formosa',5);
insert into ALMACENES (Lugar, Capacidad) values ('Montevideo',10);
insert into ALMACENES (Lugar, Capacidad) values ('Punta del este',10);
insert into ALMACENES (Lugar, Capacidad) values ('Rocha',7);
insert into ALMACENES (Lugar, Capacidad) values ('Rio de Janeiro',100);
insert into ALMACENES (Lugar, Capacidad) values ('Sáo Paulo',5);
insert into ALMACENES (Lugar, Capacidad) values ('Sevilla',3);
insert into ALMACENES (Lugar, Capacidad) values ('Santiago de Compostela',35);
insert into ALMACENES (Lugar, Capacidad) values ('Cartagena',50);
insert into ALMACENES (Lugar, Capacidad) values ('Roma',16);
insert into ALMACENES (Lugar, Capacidad) values ('Milan',75);
insert into ALMACENES (Lugar, Capacidad) values ('Verona',64);
insert into ALMACENES (Lugar, Capacidad) values ('Nápoles',30);


insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('A2ZT','Plastico',150,10);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('A3ZT','Bulones',550,15);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('A4ZT','Carton',100,20);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('U5SA','Papel',500,25);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('U15SA','Calo PVC',75,30);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('U8SA','Plastico',50,35);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('B10QW','Bananas',160,40);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('B2QW','Plastico',150,45);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('E2KO','Zumo MixFrutal',256,50);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('E20KO','Oro',800,55);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('E55KO','Plata',688,60);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('I56OP','Chasinado',368,65);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('I24OP','Carton',50,70);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('I1OP','Plastico',20,75);
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('I8OP','Perfumes',75,80);

select * from CAJAS


/*1*/
select * from ALMACENES

/*2*/
select * from CAJAS where Valor >150

/*3*/
select distinct Contenido from CAJAS 

/*4*/
select avg(Valor) from CAJAS

/*5*/
select Almacen, avg(Valor)
from CAJAS
group by Almacen

/*6*/
select Almacen, avg(Valor)
from CAJAS
group by Almacen
having avg (Valor) < 150

/*7*/
select NumReferencia, Lugar
from ALMACENES inner join CAJAS
on ALMACENES.Codigo = CAJAS.Almacen  

/*8*//**/
select Almacen , count (*)
from CAJAS
group by Almacen

select Codigo, count (NumReferencia)
from ALMACENES left join CAJAS
on ALMACENES.Codigo = CAJAS.Almacen
group by Codigo 

/*9*//**/
select Codigo 
from ALMACENES
where Capacidad <
(
select count (*) 
from CAJAS
where Almacen = Codigo
)

/*10*/
insert into ALMACENES (Lugar, Capacidad) values ('Bilboa',3)
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('D65HJ','Baterias',75,85);

/*Sin consulta*/
select NumReferencia
from ALMACENES left join CAJAS
on ALMACENES.Codigo = CAJAS.Almacen
where Lugar = 'Bilboa' 

/*con consulta*/
select NumReferencia
from CAJAS
where Almacen in
(
select Codigo
from ALMACENES
where Lugar = 'Bilboa'
) 

/*11*/
insert into ALMACENES (Lugar, Capacidad) values ('Barcelona',3)

insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('D5HJ','Cargadores de celular',75,90);


/*12*/
insert into CAJAS (NumReferencia, Contenido, Valor,Almacen) values ('H5RT','Papel',200,15);

/*13*/
update CAJAS set Valor = Valor * 0.85

select * from CAJAS

select * from ALMACENES

/*14*/
update CAJAS set Valor = Valor * 0.80
where Valor > (select avg(Valor) from CAJAS)

select * from CAJAS

/*15*/
delete from CAJAS where Valor < 100 

select * from CAJAS

/*16*/
delete from CAJAS where Almacen in
(
select Codigo
from ALMACENES
where Capacidad <
(
select count (*)
from CAJAS
where Almacen = Codigo
) 
)

select * from CAJAS

select * from ALMACENES
