--Consulta de una tabla completa
SELECT * FROM materiales

--Selección 
SELECT * FROM materiales 
WHERE clave=1000 

--Proyección 
SELECT clave,rfc,fecha FROM entregan 

--Reunión Natural 
SELECT * FROM materiales,entregan 
WHERE materiales.clave = entregan.clave 

--Reunión con criterio específico 
SELECT * FROM entregan,proyectos 
WHERE entregan.numero < = proyectos.numero 

--Unión
(SELECT * FROM entregan WHERE clave=1450) 
UNION 
(SELECT * FROM entregan WHERE clave=1300) 

--Otra manera de hacerlo
SELECT * FROM entregan
WHERE clave=1450 OR clave=1300

--Intersección
(SELECT clave FROM entregan WHERE numero=5001) 
INTERSECT
(SELECT clave FROM entregan WHERE numero=5018) 

--Diferencia
(SELECT * FROM entregan) 
EXCEPT
(SELECT * FROM entregan WHERE clave=1000)

--Producto cartesiano
SELECT * FROM entregan,materiales 



--Obtener las descripciones de los materiales entregados en el año 2000
SET DATEFORMAT dmy
SELECT M.Descripcion
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave
AND E.Fecha BETWEEN '01/01/2000' AND '31/12/2000'

--Uso del calificador distinct
SET DATEFORMAT dmy
SELECT DISTINCT M.Descripcion
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave
AND E.Fecha BETWEEN '01/01/2000' AND '31/12/2000'

--Obtén los números y denominaciones de los proyectos con las fechas y cantidades de sus entregas, 
--ordenadas por número de proyecto, presentando las fechas de la más reciente a la más antigua
SELECT P.Numero, P.Denominacion, E.Fecha, E.Cantidad
FROM Proyectos P, Entregan E
WHERE P.Numero = E.Numero
ORDER BY E.Fecha DESC

--Operadores de cadena 
SELECT * FROM Materiales where Descripcion LIKE 'Si' 


DECLARE @foo varchar(40); 
DECLARE @bar varchar(40); 
SET @foo = '¿Que resultado'; 
SET @bar = ' ¿¿¿??? ' 
SET @foo += ' obtienes?'; 
PRINT @foo + @bar; 


SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%'; 
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%'; 
SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 


--Operadores lógicos

--Exists
SELECT RFC, Cantidad, Fecha, Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND 
Exists (SELECT [RFC] 
		FROM [Proveedores] 
		WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] ) 

--In
SELECT RFC, Cantidad, Fecha, Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND 
RFC In (SELECT [RFC] 
		FROM [Proveedores] 
		WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

--Not in
SELECT RFC, Cantidad, Fecha, Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND 
RFC Not in (SELECT [RFC] 
			FROM [Proveedores] 
			WHERE RazonSocial NOT LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] )

--Any
SELECT *
FROM Materiales 
WHERE Costo>ANY(	SELECT Costo
					FROM Materiales
					WHERE Clave < 1100)

--Top
SELECT TOP 2 * FROM Proyectos

SELECT TOP Numero FROM Proyectos 


--Modificando la estructura de un tabla existente. 
ALTER TABLE Materiales ADD PorcentajeImpuesto NUMERIC(6,2); 

UPDATE Materiales SET PorcentajeImpuesto = 2*clave/1000; 

SELECT * FROM Materiales


--¿Qué consulta usarías para obtener el importe de las entregas es decir, 
--el total en dinero de lo entregado, basado en la cantidad de la entrega
--y el precio del material y el impuesto asignado? 
SELECT Denominacion, SUM(E.Cantidad * (M.Costo * (1 + M.PorcentajeImpuesto/100))) as "Total"
FROM Materiales M, Entregan E, Proyectos P
WHERE M.Clave = E.Clave 
AND P.Numero = E.Numero
GROUP BY Denominacion


--Los materiales (clave y descripción) entregados al proyecto "México sin ti no estamos completos". 
SELECT M.Clave, M.Descripcion
FROM Materiales M, Proyectos P, Entregan E
WHERE M.Clave = E.Clave 
AND P.Numero = E.Numero 
AND P.Denominacion = 'Mexico sin ti no estamos completos'

--Los materiales (clave y descripción) que han sido proporcionados por el proveedor "Acme tools". 
SELECT M.Clave, Descripcion
FROM Materiales M, Proveedores P, Entregan E
WHERE M.Clave = E.Clave 
AND P.RFC = E.RFC 
AND P.RazonSocial = 'Acme tools'

--El RFC de los proveedores que durante el 2000 entregaron en promedio cuando menos 300 materiales.
SET DATEFORMAT dmy
SELECT RFC
FROM Entregan
WHERE Fecha BETWEEN '01/01/2000' AND '31/12/2000'
GROUP BY RFC
HAVING AVG(Cantidad) >= 300

--El Total entregado por cada material en el año 2000.
SELECT M.Descripcion, SUM(E.Cantidad) AS 'Total'
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave
AND E.Fecha BETWEEN '01/01/2000' AND '31/12/2000'
GROUP BY M.Descripcion

--La Clave del material más vendido durante el 2001. 
SELECT Clave, SUM(Cantidad) AS 'Total'
FROM Entregan
WHERE Fecha BETWEEN '01/01/2001' AND '31/12/2001'
GROUP BY Clave
ORDER BY Total DESC

--Productos que contienen el patrón 'ub' en su nombre. 
SELECT Descripcion
FROM Materiales
WHERE Descripcion LiKE '%ub%'

--Denominación y suma del total a pagar para todos los proyectos.
SELECT P.Denominacion, SUM(E.Cantidad * M.Costo) AS 'Total'
FROM Entregan E, Proyectos P, Materiales M
WHERE E.Numero = P.Numero
AND E.Clave = M.Clave
GROUP BY Denominacion

--Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa 
--en acción que no se encuentran apoyando al proyecto Educando en Coahuila.
CREATE VIEW Televisa
AS
SELECT Pr.RFC
FROM Proveedores Pr, Proyectos P, Entregan E
WHERE P.Denominacion = 'Televisa en acción'
AND E.Numero = P.Numero 
AND Pr.RFC = E.RFC

CREATE VIEW Coahuila
AS
SELECT Pr.RFC
FROM Proveedores Pr, Proyectos P, Entregan E
WHERE P.Denominacion = 'Educando en Coahuila'
AND E.Numero = P.Numero 
AND Pr.RFC = E.RFC

SELECT DISTINCT P.Denominacion, Pr.RFC, Pr.RazonSocial
FROM Proyectos P, Proveedores Pr, Entregan E
WHERE E.Numero = P.Numero 
AND Pr.RFC = E.RFC
AND P.Denominacion = 'Televisa en acción'
AND Pr.RFC IN((	SELECT RFC
				FROM Televisa)
				EXCEPT
				(SELECT RFC
				FROM Coahuila))

--Denominación, RFC y RazonSocial de los proveedores que se suministran materiales al proyecto Televisa 
--en acción que no se encuentran apoyando al proyecto Educando en Coahuila.
SELECT DISTINCT P.Denominacion, Pr.RFC, Pr.RazonSocial
FROM Proyectos P, Entregan E, Proveedores Pr
WHERE P.Denominacion = 'Televisa en acción'
AND E.Numero = P.Numero 
AND Pr.RFC = E.RFC
AND Pr.RFC NOT IN(	SELECT Pr.RFC
					FROM Proveedores Pr, Proyectos P, Entregan E
					WHERE P.Denominacion = 'Educando en Coahuila'
					AND E.Numero = P.Numero 
					AND Pr.RFC = E.RFC)

--Costo de los materiales y los Materiales que son entregados al proyecto Televisa en acción cuyos 
--proveedores también suministran materiales al proyecto Educando en Coahuila.
SELECT M.Costo, M.Descripcion
FROM Materiales M, Proyectos P, Proveedores Pr, Entregan E
WHERE E.Numero = P.Numero 
AND E.RFC = Pr.RFC
AND E.Clave = M.Clave
AND P.Denominacion = 'Televisa en acción'
AND Pr.RFC IN (	SELECT Pr.RFC
				FROM Proveedores Pr, Proyectos P, Entregan E
				WHERE P.Denominacion = 'Educando en Coahuila'
				AND E.Numero = P.Numero 
				AND Pr.RFC = E.RFC)

--Nombre del material, cantidad de veces entregados y total del costo de dichas entregas por material 
--de todos los proyectos. 
SELECT M.Descripcion, COUNT(E.clave) AS 'Veces entregado', SUM(E.Cantidad * M.Costo) AS 'Total'
FROM Entregan E, Materiales M
WHERE M.Clave = E.Clave
GROUP BY M.Descripcion