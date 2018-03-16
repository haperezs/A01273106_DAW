--Crea material
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'creaMaterial' AND type = 'P')
     DROP PROCEDURE creaMaterial
GO
            
CREATE PROCEDURE creaMaterial
    @uclave NUMERIC(5,0),
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2),
    @uimpuesto NUMERIC(6,2)
AS
    INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
GO

--Modificar material
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaMaterial' AND type = 'P')
     DROP PROCEDURE modificaMaterial
GO
            
CREATE PROCEDURE modificaMaterial
    @uclave NUMERIC(5,0),
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2),
    @uimpuesto NUMERIC(6,2)
AS
    UPDATE Materiales 
	SET Descripcion = @udescripcion, Costo = @ucosto, PorcentajeImpuesto = @uimpuesto 
	WHERE Clave = @uclave
GO

--Elimina material
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'eliminaMaterial' AND type = 'P')
     DROP PROCEDURE eliminaMaterial
GO
            
CREATE PROCEDURE eliminaMaterial
    @uclave NUMERIC(5,0)
AS
    DELETE FROM Materiales WHERE Clave = @uclave
GO



--Crea proyecto
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'creaProyecto' AND type = 'P')
     DROP PROCEDURE creaProyecto
GO
            
CREATE PROCEDURE creaProyecto
    @unumero NUMERIC(5,0),
    @udenominacion VARCHAR(50)
AS
    INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
GO

--Modificar proyecto
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaProyecto' AND type = 'P')
     DROP PROCEDURE modificaProyecto
GO
            
CREATE PROCEDURE modificaProyecto
    @unumero NUMERIC(5,0),
    @udenominacion VARCHAR(50)
AS
    UPDATE Proyectos 
	SET Denominacion = @udenominacion 
	WHERE Numero = @unumero
GO

--Elimina proyecto
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaProyecto' AND type = 'P')
     DROP PROCEDURE modificaProyecto
GO
            
CREATE PROCEDURE modificaProyecto
    @unumero NUMERIC(5,0)
AS
    DELETE FROM Proyectos WHERE Numero = @unumero
GO



--Crea proveedor
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'creaProveedor' AND type = 'P')
     DROP PROCEDURE creaProveedor
GO
            
CREATE PROCEDURE creaProveedor
    @urfc CHAR(13),
    @urazonsocial VARCHAR(50)
AS
    INSERT INTO Proveedores VALUES(@urfc, @urazonsocial)
GO

--Modificar proveedor
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaProveedor' AND type = 'P')
     DROP PROCEDURE modificaProveedor
GO
            
CREATE PROCEDURE modificaProveedor
	@urfc CHAR(13),
    @urazonsocial VARCHAR(50)
AS
    UPDATE Proveedores 
	SET RazonSocial = @urfc 
	WHERE RFC = @urazonsocial
GO

--Elimina proveedor
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaProveedor' AND type = 'P')
     DROP PROCEDURE modificaProveedor
GO
            
CREATE PROCEDURE modificaProveedor
	@urfc CHAR(13)
AS
    DELETE FROM Proveedores WHERE RFC = @urfc
GO



--Crea entrega
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'creaEntrega' AND type = 'P')
     DROP PROCEDURE creaEntrega
GO
            
CREATE PROCEDURE creaEntrega
    @uclave NUMERIC(5,0),
    @urfc CHAR(13),
	@unumero NUMERIC(5,0),
    @ufecha DATETIME,
	@ucantidad NUMERIC(8,2)
AS
    INSERT INTO Entregan VALUES(@uclave, @urfc, @unumero, @ufecha, @ucantidad)
GO

--Modificar entrega
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'modificaEntrega' AND type = 'P')
     DROP PROCEDURE modificaEntrega
GO
            
CREATE PROCEDURE modificaEntrega
    @uclave NUMERIC(5,0),
    @urfc CHAR(13),
	@unumero NUMERIC(5,0),
    @ufecha DATETIME,
	@ucantidad NUMERIC(8,2)
AS
    UPDATE Entregan 
	SET Cantidad = @ucantidad
	WHERE Clave = @uclave AND RFC = @urfc AND Numero = @unumero AND Fecha = @urfc
GO

--Elimina entrega
IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'eliminaEntrega' AND type = 'P')
     DROP PROCEDURE eliminaEntrega
GO
            
CREATE PROCEDURE eliminaEntrega
    @uclave NUMERIC(5,0),
    @urfc CHAR(13),
	@unumero NUMERIC(5,0),
    @ufecha DATETIME
AS
    DELETE FROM Entregan WHERE Clave = @uclave AND RFC = @urfc AND Numero = @unumero AND Fecha = @urfc
GO





--Store procedures
IF EXISTS (SELECT name FROM sysobjects 
		WHERE name = 'queryMaterial' AND type = 'P')
	DROP PROCEDURE queryMaterial
GO
                        
CREATE PROCEDURE queryMaterial
	@udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2)
                          
AS
	SELECT * FROM Materiales WHERE descripcion 
	LIKE '%'+@udescripcion+'%' AND costo > @ucosto 
GO

--Prueba
EXECUTE queryMaterial 'Lad', 20 
