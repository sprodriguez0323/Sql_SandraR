create database Libreria
use Libreria

-- 1. ESQUEMA CATALOGO

create schema Catalogo 
go

create table Catalogo.Autores
(
	AutorId int identity (1000,1) primary key,
	Nombre varchar (50),
	Apellido varchar (50)
)

create table Catalogo.Categoria
(
	CategoriaId int identity (100,1) primary key,
	Nombre_categoria varchar (70)
)

create table Catalogo.Libros
(
	LibroId int identity (1,1) primary key,
	Titulo varchar (100),
	Autor int not null,
	constraint fk_autor_con_id_autor foreign key (Autor) references Catalogo.Autores (AutorId),
	Categoria int not null,
	constraint fk_categoria_con_id_categoria foreign key (Categoria) references Catalogo.Categoria (CategoriaId),
	Precio int check (Precio>0)
)

-- 2. ESQUEMA VENTAS
create schema Ventas 
go

create table Ventas.Clientes
(
	ClientesId int identity (1,1) primary key,
	Nombre_Cliente varchar (50),
	Apellido_Cliente varchar (50),
	email nvarchar (100) unique not null
)

create table Ventas.Ventas
(
	VentasId int identity (1,5) primary key,
	Cliente int not null,
	constraint fk_cliente_con_id_cliente foreign key (Cliente) references Ventas.Clientes (ClientesId),
	Fecha_venta date
)

create table Ventas.Detalle_Ventas
(
	DetalleId int  identity (1,1) primary key,
	VentaId int not null,
	LibroId int not null,
	Cantidad int not null,
	Precio_Venta money
)

select * from Catalogo.Libros
--- Parte 3 Relaciones


--- Parte 4.1. Relaciones entre tablas
 

alter table Ventas.Detalle_Ventas
	add constraint fk_VentasId_con_VentasId foreign key (VentaId) references Ventas.Ventas (VentasId)

alter table Ventas.Detalle_Ventas
	add constraint fk_LibroId_con_LibroId foreign key (LibroId) references Catalogo.Libros (LibroId)



--- Parte 4.2. Modificar nombres columnas

sp_rename 'Catalogo.Autores.Nombre','Nombre_Autores','COLUMN';
sp_rename 'Catalogo.Libros.Titulo','Titulo_Libros','COLUMN';
sp_rename 'Catalogo.Autores.Nombre_Autores','Nombre','COLUMN';


--- Parte 4.3. Adicionar variables
alter table Ventas.Clientes
add Numero_Documento varchar (50)


alter table Ventas.Detalle_Ventas
add Almacen varchar (100)

-- Parte 5. Insertar datos

Insert into Catalogo.Autores
(Nombre_Autores,Apellido)
values
('Mario','Medoza'),
('German', 'Castro Caicedo'),
('Egbert', 'Asshauer'),
('Paul', 'Young'),
('Daniel','Alighieri'),
('Fabio', 'Castillo'),
('Alberto', 'Coral'),
('Daniel', 'Mendoza'),
('Gonzalo', 'Gillen'),
('Gabriel', 'Garcia Marquez')

Insert into  Catalogo.Categoria
(Nombre)
Values
('Novela'),
('Poesia'),
('Ciencia ficción'),
('Suspenso'),
('Biografias'),
('Historia'),
('Acción y aventura'),
('Comics'),
('Periodistico'),
('Libros de consultas')

Insert into  Catalogo.Libros
(Titulo_libros, Autor, Categoria, Precio )
Values
---('Los Jinetes de la cocaina', 1005,108,85000)
('La divina comedia',1004,100,45000),
('Akelarre', 1000,103,65000),
('La Cabaña',1003,100,45000),
('El arte de soñar y meditar', 1002,100,75000),
('El dia que mataron a mi padre', 1006,108,65000),
('Matarife',1007,108,85000),
('Los Jinetes de la cocaina', 1005,108,85000),
('La importancia de morir a tiempo', 1000,100,75000),
('Las 12 mentiras capitales', 1008,108,95000)

Insert into  Ventas.Clientes
(Nombre_Cliente, Apellido_Cliente, email,Numero_Documento)
values
('Sofia', 'Ropero', 'sropero@gmail.com', 20145488),
('Andres', 'Arevalo', 'aarevalo@gmail.com', 154789),
('Carlos', 'Gonzalez', 'cgonzalez@gmail.com', 123457),
('Luz Marina', 'Arango', 'lmarango@gmail.com', 7984564),
('Lucinda', 'Lopez', 'llopez@gmail.com', 4784568),
('Janneth', 'Rodriguez', 'jrodriguez@gmail.com', 5874681),
('Veronica', 'Puerto', 'vpuerto@gmail.com', 895470),
('Candelaria', 'Sanchez', 'csanchez@gmail.com', 4789642),
('Johanna', 'Amaya', 'jamaya@gmail.com', 35447876),
('Antonio', 'Forez', 'aflorez@gmail.com', 95784)

Insert into Ventas.Ventas
(Cliente, Fecha_venta)
values
(7,'2023-07-22')
(1,'2024-03-23'),
(4,'2023-12-06'),
(6,'2023-03-05'),
(3,'2023-02-08'),
(2,'2024-01-30'),
(2,'2023-12-28'),
(10,'2024-05-01'),
(9,'2024-05-04'),
(1,'2024-04-05')

select * from Ventas.Detalle_Ventas

Insert into Ventas.Detalle_Ventas
(VentaId, LibroId, Cantidad, Precio_venta, Almacen)
values
(1, 1,1,85000,'Unicentro'),
(6, 7,2,170000,'Unicentro'),
(46, 8,1,85000,'Unicentro'),
(26, 5,1,75000,'Unicentro'),
(31, 3,1,65000,'Unicentro'),
(21, 9,2,150000,'Unicentro'),
(26, 4,1,45000,'Unicentro'),
(16, 3,3,195000,'Unicentro'),
(11, 10,2,190000,'Unicentro'),
(41, 2,1,45000,'Unicentro')














Values
