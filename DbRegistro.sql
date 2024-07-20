-- Creacion de BD

Create database dbregistro
go

use dbregistro
go

--crear tabla Ciudades
create table ciudades(
	id int primary key identity(1, 1)
	, nombre nvarchar(60) not null
	, estado bit default 1
)

go

--crear tabla Personas
create table personas(
	id int primary key identity(1, 1)
	, nombres nvarchar(40) not null
	, apellidos nvarchar(40) not null
	, ciudad_id int foreign key references
		ciudades(id) not null
	, activo bit default 1
)
go


/*consultas de insertar*/

insert into ciudades(nombre) values('Masaya'),('Granada'),('Jinotepe'),('Managua'),('León')
go

insert into personas(nombres,apellidos,ciudad_id) values ('Belen','Acuna',4),('Erick','Martinez',4),('Sergio','Rivas',1)
,('Elmer','Martinez',3),('Cesar','Gallardo',5)
go

/*CRUD*/
/*Visualizar datos*/

Select * from ciudades
go

Select * from personas
go

Select id as 'Código', nombre as 'Ciudad', estado as 'Est' from ciudades
go

select personas.id as Código, personas.nombres + ' ' + personas.apellidos as 'Nombre completo', 
ciudades.nombre as Ciudad from personas inner join ciudades
on personas.ciudad_id = ciudades.id
go


/*variables*/
--Consulta por nombre, declarando variable @nombre

declare @nombre nvarchar(40)
set @nombre = '%r%'

Select * from personas where nombres like @nombre