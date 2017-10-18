--UN SELECT CON UN GROUP BY	
SELECT COUNT(Matricula) as 'Cantidad de estudiantes', Estatus_ID
FROM Estudiante
GROUP BY Estatus_ID
ORDER BY 'Cantidad de estudiantes' DESC

--SELECTS CON 1 COLUMNA Y 3 FUNCIONES AGREGADAS
SELECT SUM(Capacidad) as 'Capacidad Total'
FROM Aula

SELECT COUNT(Matricula) as 'Cantidad de alumnos'
FROM Estudiante 

SELECT AVG(Capacidad) as 'Capacidad Promedio'
FROM AULA 

--IGUAL QUE EL ANTERIOIR PERO CON WHERE 
SELECT COUNT(Matricula) as 'Cantidad de alumnos activos'
FROM Estudiante
WHERE Estatus_ID = 1

SELECT COUNT(Matricula) as 'Cantiadad de alumnos suspendidos o inactivos'
FROM Estudiante
WHERE Estatus_ID != 1

SELECT AVG(Capacidad) as 'Capacidad promedio para salones chicos'
FROM Aula 
WHERE Tipo='Chico'

SELECT SUM(Capacidad) as 'Capacidad total de los salones grandes'
FROM Aula
WHERE Tipo='Grande'

--IGUAL QUE EL ANTERIOR PERO CON HAVING 
SELECT COUNT(Matricula) as 'No estudiantes', Estatus_ID
FROM Estudiante 
Group BY Estatus_ID
HAVING COUNT(Estatus_ID) > 30 
ORDER BY Estatus_ID DESC

--Select con TOP
SELECT TOP 30 * FROM Estudiante
ORDER BY Matricula DESC

SELECT TOP 12 * FROM Estudiante
WHERE Estatus_ID = 3
ORDER BY Nombre asc
