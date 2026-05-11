
-- ===============================================
-- PROYECTO: Análisis de desempeño financiero Adventure Works
-- PARTE 2: Extraer y limpiar datos
-- ===============================================

-- Paso 1: Extraer y limpiar datos
-- Antes de calcular ingresos y rentabilidad, necesitamos construir una tabla base que combine la información clave de ventas, productos y territorios.
SELECT v.numero_pedido,
       v.clave_producto,
       p.nombre_producto,
       pc.clave_categoria,
COALESCE(p.precio_producto, 0) AS precio_producto,
COALESCE(v.cantidad_pedido, 0) AS cantidad_pedido,
COALESCE(p.costo_producto, 0) AS costo_producto,
       t.pais,
       t.continente,
       v.clave_territorio
FROM ventas_2017 AS v
LEFT JOIN productos AS p
ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS PC
ON p.clave_subcategoria = pc.clave_subcategoria     
LEFT JOIN territorios AS t
ON v.clave_territorio = t.clave_territorio

-- Paso 2: Añade 2 columnas calculadas a tu query
-- Para responder preguntas de negocio necesitamos números que nos digan dinero que entra y dinero que sale.
SELECT
    v.numero_pedido,
    v.clave_producto,
    p.nombre_producto,
    pc.clave_categoria,
    COALESCE(p.precio_producto, 0)  AS precio_producto,
    COALESCE(v.cantidad_pedido, 0)  AS cantidad_pedido,
    COALESCE(p.costo_producto, 0)   AS costo_producto,
    t.pais,
    t.continente,
    v.clave_territorio,
COALESCE(p.precio_producto, 0) * COALESCE(v.cantidad_pedido, 0) AS ingreso_total,
COALESCE(p.costo_producto, 0) * COALESCE(v.cantidad_pedido, 0) AS costo_total
FROM ventas_2017 AS v
JOIN productos AS p
  ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
  ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
  ON v.clave_territorio = t.clave_territorio;