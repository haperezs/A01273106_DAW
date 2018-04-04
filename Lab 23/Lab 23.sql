CREATE TABLE Clientes_Banca
(
  NoCuenta VARCHAR(5) NOT NULL,
  Nombre VARCHAR(30),
  Saldo NUMERIC(10,2)
)

CREATE TABLE Tipos_Movimiento
(
  ClaveM VARCHAR(2) NOT NULL,
  Descripcion VARCHAR(30),
)

CREATE TABLE Movimientos 
(
  NoCuenta VARCHAR(5) NOT NULL,
  ClaveM VARCHAR(2) NOT NULL,
  Fecha DATETIME,
  Monto NUMERIC(10,2),
)

ALTER TABLE Clientes_Banca ADD CONSTRAINT llaveClientes PRIMARY KEY (NoCuenta)
ALTER TABLE Tipos_Movimiento ADD CONSTRAINT llaveTipos PRIMARY KEY (ClaveM)
ALTER TABLE Movimientos ADD CONSTRAINT FK_Clientes FOREIGN KEY (NoCuenta) REFERENCES Clientes_Banca(NoCuenta)
ALTER TABLE Movimientos ADD CONSTRAINT FK_Tipos FOREIGN KEY (ClaveM) REFERENCES Tipos_Movimiento(ClaveM)



--Inserta la siguiente transacción y ejecútala. 
BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1

SELECT * FROM CLIENTES_BANCA 

--Inserta la siguiente transacción y ejecútala. 
BEGIN TRANSACTION PRUEBA2
INSERT INTO CLIENTES_BANCA VALUES('004','Ricardo Rios Maldonado',19000); 
INSERT INTO CLIENTES_BANCA VALUES('005','Pablo Ortiz Arana',15000); 
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Manuel Alvarado',18000); 

SELECT * FROM CLIENTES_BANCA


ROLLBACK TRANSACTION PRUEBA2 


--Comprobando la propiedad de Atomicidad en una BD. 

--Inserta la siguiente transacción y ejecútala. 
BEGIN TRANSACTION PRUEBA3
INSERT INTO TIPOS_MOVIMIENTO VALUES('A','Retiro Cajero Automatico');
INSERT INTO TIPOS_MOVIMIENTO VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

--Inserta la siguiente transacción y ejecútala.
BEGIN TRANSACTION PRUEBA4
INSERT INTO MOVIMIENTOS VALUES('001','A',GETDATE(),500);
UPDATE CLIENTES_BANCA SET SALDO = SALDO -500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4


SELECT * FROM CLIENTES_BANCA
SELECT * FROM MOVIMIENTOS

--Manejando Fallas en una Transacción 

--Captura y ejecuta la siguiente transacción: 
BEGIN TRANSACTION PRUEBA5
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO CLIENTES_BANCA VALUES('001','Oscar Perez Alvarado',8000);


IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END


--Por analogía crea las siguientes transacciones dentro de un store procedure: 

--Una transacción que registre el retiro de una cajero. nombre del store procedure REGISTRAR_RETIRO_CAJERO que recibe 
--2 parámetros en NoCuenta y el monto a retirar.

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'REGISTRAR_RETIRO_CAJERO' AND type = 'P')
     DROP PROCEDURE REGISTRAR_RETIRO_CAJERO
GO
            
CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO
    @uNoCuenta VARCHAR(5),
    @uMonto NUMERIC(10,2)
AS
	BEGIN TRANSACTION retiro

	INSERT INTO Movimientos VALUES(@uNoCuenta,'A',GETDATE(),@uMonto);
	UPDATE Clientes_Banca SET Saldo = Saldo - @uMonto
	WHERE NoCuenta = @uNoCuenta;

	IF @@ERROR = 0
	COMMIT TRANSACTION retiro
	ELSE
	BEGIN
	PRINT 'A transaction needs to be rolled back'
	ROLLBACK TRANSACTION retiro
	END
GO

--Prueba
EXECUTE REGISTRAR_RETIRO_CAJERO '002', 1000 



--Una transacción que registre el deposito en ventanilla. Nombre del store procedure REGISTRAR_DEPOSITO_VENTANILLA 
--que recibe 2 parámetros en NoCuenta y el monto a depositar.

IF EXISTS (SELECT name FROM sysobjects 
           WHERE name = 'REGISTRAR_DEPOSITO_VENTANILLA' AND type = 'P')
     DROP PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
GO
            
CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA
    @uNoCuenta VARCHAR(5),
    @uMonto NUMERIC(10,2)
AS
	BEGIN TRANSACTION deposito

	INSERT INTO Movimientos VALUES(@uNoCuenta,'B',GETDATE(),@uMonto);
	UPDATE Clientes_Banca SET Saldo = Saldo + @uMonto
	WHERE NoCuenta = @uNoCuenta;

	IF @@ERROR = 0
	COMMIT TRANSACTION deposito
	ELSE
	BEGIN
	PRINT 'A transaction needs to be rolled back'
	ROLLBACK TRANSACTION deposito
	END
GO

--Prueba
EXECUTE REGISTRAR_DEPOSITO_VENTANILLA '003', 1000 


SELECT * FROM Clientes_Banca
SELECT * FROM Movimientos