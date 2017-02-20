-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-02-2017 a las 19:53:44
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
  `id_relacion` int(4) NOT NULL,
  `monto_abono` float NOT NULL,
  `fecha_pago` date NOT NULL,
  `estatus` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajuste`
--

CREATE TABLE `ajuste` (
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

CREATE TABLE `clientes` (
  `id_cliente` int(4) NOT NULL,
  `nombre` varchar(350) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `referencias` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `colonia` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `whatsapp` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `latitud` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `longitud` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `direccion`, `referencias`, `colonia`, `email`, `telefono`, `celular`, `whatsapp`, `latitud`, `longitud`) VALUES
(1, 'juan perez Garcia', 'av. 34 calle 45', 'alado de la escuela primaria', 'centro', 'juan.perez@gmail.com', '96212346743', '89432126335', '76352316i983', '', ''),
(2, 'Manuel de la fuente', 'Calle naranjos, esquina con calle tamarindos ', 'enfrente de minisuer la esquina', 'laureles', 'manueldelafuente@gmail.com', '96212345676', '96212345678', '96212345678', '', ''),
(3, 'Gerardo Ortiz', '25 calle oriente no. 45', 'casa de color amarillo de dos pisos', 'Los naranjos', 'geraortiz@gmail.com', '9621123487', '9621145678', '96212235678', '', ''),
(4, 'Gerardo Lopez Mendez', '20 calle poniente s/n', 'En frente de tienda azul', 'centro', 'mail@mail.com', '9621234567', '9627654321', '9627654321', '', ''),
(5, 'juan perez', 'av. 34 calle 45', 'alado de la escuela primaria', 'centro', 'juan.perez@gmail.com', '96212346743', '89432126335', '76352316i983', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_servicio`
--

CREATE TABLE `cliente_servicio` (
  `id_relacion` int(4) NOT NULL,
  `id_cliente` int(4) NOT NULL,
  `id_servicio` int(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_pago` date NOT NULL,
  `tipo_servicio` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Esta tabla es la relación entre cliente y servicio';

--
-- Volcado de datos para la tabla `cliente_servicio`
--

INSERT INTO `cliente_servicio` (`id_relacion`, `id_cliente`, `id_servicio`, `fecha_inicio`, `fecha_pago`, `tipo_servicio`) VALUES
(1, 1, 2, '2017-02-16', '2017-02-16', 'Fijo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fijo`
--

CREATE TABLE `fijo` (
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

CREATE TABLE `menu` (
  `id_perfil` int(11) NOT NULL,
  `index` int(1) NOT NULL,
  `label` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(60) COLLATE utf8_unicode_ci NOT NULL
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

CREATE TABLE `perfil` (
  `id_perfil` int(1) NOT NULL,
  `perfil` varchar(15) COLLATE utf8_unicode_ci NOT NULL
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

CREATE TABLE `servicios` (
  `id_servicio` int(4) NOT NULL,
  `nombre` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `costo_monto` float NOT NULL,
  `categoria` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `submenu` (
  `id_perfil` int(1) NOT NULL,
  `index` int(1) NOT NULL,
  `index_menu` int(1) NOT NULL,
  `label` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(3) NOT NULL,
  `nombre` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `celular` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `id_perfil` int(3) NOT NULL,
  `userName` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `direccion`, `email`, `telefono`, `celular`, `id_perfil`, `userName`, `password`) VALUES
(1, 'David Chay Diaz', '"4 pnte Esq. 12 Priv. Sur', 'chd2al@gmail.com', '9626285030', '9621275592', 1, 'davi', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `cliente_servicio`
--
ALTER TABLE `cliente_servicio`
  ADD PRIMARY KEY (`id_relacion`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD UNIQUE KEY `index` (`index`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD UNIQUE KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `submenu`
--
ALTER TABLE `submenu`
  ADD UNIQUE KEY `index` (`index`),
  ADD UNIQUE KEY `index_menu` (`index_menu`),
  ADD UNIQUE KEY `index_menu_2` (`index_menu`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `cliente_servicio`
--
ALTER TABLE `cliente_servicio`
  MODIFY `id_relacion` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
