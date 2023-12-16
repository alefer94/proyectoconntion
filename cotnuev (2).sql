-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 16-12-2023 a las 23:44:52
-- Versión del servidor: 8.0.31
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cotnuev`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb3_spanish_ci NOT NULL,
  `usuario_id` int NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `ruc` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombre`, `telefono`, `direccion`, `usuario_id`, `estado`, `ruc`, `correo`) VALUES
(1, 'Público en General', '8296826298', 'S/D', 1, 1, '', ''),
(2, 'Angel sifuentes flores', '2147483647', 'Lima - Huari', 1, 1, '', ''),
(4, 'fernando', '987456123', 'aasdasdsad', 1, 1, '', ''),
(5, 'PACIFIC DEEP FROZEN S.A', '98745', 'av.micalea', 1, 1, '987456123', 'alex2@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE IF NOT EXISTS `configuracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb3_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`) VALUES
(1, 'CONNECTIONS', '925491523', 'angelsifuentes2580@gamil.com', 'Lima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_permisos`
--

DROP TABLE IF EXISTS `detalle_permisos`;
CREATE TABLE IF NOT EXISTS `detalle_permisos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_permiso` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_permisos`
--

INSERT INTO `detalle_permisos` (`id`, `id_permiso`, `id_usuario`) VALUES
(8, 3, 2),
(9, 4, 2),
(10, 5, 2),
(11, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

DROP TABLE IF EXISTS `detalle_temp`;
CREATE TABLE IF NOT EXISTS `detalle_temp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE IF NOT EXISTS `detalle_venta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_venta` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `id_producto`, `id_venta`, `cantidad`, `precio`) VALUES
(1, 4, 1, 2, '13.00'),
(2, 3, 1, 1, '16.00'),
(3, 4, 2, 3, '13.00'),
(4, 2, 3, 1, '10.00'),
(5, 3, 4, 2, '16.00'),
(6, 3, 5, 1, '16.00'),
(7, 3, 6, 1, '16.00'),
(8, 3, 7, 1, '16.00'),
(9, 3, 8, 1, '16.00'),
(10, 3, 9, 1, '16.00'),
(11, 3, 10, 1, '16.00'),
(12, 3, 2338, 1, '16.00'),
(13, 7, 2338, 1, '98.00'),
(14, 7, 2340, 1, '98.00'),
(15, 8, 2341, 1, '100.00'),
(16, 7, 2342, 1, '98.00'),
(17, 8, 2342, 1, '100.00'),
(18, 7, 2343, 1, '98.00'),
(19, 7, 2344, 1, '98.00'),
(20, 7, 2345, 1, '98.00'),
(21, 7, 2346, 1, '98.00'),
(22, 7, 2347, 1, '98.00'),
(23, 7, 2348, 1, '98.00'),
(24, 7, 2349, 1, '98.00'),
(25, 8, 2350, 1, '100.00'),
(26, 7, 2351, 1, '98.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'configuración'),
(2, 'usuarios'),
(3, 'clientes'),
(4, 'productos'),
(5, 'ventas'),
(6, 'nueva_venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `codproducto` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8mb3_spanish_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int NOT NULL,
  `usuario_id` int NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  `caracteristicas` text COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`codproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`, `usuario_id`, `estado`, `caracteristicas`) VALUES
(7, '099', 'SERVICIO DE Calibración (Incluye mantenimiento preventivo)', '98.00', 43, 1, 1, 'Marca: EXACT SCALE<br />\r\nModelo: IKERT/TAB2<br />\r\nCáp. Máx: 2TN<br />\r\nDiv. Escala: 0.5 Kg'),
(8, '055', 'SERVICIO DE Calibración (Incluye mantenimiento preventivo)', '100.00', 47, 1, 1, 'Marca: Rice Lyke<br />\r\nModelo:920i<br />\r\nCáp. Máx: 50 kg<br />\r\nDiv. Escala:20g');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8mb3_spanish_ci NOT NULL,
  `clave` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `estado` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`, `estado`) VALUES
(1, 'Fernando', 'angelsifuentes2580@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'Vida informatico', 'angel@gmail.com', 'angel', 'f4f068e71e0d87bf0ad51e6214ab84e9', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `referencia` varchar(500) COLLATE utf8mb3_spanish_ci NOT NULL,
  `plazo_dias` varchar(100) COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2352 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`, `referencia`, `plazo_dias`) VALUES
(10, 5, '16.00', 1, '2023-12-14 10:01:40', 'josue', ''),
(2338, 5, '114.00', 1, '2023-12-14 11:02:37', 'Servicio de calibración anual – 23 de Junio de 2023', ''),
(2339, 5, '0.00', 1, '2023-12-14 11:02:39', 'Servicio de calibración anual – 23 de Junio de 2023', ''),
(2340, 5, '98.00', 1, '2023-12-14 11:05:39', '', ''),
(2341, 5, '100.00', 1, '2023-12-14 11:06:44', 'aa', ''),
(2342, 5, '198.00', 1, '2023-12-14 11:07:41', 'SERVICIO DE CALIBRACION ANUAL', ''),
(2343, 5, '98.00', 1, '2023-12-16 22:49:39', 'asdasd', ''),
(2344, 5, '98.00', 1, '2023-12-16 22:53:07', 'Urb San Felipe', ''),
(2345, 5, '98.00', 1, '2023-12-16 22:56:20', 'Urb San Felipe', ''),
(2346, 5, '98.00', 1, '2023-12-16 22:57:58', '', ''),
(2347, 5, '98.00', 1, '2023-12-16 22:58:21', 'Servicio de calibración anual – 23 de Junio de 2023', ''),
(2348, 5, '98.00', 1, '2023-12-16 23:02:17', 'Urb San Felipe', ''),
(2349, 5, '98.00', 1, '2023-12-16 23:02:59', 'Urb San Felipe', ''),
(2350, 5, '100.00', 1, '2023-12-16 23:04:58', 'asd', ''),
(2351, 5, '98.00', 1, '2023-12-16 23:11:49', 'Urb San Felipe', 'as');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
