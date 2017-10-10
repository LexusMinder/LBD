--Tipo 1
insert into Estudiante (Matricula, Nombre, Apellido_Paterno, Apellido_Materno, Correo, Fecha_ingreso, Calle, Numero, Colonia, Fecha_Nacimiento, Estatus_ID) values (1727375, 'Julio', 'Mancha', 'Hernandez', 'josejulio2119@gmail.com', '09/10/2017', 'Rio Verde', 101, 'Dos Rios', '03/03/2017', 1)
--Tipo 2
INSERT into Estudiante values (1727376, 'Saul Oswaldo', 'Rodriguez', 'Torres', 'oswaldo.rdz23@outlook.com', '09/10/2017', 'Rio Azul', 102, 'Tres Rios', '01/01/1999', 2)
--Tipo 3
INSERT into Estudiante select 1727371, 'Israel', 'Rodriguez', 'Martinez', 'israelIvarra23@outlook.es', '09/10/2017', 'Rio Rojo', 102, 'Cuatro Rios', '02/02/1999', 2
--Tipo 4
INSERT into Estudiante select Matricula, Nombre, Apellido_Paterno, Apellido_Materno, Correo, Fecha_ingreso, Calle, Numero, Colonia, Fecha_Nacimiento, Estatus_ID from Foraneos


Select * into #ForaneosTemp
from Foraneos
select * from #ForaneosTemp

update Estudiante SET Fecha_nacimiento = '02/19/1999'
where Matricula = 1727375 

delete from Estudiante 
where Matricula = 1727376

select * from Estudiante