-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2026 a las 03:05:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `panaderia_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo_detalle`
--

CREATE TABLE `consumo_detalle` (
  `id_consumo` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad_consumida` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id_ingrediente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `unidad_medida` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote_produccion`
--

CREATE TABLE `lote_produccion` (
  `id_lote` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `fecha_produccion` date NOT NULL,
  `cantidad_planificada` decimal(10,2) DEFAULT NULL,
  `cantidad_producida` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `unidad_producto` varchar(50) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_detalle`
--

CREATE TABLE `receta_detalle` (
  `id_producto` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad_por_unidad` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consumo_detalle`
--
ALTER TABLE `consumo_detalle`
  ADD PRIMARY KEY (`id_consumo`),
  ADD KEY `id_lote` (`id_lote`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id_ingrediente`);

--
-- Indices de la tabla `lote_produccion`
--
ALTER TABLE `lote_produccion`
  ADD PRIMARY KEY (`id_lote`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `receta_detalle`
--
ALTER TABLE `receta_detalle`
  ADD PRIMARY KEY (`id_producto`,`id_ingrediente`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `consumo_detalle`
--
ALTER TABLE `consumo_detalle`
  MODIFY `id_consumo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lote_produccion`
--
ALTER TABLE `lote_produccion`
  MODIFY `id_lote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consumo_detalle`
--
ALTER TABLE `consumo_detalle`
  ADD CONSTRAINT `consumo_detalle_ibfk_1` FOREIGN KEY (`id_lote`) REFERENCES `lote_produccion` (`id_lote`),
  ADD CONSTRAINT `consumo_detalle_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`);

--
-- Filtros para la tabla `lote_produccion`
--
ALTER TABLE `lote_produccion`
  ADD CONSTRAINT `lote_produccion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `receta_detalle`
--
ALTER TABLE `receta_detalle`
  ADD CONSTRAINT `receta_detalle_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`),
  ADD CONSTRAINT `receta_detalle_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingrediente` (`id_ingrediente`);
COMMIT;

-- Tabla PRODUCTO
INSERT INTO producto
(nombre, descripcion, unidad_producto, estado)
VALUES
('Pan Integral', 'Pan elaborado con harina integral', 'Unidad', 'Activo'),
('Pastel de Chocolate', 'Pastel artesanal de chocolate', 'Unidad', 'Activo'),
('Galletas de Avena', 'Galletas elaboradas con avena', 'Paquete', 'Activo'),
('Pan de Leche', 'Pan suave elaborado con leche', 'Unidad', 'Activo');

-- Tabla INGREDIENTE
INSERT INTO ingrediente
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
INSERT INTO receta_detalle
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
INSERT INTO lote_produccion
(id_producto, fecha_produccion, cantidad_planificada, cantidad_producida)
VALUES
(1, '2026-11-20', 100, 95),
(2, '2026-11-20', 50, 48),
(3, '2026-11-21', 80, 80),
(4, '2026-11-21', 60, 55),
(1, '2026-11-22', 120, 115),
(2, '2026-11-22', 40, 38);

-- Tabla CONSUMO_DETALLE
INSERT INTO consumo_detalle
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

