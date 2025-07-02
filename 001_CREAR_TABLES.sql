USE RETC
GO
CREATE PROCEDURE usp_CreaTablaWorkProd 
AS 
BEGIN
	RETURN 'SOLO ES SCRIPT, ABRIR STORE PROCEDURE';
-- CREACION DE TABLAS

/*
TABLA EMPRESAS
*/
CREATE TABLE TMP_EMPRESAS (
    RUC VARCHAR(11),
    RazonSocial VARCHAR(200),
    CorreoElectronico VARCHAR(100),
    FechaRegistro DATETIME,
    CIIU VARCHAR(10),
    NumeroEstablecimientos INT,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100)--,
    --FechaUltimaModificacion DATETIME,
    --UsuarioUltimaModificacion VARCHAR(100)
);


CREATE TABLE TBM_EMPRESAS (
    EmpresaID INT IDENTITY(100,100) PRIMARY KEY,
    RUC VARCHAR(11) NOT NULL UNIQUE,
    RazonSocial VARCHAR(200) NOT NULL,
    CorreoElectronico VARCHAR(100),
    FechaRegistro DATETIME,
    CIIU VARCHAR(10),
    NumeroEstablecimientos INT DEFAULT 1,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100),
    FechaUltimaModificacion DATETIME,
    UsuarioUltimaModificacion VARCHAR(100)
);




/*
TABLA Establecimientos
*/
CREATE TABLE TMP_ESTABLECIMIENTOS (
	FECHA DATETIME, 
	CORREO VARCHAR(100), 
	RAZON_SOCIAL VARCHAR(200), 
	NUMERO_RUC VARCHAR(100), 
	NOMBRE_ESTABLECIMIENTO VARCHAR(200), 
	ACTIVIDAD_PRINCIPAL VARCHAR(100), 
	DEPARTAMENTO VARCHAR(100), 
	PROVINCIA VARCHAR(100), 
	DISTRITO VARCHAR(100), 
	DNI_RESPONSABLE VARCHAR(100), 
	NOMBRE_RESPONSABLE VARCHAR(100), 
	TELEFONO_RESPONSABLE VARCHAR(100), 
	CONSUMO_ELECTRICO_WATT DECIMAL(14,2), 
	CONSUMO_AGUA_PROCESO_L DECIMAL(14,2), 
	CONSUMO_AGUA_OFICINAS_L DECIMAL(14,2), 
	AGUAS_RESIDUALES DECIMAL(14,2), 
	UNIDAD_MEDIDA VARCHAR(10), 
	METODO_CALCULO VARCHAR(10),
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100)--,
)


CREATE TABLE TBM_ESTABLECIMIENTOS (
    EstablecimientoID INT IDENTITY(100,100) PRIMARY KEY,
    EmpresaID INT NOT NULL FOREIGN KEY REFERENCES TBM_Empresas(EmpresaID),
    --Nombre NVARCHAR(100) NOT NULL,
    --ActividadPrincipal NVARCHAR(200),
    Departamento NVARCHAR(50),
    Provincia NVARCHAR(50),
    Distrito NVARCHAR(50),
    DNIResponsable VARCHAR(8),
    NombreResponsable NVARCHAR(100),
    TelefonoResponsable VARCHAR(15),
    ConsumoElectrico DECIMAL(14,2),
    ConsumoAguaProceso DECIMAL(14,2),
    ConsumoAguaOficinas DECIMAL(14,2),
    AguasResiduales DECIMAL(14,2),
    UnidadMedida NVARCHAR(20),
    MetodoCalculo NVARCHAR(50),
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100),
    FechaUltimaModificacion DATETIME,
    UsuarioUltimaModificacion VARCHAR(100),
    --CONSTRAINT UQ_Establecimiento UNIQUE (EmpresaID)
);


--  Tabla de Ubicaciones (HC1)
CREATE TABLE TMP_UBICACIONES (
	FECHA DATETIME, 
	CORREO VARCHAR(100), 
	RAZON_SOCIAL VARCHAR(200), 
	NUMERO_RUC VARCHAR(100), 
	NOMBRE_ESTABLECIMIENTO VARCHAR(200),
	[HC1-Punto] VARCHAR(100),
	[HC1-Zona] VARCHAR(100),
	[HC1-Este] DECIMAL(14,4), 
	[HC1-Norte] DECIMAL(14,4), 
	[HC1-Region] VARCHAR(100), 
	[HC1-Referencia] VARCHAR(200),
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100)--,
)

CREATE TABLE TBM_Ubicaciones (
    UbicacionID INT IDENTITY(100,100) PRIMARY KEY,
    EstablecimientoID INT NOT NULL FOREIGN KEY REFERENCES TBM_Establecimientos(EstablecimientoID),
    Punto NVARCHAR(20),
    Zona NVARCHAR(50),
    Este DECIMAL(12,2),
    Norte DECIMAL(12,2),
    Region NVARCHAR(50),
    Referencia NVARCHAR(200),
    FechaRegistro DATE,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100),
    FechaUltimaModificacion DATETIME,
    UsuarioUltimaModificacion VARCHAR(100)
);


--  Tabla de Combustibles (HC2)
CREATE TABLE TMP_Combustibles (
	FECHA DATETIME, 
	CORREO VARCHAR(100), 
	RAZON_SOCIAL VARCHAR(200), 
	NUMERO_RUC VARCHAR(100), 
	NOMBRE_ESTABLECIMIENTO VARCHAR(200),
	[HC2-Fuente] VARCHAR(100),
	[HC2-Tipo_combustible] VARCHAR(100),
	[HC2-Cantidad_toneladas] DECIMAL(14,4),
	[HC2-Densidad_KgL] DECIMAL(14,4),
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100)--,
)

CREATE TABLE TBM_Combustibles (
    CombustibleID INT IDENTITY(100,100) PRIMARY KEY,
    EstablecimientoID INT NOT NULL FOREIGN KEY REFERENCES TBM_Establecimientos(EstablecimientoID),
    Fuente NVARCHAR(50),
    TipoCombustible NVARCHAR(50),
    Cantidad DECIMAL(12,2),
    Densidad DECIMAL(6,3),
    FechaRegistro DATE,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100),
    FechaUltimaModificacion DATETIME,
    UsuarioUltimaModificacion VARCHAR(100)
);


--  Tabla de Chimeneas (HC3)
CREATE TABLE TMP_CHIMENEAS (
	FECHA DATETIME, 
	CORREO VARCHAR(100), 
	RAZON_SOCIAL VARCHAR(200), 
	NUMERO_RUC VARCHAR(100), 
	NOMBRE_ESTABLECIMIENTO VARCHAR(200),
	[HC3-Chimenea] VARCHAR(100),
	[HC3-Presion_atm] DECIMAL(14,4),
	[HC3-Temperatura_C] DECIMAL(14,4),
	[HC3-Porcentaje] DECIMAL(14,4),
	[HC3-Flujo_real_m3min] DECIMAL(14,4),
	[HC3-Flujo_normal_m3min] DECIMAL(14,4),
	[HC3-Horas_ano] INT,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100)--,

)

CREATE TABLE TBM_Chimeneas (
    ChimeneaID INT IDENTITY(100,100) PRIMARY KEY,
    EstablecimientoID INT NOT NULL FOREIGN KEY REFERENCES TBM_Establecimientos(EstablecimientoID),
    CodiChimenea NVARCHAR(20),
    Presion DECIMAL(6,3),
    Temperatura DECIMAL(6,2),
    PorcentajeOxigeno DECIMAL(5,2),
    FlujoReal DECIMAL(10,2),
    FlujoNormal DECIMAL(10,2),
    HorasOperacionAnual INT,
    FechaRegistro DATE,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100),
    FechaUltimaModificacion DATETIME,
    UsuarioUltimaModificacion VARCHAR(100)
);


--  Tabla de Descargas (HC4)
CREATE TABLE TMP_Descargas (
	FECHA DATETIME, 
	CORREO VARCHAR(100), 
	RAZON_SOCIAL VARCHAR(200), 
	NUMERO_RUC VARCHAR(100), 
	NOMBRE_ESTABLECIMIENTO VARCHAR(200),
	[HC4-Ducto] VARCHAR(100),	
	[HC4-Caudal_Ls] DECIMAL(14,4),
	[HC4-Horas_ano] INT,
	[HC4-Tipo] VARCHAR(100),
	[HC4-Fluido] VARCHAR(100),
	[HC4-Presion_bar] DECIMAL(14,4),
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100)--,
)

CREATE TABLE TBM_Descargas (
    DescargaID INT IDENTITY(100,100) PRIMARY KEY,
    EstablecimientoID INT NOT NULL FOREIGN KEY REFERENCES TBM_Establecimientos(EstablecimientoID),
    CodiDucto NVARCHAR(20),
    Caudal DECIMAL(10,2),
    HorasOperacionAnual INT,
    Tipo NVARCHAR(50),
    Fluido NVARCHAR(50),
    Presion DECIMAL(6,3),
    FechaRegistro DATE,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100),
    FechaUltimaModificacion DATETIME,
    UsuarioUltimaModificacion VARCHAR(100)
);


--  Tabla de Emisiones (HC5)
CREATE TABLE TMP_Emisiones (
	FECHA DATETIME, 
	CORREO VARCHAR(100), 
	RAZON_SOCIAL VARCHAR(200), 
	NUMERO_RUC VARCHAR(100), 
	NOMBRE_ESTABLECIMIENTO VARCHAR(200),					
	[HC5-Sustancia] VARCHAR(100),	
	[HC5-Cuerpo_receptor] VARCHAR(100),
	[HC5-Nombre_cuerpo] VARCHAR(100),
	[HC5-Unidad] VARCHAR(100),
	[HC5-Cantidad] decimal(14,4),
	[HC5-Metodo_calculo] VARCHAR(100),
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100)--,
)

CREATE TABLE TBM_Emisiones (
    EmisionID INT IDENTITY(100,100) PRIMARY KEY,
    EstablecimientoID INT NOT NULL FOREIGN KEY REFERENCES TBM_Establecimientos(EstablecimientoID),
    Sustancia NVARCHAR(100),
    CuerpoReceptor NVARCHAR(50),
    NombreCuerpo NVARCHAR(100),
    UnidadMedida NVARCHAR(20),
    Cantidad DECIMAL(15,2),
    MetodoCalculo NVARCHAR(50),
    FechaRegistro DATETIME,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100),
    FechaUltimaModificacion DATETIME,
    UsuarioUltimaModificacion VARCHAR(100)
);


--  Tabla de Residuos (HC6)
CREATE TABLE TMP_Residuos (
	FECHA DATETIME, 
	CORREO VARCHAR(100), 
	RAZON_SOCIAL VARCHAR(200), 
	NUMERO_RUC VARCHAR(100), 
	NOMBRE_ESTABLECIMIENTO VARCHAR(200),
	[Residuo] VARCHAR(100),	
	[Cantidad_transferida] DECIMAL(14,4),
	[Unidad_medida] VARCHAR(100),
	[Densidad_KgL] DECIMAL(14,4),
	[RUC_operador] VARCHAR(100),
	[Tipo_operador] VARCHAR(100),
	[Numero_registro] VARCHAR(100),
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100)--,
)

CREATE TABLE TBM_Residuos (
    ResiduoID INT IDENTITY(100,100) PRIMARY KEY,
    EstablecimientoID INT NOT NULL FOREIGN KEY REFERENCES TBM_Establecimientos(EstablecimientoID),
    TipoResiduo NVARCHAR(100),
    Cantidad DECIMAL(12,2),
    UnidadMedida NVARCHAR(20),
    Densidad DECIMAL(6,3),
    RUCOperador VARCHAR(11),
    TipoOperador NVARCHAR(50),
    NumeroRegistro NVARCHAR(50),
    FechaRegistro DATE,
	FechaCreacion DATETIME DEFAULT GETDATE(),
    UsuarioCreacion VARCHAR(100),
    FechaUltimaModificacion DATETIME,
    UsuarioUltimaModificacion VARCHAR(100)
);


/*

DROP TABLE TMP_EMPRESAS
DROP TABLE TBM_EMPRESAS
DROP TABLE TMP_ESTABLECIMIENTOS
DROP TABLE TBM_ESTABLECIMIENTOS
DROP TABLE TMP_UBICACIONES
DROP TABLE TBM_Ubicaciones
DROP TABLE TMP_Combustibles
DROP TABLE TBM_Combustibles
DROP TABLE TMP_CHIMENEAS
DROP TABLE TBM_Chimeneas
DROP TABLE TMP_Descargas
DROP TABLE TBM_Descargas
DROP TABLE TMP_Emisiones
DROP TABLE TBM_Emisiones
DROP TABLE TMP_Residuos
DROP TABLE TBM_Residuos
*/

END