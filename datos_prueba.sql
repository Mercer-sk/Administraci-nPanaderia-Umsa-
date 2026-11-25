-- Tabla PRODUCTO
INSERT INTO PRODUCTO
(nombre, descripcion, unidad_producto, estado)
VALUES
('Pan Integral', 'Pan elaborado con harina integral', 'Unidad', 'Activo'),
('Pastel de Chocolate', 'Pastel artesanal de chocolate', 'Unidad', 'Activo'),
('Galletas de Avena', 'Galletas elaboradas con avena', 'Paquete', 'Activo'),
('Pan de Leche', 'Pan suave elaborado con leche', 'Unidad', 'Activo');

-- Tabla INGREDIENTE
INSERT INTO INGREDIENTE
(nombre, unidad_medida)
VALUES
('Harina integral', 'Kilogramos'),
('Azucar', 'Kilogramos'),
('Huevos', 'Unidades'),
('Leche', 'Litros'),
('Chocolate', 'Kilogramos'),
('Avena', 'Kilogramos'),
('Levadura', 'Kilogramos'),
('Mantequilla', 'Kilogramos');

-- Tabla RECETA_DETALLE
INSERT INTO RECETA_DETALLE
(id_producto, id_ingrediente, cantidad_por_unidad)
VALUES
-- Receta Pan Integral (id_producto = 1)
(1, 1, 0.50),
(1, 2, 0.05),
(1, 4, 0.20),
(1, 7, 0.02),

-- Receta Pastel de Chocolate (id_producto = 2)
(2, 2, 0.30),
(2, 3, 3.00),
(2, 4, 0.25),
(2, 5, 0.40),
(2, 8, 0.20),

-- Receta Galletas de Avena (id_producto = 3)
(3, 2, 0.15),
(3, 3, 1.00),
(3, 6, 0.30),
(3, 8, 0.10),

-- Receta Pan de Leche (id_producto = 4)
(4, 1, 0.40),
(4, 2, 0.08),
(4, 4, 0.30),
(4, 7, 0.02);

-- Tabla LOTE_PRODUCCION
INSERT INTO LOTE_PRODUCCION
(id_producto, fecha_produccion, cantidad_planificada, cantidad_producida)
VALUES
(1, '2026-11-20', 100, 95),
(2, '2026-11-20', 50, 48),
(3, '2026-11-21', 80, 80),
(4, '2026-11-21', 60, 55),
(1, '2026-11-22', 120, 115),
(2, '2026-11-22', 40, 38);

-- Tabla CONSUMO_DETALLE
INSERT INTO CONSUMO_DETALLE
(id_lote, id_ingrediente, cantidad_consumida)
VALUES
-- Lote 1: Pan Integral (95 unidades)
(1, 1, 47.50),
(1, 2, 4.75),
(1, 4, 19.00),
(1, 7, 1.90),

-- Lote 2: Pastel de Chocolate (48 unidades)
(2, 2, 14.40),
(2, 3, 144.00),
(2, 4, 12.00),
(2, 5, 19.20),
(2, 8, 9.60),

-- Lote 3: Galletas de Avena (80 unidades)
(3, 2, 12.00),
(3, 3, 80.00),
(3, 6, 24.00),
(3, 8, 8.00),

-- Lote 4: Pan de Leche (55 unidades)
(4, 1, 22.00),
(4, 2, 4.40),
(4, 4, 16.50),
(4, 7, 1.10),

-- Lote 5: Pan Integral (115 unidades)
(5, 1, 57.50),
(5, 2, 5.75),
(5, 4, 23.00),
(5, 7, 2.30),

-- Lote 6: Pastel de Chocolate (38 unidades)
(6, 2, 11.40),
(6, 3, 114.00),
(6, 4, 9.50),
(6, 5, 15.20),
(6, 8, 7.60);
