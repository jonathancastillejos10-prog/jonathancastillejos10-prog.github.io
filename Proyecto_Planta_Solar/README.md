# ☀️ Análisis de Rendimiento de una Planta Solar

> **Análisis exploratorio de datos para evaluar el desempeño de inversores fotovoltaicos, identificar patrones de generación y detectar eventos de bajo rendimiento.**

---

## 🎯 Objetivo

Analizar los datos históricos de generación eléctrica de una planta solar fotovoltaica para identificar diferencias de rendimiento entre inversores, detectar registros anómalos durante las horas de generación y estimar pérdidas asociadas a eventos de generación nula.

---

## 📊 Datos utilizados

| Característica          | Información                   |
| ----------------------- | ----------------------------- |
| 📁 Dataset              | `Plant_1_Generation_Data.csv` |
| 📌 Registros            | 68,778                        |
| 📋 Variables originales | 7                             |
| 📅 Periodo              | Mayo–junio de 2020            |
| 🌐 Fuente               | Kaggle                        |
| ⚡ Variable principal    | `DC_POWER`                    |

---

## 🛠️ Tecnologías y herramientas

![Python](https://img.shields.io/badge/Python-Data%20Analysis-blue)
![Pandas](https://img.shields.io/badge/Pandas-Data%20Processing-blue)
![Matplotlib](https://img.shields.io/badge/Matplotlib-Visualization-orange)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange)

* **Python**
* **Pandas**
* **Matplotlib**
* **Jupyter Notebook**
* **Exploratory Data Analysis (EDA)**

---

## 🔎 Análisis realizado

El proyecto incluye:

* 🧹 Limpieza y preparación de los datos.
* 🕒 Conversión y validación de `DATE_TIME`.
* ⏱️ Extracción de la hora mediante `HOUR`.
* ⚡ Análisis de generación eléctrica por hora.
* 🌞 Análisis específico del periodo diurno.
* 🚨 Identificación de registros con `DC_POWER = 0` durante horas de generación.
* 🔌 Comparación del rendimiento entre inversores.
* 📈 Análisis de rendimiento por hora.
* 🔍 Identificación de eventos de generación nula simultánea.
* 💡 Estimación de pérdida de generación asociada a dichos eventos.
* 📊 Elaboración de tablas y visualizaciones para comunicar los resultados.

---

## 📈 Principales resultados

El análisis identificó a los inversores:

* `bvBOhCH3iADSZry`
* `1BY6WEcLGh8j5v7`

como los de menor desempeño relativo dentro del conjunto analizado.

### ⚡ Indicadores principales

| Indicador                                  |      Resultado |
| ------------------------------------------ | -------------: |
| 🚨 Ceros diurnos — `bvBOhCH3iADSZry`       |      **4.44%** |
| 🚨 Ceros diurnos — `1BY6WEcLGh8j5v7`       |      **4.27%** |
| ⚡ Potencia promedio — ambos inversores     | **5,424.97 W** |
| ⚡ Potencia promedio — resto de inversores  | **5,922.96 W** |
| 📉 Diferencia frente al resto              |      **8.40%** |
| 📉 Diferencia frente al mejor inversor     |     **10.73%** |
| 🔋 Pérdida estimada en eventos compartidos |  **89.96 kWh** |

### 🕒 Diferencia de rendimiento por hora

Al excluir los registros con potencia cero, los dos inversores analizados mantuvieron un rendimiento inferior al resto durante **todas las horas productivas**.

La diferencia observada se encontró entre:

**6.11% y 10.57%**

alcanzando su máximo a las **14:00**, con una diferencia de **10.57%** frente al resto de los inversores.

---

## 🚨 Eventos de generación nula

Se identificaron eventos en los que ambos inversores presentaron simultáneamente:

```text
DC_POWER = 0
```

durante periodos en los que se esperaba generación solar.

Los eventos más relevantes ocurrieron los días:

* 📅 **7 de junio de 2020**
* 📅 **14 de junio de 2020**

Bajo el supuesto de que los inversores afectados habrían producido una potencia similar al promedio de los demás inversores, estos eventos representan una **pérdida estimada de 89.96 kWh**.

De esta cantidad:

**55.48 kWh** corresponden aproximadamente al evento del **14 de junio de 2020**.

> ⚠️ **Nota:** esta pérdida es una estimación basada en el comportamiento promedio de los demás inversores; no representa una medición directa de energía perdida.

---

## 📊 Visualizaciones

El notebook contiene visualizaciones para facilitar la interpretación de los resultados:

### Comparación de potencia promedio

Se compara la potencia promedio entre:

* Los dos inversores analizados.
* El resto de los inversores.
* El mejor inversor identificado.

### Diferencia de rendimiento por hora

Se muestra cómo cambia la diferencia de rendimiento de los dos inversores analizados respecto al resto durante las horas productivas.

Estas visualizaciones respaldan la existencia de un patrón consistente de menor desempeño.

---

## 💡 Conclusiones

Los resultados muestran un patrón consistente de menor desempeño en los inversores `bvBOhCH3iADSZry` y `1BY6WEcLGh8j5v7`.

Además de presentar una mayor proporción de registros con generación nula durante el periodo diurno, ambos inversores mantuvieron una potencia promedio inferior al resto incluso después de excluir los registros con potencia cero.

Los eventos de generación nula simultánea identificados en junio también muestran periodos de interrupción que podrían estar relacionados con una condición operativa que afecta a ambos inversores.

Sin embargo, **los datos disponibles no permiten determinar la causa técnica específica** del problema.

Para realizar un diagnóstico más preciso sería necesario incorporar variables adicionales, como:

* ☀️ Irradiancia
* 🌡️ Temperatura
* 🔌 Estado operativo de los inversores
* 🔧 Registros de mantenimiento
* ⚠️ Alarmas o códigos de falla

---

## 📓 Notebook

El análisis completo se encuentra en:

👉 **[Analisis_Rendimiento_Planta_Solar.ipynb](./Analisis_Rendimiento_Planta_Solar.ipynb)**

El notebook contiene el proceso completo de preparación, análisis, identificación de anomalías, cálculos, tablas, visualizaciones y conclusiones.

---

## 👨‍💻 Proyecto

**Jonathan Castillejos Castillejos**

Data Analyst | Business Intelligence | Python • SQL • Power BI • PostgreSQL
