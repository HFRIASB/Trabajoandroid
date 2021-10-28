-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2021 a las 03:26:24
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_distribuidoraaol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `usuarioCliente` varchar(15) NOT NULL,
  `claveCliente` varchar(20) NOT NULL,
  `estadoCliente` tinyint(1) NOT NULL,
  `idcliente` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`usuarioCliente`, `claveCliente`, `estadoCliente`, `idcliente`) VALUES
('Herbert', 'hfriass', 1, 1),
('Huberto', '1234', 1, 2),
('Ross', '1234', 1, 3),
('Ross', '1234', 1, 4),
('Andy', '1234', 1, 5),
('Andy2', '1234', 1, 6),
('', '', 1, 7),
('', '', 1, 8),
('', '', 1, 9),
('', '', 1, 10),
('AFRIASB', '', 1, 11),
('', '', 1, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id` int(11) NOT NULL,
  `coordenadas` varchar(100) NOT NULL,
  `direccion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gps`
--

CREATE TABLE `gps` (
  `id` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `coordenadas` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gps`
--

INSERT INTO `gps` (`id`, `direccion`, `coordenadas`) VALUES
(2, 'Avenue, Quillacollo, Bolivia', 'Lat = -17.397276338180568\n Long = -66.26304292857071'),
(3, 'Ikchipa 0210, Cochabamba, Bolivia', 'Lat = -17.354998255499048\n Long = -66.17114112139372');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigoProducto` varchar(50) NOT NULL,
  `nombreProducto` varchar(100) NOT NULL,
  `precioProducto` decimal(15,2) NOT NULL,
  `descuentoProducto` decimal(15,2) NOT NULL,
  `imagenProducto` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigoProducto`, `nombreProducto`, `precioProducto`, `descuentoProducto`, `imagenProducto`) VALUES
('Tx100', 'Aceite comestible de 100Lts.', '100.00', '0.00', 'http://127.0.0.1/distribuidoraAOL/logotipo.png'),
('Tx200', 'Aceite comestible de 200Lts.', '100.00', '0.00', 'http://127.0.0.1/distribuidoraAOL/logotipo.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `appaterno` varchar(30) NOT NULL,
  `apmaterno` varchar(30) NOT NULL,
  `ci` varchar(30) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `usuarioCliente` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `appaterno`, `apmaterno`, `ci`, `celular`, `usuarioCliente`) VALUES
(1, 'Henry', 'Frias', 'Badelomar', '9479603', '68443401', 'hfriasb'),
(2, '1', '2', '2', '2', '2', '2'),
(3, 'Antonio', 'Frias', 'Sotomayor', '3147517', '71479191', 'Huberto'),
(4, 'Rossm', 'Frias', 'Sotomayor', '3147517', '71479191', 'Ross'),
(5, 'Rossm', 'Frias', 'Sotomayor', '3147517', '71479191', 'Ross'),
(6, '', 'Frias', 'Sotomayor', '3147517', '71479191', 'Ross'),
(7, 'Andrea', 'Frias', 'Sotomayor', '3147517', '71479191', 'Andy'),
(8, 'Andrea', 'Frias', 'Sotomayor', '3147517', '71479191', 'Andy2'),
(9, '', '', '', '', '', ''),
(10, '', '', '', '', '', ''),
(11, '', '', '', '', '', ''),
(12, '', '', '', '', '', ''),
(13, 'Katherine', 'Frias', 'Baldelomar', '0000000', '0000000', 'AFRIASB'),
(14, '', '', '', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD UNIQUE KEY `idcliente` (`idcliente`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gps`
--
ALTER TABLE `gps`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigoProducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `gps`
--
ALTER TABLE `gps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
