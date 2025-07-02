-- =====================================================
-- DESCRIPCIÓN DE TABLAS Y COLUMNAS
-- Usando sp_addextendedproperty
-- =====================================================

-- 1. TABLA EMPRESAS
-- Descripción de la tabla
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Tabla principal que almacena información de empresas registradas en el sistema ambiental',@level0type = N'SCHEMA', @level0name = N'dbo',@level1type = N'TABLE', @level1name = N'TBM_EMPRESAS';

-- Descripción de columnas de Empresas
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Identificador único de la empresa (clave primaria)',@level0type = N'SCHEMA', @level0name = N'dbo',@level1type = N'TABLE', @level1name = N'TBM_EMPRESAS',@level2type = N'COLUMN', @level2name = N'EmpresaID';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Registro Único de Contribuyente de la empresa (11 dígitos)',@level0type = N'SCHEMA', @level0name = N'dbo',@level1type = N'TABLE', @level1name = N'TBM_EMPRESAS',@level2type = N'COLUMN', @level2name = N'RUC';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Denominación social o nombre comercial de la empresa',@level0type = N'SCHEMA', @level0name = N'dbo',@level1type = N'TABLE', @level1name = N'TBM_EMPRESAS',@level2type = N'COLUMN', @level2name = N'RazonSocial';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Dirección de correo electrónico principal de la empresa',@level0type = N'SCHEMA', @level0name = N'dbo',@level1type = N'TABLE', @level1name = N'TBM_EMPRESAS',@level2type = N'COLUMN', @level2name = N'CorreoElectronico';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Fecha de registro de la empresa en el sistema',@level0type = N'SCHEMA', @level0name = N'dbo',@level1type = N'TABLE', @level1name = N'TBM_EMPRESAS',@level2type = N'COLUMN', @level2name = N'FechaRegistro';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Código CIIU (Clasificación Industrial Internacional Uniforme)',@level0type = N'SCHEMA', @level0name = N'dbo',@level1type = N'TABLE', @level1name = N'TBM_EMPRESAS',@level2type = N'COLUMN', @level2name = N'CIIU';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Número total de establecimientos que tiene la empresa',@level0type = N'SCHEMA', @level0name = N'dbo',@level1type = N'TABLE', @level1name = N'TBM_EMPRESAS',@level2type = N'COLUMN', @level2name = N'NumeroEstablecimientos';

-- 2. TABLA ESTABLECIMIENTOS
-- Descripción de la tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Tabla que almacena información de establecimientos o locales de cada empresa',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos';

-- Descripción de columnas de Establecimientos
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Identificador único del establecimiento (clave primaria)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'EstablecimientoID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Referencia a la empresa propietaria (clave foránea)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'EmpresaID';

--EXEC sp_addextendedproperty 
--    @name = N'MS_Description', @value = N'Nombre o denominación del establecimiento',
--    @level0type = N'SCHEMA', @level0name = N'dbo',
--    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
--    @level2type = N'COLUMN', @level2name = N'Nombre';

--EXEC sp_addextendedproperty 
--    @name = N'MS_Description', @value = N'Descripción de la actividad principal que realiza el establecimiento',
--    @level0type = N'SCHEMA', @level0name = N'dbo',
--    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
--    @level2type = N'COLUMN', @level2name = N'ActividadPrincipal';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Departamento donde se ubica el establecimiento',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'Departamento';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Provincia donde se ubica el establecimiento',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'Provincia';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Distrito donde se ubica el establecimiento',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'Distrito';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'DNI de la persona responsable del establecimiento',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'DNIResponsable';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Nombre completo de la persona responsable del establecimiento',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'NombreResponsable';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Teléfono de contacto de la persona responsable',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'TelefonoResponsable';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Cantidad de consumo eléctrico del establecimiento (kWh)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'ConsumoElectrico';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Volumen de agua utilizada en procesos productivos (m³)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'ConsumoAguaProceso';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Volumen de agua utilizada en oficinas y servicios (m³)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'ConsumoAguaOficinas';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Volumen de aguas residuales generadas (m³)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'AguasResiduales';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Unidad de medida utilizada para los volúmenes de agua',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'UnidadMedida';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Método utilizado para el cálculo de consumos y descargas',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Establecimientos',
    @level2type = N'COLUMN', @level2name = N'MetodoCalculo';

-- 3. TABLA UBICACIONES (HC1)
-- Descripción de la tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Tabla que almacena las coordenadas geográficas y ubicación de establecimientos (Hoja de Cálculo 1)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones';

-- Descripción de columnas de Ubicaciones
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Identificador único de la ubicación (clave primaria)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'UbicacionID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Referencia al establecimiento ubicado (clave foránea)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'EstablecimientoID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Identificador del punto de referencia o medición',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'Punto';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Zona UTM donde se encuentra el establecimiento',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'Zona';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Coordenada Este en sistema UTM (metros)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'Este';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Coordenada Norte en sistema UTM (metros)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'Norte';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Región geográfica donde se ubica el establecimiento',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'Region';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Descripción de referencias geográficas adicionales',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'Referencia';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Fecha de registro de la ubicación',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Ubicaciones',
    @level2type = N'COLUMN', @level2name = N'FechaRegistro';

-- 4. TABLA COMBUSTIBLES (HC2)
-- Descripción de la tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Tabla que registra el consumo de combustibles por establecimiento (Hoja de Cálculo 2)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Combustibles';

-- Descripción de columnas de Combustibles
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Identificador único del registro de combustible (clave primaria)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Combustibles',
    @level2type = N'COLUMN', @level2name = N'CombustibleID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Referencia al establecimiento que consume el combustible (clave foránea)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Combustibles',
    @level2type = N'COLUMN', @level2name = N'EstablecimientoID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Fuente o proveedor del combustible',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Combustibles',
    @level2type = N'COLUMN', @level2name = N'Fuente';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Tipo de combustible utilizado (diesel, gasolina, gas natural, etc.)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Combustibles',
    @level2type = N'COLUMN', @level2name = N'TipoCombustible';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Cantidad de combustible consumida (litros, m³, kg)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Combustibles',
    @level2type = N'COLUMN', @level2name = N'Cantidad';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Densidad del combustible (kg/m³)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Combustibles',
    @level2type = N'COLUMN', @level2name = N'Densidad';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Fecha de registro del consumo de combustible',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Combustibles',
    @level2type = N'COLUMN', @level2name = N'FechaRegistro';

-- 5. TABLA CHIMENEAS (HC3)
-- Descripción de la tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Tabla que registra parámetros operativos de chimeneas industriales (Hoja de Cálculo 3)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas';

-- Descripción de columnas de Chimeneas
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Identificador único de la chimenea (clave primaria)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'ChimeneaID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Referencia al establecimiento que posee la chimenea (clave foránea)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'EstablecimientoID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Código identificador de la chimenea',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'CodigoChimenea';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Presión de operación de la chimenea (atm)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'Presion';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Temperatura de operación de la chimenea (°C)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'Temperatura';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Porcentaje de oxígeno en los gases de emisión (%)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'PorcentajeOxigeno';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Flujo real de gases en condiciones actuales (m³/min)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'FlujoReal';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Flujo normal de gases en condiciones estándar (Nm³/min)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'FlujoNormal';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Horas de operación anual de la chimenea',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'HorasOperacionAnual';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Fecha de registro de los parámetros de la chimenea',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Chimeneas',
    @level2type = N'COLUMN', @level2name = N'FechaRegistro';

-- 6. TABLA DESCARGAS (HC4)
-- Descripción de la tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Tabla que registra descargas de efluentes líquidos por ductos (Hoja de Cálculo 4)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas';

-- Descripción de columnas de Descargas
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Identificador único de la descarga (clave primaria)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'DescargaID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Referencia al establecimiento que realiza la descarga (clave foránea)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'EstablecimientoID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Código identificador del ducto de descarga',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'CodigoDucto';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Caudal de descarga del efluente (L/s)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'Caudal';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Horas de operación anual del ducto de descarga',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'HorasOperacionAnual';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Tipo de descarga (continua, intermitente, etc.)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'Tipo';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Tipo de fluido descargado (agua residual, efluente industrial, etc.)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'Fluido';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Presión de descarga del fluido (atm)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'Presion';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Fecha de registro de la descarga',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Descargas',
    @level2type = N'COLUMN', @level2name = N'FechaRegistro';


-- 7. TABLA EMISIONES (HC5)
-- Descripción de la tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Tabla que registra emisiones de sustancias al ambiente (Hoja de Cálculo 5)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones';

-- Descripción de columnas de Emisiones
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Identificador único de la emisión (clave primaria)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'EmisionID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Referencia al establecimiento que genera la emisión (clave foránea)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'EstablecimientoID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Nombre de la sustancia emitida (CO2, SO2, NOx, etc.)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'Sustancia';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Tipo de cuerpo receptor (aire, agua, suelo)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'CuerpoReceptor';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Nombre específico del cuerpo receptor (río, lago, atmósfera)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'NombreCuerpo';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Unidad de medida de la cantidad emitida (kg/año, ton/año, m³/año)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'UnidadMedida';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Cantidad total de sustancia emitida por año',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'Cantidad';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Método utilizado para calcular la emisión (medición directa, factores de emisión, etc.)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'MetodoCalculo';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Fecha de registro de la emisión en el sistema',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Emisiones',
    @level2type = N'COLUMN', @level2name = N'FechaRegistro';

-- 8. TABLA RESIDUOS (HC6)
-- Descripción de la tabla
EXEC sp_addextendedproperty 
    @name = N'MS_Description',
    @value = N'Tabla que registra generación y manejo de residuos sólidos y peligrosos (Hoja de Cálculo 6)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos';

-- Descripción de columnas de Residuos
EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Identificador único del registro de residuo (clave primaria)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'ResiduoID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Referencia al establecimiento que genera el residuo (clave foránea)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'EstablecimientoID';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Clasificación del tipo de residuo (domiciliario, comercial, industrial, peligroso, etc.)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'TipoResiduo';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Cantidad total de residuo generada por año',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'Cantidad';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Unidad de medida de la cantidad de residuo (kg/año, ton/año, m³/año)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'UnidadMedida';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Densidad promedio del residuo (kg/m³)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'Densidad';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'RUC de la empresa operadora de residuos sólidos (EPS-RS)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'RUCOperador';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Tipo de operador de residuos (EPS-RS, EC-RS, Municipalidad, etc.)',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'TipoOperador';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Número de registro del operador ante DIGESA, MINAM u otra autoridad competente',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'NumeroRegistro';

EXEC sp_addextendedproperty 
    @name = N'MS_Description', @value = N'Fecha de registro del residuo en el sistema',
    @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'TBM_Residuos',
    @level2type = N'COLUMN', @level2name = N'FechaRegistro';

-- =====================================================
-- CONSULTA PARA VERIFICAR LAS DESCRIPCIONES
-- =====================================================

-- Script para consultar todas las descripciones de Emisiones y Residuos
/*
SELECT 
    OBJECT_SCHEMA_NAME(ep.major_id) AS Esquema,
    OBJECT_NAME(ep.major_id) AS NombreTabla,
    ep.name AS TipoPropiedad,
    ep.value AS Descripcion,
    CASE 
        WHEN ep.minor_id = 0 THEN 'TABLA'
        ELSE COL_NAME(ep.major_id, ep.minor_id)
    END AS NombreColumna
FROM sys.extended_properties ep
WHERE ep.name = 'MS_Description'
    AND (ep.major_id = OBJECT_ID('TBM_Emisiones')
         OR ep.major_id = OBJECT_ID('TBM_Residuos'))
ORDER BY NombreTabla, ep.minor_id;
*/

-- =====================================================
-- SCRIPT PARA ELIMINAR DESCRIPCIONES (SI ES NECESARIO)
-- =====================================================

/*
-- Para eliminar todas las descripciones de una tabla específica:
-- Ejemplo para tabla Emisiones:

DECLARE @sql NVARCHAR(MAX) = '';
SELECT @sql = @sql + 'EXEC sp_dropextendedproperty @name = N''MS_Description'', @level0type = N''SCHEMA'', @level0name = N''dbo'', @level1type = N''TABLE'', @level1name = N''' + TABLE_NAME + ''', @level2type = N''COLUMN'', @level2name = N''' + COLUMN_NAME + ''';' + CHAR(13)
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'TBM_Emisiones';

-- Agregar eliminación de descripción de tabla
SET @sql = @sql + 'EXEC sp_dropextendedproperty @name = N''MS_Description'', @level0type = N''SCHEMA'', @level0name = N''dbo'', @level1type = N''TABLE'', @level1name = N''TBM_Emisiones'';'

PRINT @sql;
-- EXEC sp_executesql @sql; -- Descomentar para ejecutar
*/