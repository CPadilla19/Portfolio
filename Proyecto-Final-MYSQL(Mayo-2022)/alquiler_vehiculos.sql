-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2022 a las 10:13:02
-- Versión del servidor: 8.0.28
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alquiler_vehiculos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(5, 'Barco'),
(3, 'Bicicleta'),
(7, 'Bus'),
(6, 'Camión'),
(1, 'Coche'),
(2, 'Moto'),
(4, 'Quad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_1` varchar(50) NOT NULL,
  `apellido_2` varchar(50) DEFAULT NULL,
  `dni` char(9) NOT NULL,
  `teléfono` varchar(50) NOT NULL,
  `sexo` char(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `pais_nacimiento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `apellido_1`, `apellido_2`, `dni`, `teléfono`, `sexo`, `fecha_nacimiento`, `pais_nacimiento`) VALUES
(1, 'Daniel', 'Mateo', 'Hernández', '95151311N', '660 27 55 70', 'H', '2000-12-25', 'Spain'),
(2, 'Carla', 'Garro', 'Fernández', '21311251A', '603 08 99 33', 'F', '2018-08-19', 'Italia'),
(3, 'Jonsen', 'Cortázar', 'Olivo', '40022971G', '625 13 56 13', 'H', '1993-10-14', 'Japón'),
(4, 'Adam', 'Bomba', 'Rico', '85970014Q', '774 59 32 42', 'H', '1999-12-25', 'República Checa'),
(5, 'Zaida', 'Carrero', 'Bueno', '20799891W', '671 09 99 30', 'F', '1995-03-13', 'Japón'),
(6, 'Manolo', 'Aceite', 'Empapado', '11651416F', '619 74 45 53', 'H', '1964-07-19', 'Spain'),
(7, 'Mary', 'Ortiz', 'Golosina', '15178851R', '659 06 68 52', 'F', '1970-02-05', 'República Dominicana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre`) VALUES
(1, 'Cupra'),
(3, 'Decathlon'),
(4, 'Honda'),
(6, 'Iveco'),
(7, 'Mercedes-Benz'),
(5, 'Sea'),
(2, 'Yamaha');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id_modelo` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_marca` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id_modelo`, `nombre`, `id_marca`) VALUES
(1, 'Formentor', 1),
(2, 'XSR125', 2),
(3, 'ELOPS 520', 3),
(4, 'Boxer eléctrico', 4),
(5, 'Ray 340', 5),
(6, 'Crossway Line', 6),
(7, 'ACTROS 41 51 v8', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int NOT NULL,
  `trayecto` text NOT NULL,
  `fecha_alquiler` date NOT NULL,
  `hora_inicio_alquiler` time NOT NULL,
  `hora_fin_alquiler` time NOT NULL,
  `num_vehiculo` int NOT NULL,
  `num_cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id_reserva`, `trayecto`, `fecha_alquiler`, `hora_inicio_alquiler`, `hora_fin_alquiler`, `num_vehiculo`, `num_cliente`) VALUES
(1, 'Corto', '2020-01-08', '13:05:10', '14:00:00', 4, 3),
(2, 'Medio', '2022-05-15', '18:02:45', '22:00:00', 1, 3),
(3, 'Largo', '2022-04-24', '04:30:46', '12:00:00', 5, 2),
(4, 'Largo', '2013-04-21', '08:57:32', '17:00:00', 7, 6),
(5, 'Corto', '2010-04-03', '09:02:14', '10:34:00', 4, 4),
(6, 'Medio', '2022-01-21', '16:21:21', '20:00:00', 4, 2),
(7, 'Largo', '2012-09-14', '14:30:00', '23:00:00', 1, 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `reservas_clientes_noesp`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `reservas_clientes_noesp` (
`id_reserva` int
,`trayecto` text
,`fecha_alquiler` date
,`hora_inicio_alquiler` time
,`hora_fin_alquiler` time
,`num_vehiculo` int
,`num_cliente` int
,`id_cliente` int
,`nombre_cliente` varchar(50)
,`apellido_1` varchar(50)
,`apellido_2` varchar(50)
,`dni` char(9)
,`teléfono` varchar(50)
,`sexo` char(1)
,`fecha_nacimiento` date
,`pais_nacimiento` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_vehiculo` int NOT NULL,
  `numero_matricula` varchar(50) NOT NULL,
  `nombre_categoria` int NOT NULL,
  `nombre_modelo` int NOT NULL,
  `año_fabricacion` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `numero_matricula`, `nombre_categoria`, `nombre_modelo`, `año_fabricacion`) VALUES
(1, '7998 DHM', 1, 1, 2015),
(2, '8128 HLS', 2, 2, 2015),
(3, '1141 APX', 3, 3, 2010),
(4, '2015 FNC', 4, 4, 2016),
(5, '7589 G2', 5, 5, 2022),
(6, '2016 SKT', 6, 6, 2020),
(7, '2017 JGT', 7, 7, 2021);

-- --------------------------------------------------------

--
-- Estructura para la vista `reservas_clientes_noesp`
--
DROP TABLE IF EXISTS `reservas_clientes_noesp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reservas_clientes_noesp`  AS SELECT `reservas`.`id_reserva` AS `id_reserva`, `reservas`.`trayecto` AS `trayecto`, `reservas`.`fecha_alquiler` AS `fecha_alquiler`, `reservas`.`hora_inicio_alquiler` AS `hora_inicio_alquiler`, `reservas`.`hora_fin_alquiler` AS `hora_fin_alquiler`, `reservas`.`num_vehiculo` AS `num_vehiculo`, `reservas`.`num_cliente` AS `num_cliente`, `clientes`.`id_cliente` AS `id_cliente`, `clientes`.`nombre_cliente` AS `nombre_cliente`, `clientes`.`apellido_1` AS `apellido_1`, `clientes`.`apellido_2` AS `apellido_2`, `clientes`.`dni` AS `dni`, `clientes`.`teléfono` AS `teléfono`, `clientes`.`sexo` AS `sexo`, `clientes`.`fecha_nacimiento` AS `fecha_nacimiento`, `clientes`.`pais_nacimiento` AS `pais_nacimiento` FROM (`reservas` join `clientes` on((`reservas`.`num_cliente` = `clientes`.`id_cliente`))) WHERE (`clientes`.`pais_nacimiento` <> 'Spain')  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`),
  ADD UNIQUE KEY `teléfono_UNIQUE` (`teléfono`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id_modelo`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `fk_marcas` (`id_marca`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `clientes_reservas_FK` (`num_cliente`),
  ADD KEY `vehiculos_reservas_FK` (`num_vehiculo`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_vehiculo`),
  ADD UNIQUE KEY `numero_matricula_UNIQUE` (`numero_matricula`),
  ADD KEY `categorias_vehiculos_FK` (`nombre_categoria`),
  ADD KEY `modelos_vehiculos_FK` (`nombre_modelo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id_modelo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id_reserva` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `fk_marcas` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `clientes_reservas_FK` FOREIGN KEY (`num_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`num_vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `categorias_vehiculos_FK` FOREIGN KEY (`nombre_categoria`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `modelos_vehiculos_FK` FOREIGN KEY (`nombre_modelo`) REFERENCES `modelos` (`id_modelo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
