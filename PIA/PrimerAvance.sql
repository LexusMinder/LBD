
-- tables
-- Table: Area
CREATE TABLE Area (
    ID int  NOT NULL,
    Nombre varchar(50)  NOT NULL,
    Descripcion varchar(500)  NOT NULL,
    CONSTRAINT Area_pk PRIMARY KEY (ID)
);

-- Table: Aula
CREATE TABLE Aula (
    Numero int  NOT NULL,
    Capacidad smallint  NOT NULL,
    Tipo varchar(50)  NOT NULL,
    CONSTRAINT Aula_pk PRIMARY KEY (Numero)
);

-- Table: Candidato
CREATE TABLE Candidato (
    ID int  NOT NULL,
    Nombre varchar(70)  NOT NULL,
    Apellido_Paterno varchar(40)  NOT NULL,
    Apellido_Materno varchar(40)  NULL,
    Correo varchar(100)  NOT NULL,
    Calle varchar(100)  NOT NULL,
    Numero int  NOT NULL,
    Colonia varchar(100)  NOT NULL,
    Fecha_nacimiento Date  NOT NULL,
    Fecha_solicitud Date  NOT NULL,
    Estatus_ID int  NOT NULL,
    CONSTRAINT Candidato_pk PRIMARY KEY (ID)
);

-- Table: Cuenta_Estudiante
CREATE TABLE Cuenta_Estudiante (
    contrasena varchar(50)  NOT NULL,
    Estudiante_Matricula int  NOT NULL,
    CONSTRAINT Cuenta_Estudiante_pk PRIMARY KEY (contrasena,Estudiante_Matricula)
);

-- Table: Cuenta_profesor
CREATE TABLE Cuenta_profesor (
    contrasena varchar(50)  NOT NULL,
    Profesor_Empleado_No_empleado int  NOT NULL,
    CONSTRAINT Cuenta_profesor_pk PRIMARY KEY (contrasena,Profesor_Empleado_No_empleado)
);

-- Table: Curso
CREATE TABLE Curso (
    Clave int  NOT NULL,
    Materia_Clave int  NOT NULL,
    Aula_Numero int  NOT NULL,
    Profesor_Empleado_No_empleado int  NOT NULL,
    CONSTRAINT Curso_pk PRIMARY KEY (Clave)
);

-- Table: Curso_Horario
CREATE TABLE Curso_Horario (
    Curso_Clave int  NOT NULL,
    Horario_Clave int  NOT NULL,
    CONSTRAINT Curso_Horario_pk PRIMARY KEY (Curso_Clave,Horario_Clave)
);

-- Table: Empleado
CREATE TABLE Empleado (
    No_empleado int  NOT NULL,
    Nombre varchar(70)  NOT NULL,
    Apellido_Paterno varchar(40)  NOT NULL,
    Apellido_Materno varchar(40)  NULL,
    Fecha_Ingreso Date  NOT NULL,
    Calle varchar(100)  NOT NULL,
    Numero int  NOT NULL,
    Colonia varchar(100)  NOT NULL,
    Fecha_nacimiento Date  NOT NULL,
    CONSTRAINT Empleado_pk PRIMARY KEY (No_empleado)
);

-- Table: Estatus
CREATE TABLE Estatus (
    ID int  NOT NULL,
    Nombre varchar(50)  NOT NULL,
    Descripcion varchar(500)  NOT NULL,
    Tipo varchar(25)  NOT NULL,
    CONSTRAINT Estatus_pk PRIMARY KEY (ID)
);

-- Table: Estudiante
CREATE TABLE Estudiante (
    Matricula int  NOT NULL,
    Nombre varchar(70)  NOT NULL,
    Apellido_Paterno varchar(40)  NOT NULL,
    Apellido_Materno varchar(40)  NULL,
    Correo varchar(100)  NOT NULL,
    Fecha_ingreso Date  NOT NULL,
    Calle varchar(100)  NOT NULL,
    Numero int  NOT NULL,
    Colonia varchar(100)  NOT NULL,
    Fecha_nacimiento Date  NOT NULL,
    Estatus_ID int  NOT NULL,
    CONSTRAINT Estudiante_pk PRIMARY KEY (Matricula)
);

-- Table: Grupo
CREATE TABLE Grupo (
    Calificacion numeric(4,2)  NULL,
    Curso_Clave int  NOT NULL,
    Estudiante_Matricula int  NOT NULL,
    CONSTRAINT Grupo_pk PRIMARY KEY (Curso_Clave)
);

-- Table: Horario
CREATE TABLE Horario (
    Clave int  NOT NULL,
    Hora_inicio Time  NOT NULL,
    Hora_fin Time  NOT NULL,
    Dia varchar(15)  NOT NULL,
    CONSTRAINT Horario_pk PRIMARY KEY (Clave)
);

-- Table: Inscripcion
CREATE TABLE Inscripcion (
    Candidato_ID int  NOT NULL,
    ID int  NOT NULL,
    CONSTRAINT Inscripcion_pk PRIMARY KEY (ID)
);

-- Table: Materia
CREATE TABLE Materia (
    Clave int  NOT NULL,
    Hora_semanal smallint  NOT NULL,
    Semestre smallint  NOT NULL,
    Creditos smallint  NOT NULL,
    Area_ID int  NOT NULL,
    CONSTRAINT Materia_pk PRIMARY KEY (Clave)
);

-- Table: Pagos
CREATE TABLE Pagos (
    Inscripcion_ID int  NOT NULL,
    ID int  NOT NULL,
    Cantidad money  NOT NULL,
    Tipo_pago_Nombre varchar(50)  NOT NULL,
    CONSTRAINT Pagos_pk PRIMARY KEY (ID)
);

-- Table: Profesor
CREATE TABLE Profesor (
    Estatus_ID int  NOT NULL,
    Area_ID int  NOT NULL,
    Empleado_No_empleado int  NOT NULL,
    Titulo varchar(100)  NOT NULL,
    CONSTRAINT Profesor_pk PRIMARY KEY (Empleado_No_empleado)
);

-- Table: Telefono_empleado
CREATE TABLE Telefono_empleado (
    Numero int  NOT NULL,
    Empleado_No_empleado int  NOT NULL,
    Tipo varchar(20)  NOT NULL,
    CONSTRAINT Telefono_empleado_pk PRIMARY KEY (Numero,Empleado_No_empleado)
);

-- Table: Telefono_estudiante
CREATE TABLE Telefono_estudiante (
    Numero int  NOT NULL,
    Estudiante_Matricula int  NOT NULL,
    Tipo varchar(20)  NOT NULL,
    CONSTRAINT Telefono_estudiante_pk PRIMARY KEY (Numero,Estudiante_Matricula)
);

-- Table: Tipo_pago
CREATE TABLE Tipo_pago (
    Nombre varchar(50)  NOT NULL,
    Descripcion varchar(150)  NOT NULL,
    CONSTRAINT Tipo_pago_pk PRIMARY KEY (Nombre)
);

-- foreign keys
-- Reference: Candidato_Estatus (table: Candidato)
ALTER TABLE Candidato ADD CONSTRAINT Candidato_Estatus
    FOREIGN KEY (Estatus_ID)
    REFERENCES Estatus (ID)  
;

-- Reference: Cuenta_Estudiante_Estudiante (table: Cuenta_Estudiante)
ALTER TABLE Cuenta_Estudiante ADD CONSTRAINT Cuenta_Estudiante_Estudiante
    FOREIGN KEY (Estudiante_Matricula)
    REFERENCES Estudiante (Matricula)  
;

-- Reference: Cuenta_profesor_Profesor (table: Cuenta_profesor)
ALTER TABLE Cuenta_profesor ADD CONSTRAINT Cuenta_profesor_Profesor
    FOREIGN KEY (Profesor_Empleado_No_empleado)
    REFERENCES Profesor (Empleado_No_empleado)  
;

-- Reference: Curso_Aula (table: Curso)
ALTER TABLE Curso ADD CONSTRAINT Curso_Aula
    FOREIGN KEY (Aula_Numero)
    REFERENCES Aula (Numero)  
;

-- Reference: Curso_Horario_Curso (table: Curso_Horario)
ALTER TABLE Curso_Horario ADD CONSTRAINT Curso_Horario_Curso
    FOREIGN KEY (Curso_Clave)
    REFERENCES Curso (Clave)  
;

-- Reference: Curso_Horario_Horario (table: Curso_Horario)
ALTER TABLE Curso_Horario ADD CONSTRAINT Curso_Horario_Horario
    FOREIGN KEY (Horario_Clave)
    REFERENCES Horario (Clave)  
;

-- Reference: Curso_Materia (table: Curso)
ALTER TABLE Curso ADD CONSTRAINT Curso_Materia
    FOREIGN KEY (Materia_Clave)
    REFERENCES Materia (Clave)  
;

-- Reference: Curso_Profesor (table: Curso)
ALTER TABLE Curso ADD CONSTRAINT Curso_Profesor
    FOREIGN KEY (Profesor_Empleado_No_empleado)
    REFERENCES Profesor (Empleado_No_empleado)  
;

-- Reference: Estudiante_Estatus (table: Estudiante)
ALTER TABLE Estudiante ADD CONSTRAINT Estudiante_Estatus
    FOREIGN KEY (Estatus_ID)
    REFERENCES Estatus (ID)  
;

-- Reference: Grupo_Estudiante (table: Grupo)
ALTER TABLE Grupo ADD CONSTRAINT Grupo_Estudiante
    FOREIGN KEY (Estudiante_Matricula)
    REFERENCES Estudiante (Matricula)  
;

-- Reference: Inscripcion_Curso (table: Grupo)
ALTER TABLE Grupo ADD CONSTRAINT Inscripcion_Curso
    FOREIGN KEY (Curso_Clave)
    REFERENCES Curso (Clave)  
;

-- Reference: Materia_Area (table: Materia)
ALTER TABLE Materia ADD CONSTRAINT Materia_Area
    FOREIGN KEY (Area_ID)
    REFERENCES Area (ID)  
;

-- Reference: Pagos_Inscripcion (table: Pagos)
ALTER TABLE Pagos ADD CONSTRAINT Pagos_Inscripcion
    FOREIGN KEY (Inscripcion_ID)
    REFERENCES Inscripcion (ID)  
;

-- Reference: Pagos_Tipo_pago (table: Pagos)
ALTER TABLE Pagos ADD CONSTRAINT Pagos_Tipo_pago
    FOREIGN KEY (Tipo_pago_Nombre)
    REFERENCES Tipo_pago (Nombre)  
;

-- Reference: Profesor_Area (table: Profesor)
ALTER TABLE Profesor ADD CONSTRAINT Profesor_Area
    FOREIGN KEY (Area_ID)
    REFERENCES Area (ID)  
;

-- Reference: Profesor_Empleado (table: Profesor)
ALTER TABLE Profesor ADD CONSTRAINT Profesor_Empleado
    FOREIGN KEY (Empleado_No_empleado)
    REFERENCES Empleado (No_empleado)  
;

-- Reference: Profesor_Estatus (table: Profesor)
ALTER TABLE Profesor ADD CONSTRAINT Profesor_Estatus
    FOREIGN KEY (Estatus_ID)
    REFERENCES Estatus (ID)  
;

-- Reference: Telefono_empleado_Empleado (table: Telefono_empleado)
ALTER TABLE Telefono_empleado ADD CONSTRAINT Telefono_empleado_Empleado
    FOREIGN KEY (Empleado_No_empleado)
    REFERENCES Empleado (No_empleado)  
;

-- Reference: Telefono_estudiante_Estudiante (table: Telefono_estudiante)
ALTER TABLE Telefono_estudiante ADD CONSTRAINT Telefono_estudiante_Estudiante
    FOREIGN KEY (Estudiante_Matricula)
    REFERENCES Estudiante (Matricula)  
;

-- Reference: Venta_Candidato (table: Inscripcion)
ALTER TABLE Inscripcion ADD CONSTRAINT Venta_Candidato
    FOREIGN KEY (Candidato_ID)
    REFERENCES Candidato (ID)
;

-- End of file.