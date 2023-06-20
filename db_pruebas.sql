-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2023 a las 20:32:15
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_pruebas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `idBrand` int(11) NOT NULL,
  `nameBrand` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descriptionBrand` longtext COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`idBrand`, `nameBrand`, `descriptionBrand`) VALUES
(1, 'Sony', 'Marca de renombre '),
(2, 'Samsumg', 'Marca de electrodomesticos reconocida '),
(3, 'Iphone', 'Marca de celulares '),
(4, 'LG', 'Producto para electrodomesticos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `nameProduct` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `IdBrand` int(11) NOT NULL,
  `type` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `existence` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 1,
  `createDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`idProduct`, `nameProduct`, `IdBrand`, `type`, `existence`, `price`, `state`, `createDate`) VALUES
(1, 'Samsung Galaxy J7', 2, 'Celular', 200, '3000.00', 0, '2023-06-08 22:41:48'),
(2, 'Sony Parlate SD', 1, 'Electrodoméstico', 100, '2000.00', 1, '2023-06-09 11:02:01'),
(3, 'Iphone XS', 3, 'Celular', 400, '1200.56', 1, '2023-06-09 11:37:06'),
(4, 'Televisor Samsumg 40\'', 2, 'Televisor', 2000, '12000.00', 1, '2023-06-09 11:38:23'),
(5, 'Televisor LG 60\'', 4, 'Televisores', 200, '20000.00', 1, '2023-06-09 11:45:20'),
(6, 'Parlante LG FR-3456', 4, 'Parlante ', 3000, '2000.00', 1, '2023-06-09 11:46:13'),
(7, 'Iphone 11', 3, 'Celular', 400, '20000.50', 1, '2023-06-09 11:46:45'),
(8, 'Samsung Galaxy J6 Prime', 2, 'Celular', 23000, '3000.00', 1, '2023-06-09 11:53:22'),
(9, 'Televiisor Samsung 80\'', 2, 'Televisor', 4000, '60000.00', 1, '2023-06-09 11:54:09'),
(10, 'Licuadora LG ', 4, 'Cocina', 4000, '1500.00', 1, '2023-06-09 11:54:41'),
(11, 'Laptop Samsung MS-200', 2, 'Laptop', 3000, '15000.00', 1, '2023-06-09 11:55:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `firtName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `userName` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `createDate` datetime NOT NULL DEFAULT current_timestamp(),
  `state` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`idUser`, `firtName`, `lastName`, `userName`, `password`, `createDate`, `state`) VALUES
(1, 'Diego', 'Diaz', 'Administrador', '74c0104cd5d886adef352d7debf9a3d1a15acffdffe60f1a3a62f38b7c4e1f67', '2023-06-07 21:24:49', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`idBrand`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `brand` (`IdBrand`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `idBrand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`IdBrand`) REFERENCES `brand` (`idBrand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
