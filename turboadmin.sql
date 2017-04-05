-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-04-2017 a las 17:59:13
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `turboadmin`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `id_abono` int(11) NOT NULL,
  `id_venta_servicio` int(11) NOT NULL,
  `monto_abono` float NOT NULL,
  `fecha_limite_pago` date NOT NULL,
  `fecha_pago` date NOT NULL,
  `estatus` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comentario` varchar(120) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajuste`
--

CREATE TABLE `ajuste` (
  `id_venta_servicio` int(11) NOT NULL,
  `monto_total` float NOT NULL,
  `cantidad_abonos` tinyint(4) NOT NULL,
  `dia_abono` tinyint(2) NOT NULL,
  `tiempo` tinyint(2) NOT NULL,
  `estatus` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comentarios` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Esta tabla es el desglose de tipo ajuste aqui se van aguardar los datos  ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antena`
--

CREATE TABLE `antena` (
  `id_antena` int(11) NOT NULL,
  `num_serie` int(11) DEFAULT NULL,
  `folio_antena` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `marca` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `mac` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antena_seguimiento`
--

CREATE TABLE `antena_seguimiento` (
  `id_antena` int(11) DEFAULT NULL,
  `id_punto_acceso` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha_movimiento` date DEFAULT NULL,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comentario` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(4) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referencias` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `colonia` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `ciudad` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `celular` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `rfc` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `categoria` varchar(15) COLLATE utf8_unicode_ci DEFAULT '0',
  `id_ubicacion` int(3) DEFAULT '0',
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL,
  `forma_pago` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0',
  `estado` varchar(20) COLLATE utf8_unicode_ci DEFAULT '0',
  `observaciones` varchar(120) COLLATE utf8_unicode_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `direccion`, `referencias`, `colonia`, `codigo_postal`, `ciudad`, `telefono`, `email`, `celular`, `fecha_nacimiento`, `rfc`, `categoria`, `id_ubicacion`, `fecha_alta`, `fecha_baja`, `forma_pago`, `estado`, `observaciones`) VALUES
(1, 'David chay', '24 calle pnt', 'casa amarilla', 'san sebastian', NULL, NULL, '6285030', 'chd2al@gmail.com', '9621275592', NULL, '0', 'Recidencial', 2, '2017-03-22', NULL, '0', 'Nuevo', ''),
(2, 'David chay', '24 calle pnt', 'casa amarilla', 'san sebastian', NULL, NULL, '6285030', 'chd2al@gmail.com', '9621275592', NULL, '0', 'Recidencial', 2, '2017-03-25', NULL, '0', 'Nuevo', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instalacion`
--

CREATE TABLE `instalacion` (
  `id_instalacio` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_router` int(11) NOT NULL,
  `id_antena` int(11) NOT NULL,
  `id_tecnico` int(11) NOT NULL,
  `fecha_instalacion` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_pago`
--

CREATE TABLE `perfil_pago` (
  `id_perfil_pago` int(3) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dia_pago` int(2) NOT NULL,
  `dia_advertencia` int(2) NOT NULL,
  `dia_corte` int(2) NOT NULL,
  `descripcion` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_usuario`
--

CREATE TABLE `perfil_usuario` (
  `id_perfil` int(1) NOT NULL,
  `perfil` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `perfil_usuario`
--

INSERT INTO `perfil_usuario` (`id_perfil`, `perfil`, `descripcion`) VALUES
(1, 'Administrador', NULL),
(2, 'Tecnico', NULL),
(3, 'Vendedor', NULL),
(4, 'Cliente', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `id_plan` int(3) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `precio` float NOT NULL,
  `velicidad_bajada` int(11) NOT NULL,
  `velocidad_subida` int(11) NOT NULL,
  `descripcion` varchar(120) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='planes o tarifas de la renta de internet';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `punto_acceso`
--

CREATE TABLE `punto_acceso` (
  `id_punto_acceso` int(11) NOT NULL,
  `id_ubicacion` int(3) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `mac` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `frecuencia` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `ssid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `id_ap_padre` int(3) NOT NULL,
  `canales_activos` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `comentario` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorios`
--

CREATE TABLE `recordatorios` (
  `id_recordatorio` int(3) NOT NULL,
  `id_perfil_pago` int(3) DEFAULT NULL,
  `dia_recordatorio_1` int(2) DEFAULT NULL,
  `asunto_1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mensaje_1` text COLLATE utf8_unicode_ci,
  `dia_recordatorio_2` int(2) DEFAULT NULL,
  `asunto_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mensaje_2` text COLLATE utf8_unicode_ci,
  `dia_recordatorio_3` int(2) DEFAULT NULL,
  `asunto_3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mensaje_3` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `router`
--

CREATE TABLE `router` (
  `id_router` int(11) NOT NULL,
  `num_serie` int(11) NOT NULL,
  `folio_router` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombre_router` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `marca` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `mac` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `router_seguimiento`
--

CREATE TABLE `router_seguimiento` (
  `id_router` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT '0',
  `fecha_movimiento` date DEFAULT NULL,
  `ip` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comentarios` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(4) NOT NULL,
  `nombre` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `precio` float NOT NULL,
  `categoria` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre`, `descripcion`, `precio`, `categoria`) VALUES
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
-- Estructura de tabla para la tabla `tarifa_cliente`
--

CREATE TABLE `tarifa_cliente` (
  `id_cliente` int(3) NOT NULL,
  `id_plan` int(3) NOT NULL,
  `id_perfil_pago` int(3) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `comentario` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_ubicacion` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `ubicacion`
--

INSERT INTO `ubicacion` (`id_ubicacion`, `nombre`, `descripcion`) VALUES
(2, 'norte', 'sector de la antena x'),
(3, 'sur poniente', 'sector de la antena'),
(5, 'oeste', 'sector de la antena x'),
(7, 'torre sur', 'ubicado en la parte sur de la ciudad'),
(14, 'valle verde', 'casa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(3) NOT NULL,
  `id_perfil` int(3) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `referencias` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `colonia` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `codigo_postal` int(11) NOT NULL,
  `ciudad` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `usuario` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_perfil`, `nombre`, `direccion`, `referencias`, `colonia`, `codigo_postal`, `ciudad`, `telefono`, `celular`, `email`, `usuario`, `password`) VALUES
(1, 1, 'David Chay Diaz', '"4 pnte Esq. 12 Priv. Sur', '', '', 0, '', '9626285030', '9621275592', 'chd2al@gmail.com', 'davi', '123456'),
(2, 4, 'Carlos Alejandor Perez Molina', '26 pte s/n ', 'casa de color roja', 'fracionamiento la gloria', 30790, 'Tapachula', '962 62 6 11 88', '9621257890', 'alex@mail.com', 'calex', '123456'),
(3, 4, 'Samantha Lopez Galvez', 'calle las trozas s/n manzana 3 lote 56', 'casa de dos pisos color azul', 'rinconada del carmen', 30900, 'Tapachula', '962 4567 890', '9621275593', 'sammy@mail.com', 'sammy', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_servicio`
--

CREATE TABLE `venta_servicio` (
  `id_venta_servicio` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `monto_pago` float NOT NULL,
  `ajuste` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Esta tabla es la relación entre cliente y servicio';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id_abono`);

--
-- Indices de la tabla `antena`
--
ALTER TABLE `antena`
  ADD PRIMARY KEY (`id_antena`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `instalacion`
--
ALTER TABLE `instalacion`
  ADD PRIMARY KEY (`id_instalacio`);

--
-- Indices de la tabla `perfil_pago`
--
ALTER TABLE `perfil_pago`
  ADD PRIMARY KEY (`id_perfil_pago`);

--
-- Indices de la tabla `perfil_usuario`
--
ALTER TABLE `perfil_usuario`
  ADD UNIQUE KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id_plan`);

--
-- Indices de la tabla `punto_acceso`
--
ALTER TABLE `punto_acceso`
  ADD PRIMARY KEY (`id_punto_acceso`);

--
-- Indices de la tabla `recordatorios`
--
ALTER TABLE `recordatorios`
  ADD PRIMARY KEY (`id_recordatorio`),
  ADD KEY `id_perfil_pago` (`id_perfil_pago`);

--
-- Indices de la tabla `router`
--
ALTER TABLE `router`
  ADD PRIMARY KEY (`id_router`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `tarifa_cliente`
--
ALTER TABLE `tarifa_cliente`
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_plan` (`id_plan`),
  ADD KEY `id_perfil_pago` (`id_perfil_pago`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `venta_servicio`
--
ALTER TABLE `venta_servicio`
  ADD PRIMARY KEY (`id_venta_servicio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `venta_servicio`
--
ALTER TABLE `venta_servicio`
  MODIFY `id_venta_servicio` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
