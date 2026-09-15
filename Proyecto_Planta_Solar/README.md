# Análisis de Rendimiento de una Planta Solar

## Descripción

Análisis de datos de generación eléctrica de una planta solar fotovoltaica para evaluar el rendimiento de sus inversores, identificar patrones de generación y detectar posibles eventos de bajo desempeño durante el periodo diurno.

## Datos

* **Dataset:** Plant_1_Generation_Data.csv
* **Registros:** 68,778
* **Variables originales:** 7
* **Periodo analizado:** mayo–junio de 2020
* **Fuente:** Kaggle
* **Variable principal:** `DC_POWER`

## Herramientas

* Python
* Pandas
* Matplotlib
* Jupyter Notebook
* Análisis exploratorio de datos (EDA)

## Análisis realizado

El análisis incluyó:

* Limpieza y preparación de los datos.
* Conversión y validación de la variable `DATE_TIME`.
* Extracción de la hora de generación mediante `HOUR`.
* Análisis de la generación eléctrica por hora.
* Identificación de registros con `DC_POWER` igual a cero durante el periodo diurno.
* Comparación del rendimiento entre inversores.
* Análisis del rendimiento por hora.
* Identificación de eventos de generación nula simultánea.
* Estimación de la pérdida de generación asociada a dichos eventos.
* Elaboración de tablas y visualizaciones para comunicar los resultados.

## Principales resultados

Los inversores `bvBOhCH3iADSZry` y `1BY6WEcLGh8j5v7` presentaron el menor desempeño relativo dentro del análisis.

Durante el periodo diurno:

| Indicador                               |  Resultado |
| --------------------------------------- | ---------: |
| Ceros diurnos — `bvBOhCH3iADSZry`       |      4.44% |
| Ceros diurnos — `1BY6WEcLGh8j5v7`       |      4.27% |
| Potencia promedio — ambos inversores    | 5,424.97 W |
| Potencia promedio — resto de inversores | 5,922.96 W |
| Diferencia frente al resto              |      8.40% |
| Diferencia frente al mejor inversor     |     10.73% |
| Pérdida estimada en eventos compartidos |  89.96 kWh |

La diferencia de rendimiento se mantuvo durante todas las horas productivas analizadas, con una brecha de entre **6.11% y 10.57%** respecto al resto de los inversores.

También se identificaron eventos en los que ambos inversores presentaron simultáneamente `DC_POWER = 0` durante periodos de generación solar, particularmente los días **7 y 14 de junio de 2020**.

La pérdida estimada asociada a estos eventos fue de **89.96 kWh**, de los cuales aproximadamente **55.48 kWh** correspondieron al 14 de junio.

## Conclusiones

Los resultados muestran un patrón consistente de menor desempeño en los inversores `bvBOhCH3iADSZry` y `1BY6WEcLGh8j5v7`.

Además de presentar una mayor proporción de registros con generación nula durante el periodo diurno, ambos inversores mantuvieron una potencia promedio inferior al resto incluso después de excluir los registros con potencia cero.

Los eventos de generación nula simultánea también sugieren periodos de interrupción que podrían estar relacionados con una condición operativa que afecta a ambos inversores.

Sin embargo, los datos disponibles no permiten determinar la causa técnica específica del problema. Para realizar un diagnóstico más preciso sería necesario incorporar variables adicionales como irradiancia, temperatura, estado operativo de los equipos y registros de mantenimiento.

## Visualizaciones

El proyecto incluye:

* Comparación de potencia promedio entre grupos de inversores.
* Evolución de la diferencia de rendimiento por hora.

Las visualizaciones permiten identificar de forma clara la diferencia de desempeño entre los inversores analizados y el resto de la planta.

## Archivo principal

El análisis completo se encuentra en:

**`Analisis_Rendimiento_Planta_Solar.ipynb`**

