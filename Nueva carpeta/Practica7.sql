/*
Crear una funcion y usarla
Crear 5 procedimientos alamcenados 
-uno para cada reporte de la practica anterior
-debe utilizar parametros para filtrar el reporte 

Crear un trigger tipo after 
Crear un trigger tipo insted 

*/



CREATE FUNCTION PromedioSalones1(@Salon1 int, @Salon2 int, @Salon3 int, @Salon4 int, @Salon5 int)
RETURNS	float
AS
BEGIN
DECLARE @promedio float

SET		@promedio= (@Salon1 + @Salon2 + @Salon3 + @Salon4 + @Salon5) / 5
Return(@promedio)
END

select dbo.PromedioSalones1(50, 40, 35, 42, 60) AS 'Promedio de Salones'

CREATE PROCEDURE TituloProfesores
@Titulo varchar(50)
AS BEGIN
	SELECT Profesor.Titulo, Cuenta_profesor.Profesor_Empleado_No_empleado
	FROM Profesor
	LEFT JOIN Cuenta_profesor ON Profesor.Empleado_No_empleado = Cuenta_profesor.Profesor_Empleado_No_empleado
	WHERE Profesor.Titulo > @Titulo
END

exec [TituloProfesores] 'Doctorado'

CREATE PROCEDURE Salones
@Tipo  varchar(50)
AS BEGIN
	SELECT Numero, Capacidad
	FROM Aula
	WHERE Tipo = @Tipo
END

EXEC [Salones] 'Grande'

CREATE PROCEDURE EstatusEstudiantes
@Estatus int
AS BEGIN	
	SELECT COUNT(Matricula) as 'Cantidad de alumnos '
	FROM Estudiante
	WHERE Estatus_ID = @Estatus  
END

EXEC [EstatusEstudiantes] 3

CREATE PROCEDURE CorreosEstudiantesN
@Estatusn int
AS BEGIN
	SELECT Estudiante.Matricula, Estudiante.Correo
	FROM Estudiante
	WHERE Estatus_ID = @Estatusn  
END

EXEC [CorreosEstudiantesN] 1

CREATE PROCEDURE Publicidad
@TipoN varchar(50)
AS BEGIN
	SELECT Correo, Nombre from Estudiante
	WHERE Numero = (SELECT Numero FROM Telefono_estudiante WHERE Tipo = @TipoN )
END

EXEC [Publicidad] 'Celular'


CREATE TRIGGER tr_insert2
ON dbo.Estudiante
AFTER INSERT AS
	BEGIN
		SELECT * FROM INSERTED
END

CREATE TRIGGER tr_insert3
ON dbo.Estudiante
AFTER UPDATE AS
	BEGIN
		SELECT * FROM INSERTED
END
