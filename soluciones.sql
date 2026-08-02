
-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Autor: Maria Cristina Gaupmann
-- Fecha: 02/08/2026
-- ══════════════════════════════════════════

-- ── CONSULTA 1: UNION ────────────────────
-- Reporte de Catálogo Unificado
-- Pregunta de negocio: ¿Qué productos únicos comercializa
-- la empresa en toda su red de sucursales?
-- Operador: UNION (elimina filas completamente duplicadas)
--La empresa en toda su red de sucursales comercializa 10 productos:
--Auriculares BT Pro / Hub USB-C 7p / Laptop Basic 14 / Laptop Pro 15 / Monitor 4K 27" / Mouse Inalámbrico / Parlante Bluetooth /
--SSD Externo 1TB / Teclado Mecánico / Webcam HD 1080p

SELECT * FROM inventario_sucursal_norte
UNION
SELECT * FROM inventario_sucursal_sur


-- ── CONSULTA 2: UNION ALL ────────────────
-- Auditoría de Stock Total
-- Pregunta de negocio: ¿Cuántos registros físicos de stock
-- existen en total entre ambas sucursales?
-- Operador: UNION ALL (mantiene todos los registros incluyendo duplicados)
-- Existen 14 registros físicos de stock entre ambas sucursales  

SELECT COUNT(*) AS total_registros
FROM (
    SELECT stock FROM inventario_sucursal_norte
    UNION ALL
    SELECT stock FROM inventario_sucursal_sur
) AS stock_total;


-- ── CONSULTA 3: COMPARACIÓN DE RESULTADOS ─
-- Ejecutá estas dos consultas para comparar cuántas filas
-- devuelve cada operador y explicá la diferencia en tu README

-- Este operador devuelve 14 filas
SELECT COUNT(*) AS filas_union     
FROM (SELECT * FROM inventario_sucursal_norte
UNION
SELECT * FROM inventario_sucursal_sur) AS resultado_union;

-- Este operador devuelve 14 filas
SELECT COUNT(*) AS filas_union_all FROM (SELECT * FROM inventario_sucursal_norte
UNION ALL
SELECT * FROM inventario_sucursal_sur) AS resultado_union_all;

