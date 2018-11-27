-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2018 a las 05:35:18
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `essen`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_chat` (IN `_id` INT, IN `_descripcion` VARCHAR(45))  NO SQL
CASE accion 
WHEN 'nuevo' then 
INSERT INTO `chat` (`descripcion`) VALUES (_descripcion);
WHEN 'editar' then 
UPDATE `chat` SET `descripcion`=_descripcion WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `chat` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `chat`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_datos_usu` (IN `_id` INT, IN `_nombre` VARCHAR(50), IN `_direccion` VARCHAR(45), IN `_telefono` VARCHAR(20), IN `_identificacion` INT(45), IN `_user` INT, IN `accion` VARCHAR(40))  NO SQL
CASE accion 
WHEN 'nuevo' then 
INSERT INTO `datosusuario`(`nombre`, `direccion`, `telefono`, `identificacion`, `usuario`) 
VALUES (_nombre,_direccion,_telefono,_identificacion, _user);
WHEN 'editar' then 
UPDATE `datosusuario` SET `nombre`=_nombre,`direccion`=_direccion,`telefono`=_telefono,
`identificacion`=_identificacion,`usuario`=_user  WHERE `id`=_id;
WHEN 'eliminar' then 
DELETE FROM `datosusuario` WHERE id=_id;
WHEN 'listar' then 
SELECT * FROM `datosusuario`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_estado_pedido` (IN `_id` INT, IN `_descripcion` VARCHAR(45), IN `_codigo` VARCHAR(45), IN `_fechareg` DATETIME)  NO SQL
CASE accion 
WHEN 'nuevo' then 
INSERT INTO `estado_pedido`(`descipcion`, `codigo`, `fecharegistro`) VALUES (_descripcion,_codigo,_fechareg);
WHEN 'editar' then 
UPDATE `estado_pedido` SET `descipcion`=_descripcion,`codigo`=_codigo,`fecharegistro`=_fechareg WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `estado_pedido` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `estado_pedido`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_facturacion` (IN `_id` INT, IN `_pedidos` INT, IN `_fecha` DATE)  NO SQL
CASE accion 
WHEN 'nuevo' then 
INSERT INTO `facturacion`(`pedidos`, `fecha`) VALUES (_pedidos,_fecha);
WHEN 'editar' then 
UPDATE `facturacion` SET `pedidos`=_pedidos,`fecha`=_fecha WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `facturacion` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `facturacion`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_historico` (IN `_id` INT, IN `_facturacion` INT, IN `_fecha` DATE)  NO SQL
CASE accion 
WHEN 'nuevo' then 
INSERT INTO `historico`(`facturacion`, `fecha`) VALUES (_facturacion,_fecha);
WHEN 'editar' then 
UPDATE `historico` SET `facturacion`=_facturacion,`fecha`=_fecha WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `historico` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `historico`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_mensaje` (IN `_id` INT, IN `_fec_mensaje` DATE, IN `_destino` INT, IN `_usuario` INT, IN `_chat` INT, IN `_mensaje` VARCHAR(500))  NO SQL
CASE accion 
WHEN 'nuevo' then 
INSERT INTO `mensaje`(`fecha_mensaje`, `destino`, `usuario`, `chat`, `mensaje`) VALUES (_fec_mensaje,_destino,_usuario,_chat,_mensaje);
WHEN 'editar' then 
UPDATE `mensaje` SET `fecha_mensaje`=_fec_mensaje,`destino`=_destino,`usuario`=_usuario,`chat`=_chat,`mensaje`=_mensaje WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `mensaje` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `mensaje`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_ofertas` (IN `_id` INT, IN `_nombre` VARCHAR(45), IN `_fec_inicio` DATE, IN `_fec_fin` DATE, IN `_precio` INT)  NO SQL
CASE accion 
WHEN 'nuevo' then
INSERT INTO `ofertas`(`nombre`, `fecha_inicio`, `fecha_fin`, `precio`) VALUES (_nombre,_fec_inicio,_fec_fin,_precio);
WHEN 'editar' then 
UPDATE `ofertas` SET `nombre`=_nombre,`fecha_inicio`=_fec_inicio,`fecha_fin`=_fec_fin,`precio`=_precio WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `ofertas` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `ofertas`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pagos` (IN `_id` INT, IN `_descripcion` VARCHAR(45))  NO SQL
CASE accion 
WHEN 'nuevo' then
INSERT INTO `pagos`(`descripcion`) VALUES (_descripcion);
WHEN 'editar' then 
UPDATE `pagos` SET `descripcion`=_descripcion WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `pagos` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `pagos`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_pedidos` (IN `_id` INT, IN `_tipooferta` INT, IN `_tipopedido` INT, IN `_cantidad` INT, IN `_usuario` INT, IN `_tipousuario` INT, IN `_estado_pedido` INT)  NO SQL
CASE accion 
WHEN 'nuevo' then
INSERT INTO `pedidos`(`tipooferta`, `tipopedido`, `cantidad`, `usuario`, `tipousuario`, `estado_pedido`) 
VALUES (_tipooferta,_tipopedido,_cantidad,_usuario,_tipousuario,_estado_pedido);
WHEN 'editar' then 
UPDATE `pedidos` SET `tipooferta`=_tipooferta,`tipopedido`=_tipopedido,
`cantidad`=_cantidad,`usuario`=_usuario,`tipousuario`=_tipousuario,`estado_pedido`=_estado_pedido WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `pedidos` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `pedidos`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_privilegios_usu` (IN `_id` INT, IN `_codigo` INT, IN `_descripcion` VARCHAR(45))  NO SQL
CASE accion 
WHEN 'nuevo' then
INSERT INTO `privilegios_usuario`(`codigo`, `descripcion`) VALUES (_codigo,_descripcion);
WHEN 'editar' then 
UPDATE `privilegios_usuario` SET `codigo`=_codigo,`descripcion`=_descripcion WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `privilegios_usuario` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `privilegios_usuario`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_productos` (IN `_id` INT, IN `_nombre` VARCHAR(45), IN `_precio` VARCHAR(45), IN `_descripcion` VARCHAR(45), IN `accion` VARCHAR(40))  NO SQL
CASE accion 
WHEN 'nuevo' then
INSERT INTO `productos`(`nombre`, `precio`, `descripcion`) VALUES (_nombre,_precio,_descripcion);
WHEN 'editar' then 
UPDATE `productos` SET `nombre`=_nombre,`precio`=_precio,`descripcion`= _descripcion WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `productos` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `productos`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_tipo_oferta` (IN `_id` INT, IN `_descripcion` VARCHAR(45), IN `_productos` INT, IN `_ofertas` INT)  NO SQL
CASE accion 
WHEN 'nuevo' then
INSERT INTO `tipooferta`(`descripcion`, `productos`, `ofertas`) VALUES (_descripcion,_productos,_ofertas);
WHEN 'editar' then 
UPDATE `tipooferta` SET `descripcion`=_descripcion,`productos`=_productos,`ofertas`= _ofertas WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `tipooferta` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `tipooferta`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_tipo_pedido` (IN `_id` INT, IN `_descripcion` VARCHAR(45), IN `_codigo` VARCHAR(45), IN `_pagos` INT)  NO SQL
CASE accion 
WHEN 'nuevo' then
INSERT INTO `tipopedido`(`descripcion`, `codigo`, `pagos`) VALUES (_descripcion,_codigo,_pagos);
WHEN 'editar' then 
UPDATE `tipopedido` SET `descripcion`=_descripcion,`codigo`=_codigo,`pagos`= _pagos WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `tipopedido` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `tipopedido`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_tipo_usuario` (IN `_id` INT, IN `_descripcion` VARCHAR(45), IN `_privilegio` INT)  NO SQL
CASE accion 
WHEN 'nuevo' then
INSERT INTO `tipousuario`(`descripcion`, `privilegios`) VALUES (_descripcion,_privilegio);
WHEN 'editar' then 
UPDATE `tipousuario` SET `descripcion`=_descripcion,`privilegios`= _privilegio WHERE id = _id;
WHEN 'eliminar' then 
DELETE FROM `tipousuario` WHERE id = _id;
WHEN 'listar' then 
SELECT * FROM `tipousuario`;
END CASE$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_usuario` (IN `_id` INT, IN `_usuario` VARCHAR(50), IN `_password` VARCHAR(50), IN `_tipo_usuario` INT, IN `accion` VARCHAR(40))  NO SQL
CASE accion
WHEN 'nuevo' then 
INSERT INTO usuario(usuario, password, tipousuario) VALUES (_usuario,_password,_tipo_usuario);
WHEN 'editar' then 
UPDATE usuario SET usuario=_usuario,password=_password,tipousuario=_tipo_usuario WHERE id=_id; 
WHEN 'eliminar' then 
DELETE FROM usuario WHERE id=_id;
WHEN 'listar' then 
SELECT * FROM usuario;
WHEN 'login' THEN
SELECT * FROM usuario WHERE usuario=_usuario AND password=_password; 
END CASE$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datosusuario`
--

CREATE TABLE `datosusuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `identificacion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedido`
--

CREATE TABLE `estado_pedido` (
  `id` int(11) NOT NULL,
  `descipcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecharegistro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id` int(11) NOT NULL,
  `pedidos` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historico`
--

CREATE TABLE `historico` (
  `id` int(11) NOT NULL,
  `facturacion` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `id` int(11) NOT NULL,
  `fecha_mensaje` date NOT NULL,
  `destino` int(11) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `chat` int(11) NOT NULL,
  `mensaje` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofertas`
--

CREATE TABLE `ofertas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `tipooferta` int(11) NOT NULL,
  `tipopedido` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `tipousuario` int(11) NOT NULL,
  `estado_pedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios_usuario`
--

CREATE TABLE `privilegios_usuario` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `privilegios_usuario`
--

INSERT INTO `privilegios_usuario` (`id`, `codigo`, `descripcion`) VALUES
(1, 1, 'indexCliente.php'),
(2, 2, 'indexAdministrado.php'),
(3, 3, 'indexRestaurante.php'),
(4, 4, 'indexMensajero.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `descripcion`) VALUES
(1, 'sopa de mondongo', '10000', 'sopa con arroz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipooferta`
--

CREATE TABLE `tipooferta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `productos` int(11) NOT NULL,
  `ofertas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipopedido`
--

CREATE TABLE `tipopedido` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `codigo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `pagos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `privilegios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `descripcion`, `privilegios`) VALUES
(1, 'cliente', 1),
(2, 'administrador', 2),
(3, 'restaurante', 3),
(4, 'mensajero', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tipousuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `password`, `tipousuario`) VALUES
(1, 'admin', 'uniminuto', 1),
(2, 'adminMensajero', 'uniminuto', 4),
(4, 'adminRestaurante', 'uniminuto', 3),
(5, 'adminCliente2', 'uniminuto', 1),
(6, 'admin2', '12345', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `datosusuario`
--
ALTER TABLE `datosusuario`
  ADD PRIMARY KEY (`id`,`usuario`),
  ADD KEY `fk_datosusuario_usuario1_idx` (`usuario`);

--
-- Indices de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id`,`pedidos`),
  ADD KEY `fk_facturacion_pedidos1_idx` (`pedidos`);

--
-- Indices de la tabla `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id`,`facturacion`),
  ADD KEY `fk_historico_facturacion1_idx` (`facturacion`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`id`,`usuario`,`chat`),
  ADD KEY `fk_chat_usuario1_idx` (`usuario`),
  ADD KEY `fk_mensaje_chat1_idx` (`chat`);

--
-- Indices de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`,`tipooferta`,`tipopedido`,`usuario`,`tipousuario`,`estado_pedido`),
  ADD KEY `fk_pedidos_tipooferta1_idx` (`tipooferta`),
  ADD KEY `fk_pedidos_tipopedido1_idx` (`tipopedido`),
  ADD KEY `fk_pedidos_usuario1_idx` (`usuario`,`tipousuario`),
  ADD KEY `fk_pedidos_estado_pedido1_idx` (`estado_pedido`);

--
-- Indices de la tabla `privilegios_usuario`
--
ALTER TABLE `privilegios_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipooferta`
--
ALTER TABLE `tipooferta`
  ADD PRIMARY KEY (`id`,`productos`,`ofertas`),
  ADD KEY `fk_tipooferta_productos1_idx` (`productos`),
  ADD KEY `fk_tipooferta_ofertas1_idx` (`ofertas`);

--
-- Indices de la tabla `tipopedido`
--
ALTER TABLE `tipopedido`
  ADD PRIMARY KEY (`id`,`pagos`),
  ADD KEY `fk_tipopedido_pagos1_idx` (`pagos`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`,`privilegios`),
  ADD KEY `fk_tipousuario_privilegios_usuario1_idx` (`privilegios`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`,`tipousuario`),
  ADD KEY `fk_usuario_tipousuario_idx` (`tipousuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `datosusuario`
--
ALTER TABLE `datosusuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_pedido`
--
ALTER TABLE `estado_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historico`
--
ALTER TABLE `historico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ofertas`
--
ALTER TABLE `ofertas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `privilegios_usuario`
--
ALTER TABLE `privilegios_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipooferta`
--
ALTER TABLE `tipooferta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipopedido`
--
ALTER TABLE `tipopedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datosusuario`
--
ALTER TABLE `datosusuario`
  ADD CONSTRAINT `fk_datosusuario_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `fk_facturacion_pedidos1` FOREIGN KEY (`pedidos`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `fk_historico_facturacion1` FOREIGN KEY (`facturacion`) REFERENCES `facturacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `fk_chat_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_mensaje_chat1` FOREIGN KEY (`chat`) REFERENCES `chat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_estado_pedido1` FOREIGN KEY (`estado_pedido`) REFERENCES `estado_pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_tipooferta1` FOREIGN KEY (`tipooferta`) REFERENCES `tipooferta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_tipopedido1` FOREIGN KEY (`tipopedido`) REFERENCES `tipopedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_usuario1` FOREIGN KEY (`usuario`,`tipousuario`) REFERENCES `usuario` (`id`, `tipousuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipooferta`
--
ALTER TABLE `tipooferta`
  ADD CONSTRAINT `fk_tipooferta_ofertas1` FOREIGN KEY (`ofertas`) REFERENCES `ofertas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipooferta_productos1` FOREIGN KEY (`productos`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipopedido`
--
ALTER TABLE `tipopedido`
  ADD CONSTRAINT `fk_tipopedido_pagos1` FOREIGN KEY (`pagos`) REFERENCES `pagos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD CONSTRAINT `tipousuario_ibfk_1` FOREIGN KEY (`privilegios`) REFERENCES `privilegios_usuario` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_tipousuario` FOREIGN KEY (`tipousuario`) REFERENCES `tipousuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
