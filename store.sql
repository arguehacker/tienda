-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-04-2020 a las 05:59:52
-- Versión del servidor: 10.4.6-MariaDB
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
-- Base de datos: `store`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `Nombre` varchar(30) NOT NULL,
  `Clave` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`Nombre`, `Clave`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3'),
('ANDERSON', '662eaa47199461d01a623884080934ab'),
('jose', '2d3bf1b20e09f18da1007a68e259a298');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `CodigoCat` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`CodigoCat`, `Nombre`, `Descripcion`) VALUES
('C1', 'Monitores', 'Articulos de entretenimiento y diversión'),
('C2', 'Multimedia', 'Articulos de entretenimiento y diversión'),
('C3', 'Móviles', 'Teléfonos celulares smartphones'),
('C6', 'tecnologia', 'solo productos relacionados a celulares');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `NIT` varchar(30) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `NombreCompleto` varchar(70) NOT NULL,
  `Apellido` varchar(70) NOT NULL,
  `Clave` text NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`NIT`, `Nombre`, `NombreCompleto`, `Apellido`, `Clave`, `Direccion`, `Telefono`, `Email`) VALUES
('12345678901234567-8', 'samsung', 'mobile cellphone', 'rivas ', '2d3bf1b20e09f18da1007a68e259a298', 'san isidro', 74474442, 'samsung.mobile@gmail.com'),
('1234567890123456789-7', 'Anderson', 'Anderson Fernando', 'Argueta Jovel', '25d55ad283aa400af464c76d713c07ad', 'zacatecoluca, la paz', 74474442, 'arguetaanderson953@gmail.com'),
('2323343234454545453374-3', 'jose', 'Jose Miguel', 'Deodanes Perez', '2d3bf1b20e09f18da1007a68e259a298', 'dirCliente', 77777522, 'josedeodanes99@gmail.com'),
('97237473439473798374374932748', 'Invitado', 'Jose', 'Rivas', '2d3bf1b20e09f18da1007a68e259a298', 'San Salvador', 74474442, 'invitado@gob.sv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleVenta`
--

CREATE TABLE `detalleVenta` (
  `ID` int(15) NOT NULL,
  `IDVENTA` int(15) NOT NULL,
  `IDPRODUCTO` int(15) NOT NULL,
  `PRECIOUNITARIO` decimal(20,2) NOT NULL,
  `CANTIDAD` int(15) NOT NULL,
  `VENDIDO` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalleVenta`
--

INSERT INTO `detalleVenta` (`ID`, `IDVENTA`, `IDPRODUCTO`, `PRECIOUNITARIO`, `CANTIDAD`, `VENDIDO`) VALUES
(103, 40, 2, '255.00', 1, 1),
(104, 40, 1, '3000.00', 1, 1),
(105, 40, 2, '255.00', 1, 1),
(106, 41, 1, '3000.00', 1, 1),
(107, 41, 2, '255.00', 1, 1),
(108, 42, 2, '255.00', 1, 1),
(109, 43, 2, '255.00', 1, 1),
(110, 43, 1, '3000.00', 1, 1),
(111, 44, 2, '255.00', 1, 1),
(112, 44, 1, '3000.00', 1, 1),
(113, 45, 2, '255.00', 1, 1),
(114, 45, 1, '3000.00', 1, 1),
(115, 45, 2, '255.00', 1, 1),
(116, 46, 1, '3000.00', 1, 1),
(117, 46, 1, '3000.00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `CodigoProd` int(11) NOT NULL,
  `NombreProd` varchar(255) NOT NULL,
  `Precio` decimal(20,0) NOT NULL,
  `Modelo` text NOT NULL,
  `Marca` varchar(255) NOT NULL,
  `Imagen` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`CodigoProd`, `NombreProd`, `Precio`, `Modelo`, `Marca`, `Imagen`) VALUES
(1, 'Video camara con zoom optico', '3000', 'HMX-F90', 'Samsung', 'Samsung-HMX-F90-video-camera-2.jpg'),
(2, 'Altavoz Multiroom 360 R6', '255', 'WAM6500', 'Samsung', 'es_WAM6500-ZF_001_Front_black.jpg'),
(3, 'Galaxy J5', '150', 'J5', 'Samsung', 'j5.jpg'),
(4, 'Monitor TV LED 32\"', '200', 'T32E310EW', 'Samsung', 'es_LT32E310EW-EN_001_Front_black.jpg'),
(5, 'Camara Digital Sony Cyber-shot', '1000', 'DSC-WX9', 'Sony', 'camara.jpg'),
(6, 'Laptop', '555', 'DL23', 'Toshiba', 'lenguaje-programacion.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `NITProveedor` varchar(30) NOT NULL,
  `NombreProveedor` varchar(30) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `PaginaWeb` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`NITProveedor`, `NombreProveedor`, `Direccion`, `Telefono`, `PaginaWeb`) VALUES
('0001781', 'Sony', 'Minato, Tokio, Japón', 22596485, 'www.sony.com'),
('0001782', 'HTC', 'Taoyuan, Taiwán, (República de China)', 25987456, 'www.htc.com'),
('0001783', 'TCL', 'Huizhou, Guangdong, China', 25698745, 'tcl.com.ar'),
('0001785', 'Samsung', 'Samsung Town, Seúl, Corea del Sur', 22504787, 'www.samsung.com'),
('0001787', 'LG', 'Seúl,Corea del Sur', 26589874, 'www.lg.com'),
('0001788', 'Compaq', 'Houston, Texas, EE.UU', 24569875, 'www.compaq.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID` int(11) NOT NULL,
  `ClaveTransacion` varchar(250) NOT NULL,
  `PaypalDatos` text NOT NULL,
  `Fecha` datetime NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Total` decimal(60,0) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID`, `ClaveTransacion`, `PaypalDatos`, `Fecha`, `Correo`, `Total`, `status`) VALUES
(40, '2e768f9e415613ad41168e1c70d648cc', '{\"id\":\"PAYID-L2LYP2Q1T258240E97723926\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"61N28832YV833244M\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-w7jbl660881@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"MLLFA3FSZXVPC\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"},\"phone\":\"5033234741\",\"country_code\":\"SV\"}},\"transactions\":[{\"amount\":{\"total\":\"3510.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3510.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"628HUGKVDMKJ6\",\"email\":\"sb-ga3n61050275@business.example.com\"},\"description\":\"Compra de productos a Techmology box:$3,510.00\",\"custom\":\"2e768f9e415613ad41168e1c70d648cc#40\",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"}},\"related_resources\":[{\"sale\":{\"id\":\"71388163S6167662B\",\"state\":\"completed\",\"amount\":{\"total\":\"3510.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3510.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"189.84\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2LYP2Q1T258240E97723926\",\"create_time\":\"2020-04-15T22:17:32Z\",\"update_time\":\"2020-04-15T22:17:32Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/71388163S6167662B\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/71388163S6167662B/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LYP2Q1T258240E97723926\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\"}}]}],\"create_time\":\"2020-04-15T22:17:14Z\",\"update_time\":\"2020-04-15T22:17:32Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LYP2Q1T258240E97723926\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-04-15 16:17:04', 'elsalvador@gmail.com', '3510', 'Completo'),
(41, '2e768f9e415613ad41168e1c70d648cc', '{\"id\":\"PAYID-L2LZTHA5EY41839NF0416809\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"37727102A9002353P\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-w7jbl660881@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"MLLFA3FSZXVPC\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"},\"phone\":\"5033234741\",\"country_code\":\"SV\"}},\"transactions\":[{\"amount\":{\"total\":\"3255.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3255.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"628HUGKVDMKJ6\",\"email\":\"sb-ga3n61050275@business.example.com\"},\"description\":\"Compra de productos a Techmology box:$3,255.00\",\"custom\":\"2e768f9e415613ad41168e1c70d648cc#41\",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"}},\"related_resources\":[{\"sale\":{\"id\":\"4X052095H15660708\",\"state\":\"completed\",\"amount\":{\"total\":\"3255.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3255.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"176.07\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2LZTHA5EY41839NF0416809\",\"create_time\":\"2020-04-15T23:33:29Z\",\"update_time\":\"2020-04-15T23:33:29Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/4X052095H15660708\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/4X052095H15660708/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZTHA5EY41839NF0416809\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\"}}]}],\"create_time\":\"2020-04-15T23:32:44Z\",\"update_time\":\"2020-04-15T23:33:29Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZTHA5EY41839NF0416809\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-04-15 17:32:30', 'compraventas@gmail.com', '3255', 'Completo'),
(42, '2e768f9e415613ad41168e1c70d648cc', '{\"id\":\"PAYID-L2LZUCI0J884321C2874334X\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"92424707FV2490521\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-w7jbl660881@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"MLLFA3FSZXVPC\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"},\"phone\":\"5033234741\",\"country_code\":\"SV\"}},\"transactions\":[{\"amount\":{\"total\":\"255.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"255.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"628HUGKVDMKJ6\",\"email\":\"sb-ga3n61050275@business.example.com\"},\"description\":\"Compra de productos a Techmology box:$255.00\",\"custom\":\"2e768f9e415613ad41168e1c70d648cc#42\",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"}},\"related_resources\":[{\"sale\":{\"id\":\"2KM03549KJ820850M\",\"state\":\"completed\",\"amount\":{\"total\":\"255.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"255.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"14.07\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2LZUCI0J884321C2874334X\",\"create_time\":\"2020-04-15T23:34:57Z\",\"update_time\":\"2020-04-15T23:34:57Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2KM03549KJ820850M\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/2KM03549KJ820850M/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZUCI0J884321C2874334X\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\"}}]}],\"create_time\":\"2020-04-15T23:34:33Z\",\"update_time\":\"2020-04-15T23:34:57Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZUCI0J884321C2874334X\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-04-15 17:34:22', 'elsalvador@gmail.com', '255', 'Completo'),
(43, '2e768f9e415613ad41168e1c70d648cc', '', '2020-04-15 17:47:51', 'misventas@hotmail.com', '3255', 'pendiente'),
(44, '2e768f9e415613ad41168e1c70d648cc', '{\"id\":\"PAYID-L2LZ4TA0ES35122V9178370K\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"1GM43850UY751645E\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-w7jbl660881@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"MLLFA3FSZXVPC\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"},\"phone\":\"5033234741\",\"country_code\":\"SV\"}},\"transactions\":[{\"amount\":{\"total\":\"3255.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3255.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"628HUGKVDMKJ6\",\"email\":\"sb-ga3n61050275@business.example.com\"},\"description\":\"Compra de productos a Techmology box:$3,255.00\",\"custom\":\"2e768f9e415613ad41168e1c70d648cc#44\",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"}},\"related_resources\":[{\"sale\":{\"id\":\"1KE67570J4942933U\",\"state\":\"completed\",\"amount\":{\"total\":\"3255.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3255.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"176.07\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2LZ4TA0ES35122V9178370K\",\"create_time\":\"2020-04-15T23:53:37Z\",\"update_time\":\"2020-04-15T23:53:37Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/1KE67570J4942933U\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/1KE67570J4942933U/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZ4TA0ES35122V9178370K\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\"}}]}],\"create_time\":\"2020-04-15T23:52:44Z\",\"update_time\":\"2020-04-15T23:53:37Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZ4TA0ES35122V9178370K\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-04-15 17:52:30', 'misventas@hotmail.com', '3255', 'Completo'),
(45, '2e768f9e415613ad41168e1c70d648cc', '{\"id\":\"PAYID-L2LZ5XA8YN40544U95226038\",\"intent\":\"sale\",\"state\":\"approved\",\"cart\":\"6JM60825AL352323K\",\"payer\":{\"payment_method\":\"paypal\",\"status\":\"VERIFIED\",\"payer_info\":{\"email\":\"sb-w7jbl660881@personal.example.com\",\"first_name\":\"John\",\"last_name\":\"Doe\",\"payer_id\":\"MLLFA3FSZXVPC\",\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"},\"phone\":\"5033234741\",\"country_code\":\"SV\"}},\"transactions\":[{\"amount\":{\"total\":\"3510.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3510.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payee\":{\"merchant_id\":\"628HUGKVDMKJ6\",\"email\":\"sb-ga3n61050275@business.example.com\"},\"description\":\"Compra de productos a Techmology box:$3,510.00\",\"custom\":\"2e768f9e415613ad41168e1c70d648cc#45\",\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\",\"item_list\":{\"shipping_address\":{\"recipient_name\":\"John Doe\",\"line1\":\"Free Trade Zone\",\"city\":\"San Salvador\",\"state\":\"San Salvador\",\"postal_code\":\"1120\",\"country_code\":\"SV\"}},\"related_resources\":[{\"sale\":{\"id\":\"0FL76192W0163233T\",\"state\":\"completed\",\"amount\":{\"total\":\"3510.00\",\"currency\":\"USD\",\"details\":{\"subtotal\":\"3510.00\",\"shipping\":\"0.00\",\"insurance\":\"0.00\",\"handling_fee\":\"0.00\",\"shipping_discount\":\"0.00\"}},\"payment_mode\":\"INSTANT_TRANSFER\",\"protection_eligibility\":\"ELIGIBLE\",\"protection_eligibility_type\":\"ITEM_NOT_RECEIVED_ELIGIBLE,UNAUTHORIZED_PAYMENT_ELIGIBLE\",\"transaction_fee\":{\"value\":\"189.84\",\"currency\":\"USD\"},\"parent_payment\":\"PAYID-L2LZ5XA8YN40544U95226038\",\"create_time\":\"2020-04-15T23:55:29Z\",\"update_time\":\"2020-04-15T23:55:29Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/0FL76192W0163233T\",\"rel\":\"self\",\"method\":\"GET\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/sale/0FL76192W0163233T/refund\",\"rel\":\"refund\",\"method\":\"POST\"},{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZ5XA8YN40544U95226038\",\"rel\":\"parent_payment\",\"method\":\"GET\"}],\"soft_descriptor\":\"PAYPAL *JOHNDOESTES\"}}]}],\"create_time\":\"2020-04-15T23:55:08Z\",\"update_time\":\"2020-04-15T23:55:29Z\",\"links\":[{\"href\":\"https://api.sandbox.paypal.com/v1/payments/payment/PAYID-L2LZ5XA8YN40544U95226038\",\"rel\":\"self\",\"method\":\"GET\"}]}', '2020-04-15 17:54:47', 'elhackerpaypal@gmail.com', '3510', 'Completo'),
(46, '3fbae28d878995fdd67e8b9155f6ab67', '', '2020-04-15 21:22:41', 'blogger.programador@gmail.com', '6000', 'pendiente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`Nombre`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`CodigoCat`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`NIT`);

--
-- Indices de la tabla `detalleVenta`
--
ALTER TABLE `detalleVenta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDVENTA` (`IDVENTA`),
  ADD KEY `IDPRODUCTO` (`IDPRODUCTO`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`CodigoProd`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`NITProveedor`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalleVenta`
--
ALTER TABLE `detalleVenta`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `CodigoProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalleVenta`
--
ALTER TABLE `detalleVenta`
  ADD CONSTRAINT `detalleVenta_ibfk_1` FOREIGN KEY (`IDVENTA`) REFERENCES `ventas` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalleVenta_ibfk_2` FOREIGN KEY (`IDPRODUCTO`) REFERENCES `productos` (`CodigoProd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
