-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-08-2023 a las 22:19:43
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
-- Base de datos: `mimimbreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `category`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Canastos', NULL, NULL, NULL),
(2, 'Infantiles', NULL, NULL, NULL),
(3, 'Mesas', NULL, NULL, NULL),
(4, 'Pantallas', NULL, NULL, NULL),
(5, 'Sillas', NULL, NULL, NULL),
(6, 'Sillones', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `published` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `comment`, `published`, `user_id`, `product_id`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Comentario de Kary sobre el producto 1', 1, 7, 1, '2023-08-04 17:18:10', '2023-08-10 19:53:05', NULL),
(2, 'Veamos que pasa con este comentario de otro producto', 0, 7, 4, '2023-08-04 18:32:45', '2023-08-04 18:32:45', NULL),
(3, 'Primer comentario de Cami', 1, 8, 1, '2023-08-07 19:45:21', '2023-08-10 19:56:28', NULL),
(4, 'Comentario de Cami para el producto 3', 0, 8, 3, '2023-08-08 00:22:50', '2023-08-08 00:22:50', '2023-08-10 19:59:17'),
(5, 'Vamos a comentar el canastos para ropa', 1, 8, 2, '2023-08-11 14:23:34', '2023-08-11 14:24:33', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(100) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `order` int(11) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `product`, `description`, `price`, `discount`, `stock`, `order`, `image`, `category_id`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Canastos Grandes', 'Canastos de varios tamaños y diseños para usos múltiples', 3000, 10, 20, 1, 'producto_1689884570351.jpg', 1, '2023-07-20 20:22:50', '2023-07-20 20:22:50', '2023-08-11 14:27:30'),
(2, 'Canastos para ropa', 'Canastos de varios tamaños y diseños para guardar la ropa', 2500, 10, 40, 1, 'producto_1689945876887.jpg', 1, '2023-07-21 13:24:36', '2023-07-21 13:24:36', NULL),
(3, 'Canastos floreros', 'Canastos de base ancha para flores y plantas bajas', 3000, 10, 40, 1, 'producto_1689946088633.jpg', 1, '2023-07-21 13:28:08', '2023-07-21 13:28:08', NULL),
(4, 'Canastos floreros', 'Canastos de base circular para plantas altas', 3200, 0, 20, 0, 'producto_1689946272646.jpg', 1, '2023-07-21 13:31:12', '2023-07-21 13:31:12', NULL),
(5, 'Canastos base ancha', 'Canastos con base circular de 40 cms de diámetro', 3700, 0, 20, 0, 'producto_1689946391136.jpg', 1, '2023-07-21 13:33:11', '2023-07-21 13:33:11', NULL),
(6, 'Sillas para niñ@s', 'Sillas bajas de 1 mt de alto con base cuadrada', 5400, 0, 20, 1, 'producto_1689946563964.jpg', 2, '2023-07-21 13:36:03', '2023-07-21 13:36:03', NULL),
(7, 'Caballito mecedor', 'Caballito para niñ@s de 50cms de alto y base reforzada en madera', 5600, 0, 20, 1, 'producto_1689946719002.jpg', 2, '2023-07-21 13:38:39', '2023-07-21 13:38:39', NULL),
(8, 'Moisés', 'Moisés con manija y base reforzada en madera', 6200, 10, 20, 1, 'producto_1689947025511.jpg', 2, '2023-07-21 13:43:45', '2023-07-21 13:43:45', NULL),
(9, 'Cuna', 'Cuna de 1m de largo por 60cms de ancho con patas de madera reforzadas', 7400, 10, 10, 0, 'producto_1689947173948.jpg', 2, '2023-07-21 13:46:13', '2023-07-21 13:46:13', NULL),
(10, 'Mesa redonda', 'Mesa redonda de 70 cms. de diámetro con base circular', 4500, 10, 10, 1, 'producto_1689947230562.jpg', 3, '2023-07-21 13:47:10', '2023-07-21 13:47:10', NULL),
(11, 'Mesa chata', 'Mesa cuadrada de 1,5 mts y 50cms de alto', 4700, 10, 10, 1, 'producto_1689948033229.jpg', 3, '2023-07-21 14:00:33', '2023-07-21 14:00:33', NULL),
(12, 'Silla con base ancha', 'Silla ancha con patas de madera reforzada', 5000, 0, 20, 1, 'producto_1690208975059.jpg', 5, '2023-07-24 14:29:35', '2023-07-25 19:49:48', NULL),
(13, 'Silla colgante', 'Silla colgante circular de 80 cms de alto con base circular en madera', 4000, 0, 10, 0, 'producto_1690211906810.jpg', 5, '2023-07-24 15:18:26', '2023-07-24 15:18:26', '2023-07-24 16:53:45'),
(14, 'Pantalla cónica', 'Pantalla cónica marrón de 30 cms. de alto y 25 cms. de diámetro', 3800, 0, 40, 1, 'producto_1691017428939.jpg', 4, '2023-08-02 23:03:48', '2023-08-02 23:03:48', NULL),
(15, 'Sillones circulares', 'Sillones circulares ideales para jardín de un cuerpo', 5400, 12, 20, 1, 'producto_1691017747191.jpg', 6, '2023-08-02 23:09:07', '2023-08-02 23:09:07', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(100) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `role`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'admin', NULL, NULL, NULL),
(2, 'editor', NULL, NULL, NULL),
(3, 'user', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `deletedAt` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `phone`, `address`, `code`, `avatar`, `password`, `role_id`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
(1, 'Willy', 'Miller', 'willymiller@hotmail.com', '1131742779', 'Washington 3664', '1419', 'usuario_1689880372727.jpg', '$2b$10$Y.c7qIhEusw2hlNL9NXr1.DNN3Z/fk0R2TxYAUAHSu32kk/9gMEl.', 1, '2023-07-20 19:12:52', '2023-07-20 19:12:52', NULL),
(4, 'Marcela', 'Salvatierra', 'msalvatierra@gmail.com', '23083002', 'Aguirre 2830', '5555', 'usuario_1690486858332.jpg', '$2b$10$xFDfdni1C/igs/1WNdAJmObAO7474tJFuxvGq9psIur8WVmM.Tbvm', 2, '2023-07-25 22:00:50', '2023-07-27 19:40:58', NULL),
(5, 'Silvia', 'Espíndola', 'sespindola@gmail.com', '45345345', 'Reconquista 5400', '3800', 'usuario_1690492385930.jpg', '$2b$10$ncBT7sF/QUOXxRYNN8ib1eG6fn4vT8Dn7365lpgwSm2LbE4JdnKAW', 1, '2023-07-27 21:13:06', '2023-07-27 21:13:06', NULL),
(6, 'Kely', 'Lenna', 'klena@gmail.com', '34564566', 'Lavalle 4302', '3288', 'usuario_1690816590869.jpg', '$2b$10$/xB1Z00VwOF6kaIfIKgV2.zMsUdiLijjBjlMT3YJDdzbrxKAeknGq', 1, '2023-07-31 15:16:31', '2023-07-31 15:22:53', NULL),
(7, 'Karina', 'Fusini', 'kfusini@gmail.com', '234125544', 'Lavalle 4302', '5530', 'usuario_1690915840837.jpg', '$2b$10$.jl8Em464z8VXNO8BM6uV.YAQagrLtD8ibhRj/5.Ycy/T.Gs0Qrn.', 3, '2023-08-01 18:50:41', '2023-08-01 18:50:41', NULL),
(8, 'Camila', 'Miller', 'camila@gmail.com', '435454552', 'Washington 3664', '1419', 'usuario_1691437485490.jpg', '$2b$10$KVt5zhy.OxPADxzd7g2PNuBWTzHSt/UmQlqm8.JS8jGCrFnff2JmK', 3, '2023-08-07 19:44:45', '2023-08-07 19:44:45', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
