-- Visualizar contenido completo de TMP_EMPRESAS
SELECT * 
FROM TMP_EMPRESAS;

-- Visualizar contenido completo de TMP_ESTABLECIMIENTOS
SELECT * 
FROM TMP_ESTABLECIMIENTOS;



-- =============================================
-- CONSULTAS DE VALIDACIÓN SEGÚN REGLAS DE NEGOCIO
-- =============================================

-- VALIDACIÓN RN0110: Un RUC debe estar relacionado a una razón social
SELECT 
    RUC,
    RazonSocial,
    CASE 
        WHEN RazonSocial IS NULL OR RazonSocial = '' THEN 'INVÁLIDO - Sin razón social'
        ELSE 'VÁLIDO'
    END AS VALIDACION_RAZON_SOCIAL
FROM TMP_EMPRESAS
WHERE RazonSocial IS NULL OR RazonSocial = '';

-- VALIDACIÓN RN0100: El RUC debe tener exactamente 11 dígitos
SELECT 
    RUC,
    RazonSocial,
    LEN(RUC) AS LONGITUD_RUC,
    CASE 
        WHEN LEN(RUC) = 11 THEN 'VÁLIDO'
        ELSE 'INVÁLIDO - No tiene 11 dígitos'
    END AS VALIDACION_RUC
FROM TMP_EMPRESAS
WHERE LEN(RUC) != 11;

-- Registro de empresas por año
SELECT 
    YEAR(FechaRegistro) AS AÑO_REGISTRO,
    COUNT(*) AS TOTAL_EMPRESAS
FROM TMP_EMPRESAS
WHERE FechaRegistro IS NOT NULL
GROUP BY YEAR(FechaRegistro)
ORDER BY AÑO_REGISTRO;

-- VALIDACIÓN RN0120: Una empresa no puede estar registrada más de una vez
SELECT 
    RUC,
    COUNT(*) AS CANTIDAD_REGISTROS,
    CASE 
        WHEN COUNT(*) > 1 THEN 'DUPLICADO - Revisar'
        ELSE 'ÚNICO'
    END AS VALIDACION_DUPLICADOS
FROM TMP_EMPRESAS
GROUP BY RUC
HAVING COUNT(*) > 1;

-- La razón social no puede exceder 200 caracteres y debe contener al menos 2 palabras
SELECT 
    RUC,
    RazonSocial,
    LEN(RazonSocial) AS LONGITUD_RAZON,
    LEN(RazonSocial) - LEN(REPLACE(RazonSocial, ' ', '')) + 1 AS CANTIDAD_PALABRAS,
    CASE 
        WHEN LEN(RazonSocial) > 200 THEN 'INVÁLIDO - Excede 200 caracteres'
        WHEN LEN(RazonSocial) - LEN(REPLACE(RazonSocial, ' ', '')) + 1 < 2 THEN 'INVÁLIDO - Menos de 2 palabras'
        ELSE 'VÁLIDO'
    END AS VALIDACION_RAZON_SOCIAL
FROM TMP_EMPRESAS
WHERE LEN(RazonSocial) > 200 
   OR LEN(RazonSocial) - LEN(REPLACE(RazonSocial, ' ', '')) + 1 < 2;

-- VALIDACIÓN RN0140: El correo electrónico debe tener formato válido ("@")
SELECT 
    RUC,
    RazonSocial,
    CorreoElectronico,
    CASE 
        WHEN CorreoElectronico LIKE '%@%' AND CorreoElectronico LIKE '%.%' THEN 'VÁLIDO'
        ELSE 'INVÁLIDO - Formato incorrecto'
    END AS VALIDACION_EMAIL
FROM TMP_EMPRESAS
WHERE CorreoElectronico NOT LIKE '%@%' OR CorreoElectronico NOT LIKE '%.%';

-- VALIDACIÓN RN0150: Cada empresa debe tener al menos un establecimiento registrado
SELECT 
    e.RUC,
    e.RazonSocial,
    COUNT(est.NUMERO_RUC) AS CANTIDAD_ESTABLECIMIENTOS,
    CASE 
        WHEN COUNT(est.NUMERO_RUC) = 0 THEN 'INVALIDO - Sin establecimientos'
        ELSE 'VALIDO'
    END AS VALIDACION_ESTABLECIMIENTOS
FROM TMP_EMPRESAS e
LEFT JOIN TMP_ESTABLECIMIENTOS est ON e.RUC = est.NUMERO_RUC
GROUP BY e.RUC, e.RazonSocial
HAVING COUNT(est.NUMERO_RUC) = 0;

-- =============================================
-- CONSULTAS DE ANÁLISIS Y CONTROL DE CALIDAD
-- =============================================

-- EMPRESAS CON INCONSISTENCIAS EN DATOS BÁSICOS
SELECT 
    e.RUC,
    e.RazonSocial,
    e.CorreoElectronico,
    COUNT(est.NUMERO_RUC) AS ESTABLECIMIENTOS_REGISTRADOS,
    CASE 
        WHEN LEN(e.RUC) != 11 THEN 'RUC inválido'
        WHEN e.RazonSocial IS NULL OR e.RazonSocial = '' THEN 'Sin razón social'
        WHEN e.CorreoElectronico NOT LIKE '%@%' THEN 'Email inválido'
        WHEN COUNT(est.NUMERO_RUC) = 0 THEN 'Sin establecimientos'
        ELSE 'VÁLIDO'
    END AS ESTADO_VALIDACION
FROM TMP_EMPRESAS e
LEFT JOIN TMP_ESTABLECIMIENTOS est ON e.RUC = est.NUMERO_RUC
GROUP BY e.RUC, e.RazonSocial, e.CorreoElectronico
HAVING LEN(e.RUC) != 11 
    OR e.RazonSocial IS NULL 
    OR e.RazonSocial = ''
    OR e.CorreoElectronico NOT LIKE '%@%'
    OR COUNT(est.NUMERO_RUC) = 0;

-- VERIFICAR CONSISTENCIA ENTRE TABLAS (RUC vs NUMERO_RUC)
SELECT 
    'EMPRESAS SIN ESTABLECIMIENTOS' AS TIPO_INCONSISTENCIA,
    COUNT(*) AS CANTIDAD
FROM TMP_EMPRESAS e
LEFT JOIN TMP_ESTABLECIMIENTOS est ON e.RUC = est.NUMERO_RUC
WHERE est.NUMERO_RUC IS NULL

UNION ALL

SELECT 
    'ESTABLECIMIENTOS SIN EMPRESA' AS TIPO_INCONSISTENCIA,
    COUNT(*) AS CANTIDAD
FROM TMP_ESTABLECIMIENTOS est
LEFT JOIN TMP_EMPRESAS e ON est.NUMERO_RUC = e.RUC
WHERE e.RUC IS NULL;

-- RESUMEN ESTADÍSTICO POR DEPARTAMENTO
SELECT 
    est.DEPARTAMENTO,
    COUNT(DISTINCT est.NUMERO_RUC) AS EMPRESAS_UNICAS,
    COUNT(est.NUMERO_RUC) AS TOTAL_ESTABLECIMIENTOS,
    ROUND(CAST(COUNT(est.NUMERO_RUC) AS FLOAT) / COUNT(DISTINCT est.NUMERO_RUC), 2) AS PROMEDIO_ESTABLECIMIENTOS_POR_EMPRESA
FROM TMP_ESTABLECIMIENTOS est
GROUP BY est.DEPARTAMENTO
ORDER BY EMPRESAS_UNICAS DESC;

-- EMPRESAS CON MAYOR CANTIDAD DE ESTABLECIMIENTOS
SELECT 
    e.RUC,
    e.RazonSocial,
    e.NumeroEstablecimientos AS ESTABLECIMIENTOS_DECLARADOS,
    COUNT(est.NUMERO_RUC) AS ESTABLECIMIENTOS_REGISTRADOS,
    CASE 
        WHEN e.NumeroEstablecimientos = COUNT(est.NUMERO_RUC) THEN 'COINCIDE'
        ELSE 'NO COINCIDE'
    END AS VALIDACION_CANTIDAD
FROM TMP_EMPRESAS e
LEFT JOIN TMP_ESTABLECIMIENTOS est ON e.RUC = est.NUMERO_RUC
GROUP BY e.RUC, e.RazonSocial, e.NumeroEstablecimientos
ORDER BY COUNT(est.NUMERO_RUC) DESC;

-- RESUMEN GENERAL DE EMPRESAS POR AÑO DE REGISTRO
SELECT 
    YEAR(FechaRegistro) AS AÑO_REGISTRO,
    COUNT(*) AS TOTAL_EMPRESAS,
    COUNT(CASE WHEN LEN(RUC) = 11 THEN 1 END) AS EMPRESAS_RUC_VALIDO,
    COUNT(CASE WHEN CorreoElectronico LIKE '%@%' THEN 1 END) AS EMPRESAS_EMAIL_VALIDO
FROM TMP_EMPRESAS
WHERE FechaRegistro IS NOT NULL
GROUP BY YEAR(FechaRegistro)
ORDER BY AÑO_REGISTRO;

-- ACTIVIDADES PRINCIPALES MÁS COMUNES
SELECT 
    ACTIVIDAD_PRINCIPAL,
    COUNT(*) AS CANTIDAD_ESTABLECIMIENTOS,
    COUNT(DISTINCT NUMERO_RUC) AS EMPRESAS_UNICAS
FROM TMP_ESTABLECIMIENTOS
WHERE ACTIVIDAD_PRINCIPAL IS NOT NULL
GROUP BY ACTIVIDAD_PRINCIPAL
ORDER BY CANTIDAD_ESTABLECIMIENTOS DESC;
