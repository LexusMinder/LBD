/*
5 REPORTES 
*Cada uno es una vista
*Con todo los joins necesarios
*Al menos 1 de más de 2 tablas 
*Al menos 1 con funciones agregadas 

1 Subconsulta de parentesis 
1 Subconsulta with
1 Tabla temporal delete into

Creación de vista y su respectivo select a la vista
*/


CREATE VIEW TitulosDeProfesores AS
SELECT Profesor.Titulo, Cuenta_profesor.Profesor_Empleado_No_empleado
FROM Profesor
LEFT JOIN Cuenta_profesor ON Profesor.Empleado_No_empleado = Cuenta_profesor.Profesor_Empleado_No_empleado
WHERE Profesor.Titulo > 'Doctorado'

CREATE VIEW AulasGrandes AS
SELECT Numero, Capacidad
FROM Aula
WHERE Tipo = 'Grande'

CREATE VIEW EstudiantesSuspendidos AS
SELECT COUNT(Matricula) as 'Cantidad de alumnos suspendidos'
FROM Estudiante
WHERE Estatus_ID =  3 

CREATE VIEW CorreosEstudiantes AS
SELECT Estudiante.Matricula, Estudiante.Correo
FROM Estudiante 
 
CREATE VIEW NumeroEstudiantes AS
SELECT Estudiante.Nombre, Estudiante.Apellido_Paterno, Estudiante.Apellido_Materno, Telefono_estudiante.Numero
FROM Estudiante
LEFT JOIN Telefono_estudiante ON Estudiante.Matricula = Telefono_estudiante.Estudiante_Matricula 

SELECT Correo, Nombre from Estudiante
WHERE Numero = (SELECT Numero FROM Telefono_estudiante WHERE Tipo = 'Celular' );

WITH ContadorSalones AS (
  SELECT Tipo,
		count(Numero) Salones
  FROM   Aula
  GROUP BY Tipo )

SELECT Salones, 
	   Tipo
FROM ContadorSalones
WHERE Tipo = 'Grande'
ORDER BY Salones


CREATE TABLE #Lista (Matricula int, Nombre varchar(50))
INSERT INTO #Lista SELECT Matricula, Nombre
FROM Estudiante
SELECT * FROM #Lista

