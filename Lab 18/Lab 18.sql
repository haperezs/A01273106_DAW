
--La suma de las cantidades e importe total de todas las entregas realizadas durante el 97. 

SET DATEFORMAT dmy

SELECT SUM(E.Cantidad) AS 'Cantidad total', SUM(E.Cantidad * M.Costo) AS 'Importe total'
FROM Entregan E, Materiales M
WHERE E.Clave = M.Clave
AND E.Fecha BETWEEN '01-01-1997' AND '31-12-1997'


--Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas. 

SELECT P.RazonSocial, COUNT(E.RFC) AS 'Número de entregas', SUM(E.Cantidad * M.Costo) AS 'Importe total'
FROM Entregan E, Proveedores P, Materiales M
WHERE E.RFC = P.RFC
AND E.Clave = M.Clave
GROUP BY P.RazonSocial


--Por cada material obtener la clave y descripción del material, la cantidad total entregada, la mínima cantidad entregada, 
--la máxima cantidad entregada, el importe total de las entregas de aquellos materiales en los que la cantidad promedio 
--entregada sea mayor a 400.

SELECT M.Clave, M.Descripcion, SUM(E.Cantidad) AS 'Cantdad total entregada', MIN(E.Cantidad) AS 'Mínima cantidad entregada',
MAX(E.Cantidad) AS 'Máxima cantidad entregada', SUM(E.Cantidad * M.Costo) AS 'Importe total'
FROM Entregan E, Materiales M
WHERE E.Clave = M.Clave
GROUP BY M.Clave, M.Descripcion
HAVING AVG(e.Cantidad) > 400


--Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material entregado, detallando 
--la clave y descripción del material, excluyendo aquellos proveedores para los que la cantidad promedio sea menor a 500. 

SELECT P.RazonSocial, AVG(E.Cantidad) AS 'Cantidad promedio', M.Clave, M.Descripcion
FROM Entregan E, Materiales M, Proveedores P
WHERE E.Clave = M.Clave
AND E.RFC = P.RFC
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 500
ORDER BY P.RazonSocial


--Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos de proveedores: 
--aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos para los que la cantidad promedio entregada 
--sea mayor a 450.

SELECT P.RazonSocial, AVG(E.Cantidad) AS 'Cantidad promedio', M.Clave, M.Descripcion
FROM Entregan E, Materiales M, Proveedores P
WHERE E.Clave = M.Clave
AND E.RFC = P.RFC
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) < 370 OR AVG(E.Cantidad) > 450
ORDER BY P.RazonSocial


--Considerando que los valores de tipos CHAR y VARCHAR deben ir encerrados entre apóstrofes, los valores numéricos se 
--escriben directamente y los de fecha, como '1-JAN-00' para 1o. de enero del 2000, inserta cinco nuevos materiales.

INSERT INTO Materiales VALUES (1450, 'Boligoma', 85, 5); 
INSERT INTO Materiales VALUES (1460, 'Guijarro', 70, 2.5); 
INSERT INTO Materiales VALUES (1470, 'Madera', 150, 1.5); 
INSERT INTO Materiales VALUES (1480, 'Arcilla', 50, 2.3);
INSERT INTO Materiales VALUES (1490, 'Plástico', 150, 2.3);


--Clave y descripción de los materiales que nunca han sido entregados. 

(SELECT M.Clave, M.Descripcion
FROM Materiales M)
EXCEPT
(SELECT M.Clave, M.Descripcion
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave)


--Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México' como al proyecto 'Querétaro Limpio'. 

SELECT P.RazonSocial
FROM Proveedores P, Proyectos Pr, Entregan E
WHERE P.RFC = E.RFC
AND Pr.Numero = E.Numero
AND P.RazonSocial = 'Vamos México'
AND P.RazonSocial IN (	SELECT P.RazonSocial
						FROM Proveedores P, Proyectos Pr, Entregan E
						WHERE P.RFC = E.RFC
						AND Pr.Numero = E.Numero
						AND P.RazonSocial = 'Vamos México')

--Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'.

SELECT M.Descripcion
FROM Materiales M
WHERE M.Clave NOT IN(	SELECT M.Clave
						FROM Materiales M, Proyectos P, Entregan E
						WHERE M.Clave = E.Clave
						AND P.Numero = E.Numero
						AND P.Denominacion = 'CIT Yucatan')

--Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad entregada es mayor al 
--promedio de la cantidad entregada por el proveedor con el RFC 'VAGO780901'. 

SELECT P.RazonSocial, AVG(E.Cantidad) AS 'Promedio cantidad entregada'
FROM Proveedores P, Entregan E
WHERE P.RFC = E.RFC
GROUP BY P.RazonSocial
HAVING AVG(E.Cantidad) > (	SELECT AVG(E.Cantidad)
							FROM Entregan E
							WHERE E.RFC = 'VAGO780901'
							GROUP BY E.RFC)


--RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango' y cuyas cantidades totales
--entregadas en el 2000 fueron mayores a las cantidades totales entregadas en el 2001.

CREATE VIEW Totales2000 (RFC, CantidadTotal)
AS
SELECT E.RFC, SUM(E.Cantidad)
FROM Entregan E
WHERE E.Fecha BETWEEN '01-01-2000' AND '31-12-2000'
GROUP BY E.RFC

CREATE VIEW Totales2001 (RFC, CantidadTotal)
AS
SELECT E.RFC, SUM(E.Cantidad)
FROM Entregan E
WHERE E.Fecha BETWEEN '01-01-2001' AND '31-12-2001'
GROUP BY E.RFC

SELECT DISTINCT P.RFC, P.RazonSocial
FROM Proveedores P, Proyectos Pr, Entregan E, Totales2000 T0, Totales2001 T1
WHERE T0.RFC =  T1.RFC
AND T0.RFC = P.RFC
AND E.Numero = Pr.Numero
AND Pr.Denominacion = 'Infonavit Durango'
AND T0.CantidadTotal > T1.CantidadTotal








