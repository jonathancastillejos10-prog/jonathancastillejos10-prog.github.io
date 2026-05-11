

--PARTE 2: Explorar el esquema y comprender el flujo
-- Paso 1: Contar usuarios activos acumulados por país (D7, D14, D21, D28)
Objetivo: Para cada país, contar usuarios activos acumulados desde su registro, en el rango 2025-01-01 → 2025-08-31, al día 7, día 14, día 21 y día 28.
SELECT
  country,
COUNT(DISTINCT CASE WHEN day_after_signup >= 7 AND active = 1 THEN user_id END) AS users_d7,
COUNT(DISTINCT CASE WHEN day_after_signup >= 14 AND active = 1 THEN user_id END) AS users_d14,
COUNT(DISTINCT CASE WHEN day_after_signup >= 21 AND active = 1 THEN user_id END) AS  users_d21,
COUNT(DISTINCT CASE WHEN day_after_signup >= 28 AND active = 1 THEN user_id END) AS  users_d28
FROM mercadolibre_retention
WHERE activity_date BETWEEN '2025-01-01' AND '2025-08-31'
GROUP BY country
ORDER BY country

--Paso 2:
Convertir conteos a % de retención por país
Objetivo: Convertir los conteos del Task 1 en porcentajes de retención por país al día 7, día 14, día 21 y día 28.

SELECT
  country,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN day_after_signup >= 7  AND active = 1 THEN user_id END)::numeric / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d7_pct,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN day_after_signup >= 14 AND active = 1 THEN user_id END)::numeric / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d14_pct,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN day_after_signup >= 21 AND active = 1 THEN user_id END)::numeric / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d21_pct,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN day_after_signup >= 28 AND active = 1 THEN user_id END)::numeric / NULLIF(COUNT(DISTINCT user_id), 0), 1) AS retention_d28_pct
FROM mercadolibre_retention
WHERE activity_date BETWEEN '2025-01-01' AND '2025-08-31'
GROUP BY country
ORDER BY country;


-- Paso 3: Definir la cohorte de registro
Objetivo:  Ahora vamos a analizar la retención por cohort. El primer paso es crear una consulta SQL que asigne el cohort en formato YYYY-MM a cada usuario (usando su primera fecha de registro)

SELECT user_id,
       MIN(signup_date) AS signup_dates,
       TO_CHAR(DATE_TRUNC('month', MIN (signup_date)), 'YYYY-MM') AS cohort
FROM mercadolibre_retention
GROUP BY user_id
LIMIT 5;

-- Paso 4: Calcular retención por cohorte y periodo D7, D14, D21, D28
Objetivo: Ahora, para cada cohorte mensual (YYYY-MM), vas a calcular el % de usuarios activos al día 7, 14, 21, y 28  desde su registro.
WITH cohort AS (
SELECT
user_id,
TO_CHAR(DATE_TRUNC('month', MIN(signup_date)), 'YYYY-MM') AS cohort
FROM mercadolibre_retention
GROUP BY user_id
ORDER BY cohort
),
activity AS (
SELECT r.user_id, c.cohort, r.day_after_signup, r.active
FROM mercadolibre_retention r
    LEFT JOIN cohort c ON r.user_id = c.user_id
WHERE r.activity_date BETWEEN '2025-01-01' AND '2025-08-31'
)
SELECT cohort,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN day_after_signup >= 7 AND active = 1 THEN user_id END) / NULLIF(COUNT(DISTINCT user_id),0),1) AS retention_d7_pct,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN day_after_signup >= 14 AND active = 1 THEN user_id END) / NULLIF(COUNT(DISTINCT user_id),0),1) AS retention_d14_pct,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN day_after_signup >= 21 AND active = 1 THEN user_id END) / NULLIF(COUNT(DISTINCT user_id),0),1) AS retention_d21_pct,
ROUND(100.0 * COUNT(DISTINCT CASE WHEN day_after_signup >= 28 AND active = 1 THEN user_id END) / NULLIF(COUNT(DISTINCT user_id),0),1) AS retention_d28_pct
FROM activity
GROUP BY cohort
ORDER BY cohort;