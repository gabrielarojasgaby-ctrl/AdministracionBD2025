-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-09-2025 a las 18:36:03
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `charles`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `num_boleta` char(15) NOT NULL,
  `fecha_emi` date DEFAULT NULL,
  `id_cliente` char(15) DEFAULT NULL,
  `cod_emple` char(15) DEFAULT NULL,
  `estado_boleta` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `cod_cargo` char(15) NOT NULL,
  `nombre_cargo` varchar(30) DEFAULT NULL,
  `sueldo_basico` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cod_categoria` char(6) NOT NULL,
  `nombre` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` char(15) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `id_direccion` char(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleboleta`
--

CREATE TABLE `detalleboleta` (
  `id_detalle` int(11) NOT NULL,
  `num_boleta` char(15) DEFAULT NULL,
  `id_producto` char(6) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` char(15) NOT NULL,
  `departamento` varchar(30) DEFAULT NULL,
  `provincia` varchar(30) DEFAULT NULL,
  `detalledireccion` varchar(30) DEFAULT NULL,
  `referencia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `cod_emple` char(15) NOT NULL,
  `nombres` varchar(30) DEFAULT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `dni_emple` char(8) DEFAULT NULL,
  `estado_civil` varchar(30) DEFAULT NULL,
  `nivel_edu` varchar(30) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fecha_ingreso` varchar(30) DEFAULT NULL,
  `id_sede` char(30) DEFAULT NULL,
  `id_direccion` char(15) DEFAULT NULL,
  `cod_cargo` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` char(6) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `stock_minimo` int(11) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  `cod_categoria` char(6) DEFAULT NULL,
  `cod_sede` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `cod_sede` char(30) NOT NULL,
  `m2` varchar(30) DEFAULT NULL,
  `aforo` varchar(30) DEFAULT NULL,
  `n_pisos` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`num_boleta`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `cod_emple` (`cod_emple`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`cod_cargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indices de la tabla `detalleboleta`
--
ALTER TABLE `detalleboleta`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `num_boleta` (`num_boleta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`cod_emple`),
  ADD KEY `cod_cargo` (`cod_cargo`),
  ADD KEY `id_direccion` (`id_direccion`),
  ADD KEY `id_sede` (`id_sede`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `cod_categoria` (`cod_categoria`),
  ADD KEY `cod_sede` (`cod_sede`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`cod_sede`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalleboleta`
--
ALTER TABLE `detalleboleta`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `boleta_ibfk_2` FOREIGN KEY (`cod_emple`) REFERENCES `empleado` (`cod_emple`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

--
-- Filtros para la tabla `detalleboleta`
--
ALTER TABLE `detalleboleta`
  ADD CONSTRAINT `detalleboleta_ibfk_1` FOREIGN KEY (`num_boleta`) REFERENCES `boleta` (`num_boleta`),
  ADD CONSTRAINT `detalleboleta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cod_cargo`) REFERENCES `cargos` (`cod_cargo`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`cod_sede`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`cod_categoria`) REFERENCES `categoria` (`cod_categoria`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`cod_sede`) REFERENCES `sede` (`cod_sede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
