# Administraci-nPanaderia-Umsa-
# Sistema de Control de Producción para una Panadería

Base de datos (`panaderia_db`) diseñada para registrar la elaboración diaria de productos, controlar el uso de ingredientes y llevar el historial de lotes producidos[cite: 1, 3].

## Resolución de los cinco problemas

1. **Registrar productos e ingredientes necesarios para su elaboración:**  
   Se cuenta con las tablas `producto` (`nombre`, `descripcion`, `unidad_producto`, `estado`) e `ingrediente` (`nombre`, `unidad_medida`), relacionadas mediante la tabla `receta_detalle` (`id_producto`, `id_ingrediente`, `cantidad_por_unidad`), que define qué ingredientes y en qué cantidad requiere cada unidad de producto.

2. **Registrar lotes de producción indicando cantidades y fechas:**  
   La tabla `lote_produccion` (`id_producto`, `fecha_produccion`, `cantidad_planificada`, `cantidad_producida`) registra cada tanda de elaboración con su fecha correspondiente, el producto fabricado y las cantidades planificadas frente a las realmente producidas.

3. **Controlar el consumo de ingredientes durante la producción:**  
   La tabla `consumo_detalle` (`id_lote`, `id_ingrediente`, `cantidad_consumida`) asocia cada lote de producción con los ingredientes empleados y la cantidad exacta consumida en dicho lote (por ejemplo, calculada a partir de `cantidad_producida` y `cantidad_por_unidad` de `receta_detalle`).

4. **Consultar el historial de producción por producto o fecha:**  
   Mediante la relación entre `lote_produccion` y `producto` (`id_producto`) junto con el campo `fecha_produccion`, es posible consultar el historial de producción filtrando por producto, por una fecha exacta o por un rango de fechas.

5. **Obtener reportes de productos elaborados y consumo de ingredientes:**  
   La estructura relacional con claves foráneas permite realizar consultas con `JOIN`, `SUM` y `GROUP BY` para obtener totales de unidades producidas en `lote_produccion` y el consumo acumulado de cada ingrediente en `consumo_detalle` por producto, lote o periodo.

## Estructura del repositorio
* `panaderia_db.sql`: Script de creación de la base de datos `panaderia_db`, sus tablas (`producto`, `ingrediente`, `receta_detalle`, `lote_produccion`, `consumo_detalle`), claves primarias y claves foráneas[cite: 1].
* `datos_prueba.sql`: Sentencias `INSERT` con datos de ejemplo para productos, recetas, lotes de producción y consumo de ingredientes[cite: 1].
