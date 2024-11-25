-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-11-2024 a las 23:02:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `innovafix`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarEquipos` (IN `id` INT, `marca` VARCHAR(45), `referencia` VARCHAR(45), `fechaEntregado` DATE)   UPDATE tbl_equipos
SET equipo_marca=marca, equipo_referencia=referencia, equipo_fechaEntregado=fechaEntregado
WHERE equipo_ID=id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarCliente` (IN `eliminar` INT)   BEGIN
DELETE FROM tbl_clientes WHERE cli_cedula=eliminar;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarClientes` (IN `cedula` INT, `nombre` VARCHAR(45), `apellido` VARCHAR(45), `telefono` VARCHAR(10), `direccion` VARCHAR(45))   INSERT INTO tbl_clientes (cli_cedula, cli_nombre, cli_apellido, cli_telefono, cli_direccion)
VALUES (cedula, nombre, apellido, telefono, direccion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_equipoDeCliente` ()   SELECT tbl_equipos.equipo_ID, tbl_equipos.equipo_marca, tbl_equipos.equipo_referencia, tbl_equipos.equipo_fechaRecibido, tbl_equipos.equipo_fechaEntregado, 
tbl_clientes.cli_nombre, tbl_clientes.cli_apellido 
FROM tbl_equipos 
INNER JOIN tbl_clientes
ON tbl_equipos.copia_cliCedula=tbl_clientes.cli_cedula$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_rolDeEmpleado` ()   SELECT tbl_roles.rol_ID, tbl_roles.rol_nombre, tbl_empleados.emple_cedula, tbl_empleados.emple_nombre, tbl_empleados.emple_estado AS Estado
FROM tbl_roles 
INNER JOIN tbl_empleados
ON tbl_roles.rol_empleCedula=tbl_empleados.emple_cedula
WHERE tbl_empleados.emple_estado LIKE 'Inactivo'$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adquirir_productos`
--

CREATE TABLE `adquirir_productos` (
  `adquirir_prodID` int(11) NOT NULL,
  `adquirir_compraID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `adquirir_productos`
--

INSERT INTO `adquirir_productos` (`adquirir_prodID`, `adquirir_compraID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audi_productos`
--

CREATE TABLE `audi_productos` (
  `audiID_prod` int(11) NOT NULL,
  `num_prod_ID` int(11) NOT NULL,
  `audi_prodNombre_old` varchar(45) DEFAULT NULL,
  `audi_prodStock_old` int(11) DEFAULT NULL,
  `audi_prodCosto_old` int(11) DEFAULT NULL,
  `audi_prodPrecio_old` int(11) DEFAULT NULL,
  `audi_prodDescripcion_old` varchar(300) DEFAULT NULL,
  `audi_prodNombre_new` varchar(45) DEFAULT NULL,
  `audi_prodStock_new` int(11) DEFAULT NULL,
  `audi_prodCosto_new` int(11) DEFAULT NULL,
  `audi_prodPrecio_new` int(11) DEFAULT NULL,
  `audi_prodDescripcion_new` varchar(300) DEFAULT NULL,
  `audiProd_usuario` varchar(30) DEFAULT NULL,
  `audiProd_fecha` date DEFAULT NULL,
  `audiProd_accion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `audi_productos`
--

INSERT INTO `audi_productos` (`audiID_prod`, `num_prod_ID`, `audi_prodNombre_old`, `audi_prodStock_old`, `audi_prodCosto_old`, `audi_prodPrecio_old`, `audi_prodDescripcion_old`, `audi_prodNombre_new`, `audi_prodStock_new`, `audi_prodCosto_new`, `audi_prodPrecio_new`, `audi_prodDescripcion_new`, `audiProd_usuario`, `audiProd_fecha`, `audiProd_accion`) VALUES
(1, 7, 'Control XBOX', 6, 70000, 110000, 'Control para XBOX 360 inalambrico', 'Control XBOX', 7, 70000, 110000, 'Control para XBOX 360 inalambrico', 'root@localhost', '2024-11-25', 'Actualización Producto'),
(2, 0, NULL, NULL, NULL, NULL, NULL, 'Cable tipoC', 30, 3000, 10000, 'Cable para telefonos con entrada \"TipoC\"', 'root@localhost', '2024-11-25', 'Se adiciona un producto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realizar_compra`
--

CREATE TABLE `realizar_compra` (
  `realizar_proveedorNIT` int(11) NOT NULL,
  `realizar_compraID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `realizar_compra`
--

INSERT INTO `realizar_compra` (`realizar_proveedorNIT`, `realizar_compraID`) VALUES
(1010, 1),
(1020, 2),
(1030, 3),
(1040, 4),
(1050, 5),
(1110, 6),
(8795, 7);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `servicio_empleado`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `servicio_empleado` (
`serv_ID` int(11)
,`serv_estado` varchar(45)
,`serv_entradaFecha` date
,`serv_salidaFecha` date
,`emple_nombre` varchar(45)
,`emple_apellido` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_servicio`
--

CREATE TABLE `solicitud_servicio` (
  `solicitud_equipoID` int(11) NOT NULL,
  `solicitud_servID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitud_servicio`
--

INSERT INTO `solicitud_servicio` (`solicitud_equipoID`, `solicitud_servID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `cli_cedula` int(11) NOT NULL,
  `cli_nombre` varchar(45) NOT NULL,
  `cli_apellido` varchar(45) NOT NULL,
  `cli_telefono` varchar(10) NOT NULL,
  `cli_direccion` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`cli_cedula`, `cli_nombre`, `cli_apellido`, `cli_telefono`, `cli_direccion`) VALUES
(498561270, 'Valentina', 'Zacarate', '3154213123', 'Diagonal 85b #32-45'),
(543213131, 'Carlos', 'Cortes', '3474545163', 'Calle 56 #67-89'),
(1025978363, 'Samuel', 'Bello', '3336757455', 'Av Caracas #4-12'),
(1313235865, 'Luisa', 'Arias', '312542452', 'Carrera 32 # 76-09'),
(1342453542, 'Mateo', 'Castro', '3336757455', 'Calle 19 #12-10'),
(1342478918, 'Gabriela', 'Montenegro', '3124543431', 'Diagonal 83a #65-78'),
(2147483647, 'Juan', 'Cruz', '3153445544', 'Calle 33 SUR # 40a-37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_compras`
--

CREATE TABLE `tbl_compras` (
  `compra_ID` int(11) NOT NULL,
  `compra_nombre` varchar(100) NOT NULL,
  `compra_fecha` date NOT NULL,
  `compra_cantidad` int(11) NOT NULL,
  `compra_valor` int(11) NOT NULL,
  `compra_impuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_compras`
--

INSERT INTO `tbl_compras` (`compra_ID`, `compra_nombre`, `compra_fecha`, `compra_cantidad`, `compra_valor`, `compra_impuesto`) VALUES
(1, 'Case de celular', '2024-05-25', 50, 350000, 66500),
(2, 'Audifonos', '2024-04-17', 30, 150000, 28500),
(3, 'Powerband', '2024-10-11', 10, 450000, 85500),
(4, 'Vidrio templado', '2024-07-09', 100, 200000, 38000),
(5, 'Cargador inteligente', '2024-11-17', 20, 160000, 30400),
(6, 'Cable HDMI', '2024-02-22', 10, 40000, 7600),
(7, 'Control XBOX', '2024-03-06', 5, 350000, 66500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_empleados`
--

CREATE TABLE `tbl_empleados` (
  `emple_cedula` int(11) NOT NULL,
  `emple_nombre` varchar(45) NOT NULL,
  `emple_apellido` varchar(45) NOT NULL,
  `emple_direccion` varchar(50) NOT NULL,
  `emple_telefono` varchar(10) NOT NULL,
  `emple_estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_empleados`
--

INSERT INTO `tbl_empleados` (`emple_cedula`, `emple_nombre`, `emple_apellido`, `emple_direccion`, `emple_telefono`, `emple_estado`) VALUES
(415135, 'Omar David', 'Niño Lopez', 'Calle 127 #01a 35', '3226549875', 'Inactivo'),
(5481312, 'Rauw Alejandro', 'Hernandez Moreno', 'Cra 82c #123a 11', '3568965452', 'Inactivo'),
(6465210, 'Hallan David', 'Gomez Tobar', 'Calle 87 #120a 10', '3132150087', 'Activo'),
(18441531, 'Juan Felipe', 'Abril Cardenas', 'Cra 87c #128a 18', '3226547897', 'Activo'),
(31561332, 'Stefany', 'Leal Rodriguez', 'Calle 87 #128a 12', '3108536967', 'Activo'),
(78431311, 'Gabriela', 'Muñoz Samaca', 'Cra 87b #135a 15', '3222328565', 'Inactivo'),
(2147483647, 'Daniela', 'Rodriguez Peña', 'Cra 85c #126a 13', '3216548987', 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_equipos`
--

CREATE TABLE `tbl_equipos` (
  `equipo_ID` int(11) NOT NULL,
  `equipo_marca` varchar(45) NOT NULL,
  `equipo_referencia` varchar(45) NOT NULL,
  `equipo_fechaRecibido` date NOT NULL,
  `equipo_fechaEntregado` date NOT NULL,
  `copia_cliCedula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_equipos`
--

INSERT INTO `tbl_equipos` (`equipo_ID`, `equipo_marca`, `equipo_referencia`, `equipo_fechaRecibido`, `equipo_fechaEntregado`, `copia_cliCedula`) VALUES
(1, 'Dell', 'XPS-15-2023', '2024-01-12', '2024-01-14', 498561270),
(2, 'Samsung', 'A15', '2024-02-05', '2024-02-07', 2147483647),
(3, 'Iphone', '11', '2024-03-19', '2024-03-21', 1025978363),
(4, 'Xiaomi', 'Redmi 13C', '2024-04-22', '2024-04-24', 1342478918),
(5, 'Samsung', 'A25', '2024-05-09', '2024-05-11', 1313235865),
(6, 'Motorola', 'G50', '2024-06-30', '2024-07-02', 1342453542),
(7, 'Asus', 'ZenBook-Flip-14', '2024-07-15', '2024-07-17', 543213131);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_pagos`
--

CREATE TABLE `tbl_pagos` (
  `pago_ID` int(11) NOT NULL,
  `pago_metodo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_pagos`
--

INSERT INTO `tbl_pagos` (`pago_ID`, `pago_metodo`) VALUES
(1, 'Efectivo'),
(2, 'Datafono'),
(3, 'Nequi'),
(4, 'Daviplata');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `prod_ID` int(11) NOT NULL,
  `prod_nombre` varchar(45) NOT NULL,
  `prod_stock` int(11) NOT NULL,
  `prod_costo` int(11) NOT NULL,
  `prod_precio` int(11) NOT NULL,
  `prod_descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`prod_ID`, `prod_nombre`, `prod_stock`, `prod_costo`, `prod_precio`, `prod_descripcion`) VALUES
(1, 'Case celular', 300, 7000, 18000, 'Diferentes case para todas las marcas y referencias de teléfonos móviles'),
(2, 'Audifonos', 50, 5000, 15000, 'Audifonos para teléfono todas las entradas'),
(3, 'PowerBand', 20, 45000, 70000, 'Bateria portatil carga rapida para teléfonos moviles'),
(4, 'Vidrio templado', 500, 2000, 15000, 'Vidrio templado calibre ancho para todas las marcas y referencias de teléfonos moviles'),
(5, 'Cargador Inteligente', 60, 8000, 23000, 'Cargador para teléfonos móviles, carga rapida e inteligente'),
(6, 'Cable HDMI', 25, 4000, 10000, 'Cable HDMI de 5 metros'),
(7, 'Control XBOX', 7, 70000, 110000, 'Control para XBOX 360 inalambrico'),
(8, 'Cable tipoC', 30, 3000, 10000, 'Cable para telefonos con entrada \"TipoC\"');

--
-- Disparadores `tbl_productos`
--
DELIMITER $$
CREATE TRIGGER `actualizar_producto` BEFORE UPDATE ON `tbl_productos` FOR EACH ROW INSERT INTO audi_productos (num_prod_ID, audi_prodNombre_old, audi_prodStock_old, audi_prodCosto_old, audi_prodPrecio_old, audi_prodDescripcion_old, audi_prodNombre_new, audi_prodStock_new, audi_prodCosto_new, audi_prodPrecio_new, audi_prodDescripcion_new, audiProd_usuario, audiProd_fecha, audiProd_accion)
VALUES (old.prod_ID, old.prod_nombre, old.prod_stock, old.prod_costo, old.prod_precio, old.prod_descripcion,new.prod_nombre, new.prod_stock, new.prod_costo, new.prod_precio, new.prod_descripcion, user(), now(), 'Actualización Producto')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertar_producto` BEFORE INSERT ON `tbl_productos` FOR EACH ROW INSERT INTO audi_productos (num_prod_ID, audi_prodNombre_new, audi_prodStock_new, audi_prodCosto_new, audi_prodPrecio_new, audi_prodDescripcion_new, audiProd_usuario, audiProd_fecha, audiProd_accion)
VALUES (new.prod_ID, new.prod_nombre, new.prod_stock, new.prod_costo, new.prod_precio, new.prod_descripcion, user(), now(), 'Se adiciona un producto')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_proveedores`
--

CREATE TABLE `tbl_proveedores` (
  `proveedor_NIT` int(11) NOT NULL,
  `proveedor_nombre` varchar(45) NOT NULL,
  `proveedor_telefono` varchar(10) NOT NULL,
  `proveedor_direccion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_proveedores`
--

INSERT INTO `tbl_proveedores` (`proveedor_NIT`, `proveedor_nombre`, `proveedor_telefono`, `proveedor_direccion`) VALUES
(1010, 'CaseStore', '3116474141', 'Calle 33 Sur # 40A - 37'),
(1020, 'PodsNow', '3158982332', 'Carrera 7ma #60 - 34'),
(1030, 'PowerBond', '3057896312', 'Cll 26 Sur # 52 - 47'),
(1040, 'Vidrios La Mariposa', '3007854615', 'Av. 1ra de Mayo 43 Sur # 20 - 54'),
(1050, 'FastCharging', '3214756954', 'Carrera 7ma # 43 - 10'),
(1110, 'Cables La 19', '3124572323', 'Av. Cll 19 # 45A - 28'),
(8795, 'GamingTime', '3127543231', 'Av. Caracas # 10 - 28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reciboservicios`
--

CREATE TABLE `tbl_reciboservicios` (
  `recibServ_ID` int(11) NOT NULL,
  `recibServ_fecha` date NOT NULL,
  `recibServ_cliente` varchar(60) NOT NULL,
  `recibServ_equipo` varchar(50) NOT NULL,
  `recibServ_descripcion` varchar(300) NOT NULL,
  `recibServ_valor` int(11) NOT NULL,
  `recibServ_impuesto` int(11) NOT NULL,
  `recib_servID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_reciboservicios`
--

INSERT INTO `tbl_reciboservicios` (`recibServ_ID`, `recibServ_fecha`, `recibServ_cliente`, `recibServ_equipo`, `recibServ_descripcion`, `recibServ_valor`, `recibServ_impuesto`, `recib_servID`) VALUES
(1, '2024-11-08', 'Juan Cruz', 'Samsung A15', 'Se le cambio la tarjeta lógica al telefono', 45000, 8550, 2),
(2, '2024-10-16', 'Gabriela Montenegro', 'Redmi 13C', 'Cambio de visor al telofono', 95000, 18050, 4),
(3, '2024-09-11', 'Mateo Castro', 'Motorola G53', 'Cambio de tarjeta lógica al telefono', 50000, 9500, 6),
(4, '2024-08-26', 'Carlos Cortes', 'Computador ASUS', 'Formateo, limpieza, instalación', 120000, 22800, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_reciboventas`
--

CREATE TABLE `tbl_reciboventas` (
  `recibVent_ID` int(11) NOT NULL,
  `recibVent_fecha` date NOT NULL,
  `recibVent_cliente` varchar(60) NOT NULL,
  `recibVent_producto` varchar(100) NOT NULL,
  `recibVent_cantidad` int(11) NOT NULL,
  `recibVent_valorUnidad` int(11) NOT NULL,
  `recibVent_valorTotal` int(11) NOT NULL,
  `recibVent_impuesto` int(11) NOT NULL,
  `recib_ventaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_reciboventas`
--

INSERT INTO `tbl_reciboventas` (`recibVent_ID`, `recibVent_fecha`, `recibVent_cliente`, `recibVent_producto`, `recibVent_cantidad`, `recibVent_valorUnidad`, `recibVent_valorTotal`, `recibVent_impuesto`, `recib_ventaID`) VALUES
(1, '2024-11-18', 'Valentina Zacarate', 'Audifonos', 2, 15000, 30000, 5700, 1),
(2, '2024-11-15', 'Carlos Cortes', 'PowerBand', 1, 70000, 70000, 13300, 2),
(3, '2024-11-14', 'Luisa Arias', 'Case Celular', 2, 18000, 36000, 6900, 3),
(4, '2024-11-13', 'Juan Cruz', 'Cargador Inteligente', 1, 23000, 23000, 4400, 4),
(5, '2024-11-12', 'Samuel Bello', 'Cables HDMI', 4, 10000, 40000, 7600, 5),
(6, '2024-11-08', 'Mateo Castro', 'Control XBOX', 1, 110000, 110000, 20900, 6),
(7, '2024-11-11', 'Gabriela Montenegro', 'Vidrios Telefono', 5, 15000, 75000, 14250, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_roles`
--

CREATE TABLE `tbl_roles` (
  `rol_ID` int(11) NOT NULL,
  `rol_nombre` varchar(45) NOT NULL,
  `rol_descripcion` varchar(200) NOT NULL,
  `rol_estado` varchar(45) NOT NULL,
  `rol_empleCedula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_roles`
--

INSERT INTO `tbl_roles` (`rol_ID`, `rol_nombre`, `rol_descripcion`, `rol_estado`, `rol_empleCedula`) VALUES
(1, 'Gerente', 'El gerente de la empresa puede llevar un control de la base de datos, actualizar y eliminar datos de la misma', 'Activo', 18441531),
(2, 'Vendedor', 'El vendedor se encarga de dar los productos requeridos por los clientes de la empresa y tendra el poder de actualizar el stock', 'Activo', 2147483647),
(3, 'Vendedor', 'El vendedor se encarga de dar los productos requeridos por los clientes de la empresa y tendra el poder de actualizar el stock', 'Activo', 31561332),
(4, 'Vendedor', 'El vendedor se encarga de dar los productos requeridos por los clientes de la empresa y tendra el poder de actualizar el stock', 'Inactivo', 415135),
(5, 'Vendedor', 'El vendedor se encarga de dar los productos requeridos por los clientes de la empresa y tendra el poder de actualizar el stock', 'Inactivo', 5481312),
(6, 'Tecnico', 'El tecnico se encargara de revisar los equipos que lleguen a la empresa para realizarle el mantenimiento requerido', 'Activo', 6465210),
(7, 'Tecnico', 'El tecnico se encargara de revisar los equipos que lleguen a la empresa para realizarle el mantenimiento requerido', 'Activo', 18441531),
(8, 'Tecnico', 'El tecnico se encargara de revisar los equipos que lleguen a la empresa para realizarle el mantenimiento requerido', 'Inactivo', 78431311);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_servicios`
--

CREATE TABLE `tbl_servicios` (
  `serv_ID` int(11) NOT NULL,
  `serv_estado` varchar(45) NOT NULL,
  `serv_novedad` varchar(400) DEFAULT NULL,
  `serv_entradaFecha` date NOT NULL,
  `serv_salidaFecha` date DEFAULT NULL,
  `serv_valor` int(11) NOT NULL,
  `copia_empleCedula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_servicios`
--

INSERT INTO `tbl_servicios` (`serv_ID`, `serv_estado`, `serv_novedad`, `serv_entradaFecha`, `serv_salidaFecha`, `serv_valor`, `copia_empleCedula`) VALUES
(1, 'Pendiente', 'Cambio de disco duro', '2024-11-23', '0000-00-00', 110000, 18441531),
(2, 'Entregado', 'Cambio tarjeta lógica', '2024-11-07', '2024-11-08', 45000, 6465210),
(3, 'Finalizado', 'Reparación telefono mojado', '2024-11-15', '0000-00-00', 60000, 18441531),
(4, 'Entregado', 'Cambio de visor', '2024-10-15', '2024-10-16', 95000, 6465210),
(5, 'Pendiente', 'Cambio de visor', '2024-11-23', '0000-00-00', 90000, 18441531),
(6, 'Entregado', 'Cambio de tarjeta lógica', '2024-09-10', '2024-09-11', 50000, 6465210),
(7, 'Entregado', 'Formateo, instalación programas, limpieza general', '2024-08-25', '2024-08-26', 120000, 18441531);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ventas`
--

CREATE TABLE `tbl_ventas` (
  `venta_ID` int(11) NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_cantidad` int(11) NOT NULL,
  `venta_valor` int(11) NOT NULL,
  `venta_impuesto` int(11) NOT NULL,
  `venta_descripcion` varchar(300) NOT NULL,
  `venta_cliCedula` int(11) NOT NULL,
  `venta_prodID` int(11) NOT NULL,
  `venta_pagoID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_ventas`
--

INSERT INTO `tbl_ventas` (`venta_ID`, `venta_fecha`, `venta_cantidad`, `venta_valor`, `venta_impuesto`, `venta_descripcion`, `venta_cliCedula`, `venta_prodID`, `venta_pagoID`) VALUES
(1, '2024-11-18', 2, 30000, 5700, 'Se vendieron 2 audifonos', 498561270, 2, 1),
(2, '2024-11-15', 1, 70000, 13300, 'Se vendio una PowerBand', 543213131, 3, 2),
(3, '2024-11-14', 2, 36000, 6900, 'Se vendieron 2 case', 1313235865, 1, 3),
(4, '2024-11-13', 1, 23000, 4400, 'Se vendio un cargador \"Carga Inteligente\" para celular', 2147483647, 5, 4),
(5, '2024-11-12', 4, 40000, 7600, 'Se vendieron 4 cables HDMI 5mts', 1025978363, 6, 1),
(6, '2024-11-08', 1, 110000, 20900, 'Se vendio control de XBOX', 1342453542, 7, 2),
(7, '2024-11-11', 5, 75000, 14250, 'Se vendieron 5 vidrios para celular', 1342478918, 4, 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `venta_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `venta_cliente` (
`venta_ID` int(11)
,`venta_fecha` date
,`venta_cantidad` int(11)
,`venta_valor` int(11)
,`venta_descripcion` varchar(300)
,`cli_cedula` int(11)
,`cli_nombre` varchar(45)
,`cli_apellido` varchar(45)
,`pago_metodo` varchar(45)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `servicio_empleado`
--
DROP TABLE IF EXISTS `servicio_empleado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `servicio_empleado`  AS SELECT `tbl_servicios`.`serv_ID` AS `serv_ID`, `tbl_servicios`.`serv_estado` AS `serv_estado`, `tbl_servicios`.`serv_entradaFecha` AS `serv_entradaFecha`, `tbl_servicios`.`serv_salidaFecha` AS `serv_salidaFecha`, `tbl_empleados`.`emple_nombre` AS `emple_nombre`, `tbl_empleados`.`emple_apellido` AS `emple_apellido` FROM (`tbl_servicios` join `tbl_empleados` on(`tbl_servicios`.`copia_empleCedula` = `tbl_empleados`.`emple_cedula`)) WHERE `tbl_servicios`.`serv_salidaFecha` like '0000-00-00' ;

-- --------------------------------------------------------

--
-- Estructura para la vista `venta_cliente`
--
DROP TABLE IF EXISTS `venta_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `venta_cliente`  AS SELECT `tbl_ventas`.`venta_ID` AS `venta_ID`, `tbl_ventas`.`venta_fecha` AS `venta_fecha`, `tbl_ventas`.`venta_cantidad` AS `venta_cantidad`, `tbl_ventas`.`venta_valor` AS `venta_valor`, `tbl_ventas`.`venta_descripcion` AS `venta_descripcion`, `tbl_clientes`.`cli_cedula` AS `cli_cedula`, `tbl_clientes`.`cli_nombre` AS `cli_nombre`, `tbl_clientes`.`cli_apellido` AS `cli_apellido`, `tbl_pagos`.`pago_metodo` AS `pago_metodo` FROM ((`tbl_ventas` join `tbl_clientes` on(`tbl_ventas`.`venta_cliCedula` = `tbl_clientes`.`cli_cedula`)) join `tbl_pagos` on(`tbl_ventas`.`venta_pagoID` = `tbl_pagos`.`pago_ID`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adquirir_productos`
--
ALTER TABLE `adquirir_productos`
  ADD KEY `adquirir_prodID` (`adquirir_prodID`),
  ADD KEY `adquirir_compraID` (`adquirir_compraID`);

--
-- Indices de la tabla `audi_productos`
--
ALTER TABLE `audi_productos`
  ADD PRIMARY KEY (`audiID_prod`);

--
-- Indices de la tabla `realizar_compra`
--
ALTER TABLE `realizar_compra`
  ADD KEY `realizar_proveedorNIT` (`realizar_proveedorNIT`),
  ADD KEY `realizar_compraID` (`realizar_compraID`);

--
-- Indices de la tabla `solicitud_servicio`
--
ALTER TABLE `solicitud_servicio`
  ADD KEY `solicitud_equipoID` (`solicitud_equipoID`),
  ADD KEY `solicitud_servID` (`solicitud_servID`);

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`cli_cedula`),
  ADD UNIQUE KEY `identificacion_cliente` (`cli_nombre`);

--
-- Indices de la tabla `tbl_compras`
--
ALTER TABLE `tbl_compras`
  ADD PRIMARY KEY (`compra_ID`);

--
-- Indices de la tabla `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD PRIMARY KEY (`emple_cedula`),
  ADD UNIQUE KEY `identificacion_empleado` (`emple_nombre`);

--
-- Indices de la tabla `tbl_equipos`
--
ALTER TABLE `tbl_equipos`
  ADD PRIMARY KEY (`equipo_ID`),
  ADD KEY `copia_cliCedula` (`copia_cliCedula`);

--
-- Indices de la tabla `tbl_pagos`
--
ALTER TABLE `tbl_pagos`
  ADD PRIMARY KEY (`pago_ID`);

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`prod_ID`);

--
-- Indices de la tabla `tbl_proveedores`
--
ALTER TABLE `tbl_proveedores`
  ADD PRIMARY KEY (`proveedor_NIT`);

--
-- Indices de la tabla `tbl_reciboservicios`
--
ALTER TABLE `tbl_reciboservicios`
  ADD PRIMARY KEY (`recibServ_ID`),
  ADD KEY `recib_servID` (`recib_servID`);

--
-- Indices de la tabla `tbl_reciboventas`
--
ALTER TABLE `tbl_reciboventas`
  ADD PRIMARY KEY (`recibVent_ID`),
  ADD KEY `recib_ventaID` (`recib_ventaID`);

--
-- Indices de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD PRIMARY KEY (`rol_ID`),
  ADD KEY `rol_empleCedula` (`rol_empleCedula`);

--
-- Indices de la tabla `tbl_servicios`
--
ALTER TABLE `tbl_servicios`
  ADD PRIMARY KEY (`serv_ID`),
  ADD KEY `copia_empleCedula` (`copia_empleCedula`);

--
-- Indices de la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  ADD PRIMARY KEY (`venta_ID`),
  ADD KEY `venta_cliCedula` (`venta_cliCedula`),
  ADD KEY `venta_prodID` (`venta_prodID`),
  ADD KEY `venta_pagoID` (`venta_pagoID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `audi_productos`
--
ALTER TABLE `audi_productos`
  MODIFY `audiID_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_compras`
--
ALTER TABLE `tbl_compras`
  MODIFY `compra_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_equipos`
--
ALTER TABLE `tbl_equipos`
  MODIFY `equipo_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_pagos`
--
ALTER TABLE `tbl_pagos`
  MODIFY `pago_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `prod_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_reciboservicios`
--
ALTER TABLE `tbl_reciboservicios`
  MODIFY `recibServ_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_reciboventas`
--
ALTER TABLE `tbl_reciboventas`
  MODIFY `recibVent_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  MODIFY `rol_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_servicios`
--
ALTER TABLE `tbl_servicios`
  MODIFY `serv_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  MODIFY `venta_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adquirir_productos`
--
ALTER TABLE `adquirir_productos`
  ADD CONSTRAINT `adquirir_productos_ibfk_1` FOREIGN KEY (`adquirir_prodID`) REFERENCES `tbl_productos` (`prod_ID`),
  ADD CONSTRAINT `adquirir_productos_ibfk_2` FOREIGN KEY (`adquirir_compraID`) REFERENCES `tbl_compras` (`compra_ID`);

--
-- Filtros para la tabla `realizar_compra`
--
ALTER TABLE `realizar_compra`
  ADD CONSTRAINT `realizar_compra_ibfk_1` FOREIGN KEY (`realizar_proveedorNIT`) REFERENCES `tbl_proveedores` (`proveedor_NIT`),
  ADD CONSTRAINT `realizar_compra_ibfk_2` FOREIGN KEY (`realizar_compraID`) REFERENCES `tbl_compras` (`compra_ID`);

--
-- Filtros para la tabla `solicitud_servicio`
--
ALTER TABLE `solicitud_servicio`
  ADD CONSTRAINT `solicitud_servicio_ibfk_1` FOREIGN KEY (`solicitud_equipoID`) REFERENCES `tbl_equipos` (`equipo_ID`),
  ADD CONSTRAINT `solicitud_servicio_ibfk_2` FOREIGN KEY (`solicitud_servID`) REFERENCES `tbl_servicios` (`serv_ID`);

--
-- Filtros para la tabla `tbl_equipos`
--
ALTER TABLE `tbl_equipos`
  ADD CONSTRAINT `tbl_equipos_ibfk_1` FOREIGN KEY (`copia_cliCedula`) REFERENCES `tbl_clientes` (`cli_cedula`);

--
-- Filtros para la tabla `tbl_reciboservicios`
--
ALTER TABLE `tbl_reciboservicios`
  ADD CONSTRAINT `tbl_reciboservicios_ibfk_1` FOREIGN KEY (`recib_servID`) REFERENCES `tbl_servicios` (`serv_ID`);

--
-- Filtros para la tabla `tbl_reciboventas`
--
ALTER TABLE `tbl_reciboventas`
  ADD CONSTRAINT `tbl_reciboventas_ibfk_1` FOREIGN KEY (`recib_ventaID`) REFERENCES `tbl_ventas` (`venta_ID`);

--
-- Filtros para la tabla `tbl_roles`
--
ALTER TABLE `tbl_roles`
  ADD CONSTRAINT `tbl_roles_ibfk_1` FOREIGN KEY (`rol_empleCedula`) REFERENCES `tbl_empleados` (`emple_cedula`);

--
-- Filtros para la tabla `tbl_servicios`
--
ALTER TABLE `tbl_servicios`
  ADD CONSTRAINT `tbl_servicios_ibfk_1` FOREIGN KEY (`copia_empleCedula`) REFERENCES `tbl_empleados` (`emple_cedula`);

--
-- Filtros para la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  ADD CONSTRAINT `tbl_ventas_ibfk_1` FOREIGN KEY (`venta_cliCedula`) REFERENCES `tbl_clientes` (`cli_cedula`),
  ADD CONSTRAINT `tbl_ventas_ibfk_2` FOREIGN KEY (`venta_prodID`) REFERENCES `tbl_productos` (`prod_ID`),
  ADD CONSTRAINT `tbl_ventas_ibfk_3` FOREIGN KEY (`venta_pagoID`) REFERENCES `tbl_pagos` (`pago_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
