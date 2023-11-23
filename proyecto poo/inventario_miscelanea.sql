-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2023 a las 09:30:48
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_miscelanea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_Categoria` int(11) NOT NULL,
  `NombreCategoria` varchar(30) NOT NULL,
  `DescripcionCat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_Categoria`, `NombreCategoria`, `DescripcionCat`) VALUES
(2, 'impresion', 'impresiones'),
(3, 'impresion', 'impresiones'),
(4, 'impresion', 'impresiones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `NombreCli` varchar(50) NOT NULL,
  `DireccionCli` varchar(60) NOT NULL,
  `Telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `NombreCli`, `DireccionCli`, `Telefono`) VALUES
(1010223555, 'marcela', 'calle 12#12-24', 2147483647),
(1032485205, 'edwin', 'calle1332', 2147483647),
(2147483647, 'pencil', 'calle 12#12-243e', 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentasporcobrar`
--

CREATE TABLE `cuentasporcobrar` (
  `ID_Cuenta` int(11) NOT NULL,
  `Monto_Debido` float DEFAULT NULL,
  `Fecha_Limite` date DEFAULT NULL,
  `ID_ClienteFK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompras`
--

CREATE TABLE `detallecompras` (
  `ID_DetalleCompra` int(11) NOT NULL,
  `CantidadCompra` int(11) NOT NULL,
  `Precio_Compra` float NOT NULL,
  `Precio_Venta` float NOT NULL,
  `ID_ProductoFK` int(11) NOT NULL,
  `ID_ProveedorFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `ID_Factura` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Total` float NOT NULL,
  `ID_ProductoFK` int(11) NOT NULL,
  `ID_ClienteFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`ID_Factura`, `Fecha`, `Cantidad`, `Total`, `ID_ProductoFK`, `ID_ClienteFK`) VALUES
(12, '2023-11-23', 1, 2100, 10, 1032485205);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historicomodificacion`
--

CREATE TABLE `historicomodificacion` (
  `ID_Historico` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Detalles` varchar(50) DEFAULT NULL,
  `ID_ProductoFK` int(11) NOT NULL,
  `ID_UsuarioFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_Producto` int(11) NOT NULL,
  `NombreProd` varchar(30) NOT NULL,
  `CodigoProducto` bigint(20) NOT NULL,
  `DescripcionProd` varchar(60) NOT NULL,
  `PrecioUnitario` float NOT NULL,
  `PrecioCompra` float NOT NULL,
  `Cantidad_Disponible` int(11) NOT NULL,
  `ID_CategoriaFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_Producto`, `NombreProd`, `CodigoProducto`, `DescripcionProd`, `PrecioUnitario`, `PrecioCompra`, `Cantidad_Disponible`, `ID_CategoriaFK`) VALUES
(9, 'lapiz', 200, 'eds', 2000, 1200, 200, 2),
(10, 'papel', 77025719, 'hoja blanca', 2000, 1000, 200, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_Proveedor` int(11) NOT NULL,
  `NombreProv` varchar(50) NOT NULL,
  `DireccionProv` varchar(60) NOT NULL,
  `Telefono` int(11) DEFAULT NULL,
  `Correo` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ID_Proveedor`, `NombreProv`, `DireccionProv`, `Telefono`, `Correo`) VALUES
(0, '', '', 0, ''),
(900002827, 'pencil', 'calle18', 31945510, 'ebernal@gjamso'),
(2147483647, 'pencil', 'Calle18#65-34', 2147483647, 'abcd@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_Rol` int(11) NOT NULL,
  `NombreRol` varchar(30) NOT NULL,
  `DescripcionRol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`ID_Rol`, `NombreRol`, `DescripcionRol`) VALUES
(1, 'admin', 'admin total'),
(6, 'solo ventas', 'vendedor'),
(7, 'admin', 'solo ventas'),
(8, 'admin', 'solo ventas'),
(9, 'admin', 'solo ventas'),
(10, 'admin', 'solo ventas'),
(11, 'admin', 'admin total'),
(12, 'admin', 'admin total');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(11) NOT NULL,
  `NombreUsuario` varchar(30) NOT NULL,
  `Contrasena` varchar(16) NOT NULL,
  `ID_RolFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuario`, `NombreUsuario`, `Contrasena`, `ID_RolFK`) VALUES
(1, 'ED', '12345rt6', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `cuentasporcobrar`
--
ALTER TABLE `cuentasporcobrar`
  ADD PRIMARY KEY (`ID_Cuenta`),
  ADD KEY `ID_ClienteFK` (`ID_ClienteFK`);

--
-- Indices de la tabla `detallecompras`
--
ALTER TABLE `detallecompras`
  ADD PRIMARY KEY (`ID_DetalleCompra`),
  ADD KEY `ID_ProductoFK` (`ID_ProductoFK`),
  ADD KEY `ID_ProveedorFK` (`ID_ProveedorFK`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `ID_ProductoFK` (`ID_ProductoFK`),
  ADD KEY `ID_ClienteFK` (`ID_ClienteFK`);

--
-- Indices de la tabla `historicomodificacion`
--
ALTER TABLE `historicomodificacion`
  ADD PRIMARY KEY (`ID_Historico`),
  ADD KEY `ID_ProductoFK` (`ID_ProductoFK`),
  ADD KEY `ID_UsuarioFK` (`ID_UsuarioFK`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_Producto`),
  ADD KEY `ID_CategoriaFK` (`ID_CategoriaFK`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_Proveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_Rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`),
  ADD KEY `ID_RolFK` (`ID_RolFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cuentasporcobrar`
--
ALTER TABLE `cuentasporcobrar`
  MODIFY `ID_Cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `detallecompras`
--
ALTER TABLE `detallecompras`
  MODIFY `ID_DetalleCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `ID_Factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `historicomodificacion`
--
ALTER TABLE `historicomodificacion`
  MODIFY `ID_Historico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuentasporcobrar`
--
ALTER TABLE `cuentasporcobrar`
  ADD CONSTRAINT `cuentasporcobrar_ibfk_1` FOREIGN KEY (`ID_ClienteFK`) REFERENCES `clientes` (`ID_Cliente`);

--
-- Filtros para la tabla `detallecompras`
--
ALTER TABLE `detallecompras`
  ADD CONSTRAINT `detallecompras_ibfk_1` FOREIGN KEY (`ID_ProductoFK`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `detallecompras_ibfk_2` FOREIGN KEY (`ID_ProveedorFK`) REFERENCES `proveedores` (`ID_Proveedor`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`ID_ProductoFK`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`ID_ClienteFK`) REFERENCES `clientes` (`ID_Cliente`);

--
-- Filtros para la tabla `historicomodificacion`
--
ALTER TABLE `historicomodificacion`
  ADD CONSTRAINT `historicomodificacion_ibfk_1` FOREIGN KEY (`ID_ProductoFK`) REFERENCES `productos` (`ID_Producto`),
  ADD CONSTRAINT `historicomodificacion_ibfk_2` FOREIGN KEY (`ID_UsuarioFK`) REFERENCES `usuarios` (`ID_Usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_CategoriaFK`) REFERENCES `categorias` (`ID_Categoria`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_RolFK`) REFERENCES `roles` (`ID_Rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
