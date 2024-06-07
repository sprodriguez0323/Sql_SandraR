Create database mineras_1
use mineras_1

create schema dem
go


create table dem.tipo_documento
(	id_tipo_Doc int primary key,
	documento char (30) not null)
insert into dem.tipo_documento (id_tipo_Doc, documento)
values
(1,'Cédula de ciudadania'),
(2,'NUI'),
(3,'Tarjeta de identidad'),
(4,'Registro de civil'),
(5,'Permiso de permanencia'),
(6,'Sin información')
select * from dem.tipo_documento

create table dem.sexo
(	id_sexo int primary key,
	sexo char (20) not null)
insert into dem.sexo
(id_sexo, sexo)
values
(1, 'Mujer'),
(2, 'Hombre'),
(3, 'Intersexual'),
(99, 'NS/NR')

select *from dem.sexo

create schema ubicacion
go

create table ubicacion.ciudad_nacimiento
(	id_ciudad_nacimiento int primary key,
	nombre_ciudad char(50) not null)
insert into ubicacion.ciudad_nacimiento
(id_ciudad_nacimiento, nombre_ciudad)
values
(11001, 'Bogotá'),
(5001,'Medellín'),
(76001,'Cali'),
(8001,'Barranquilla'),
(13001,'Cartagena')


select * from ubicacion.ciudad_nacimiento

create table dem.parentesco
(	id_parentesco int primary key,
	parentesco char (50) not null)

insert into dem.parentesco
(id_parentesco, parentesco)
values
(1, 'jefe de hogar'),
(2, 'cónyuge'),
(3, 'hijo'),
(4, 'otro pariente'),
(5, 'otro no pariente')

select *from dem.parentesco


create table dem.nivel_educativo
(	id_nivel_educativo int primary key,
	nivel_educativo char (50) not null)

insert into dem.nivel_educativo
(id_nivel_educativo, nivel_educativo)
values
(0, 'Ninguno'),
(1, 'primaria'),
(2, 'secundaria'),
(3, 'profesional'),
(4, 'posgrado')
select *from dem.nivel_educativo


create table dem.personas
(	Id_personas int identity (1,1) primary key,
	tipo_documento int default (6),
	numero_doc int unique not null,
	parentesco int not null, 
	ciudad_nacimiento int default (99),
	sexo int default (99),
	mail nvarchar (300) unique not null, --- evita que se repita el mail
	edad int default (99),
	fecha_cumple date,
	nivel int,
	constraint fk_tipo_doc_con_id_tipo_documento foreign key (tipo_documento) references dem.tipo_documento (id_tipo_Doc),
	constraint fk_parentesco_con_id_parentesco foreign key (parentesco) references dem.parentesco (id_parentesco),
	constraint fk_sexo_con_id_sexo foreign key (sexo) references dem.sexo (id_sexo),
	constraint fk_ciudad_nacimiento_con_id_ciudad_nacimiento foreign key (ciudad_nacimiento) references ubicacion.ciudad_nacimiento (id_ciudad_nacimiento),
	constraint fk_nivel_con_id_nivel foreign key (nivel) references dem.nivel_educativo (id_nivel_educativo)
	)

insert into dem.personas
(tipo_documento, numero_doc, parentesco, ciudad_nacimiento, sexo, mail, edad, fecha_cumple,nivel)
values
(1,456,1,5001,1,'mromero@gmail',15,'2008-02-23',1), 
(3,789,2,11001,2,'ssanchez@gmail',18,'2025-02-23',4), 
(2,321,3,76001,2,'h2508_g@gmail',23,'1998-02-23',3), 
(1,1458,1,8001,3,'xx_1978@gmail',47,'1978-03-23',1), 
(2,58871,2,13001,1,'saromero@gmail',30,'1993-09-23',1) 

select * from dem.personas
