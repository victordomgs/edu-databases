# Valorant Pro Matches Database

Este repositorio contiene una base de datos relacional diseñada para analizar partidos profesionales del videojuego **Valorant**. 

---

## **Modelo de Datos**

La base de datos incluye las siguientes tablas principales:

![Modelo EER de la base de datos](https://github.com/victordomgs/edu-databases/blob/main/valorantProMatches/EER-valorantpromatches.png)

---

## **Fuente de los Datos**

### **Contexto de los datos**
- Valorant es relativamente nuevo en el escenario competitivo de eSports, y la recopilación de datos aún está en sus primeras etapas.
- Los datos fueron obtenidos mediante scraping de la página web [vlr.gg](https://www.vlr.gg), que proporciona información detallada de los partidos.
- Los datos actuales cubren la mayoría de los partidos hasta el 1 de enero de 2022. Algunos datos más antiguos o difíciles de procesar no se incluyeron debido a problemas en el formato.

### **Detalles de los datos**
- La base de datos incluye información como mapas jugados, estadísticas de rondas, economía, agentes utilizados, y estadísticas individuales de jugadores.
- El dataset original contenía aproximadamente 11,500 partidas, pero algunos errores redujeron el total de partidas procesadas. Además, al crear el modelo relacional se han reducido los datos a únicamente partidas completas (en número de jugadores y rondas).

---

## **Licencia**

Los datos originales pertenecen a [Kaggle](https://www.kaggle.com/datasets/visualize25/valorant-pro-matches-full-data).
