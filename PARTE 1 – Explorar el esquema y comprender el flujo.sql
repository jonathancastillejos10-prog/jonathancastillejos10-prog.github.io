

--PARTE 1 – Explorar el esquema y comprender el flujo
-- Paso 1: Listar columnas y tipos de datos
Objetivo: conocer la estructura de la tabla mercadolibre_funnel
SELECT *
FROM mercadolibre_funnel
LIMIT 5;

--Paso 2:Listar columnas y tipos de datos
Objetivo: conocer la estructura de la tabla 
SELECT *
FROM mercadolibre_retention
LIMIT 5;

-- Paso 3: Explorar tipos de eventos
Objetivo: confirmar la secuencia del embudo de la tabla mercadolibre_funnel
SELECT DISTINCT event_name
FROM mercadolibre_funnel
ORDER BY event_name
