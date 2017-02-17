-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-02-2017 a las 23:50:44
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `turboadmin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE IF NOT EXISTS `abonos` (
  `id_relacion` int(4) NOT NULL,
  `monto_abono` float NOT NULL,
  `fecha_pago` date NOT NULL,
  `estatus` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajuste`
--

CREATE TABLE IF NOT EXISTS `ajuste` (
  `id_relacion` int(4) NOT NULL,
  `monto_total` float NOT NULL,
  `cantidad_abonos` int(2) NOT NULL,
  `num_quincena` int(1) NOT NULL,
  `estatus` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Esta tabla es el desglose de tipo ajuste aqui se van aguardar los datos  ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(350) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `referencias` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `colonia` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `whatsapp` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `direccion`, `referencias`, `colonia`, `email`, `telefono`, `celular`, `whatsapp`) VALUES
(1, 'juan perez', 'av. 34 calle 45', 'alado de la escuela primaria', 'centro', 'juan.perez@gmail.com', '96212346743', '89432126335', '76352316i983'),
(2, 'Manuel de la fuente', 'Calle naranjos, esquina con calle tamarindos ', 'enfrente de minisuer la esquina', 'laureles', 'manueldelafuente@gmail.com', '96212345676', '96212345678', '96212345678'),
(3, 'Gerardo Ortiz', '25 calle oriente no. 45', 'casa de color amarillo de dos pisos', 'Los naranjos', 'geraortiz@gmail.com', '9621123487', '9621145678', '96212235678');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_servicio`
--

CREATE TABLE IF NOT EXISTS `cliente_servicio` (
  `id_relacion` int(4) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(4) NOT NULL,
  `id_servicio` int(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_pago` date NOT NULL,
  `tipo_servicio` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_relacion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Esta tabla es la relación entre cliente y servicio' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cliente_servicio`
--

INSERT INTO `cliente_servicio` (`id_relacion`, `id_cliente`, `id_servicio`, `fecha_inicio`, `fecha_pago`, `tipo_servicio`) VALUES
(1, 1, 2, '2017-02-16', '2017-02-16', 'Fijo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fijo`
--

CREATE TABLE IF NOT EXISTS `fijo` (
  `id_relacion` int(4) NOT NULL,
  `fecha_pago` date NOT NULL,
  `num_quincena` int(1) NOT NULL,
  `estatus` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aui se guardaran los datos de los servicios de tipo fijo o concurrente o mensual';

--
-- Volcado de datos para la tabla `fijo`
--

INSERT INTO `fijo` (`id_relacion`, `fecha_pago`, `num_quincena`, `estatus`) VALUES
(1, '2017-02-16', 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id_perfil` int(11) NOT NULL,
  `index` int(1) NOT NULL,
  `label` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `index` (`index`),
  KEY `id_perfil` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_perfil`, `index`, `label`, `state`) VALUES
(1, 1, 'Clientes', 'inicio.clientes'),
(1, 2, 'Servicios', 'inicio.servicios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int(1) NOT NULL,
  `perfil` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `id_perfil` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `perfil`) VALUES
(1, 'Administrador'),
(2, 'Tecnico'),
(3, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE IF NOT EXISTS `servicios` (
  `id_servicio` int(4) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `costo_monto` float NOT NULL,
  `categoria` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre`, `descripcion`, `costo_monto`, `categoria`) VALUES
(1, 'Trubo One', 'Internet de 3MB', 250, 'Renta de Internet: residencial'),
(2, 'Trubo Plus', 'Internet de 5MB', 350, 'Renta de Internet: residencial'),
(3, 'Super Trubo', 'Internet de 10MB', 500, 'Renta de Internet: residencial'),
(4, 'Micro', 'Internet de 10MB', 1299, 'Renta de Internet: comercial'),
(5, 'Pymes', 'Internet de 20MB', 1999, 'Renta de Internet: comercial'),
(6, 'Empresarial', 'Internet de 50MB', 3999, 'Renta de Internet: comercial'),
(7, 'Camaras de seguridad', 'Venta e istalacion de camras de seguridad', 4000, 'Instalacion camras'),
(8, 'Torre de telecomunicaciones', 'Venta e istalacion de torres de telecomunicaciones', 2500, 'Instalacion torres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `submenu`
--

CREATE TABLE IF NOT EXISTS `submenu` (
  `id_perfil` int(1) NOT NULL,
  `index` int(1) NOT NULL,
  `index_menu` int(1) NOT NULL,
  `label` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `index` (`index`),
  UNIQUE KEY `index_menu` (`index_menu`),
  UNIQUE KEY `index_menu_2` (`index_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE IF NOT EXISTS `ubicacion` (
  `id_cliente` int(4) NOT NULL,
  `latitud` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `longitud` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(3) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `id_perfil` int(3) NOT NULL,
  `userName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_perfil` (`id_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `direccion`, `email`, `telefono`, `celular`, `id_perfil`, `userName`, `password`) VALUES
(1, 'David Chay Diaz', '"4 pnte Esq. 12 Priv. Sur', 'chd2al@gmail.com', '9626285030', '9621275592', 1, 'davi', '123456');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
