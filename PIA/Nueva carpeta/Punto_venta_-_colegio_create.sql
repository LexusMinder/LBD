-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-10-08 16:39:44.294

-- tables
-- Table: Empleado
CREATE TABLE Empleado (
    No_empleado int NOT NULL,
    Nombre varchar(70) NOT NULL,
    Apellido_Paterno varchar(40)  NOT NULL,
    Apellido_Materno varchar(40)  NULL,
    Direccion varchar(150) NULL,
	Fecha_nacimiento Date  NOT NULL,
    CONSTRAINT Empleado_pk 
        PRIMARY KEY (No_empleado)
);

-- Table: Area
CREATE TABLE Area (
    ID int NOT NULL unique,
    Nombre varchar(50) UNIQUE NOT NULL,
    CONSTRAINT Area_pk PRIMARY KEY (ID)
);

-- Table: Estatus
CREATE TABLE Estatus (
	ID int NOT NULL unique,
    Nombre varchar(50) unique NOT NULL,
    Descripcion varchar(500) NOT NULL,
    CONSTRAINT Estatus_pk PRIMARY KEY (ID)
);

--Table: Cuenta
CREATE TABLE Cuenta (
	ID int unique NOT NULL,
	Usuario varchar(100) unique NOT NULL,
	PasswordCuenta varchar(700) NOT NULL,
	NivelAutorizacion int NOT NULL,
	CONSTRAINT Cuenta_pk PRIMARY KEY (ID)
);

-- Table: Profesor
CREATE TABLE Profesor (
    Empleado_No_empleado int unique NOT NULL,	
	Cuenta_ID int NULL,
    Estatus_ID int NOT NULL,
    Area_ID int NOT NULL,
    GradoEstudio varchar(100)  NOT NULL,
    CONSTRAINT Profesor_pk 
		PRIMARY KEY (Empleado_No_empleado),
	CONSTRAINT Profesor_Cuenta
		FOREIGN KEY (Cuenta_ID)
		REFERENCES Cuenta (ID),
	CONSTRAINT Profesor_Estatus
		FOREIGN KEY (Estatus_ID)
		REFERENCES Estatus (ID),
	CONSTRAINT Profesor_Empleado
		FOREIGN KEY (Empleado_No_empleado)
		REFERENCES Empleado (No_empleado),
	CONSTRAINT Profesor_Area
		FOREIGN KEY (Area_ID)
		REFERENCES Area (ID) 
);

-- Table: Cliente
CREATE TABLE Cliente (
    ID int unique NOT NULL,
    Nombre varchar(70)  NOT NULL,
    Apellido_Paterno varchar(40)  NOT NULL,
    Apellido_Materno varchar(40)  NULL,
    Correo varchar(100) NOT NULL,
	Direccion varchar(150) NULL,
    Fecha_nacimiento Date  NOT NULL,
    Estatus_ID INT NOT NULL,
    CONSTRAINT Cliente_pk 
		PRIMARY KEY (ID),
	CONSTRAINT Cliente_Estatus
		FOREIGN KEY (Estatus_ID)
		REFERENCES Estatus (ID)
);

-- Table: Materia
CREATE TABLE Materia (
    Clave int unique NOT NULL,
    Nombre varchar(50) NOT NULL,
    Hora_semanal smallint  NOT NULL,
    Grado smallint  NOT NULL,
    Area_ID int  NOT NULL,
    CONSTRAINT Materia_pk 
		PRIMARY KEY (Clave),
	CONSTRAINT Materia_Area
		FOREIGN KEY (Area_ID)
		REFERENCES Area (ID) 
);


CREATE TABLE Tipo_Aula(
	ID int unique NOT NULL,
	TIPO VARCHAR(50) UNIQUE NOT NULL,
	CONSTRAINT Tipo_pk
		PRIMARY KEY (ID)
);

-- Table: Aula
CREATE TABLE Aula (
    Numero int unique NOT NULL,
    Capacidad smallint  NOT NULL,
	Tipo_aula int NOT NULL,
    CONSTRAINT Aula_pk 
		PRIMARY KEY (Numero),
	CONSTRAINT Tipo_fk
		FOREIGN KEY (Tipo_aula)
		REFERENCES Tipo_aula (ID)
);

-- Table: Curso
CREATE TABLE Curso (
    Clave int unique NOT NULL,
    Aula_Numero int  NOT NULL,-----Para tabla paquetes
    Profesor_Empleado_No_empleado int  NOT NULL,
    CONSTRAINT Curso_pk 
		PRIMARY KEY (Clave),
	CONSTRAINT Curso_Aula
		FOREIGN KEY (Aula_Numero)
		REFERENCES Aula (Numero),
	CONSTRAINT Curso_Profesor
		FOREIGN KEY (Profesor_Empleado_No_empleado)
		REFERENCES Profesor (Empleado_No_empleado)
);

-- Table: Horario
CREATE TABLE Horario (
    Clave int identity(1,1) NOT NULL,
    Hora_inicio Time NOT NULL,
    Hora_fin Time NOT NULL,
    Dia varchar(15) NOT NULL,
    CONSTRAINT Horario_pk 
		PRIMARY KEY (Clave)
);

-- Table: Curso_Horario
CREATE TABLE Curso_Horario (
    Curso_Clave int NOT NULL,
    Horario_Clave int NOT NULL,
    CONSTRAINT Curso_Horario_pk 
		PRIMARY KEY (Curso_Clave,Horario_Clave),
	CONSTRAINT Curso_Horario_Curso
		FOREIGN KEY (Curso_Clave)
		REFERENCES Curso (Clave),
	CONSTRAINT Curso_Horario_Horario
		FOREIGN KEY (Horario_Clave)
		REFERENCES Horario (Clave) 
);

-- Table: Grupo
CREATE TABLE Grupo (
	ID int unique NOT NULL,
    Curso_Clave int NOT NULL,
    Calificacion numeric(4,2) NULL,
    Cliente_ID int  NOT NULL,
    CONSTRAINT Grupo_pk 
		PRIMARY KEY (ID),
	CONSTRAINT Grupo_Estudiante
		FOREIGN KEY (Cliente_ID)
		REFERENCES Cliente (ID),
	CONSTRAINT Inscripcion_Curso
		FOREIGN KEY (Curso_Clave)
		REFERENCES Curso (Clave)   
);

-- Table: Clases
CREATE TABLE Clases (
	Materia_Clave int NOT NULL,
	Curso_Clave int NOT NULL,
	CONSTRAINT Clases_pk
		PRIMARY KEY (Materia_Clave,Curso_Clave),
	CONSTRAINT Clases_Materia
		FOREIGN KEY (Materia_Clave)
		REFERENCES Materia (Clave),
	CONSTRAINT Clases_Curso
		FOREIGN KEY (Curso_Clave)
		REFERENCES Curso (Clave)
);
