-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql313.infinityfree.com
-- Tiempo de generación: 11-09-2025 a las 12:16:58
-- Versión del servidor: 11.4.7-MariaDB
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `if0_39865592_INSTI_2025`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Artefacto`
--

CREATE TABLE `Artefacto` (
  `codArt` char(10) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `precio` decimal(20,0) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `linea` varchar(23) DEFAULT NULL,
  `modelo` varchar(6) DEFAULT NULL,
  `codFabricante` char(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Boleta`
--

CREATE TABLE `Boleta` (
  `nroBoleta` char(9) NOT NULL,
  `fechaEmision` datetime DEFAULT NULL,
  `Situacion` varchar(30) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `nroNP` char(8) DEFAULT NULL,
  `codClie` char(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Cliente`
--

CREATE TABLE `Cliente` (
  `codClie` char(10) NOT NULL,
  `nombreClie` varchar(27) DEFAULT NULL,
  `apellidosClie` varchar(27) DEFAULT NULL,
  `direccionClie` varchar(27) DEFAULT NULL,
  `telefonoClie` varchar(9) DEFAULT NULL,
  `emailClie` varchar(20) DEFAULT NULL,
  `rucClie` varchar(11) DEFAULT NULL,
  `dniClie` char(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetalleBoleta`
--

CREATE TABLE `DetalleBoleta` (
  `nroBoleta` char(9) NOT NULL,
  `codArt` char(9) NOT NULL,
  `descripcion` varchar(25) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(15,5) DEFAULT NULL,
  `monto` int(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetalleFactura`
--

CREATE TABLE `DetalleFactura` (
  `NroFactura` char(8) NOT NULL,
  `codArt` char(10) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `precio` decimal(15,5) DEFAULT NULL,
  `cantidad` int(12) DEFAULT NULL,
  `monto` int(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DetalleNotaPed`
--

CREATE TABLE `DetalleNotaPed` (
  `nroNP` char(8) NOT NULL,
  `codArt` char(10) NOT NULL,
  `descripcion` varchar(30) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(19,4) DEFAULT NULL,
  `monto` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Fabricante`
--

CREATE TABLE `Fabricante` (
  `codFabricante` char(12) NOT NULL,
  `nombreFabric` char(22) DEFAULT NULL,
  `procedencia` char(22) DEFAULT NULL,
  `direccionLocal` varchar(30) DEFAULT NULL,
  `telefonoLocal` varchar(25) DEFAULT NULL,
  `emailFabric` varchar(23) DEFAULT NULL,
  `contacto` varchar(9) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Factura`
--

CREATE TABLE `Factura` (
  `NroFactura` char(8) NOT NULL,
  `FechaEmision` datetime DEFAULT NULL,
  `Situacion` varchar(30) DEFAULT NULL,
  `Subtotal` varchar(30) DEFAULT NULL,
  `IGV` varchar(27) DEFAULT NULL,
  `Total` varchar(27) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `NotaPedido`
--

CREATE TABLE `NotaPedido` (
  `nroNP` char(8) NOT NULL,
  `fechaEmision` datetime DEFAULT NULL,
  `Situacion` varchar(30) DEFAULT NULL,
  `motivoCancelado` char(18) DEFAULT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  `codVend` char(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Vendedor`
--

CREATE TABLE `Vendedor` (
  `codVend` char(8) NOT NULL,
  `nombreVend` varchar(28) DEFAULT NULL,
  `apellidosVend` varchar(28) DEFAULT NULL,
  `direccionVend` varchar(32) DEFAULT NULL,
  `telefonoVend` varchar(9) DEFAULT NULL,
  `dniVend` char(8) DEFAULT NULL,
  `emailVend` varchar(26) DEFAULT NULL,
  `sueldoVend` decimal(19,4) DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Artefacto`
--
ALTER TABLE `Artefacto`
  ADD PRIMARY KEY (`codArt`),
  ADD KEY `R_4` (`codFabricante`);

--
-- Indices de la tabla `Boleta`
--
ALTER TABLE `Boleta`
  ADD PRIMARY KEY (`nroBoleta`),
  ADD KEY `R_8` (`nroNP`),
  ADD KEY `R_11` (`codClie`);

--
-- Indices de la tabla `Cliente`
--
ALTER TABLE `Cliente`
  ADD PRIMARY KEY (`codClie`);

--
-- Indices de la tabla `DetalleBoleta`
--
ALTER TABLE `DetalleBoleta`
  ADD PRIMARY KEY (`nroBoleta`,`codArt`);

--
-- Indices de la tabla `DetalleFactura`
--
ALTER TABLE `DetalleFactura`
  ADD PRIMARY KEY (`NroFactura`,`codArt`),
  ADD KEY `R_5` (`codArt`);

--
-- Indices de la tabla `DetalleNotaPed`
--
ALTER TABLE `DetalleNotaPed`
  ADD PRIMARY KEY (`nroNP`,`codArt`),
  ADD KEY `R_12` (`codArt`);

--
-- Indices de la tabla `Fabricante`
--
ALTER TABLE `Fabricante`
  ADD PRIMARY KEY (`codFabricante`);

--
-- Indices de la tabla `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`NroFactura`);

--
-- Indices de la tabla `NotaPedido`
--
ALTER TABLE `NotaPedido`
  ADD PRIMARY KEY (`nroNP`),
  ADD KEY `R_7` (`codVend`);

--
-- Indices de la tabla `Vendedor`
--
ALTER TABLE `Vendedor`
  ADD PRIMARY KEY (`codVend`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
