
-- ===============================================
-- PROYECTO: Análisis de desempeño financiero Adventure Works
-- PARTE 3: Calcular KPIs financieros
-- ===============================================
-- Paso 1: Calcular ingresos y costos por país
-- En esta etapa y tendras la tabla ventas_clean. Ahora puedes utilizarla como la base para continuar con los siguientes pasos. Debes calcular el total de ingresos y costos en cada país. 
SELECT pais,
       clave_territorio,
SUM(ingreso_total)::integer AS ingresos,
SUM(costo_total)::integer AS costos
FROM ventas_clean      
GROUP BY pais, 
         clave_territorio
ORDER BY ingresos DESC;

-- Paso 2: Agregar la inversión en campañas de marketing
-- Ya sabes cuánto entra (ingresos) y cuánto cuesta operar (costos).

-- Pero aún nos falta una pieza clave: ¿cuánto estamos gastando en campañas de marketing?

-- La idea es combinar lo que venden los países con lo que se invirtió en campañas, para ver la foto completa.
SELECT
    v.pais,
    v.clave_territorio,
    SUM(v.ingreso_total)::integer AS ingresos,
    SUM(v.costo_total)::integer  AS costos,    
    COALESCE(SUM(c.costo_campana::integer), 0) AS costo_campana
FROM ventas_clean AS v
LEFT JOIN campanas AS c
  ON v.clave_territorio = c.clave_territorio::integer
GROUP BY
    v.pais,
    v.clave_territorio
ORDER BY
    ingresos DESC;


-- Paso 3: Calcular Beneficio Bruto, Margen y ROI
-- Ya tenemos ventas, costos y campañas. Ahora toca transformarlos en indicadores que hablan el idioma del negocio:
SELECT
    p.pais,
    p.clave_territorio,
    SUM(p.ingresos)::integer AS ingresos,
    SUM(p.costos)::integer AS costos,
    COALESCE(SUM(c.costo_campana), 0)::integer AS costo_campana,
    SUM(p.ingresos)::integer - SUM(p.costos)::integer AS beneficio_bruto,
    (SUM(p.ingresos) - SUM(p.costos))*100.0 / NULLIF(SUM(p.ingresos), 0) AS margen_pct,
    (SUM(p.ingresos) - SUM(p.costos))*100.0 / NULLIF(SUM(c.costo_campana), 0)  AS ROI_pct
FROM pais_ingreso_costo AS p
LEFT JOIN pais_campanas AS c
  ON p.clave_territorio = c.clave_territorio
GROUP BY
    p.pais,
    p.clave_territorio
ORDER BY
    p.clave_territorio, ingresos, costos;