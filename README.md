# 📊 Caso Práctico SQL

**Diplomado en Análisis y Visualización de Datos**  
*Módulo: SQL*  
**Proyecto:** Análisis de Ventas del Restaurante *Sabores del Mundo*

---

## 🍽️ Contexto  

El restaurante **Sabores del Mundo**, reconocido por su auténtica cocina internacional y ambiente acogedor, lanzó un nuevo menú a principios de año. Desde entonces, ha estado recopilando información detallada sobre las transacciones de sus clientes con el objetivo de identificar áreas de oportunidad, optimizar su oferta y maximizar las ventas mediante el análisis de datos.

---

## 🎯 Objetivo  

Analizar el comportamiento de ventas para determinar:

- Los productos del menú con mejor y peor desempeño.
- Las categorías más solicitadas.
- Oportunidades para mejorar la rentabilidad.

---

## 📈 Resultados y Recomendaciones

Tras realizar un análisis exhaustivo utilizando consultas en **PostgreSQL**, se obtuvieron los siguientes hallazgos:

### ✅ 1. Platillos más populares
- **Hamburguesa** – 622 pedidos  
- **Edamame** – 620 pedidos  
- **Korean Beef Bowl** – 588 pedidos  

📌 Aunque el platillo más vendido es de tipo americano, la **categoría más solicitada** es la **asiática**, lo que sugiere una fuerte preferencia por este tipo de cocina.

---

### ⚠️ 2. Platillos con menor demanda
- **Chicken Tacos** – 123 pedidos  
- **Potstickers** – 205 pedidos  
- **Cheese Lasagna** – 207 pedidos  

Esto podría indicar una menor aceptación o visibilidad de estos productos en el menú actual.

---

### 💰 3. Ganancias totales
- **Ingresos totales del periodo:** `$159,217.90`

💡 **Recomendación:** Ajustar los precios de los platillos más populares entre **$0.50 y $1.00** para aumentar ingresos sin reducir significativamente la demanda.

---

### 🍜 4. Categoría con mayor aceptación
- **Comida asiática:** 3,470 pedidos

🔍 Sugerencia: Ampliar la oferta de esta categoría para aprovechar su alta popularidad entre los comensales.

---

### 📉 5. Sensibilidad al precio
- El platillo más caro se vendió **239 veces**
- El más económico (Edamame) se vendió **620 veces**

📌 Esto indica que los clientes podrían mostrar **sensibilidad al precio**, por lo que es importante considerar este factor al definir la estrategia de precios.

---

## 🛠️ Herramientas utilizadas

- PostgreSQL
- SQL Queries
- Análisis exploratorio de datos

---

## 📚 Conclusión

El análisis de ventas permite identificar patrones de consumo y tomar decisiones estratégicas basadas en datos. En este caso, se detectaron oportunidades claras para ajustar precios, mejorar el menú y enfocarse en las categorías con mayor demanda.
