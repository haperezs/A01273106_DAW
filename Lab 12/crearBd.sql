--Crear tablas--
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Materiales')
DROP TABLE Materiales 

CREATE TABLE Materiales 
( 
  Clave numeric(5) not null, 
  Descripcion varchar(50), 
  Costo numeric (8,2) 
) 


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proveedores')
DROP TABLE Proveedores 

CREATE TABLE Proveedores 
( 
  RFC char(13) not null, 
  RazonSocial varchar(50) 
) 


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Proyectos')
DROP TABLE Proyectos

CREATE TABLE Proyectos 
( 
  Numero numeric(5) not null, 
  Denominacion varchar(50) 
) 


IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Entregan')
DROP TABLE Entregan 

CREATE TABLE Entregan 
( 
  Clave numeric(5) not null, 
  RFC char(13) not null, 
  Numero numeric(5) not null, 
  Fecha DateTime not null, 
  Cantidad numeric (8,2) 
)

--Insertar datos--
BULK INSERT a1273106.[Materiales] 
  FROM 'e:\wwwroot\a1273106\materiales.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

BULK INSERT a1273106.[Proyectos] 
  FROM 'e:\wwwroot\a1273106\Proyectos.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

BULK INSERT a1273106.[Proveedores] 
  FROM 'e:\wwwroot\a1273106\Proveedores.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  ) 

SET DATEFORMAT dmy

BULK INSERT a1273106.[Entregan] 
  FROM 'e:\wwwroot\a1273106\Entregan.csv' 
  WITH 
  ( 
    CODEPAGE = 'ACP', 
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n' 
  )
  
   
--Ejercicio 2--
ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)
ALTER TABLE Proveedores add constraint llaveProveedores PRIMARY KEY (RFC)
ALTER TABLE Proyectos add constraint llaveProyectos PRIMARY KEY (Numero)
ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY (Clave, RFC, Numero, Fecha)

--Ejercicio 3--
ALTER TABLE Entregan add constraint cfEntreganClave 
foreign key (clave) references Materiales(clave);

ALTER TABLE Entregan add constraint cfEntreganRFC 
foreign key (RFC) references Proveedores(RFC); 

ALTER TABLE Entregan add constraint cfEntreganNumero 
foreign key (Numero) references Proyectos(Numero); 

--Ejercicio 4--
ALTER TABLE Entregan add constraint Cantidad check (Cantidad > 0); 