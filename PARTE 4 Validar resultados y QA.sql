
-- ===============================================
-- PROYECTO: Análisis de desempeño financiero Adventure Works
-- PARTE 4: Validar resultados y QA
-- ===============================================
-- Paso 1: Validar integridad básica — NULOS en claves
-- Cuando tu proceso integra ventas con productos y territorios, cualquier clave faltante puede romper uniones o distorsionar sumas. Vamos a realizar un chequeo rápido de integridad para confirmar que no existan valores nulos en las columnas clave.

-- Objetivo: Detectar valores NULL en las claves mínimas necesarias para unir y agrupar correctamente los datos.
SELECT 
    SUM(CASE WHEN numero_pedido IS NULL THEN 1 ELSE 0 END),
    SUM(CASE WHEN clave_producto IS NULL THEN 1 ELSE 0 END),
    SUM(CASE WHEN clave_territorio IS NULL THEN 1 ELSE 0 END)
FROM ventas_2017

-- Paso 2: Validar valores no válidos en ventas_2017 (cantidad)
-- Algunas integraciones pueden incluir devoluciones o errores que dejan cantidades en cero o negativas, afectando los totales. Vamos a contar las filas problemáticas para garantizar que los datos de ventas sean consistentes.

-- Objetivo: Detectar registros con cantidad_pedido igual o menor que cero.
SELECT 
 COUNT(*) AS filas_cantidad_no_valida
FROM ventas_2017
WHERE cantidad_pedido <= 0;

-- Paso 3: Validar precios en productos
-- Antes de calcular ingresos, confirmemos que los precios en el catálogo no tengan valores negativos o inconsistentes. Los precios negativos suelen indicar errores de carga o descuentos mal definidos.

-- Objetivo: Detectar registros en productos con precios negativos.
SELECT 
    COUNT(*) AS productos_precio_no_valido
FROM productos
WHERE precio_producto <0